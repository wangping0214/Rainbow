package com.rainbow.action;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.dao.ReceiptDAO;
import com.rainbow.dao.TaxRateDAO;
import com.rainbow.dao.UserDAO;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.entity.Receipt;
import com.rainbow.entity.TaxRate;
import com.rainbow.entity.User;
import com.rainbow.server.App;
import com.rainbow.server.Financial;
import com.rainbow.server.FinancialSev;
import com.rainbow.util.PageUtil;

/**
 * 财务管理
 * 
 * @author STerOTto
 *
 */
public class FinancialAction {
	private UserDAO userDAO;
	private AppInfoDAO appInfoDAO;
	private AppSouDAO appSouDAO;
	private AppAutDAO appAutDAO;
	private ReceiptDAO receiptDAO;
	private TaxRateDAO taxRateDAO;

	private int appId;
	private String year;
	private String month;
	private String status;
	private int currentPage =1;

	/**
	 * 财务初始化，默认显示本年本月，状态为全部 可根据时间查询
	 * 
	 * @return
	 */
	public String initFinancial() {
		List<FinancialSev> financialSevList = new ArrayList<FinancialSev>();
		int total = userDAO.findDiviedUserApprovedNum(1);
		PageUtil page = new PageUtil(currentPage, total);
		page.setPageSize(5);
		List<User> userList = userDAO.findDiviedUserApproved(1, currentPage,
				page.getPageSize());
		Calendar now = Calendar.getInstance();
		if (year == null || "".equals(year)) {
			// 默认为本年
			year = String.valueOf(now.get(Calendar.YEAR));
		}
		if (month == null || "".equals(month)) {
			month = String.format("%02d",now.get(Calendar.MONTH)+1);
		}
		else
			month = String.format("%02d",Integer.valueOf(month));
		int check_out = -1;
		if (status == null || "".equals(status)) {
			// 默认结算状态为全部
			status = "全部";
			check_out = -1;
		}
		else{
			switch(status){
				case "全部": check_out = -1;break;
				case "已结算": check_out = 1;break;
				default : check_out = 0;break;
			}
		}
		for (User user : userList) {
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
				receiptList = receiptDAO.findByUserAppYearMonth(
						user.getCp_id(), info.getApp_id(), year + "-" + month);
				financial.setReceiptList(receiptList);
				if (receiptList.size()>0) {
					financial.setCheck_out(receiptList.get(0).getCheck_out());
				} else
					financial.setCheck_out(1);
				TaxRate taxRate = taxRateDAO
						.findByYearMonth(year + "-" + month);
				if(taxRate==null)
					return Action.ERROR;
				financial.setTaxRate(taxRate);

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
				paySum = (massageSum * (1 - taxRate.getChannel_message() / 100)
						+ alipaySum * (1 - taxRate.getChannel_alipay() / 100) + bankSum
						* (1 - taxRate.getChannel_bank() / 100))
						* (1 - taxRate.getTax_rate() / 100)
						* (1 - app.getAppAut().getDivided() / 100);
				
				DecimalFormat df=new DecimalFormat(".##");
				financial.setSum(sum);
				financial.setMassageSum(massageSum);
				financial.setAlipaySum(alipaySum);
				financial.setBankSum(bankSum);
				financial.setPaySum(Double.valueOf(df.format(paySum)));

				financialList.add(financial);
			}
			financialSev.setFinancialList(financialList);
			financialSevList.add(financialSev);
		}
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("status", status);
		session.setAttribute("check_out", check_out);
		session.setAttribute("year", year);
		session.setAttribute("month", month);
		session.setAttribute("financialSevList", financialSevList);
		session.setAttribute("page", page);
		return Action.SUCCESS;
	}
	
	/**
	 * 结算app某月的订单
	 */
	public void checkOutAppFinancial(){
		AppInfo info = appInfoDAO.findById(appId);
		Calendar now = Calendar.getInstance();
		if (year == null || "".equals(year)) {
			// 默认为本年
			year = String.valueOf(now.get(Calendar.YEAR));
		}
		if (month == null || "".equals(month)) {
			month = String.format("%02d",now.get(Calendar.MONTH)+1);
		}
		else
			month = String.format("%02d",Integer.valueOf(month));
		List<Receipt> receiptList = receiptDAO.findByUserAppYearMonth(info.getCp_id(), info.getApp_id(), year+"-"+month);
		for(Receipt receipt : receiptList){
			receipt.setCheck_out(1);
			receiptDAO.update(receipt);
		}
	}

	/**
	 * 根据订单获取支付类型
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

	public int getAppId() {
		return appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public FinancialAction(UserDAO userDAO, AppInfoDAO appInfoDAO,
			AppSouDAO appSouDAO, AppAutDAO appAutDAO, ReceiptDAO receiptDAO,
			TaxRateDAO taxRateDAO) {
		super();
		this.userDAO = userDAO;
		this.appInfoDAO = appInfoDAO;
		this.appSouDAO = appSouDAO;
		this.appAutDAO = appAutDAO;
		this.receiptDAO = receiptDAO;
		this.taxRateDAO = taxRateDAO;
	}

}
