package com.rainbow.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
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
import com.rainbow.server.UserApps;
import com.rainbow.util.PageUtil;

/**
 * @author STerOTto
 *@version 2014-8-7 15:35:50
 */
public class AdminReportAction {
	private UserDAO userDAO;
	private AppInfoDAO appInfoDAO;
	private AppSouDAO appSouDAO;
	private AppAutDAO appAutDAO;
	private ReceiptDAO receiptDAO;
	
	private int userId ;
	private int appId ;
	private String payType;
	private String startTime ;
	private String endTime ;
	private String companyOrName;
	private String orderIdOrAppName ;
	private int currentPage = 1 ;
	
	/**
	 * 企业订单初始化
	 * @return
	 */
	public String adminReportInit(){
		int jointAppCount = appInfoDAO.findAllJointNum(1);//联运应用数量
		int receiptCount = 0;//订单数
		double cmyxPaySum = 0; //总金额
		
		int total = userDAO.findDiviedUserApprovedNum(1);
		PageUtil page = new PageUtil(currentPage, total);
		page.setPageSize(5);
		List<User> userList = userDAO.findDiviedUserApproved(1, currentPage, page.getPageSize());
		List<UserApps> userAppsList = new ArrayList<UserApps>();
		for(User user: userList){
			List<App> appList = new ArrayList<App>();
			List<AppInfo> appInfo = appInfoDAO.findUserJointApp(user.getCp_id(), 1);
			for(AppInfo info : appInfo){
				AppSource sou = appSouDAO.findById(info.getId());
				AppAuthority aut = appAutDAO.findById(info.getId());
				appList.add(new App(info,sou,aut));
			}
			List<Receipt> receiptList = receiptDAO.findByCp_id(user.getCp_id());
			double paySum = 0;
			for (Receipt receipt:receiptList){
				receiptCount++;
				paySum += receipt.getPrice();
				cmyxPaySum+=receipt.getPrice();
			}
			UserApps userApps = new UserApps();
			userApps.setUser(user);
			userApps.setApp(appList);
			userApps.setReceiptList(receiptList);
			userApps.setPaySum(paySum);
			userAppsList.add(userApps);
		}
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("jointAppCount", jointAppCount);
		session.setAttribute("receiptCount", receiptCount);
		session.setAttribute("cmyxPaySum", cmyxPaySum);
		session.setAttribute("userAppsList", userAppsList);
		session.setAttribute("page", page);
		return Action.SUCCESS;
	}
	
	/**
	 * 管理员查询金额
	 * @return
	 */
	public void adminEarnings(){
		double earningsSum = 0;
		List<Receipt> receiptList = new ArrayList<Receipt>();
		if("全部支付".equals(payType)){
			receiptList = receiptDAO.findByTime(startTime, endTime);
		}
		else{
			String typeReg="";
			switch(payType){
			case "短代":typeReg="00";break;
			case "支付宝":typeReg="01";break;
			default :typeReg="02";break;
			}
			receiptList = receiptDAO.findByTypeAndTime(typeReg, startTime, endTime);
		}
		for(Receipt receipt:receiptList)
			earningsSum+=receipt.getPrice();
		HttpServletResponse response = ServletActionContext.getResponse();      
        response.setCharacterEncoding("UTF-8");      
        try {
			response.getWriter().write(String.valueOf(earningsSum));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 超级管理员搜索某个企业的账单
	 * @return
	 */
	public String adminSearchUserReport(){
		int total = userDAO.findByUserCompanyOrNameNum(1, companyOrName);
		PageUtil page = new PageUtil(currentPage, total);
		page.setPageSize(5);
		List<User> userList = userDAO.findByUserCompanyOrName(1, companyOrName, currentPage, page.getPageSize());
		List<UserApps> userAppsList = new ArrayList<UserApps>();
		for(User user: userList){
			List<App> appList = new ArrayList<App>();
			List<AppInfo> appInfo = appInfoDAO.findUserJointApp(user.getCp_id(), 1);
			for(AppInfo info : appInfo){
				AppSource sou = appSouDAO.findById(info.getId());
				AppAuthority aut = appAutDAO.findById(info.getId());
				appList.add(new App(info,sou,aut));
			}
			List<Receipt> receiptList = receiptDAO.findByCp_id(user.getCp_id());
			double paySum = 0;
			for (Receipt receipt:receiptList){
				paySum += receipt.getPrice();
			}
			UserApps userApps = new UserApps();
			userApps.setUser(user);
			userApps.setApp(appList);
			userApps.setReceiptList(receiptList);
			userApps.setPaySum(paySum);
			userAppsList.add(userApps);
		}
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("userAppsList", userAppsList);
		session.setAttribute("page", page);
		return Action.SUCCESS;
	}
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getAppId() {
		return appId;
	}
	public void setAppId(int appId) {
		this.appId = appId;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	public String getCompanyOrName() {
		return companyOrName;
	}

	public void setCompanyOrName(String companyOrName) {
		this.companyOrName = companyOrName;
	}

	public String getOrderIdOrAppName() {
		return orderIdOrAppName;
	}
	public void setOrderIdOrAppName(String orderIdOrAppName) {
		this.orderIdOrAppName = orderIdOrAppName;
	}
	public AdminReportAction(AppInfoDAO appInfoDAO, AppSouDAO appSouDAO,
			AppAutDAO appAutDAO, ReceiptDAO receiptDAO, String orderIdOrAppName) {
		super();
		this.appInfoDAO = appInfoDAO;
		this.appSouDAO = appSouDAO;
		this.appAutDAO = appAutDAO;
		this.receiptDAO = receiptDAO;
		this.orderIdOrAppName = orderIdOrAppName;
	}
	
}
