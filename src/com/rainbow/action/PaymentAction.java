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
 * �ύ֧����ʽ
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
	 * ������Ʒ�ύ ����Ʒ�۸񳬹�30Ԫʱ�����̴�֧��
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
	 * �༭��Ʒ�ύ
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
			// �۸��޸�֮ǰ�۸����30���޸�֮�����30����ԭ���Ķ̴�֧��ɾ��
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
				//�۸�30���ڱ䶯
				mesPay.setId(messagePayment.getId());
				messageDAO.update(mesPay);
			}
			else
				//��Ʒ�۸񽵵�30����
				messageDAO.save(mesPay);
		}
		//��Ʒ�۸�30����䶯�����账��
	}

	/**
	 * �쳵product_id�Ƿ�ʹ��
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
	 * ��ʾĳ��Ӧ�õ�������Ʒ
	 * ��Ʒ�۸����30Ԫʱ�޶̴�֧��
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
		
		//�ҵ����е�֧��
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
	 * �༭ĳ����Ʒ���ҵ������Ʒ ����session
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
			//�����ҵ��۸�
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
	 * ɾ��ĳ����Ʒ
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
