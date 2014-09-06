package com.rainbow.action;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.dao.ReceiptDAO;
import com.rainbow.dao.UserDAO;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.entity.Receipt;
import com.rainbow.entity.User;
import com.rainbow.server.App;
import com.rainbow.server.Financial;
import com.rainbow.server.FinancialSev;
import com.rainbow.util.PageUtil;

/**
 * @author STerOTto
 *@use Admin manage financial'information of joint apps is visitable to finance
 */
public class AdminSetFinancialAction
{
	private final static DecimalFormat df = new DecimalFormat(".##");//数据格式
	
	private UserDAO userDAO;
	private AppInfoDAO appInfoDAO;
	private AppSouDAO appSouDAO;
	private AppAutDAO appAutDAO;
	private ReceiptDAO receiptDAO;
	
	private int currentPage = 1;
	private int appId;
	private int visitable;
	
	/**
	 * Get users who have joint apps
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String initAdminSetFinancial()
	{
		List<FinancialSev> financialSevList = new ArrayList<FinancialSev>();
		int total = userDAO.findDeveloperHasJointAppSize(1);
		PageUtil page = new PageUtil(currentPage, total);
		page.setPageSize(5);
		List<User> userList = userDAO.findDeveloperHasJointApp(1, currentPage, page.getPageSize());
		for(User user : userList)
		{
			FinancialSev financialSev = new FinancialSev();
			financialSev.setUser(user);
			List<Financial> financialList = new ArrayList<Financial>();
			List<AppInfo> appInfoList = appInfoDAO.findUserJointApp(
					user.getCp_id(), 1);
			for (AppInfo info : appInfoList) {
				Financial financial = new Financial();
				AppSource sou = appSouDAO.findById(info.getId());
				AppAuthority aut = appAutDAO.findById(info.getId());
				App app = new App(info, sou, aut);
				financial.setApp(app);

				List<Receipt> receiptList = new ArrayList<Receipt>();
				receiptList = receiptDAO.findByCp_idAndApp_id(
						user.getCp_id(), info.getApp_id());
				financial.setReceiptList(receiptList);
				double sum = 0.0;
				double massageSum = 0.0;
				double alipaySum = 0.0;
				double bankSum = 0.0;
				double paySum = 0.0;
				for (Receipt receipt : receiptList) {
					switch (getType(receipt.getOrder_id())) {
					case 0:
						massageSum += receipt.getPrice();
						break;
					case 1:
						alipaySum += receipt.getPrice();
						break;
					default:
						bankSum += receipt.getPrice();
						break;
					}
				}
				sum = massageSum + alipaySum + bankSum;
	
				financial.setSum(Double.valueOf(df.format(sum)));
				financial.setMassageSum(Double.valueOf(df.format(massageSum)));
				financial.setAlipaySum(Double.valueOf(df.format(alipaySum)));
				financial.setBankSum(Double.valueOf(df.format(bankSum)));
				financial.setPaySum(Double.valueOf(df.format(paySum)));

				financialList.add(financial);
			}
			financialSev.setFinancialList(financialList);
			financialSevList.add(financialSev);
		}
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("page", page);
		request.put("financialSevList", financialSevList);
		return Action.SUCCESS;
	}
	
	/**
	 * Set app is visitabled to finance according to the values of appId and visitable
	 */
	public void setAppVisitable()
	{
		AppAuthority appAut = appAutDAO.findById(appId);
		appAut.setVisitable(visitable);
		appAutDAO.updatePart(appAut);
	}
	
	
	/**
	 * 根据订单获取支付类型
	 * 
	 * @param Order_id
	 * @return
	 */
	public int getType(String Order_id) {
		String reg1 = "^[0-9]{12}00[0-9]*$";
		String reg2 = "^[0-9]{12}01[0-9]*$";
		if (Pattern.matches(reg1, Order_id))
			return 0;// 短代
		else if (Pattern.matches(reg2, Order_id))
			return 1;// 支付宝
		else
			return 2;// 银联
	}
	
	public int getCurrentPage()
	{
		return currentPage;
	}

	public void setCurrentPage(int currentPage)
	{
		this.currentPage = currentPage;
	}
	
	public int getAppId()
	{
		return appId;
	}

	public void setAppId(int appId)
	{
		this.appId = appId;
	}
	
	public int getVisitable()
	{
		return visitable;
	}

	public void setVisitable(int visitable)
	{
		this.visitable = visitable;
	}

	public AdminSetFinancialAction(UserDAO userDAO, AppInfoDAO appInfoDAO,
			AppSouDAO appSouDAO, AppAutDAO appAutDAO,ReceiptDAO receiptDAO)
	{
		super();
		this.userDAO = userDAO;
		this.appInfoDAO = appInfoDAO;
		this.appSouDAO = appSouDAO;
		this.appAutDAO = appAutDAO;
		this.receiptDAO = receiptDAO;
	}
}
