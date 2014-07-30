package com.rainbow.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.dao.MessageDAO;
import com.rainbow.dao.OtherPaymentDAO;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.entity.MessagePayment;
import com.rainbow.entity.OtherPayment;
import com.rainbow.server.App;
import com.rainbow.server.Pay;
import com.rainbow.util.PayData;
import com.rainbow.util.MesPayData;

/**
 * 提交支付方式
 * 
 * @author STerOTto
 * @version 2014-7-1 15:36:50
 * 
 */
public class PaymentAction
{
	private MessagePayment mesPay;
	private OtherPayment otherPay;

	private MessageDAO messageDAO;
	private OtherPaymentDAO otherPaymentDAO;
	private AppAutDAO appAutDAO;
	private AppInfoDAO appInfoDAO;
	private AppSouDAO appSouDAO;

	private int payId;
	private int apkId;
	private String app_id;
	private String user_id;
	private String product_id;
	private int mes_price;

	/**
	 * 虚拟物品提交 当商品价格超过30元时无需存短代支付
	 * 
	 * @return
	 */
	public void payFormSub()
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		App app = (App) session.getAttribute("app");
		List<PayData> payData = MesPayData.getInstance().getPayData();

		otherPay.setApp_id(app.getAppInfo().getApp_id());
		otherPay.setCp_id(app.getAppInfo().getCp_id());
		otherPaymentDAO.save(otherPay);

		if (otherPay.getPrice() <= 30)
		{
			mesPay.setChina_unicom_product_id(payData.get(mes_price - 1).productId);
			mesPay.setChina_unicom_consume_code(payData.get(mes_price - 1).consumeCode);
			mesPay.setPrice(mes_price);
			mesPay.setApp_id(app.getAppInfo().getApp_id());
			mesPay.setCp_id(app.getAppInfo().getCp_id());
			messageDAO.save(mesPay);
		}

	}

	/**
	 * 编辑物品提交
	 */
	public void editPaySub()
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		App app = (App) session.getAttribute("app");

		List<PayData> payData = MesPayData.getInstance().getPayData();

		otherPay.setApp_id(app.getAppInfo().getApp_id());
		otherPay.setCp_id(app.getAppInfo().getCp_id());
		otherPay.setId(payId);
		otherPaymentDAO.update(otherPay);

		MessagePayment messagePayment = messageDAO.findByProductId(otherPay
				.getProduct_id());
		if (messagePayment != null && otherPay.getPrice() > 30)
		{
			// 价格修改之前价格低于30，修改之后高于30，将原来的短代支付删除
			messageDAO.delete(messagePayment);
		}
		else if (otherPay.getPrice() <= 30)
		{
			mesPay.setApp_id(app.getAppInfo().getApp_id());
			mesPay.setCp_id(app.getAppInfo().getCp_id());
			mesPay.setChina_unicom_product_id(payData.get(mes_price - 1).productId);
			mesPay.setChina_unicom_consume_code(payData.get(mes_price - 1).consumeCode);
			mesPay.setPrice(mes_price);
			if (messagePayment != null)
			{
				//价格30以内变动
				mesPay.setId(messagePayment.getId());
				messageDAO.update(mesPay);
			}
			else
				//商品价格降到30以内
				messageDAO.save(mesPay);
		}
		//商品价格30以外变动，无需处理
	}

	/**
	 * 检车product_id是否被使用
	 * 
	 * @return
	 */
	public String checkProductId()
	{
		MessagePayment mes = messageDAO.findByProductId(product_id);
		OtherPayment other = otherPaymentDAO.findByProductId(product_id);
		if (mes == null && other == null)
			return Action.SUCCESS;
		else
			return Action.ERROR;

	}

	/**
	 * 显示某个应用的所有物品
	 * 商品价格大于30元时无短代支付
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String showAppProduct()
	{
		List<Pay> pay = new ArrayList<>();

		AppInfo info = appInfoDAO.findById(apkId);
		AppAuthority aut = appAutDAO.findById(apkId);
		AppSource sou = appSouDAO.findById(apkId);
		App app = new App(info, sou, aut);
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("app", app);
		
		//找到所有的支付
		List<OtherPayment> otherPayList = otherPaymentDAO.findByAppIdAndCpId(info.getApp_id(), info.getCp_id());
		for(OtherPayment otherPay:otherPayList)
		{
			MessagePayment mesPay = messageDAO.findByProductId(otherPay.getProduct_id());
			if(mesPay!=null)
				pay.add(new Pay(mesPay, otherPay));
			else
			{
				mesPay = new MessagePayment();
				pay.add(new Pay(mesPay, otherPay));
			}
		}
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("pay", pay);
		return Action.SUCCESS;

	}

	/**
	 * 编辑某个物品，找到这个物品 放入session
	 * 
	 * @return
	 */
	public void editPay()
	{		
		OtherPayment otherPay = otherPaymentDAO.findById(payId);
		MessagePayment mesPay = messageDAO.findByProductId(otherPay.getProduct_id());
		int mes_price = 1;
		Pay pay;
		if(mesPay!=null)
		{
			//不空找到价格
			pay = new Pay(mesPay, otherPay);
			List<PayData> payData = MesPayData.getInstance().getPayData();
			for (int i = 0; i < payData.size(); i++)
				if (payData.get(i).productId.equals(mesPay
						.getChina_unicom_product_id()))
				{
					mes_price = i + 1;
					break;
				}
		}
		else
		{
			mesPay = new MessagePayment();
			pay = new Pay(mesPay, otherPay);	
		}
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("pay", pay);
		session.setAttribute("mes_price", mes_price);
	}

	/**
	 * 删除某个物品
	 */
	public void deletePay()
	{
		OtherPayment otherPay = otherPaymentDAO.findById(payId);
		MessagePayment mesPay = messageDAO.findByProductId(otherPay.getProduct_id());
		messageDAO.delete(mesPay);
		otherPaymentDAO.delete(otherPay);

	}

	public PaymentAction(MessageDAO messageDAO,
			OtherPaymentDAO otherPaymentDAO, AppAutDAO appAutDAO,
			AppInfoDAO appInfoDAO, AppSouDAO appSouDAO)
	{
		super();
		this.messageDAO = messageDAO;
		this.otherPaymentDAO = otherPaymentDAO;
		this.appAutDAO = appAutDAO;
		this.appInfoDAO = appInfoDAO;
		this.appSouDAO = appSouDAO;
	}

	public int getPayId()
	{
		return payId;
	}

	public void setPayId(int payId)
	{
		this.payId = payId;
	}

	public String getApp_id()
	{
		return app_id;
	}

	public void setApp_id(String app_id)
	{
		this.app_id = app_id;
	}

	public String getUser_id()
	{
		return user_id;
	}

	public void setUser_id(String user_id)
	{
		this.user_id = user_id;
	}

	public MessagePayment getMesPay()
	{
		return mesPay;
	}

	public void setMesPay(MessagePayment mesPay)
	{
		this.mesPay = mesPay;
	}

	public OtherPayment getOtherPay()
	{
		return otherPay;
	}

	public void setOtherPay(OtherPayment otherPay)
	{
		this.otherPay = otherPay;
	}

	public int getApkId()
	{
		return apkId;
	}

	public void setApkId(int apkId)
	{
		this.apkId = apkId;
	}

	public String getProduct_id()
	{
		return product_id;
	}

	public void setProduct_id(String product_id)
	{
		this.product_id = product_id;
	}

	public int getMes_price()
	{
		return mes_price;
	}

	public void setMes_price(int mes_price)
	{
		this.mes_price = mes_price;
	}

}
