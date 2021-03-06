package com.rainbow.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.dao.TaxRateDAO;
import com.rainbow.dao.UserDAO;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.entity.TaxRate;
import com.rainbow.entity.User;
import com.rainbow.server.App;
import com.rainbow.server.UserApps;
import com.rainbow.util.PageUtil;

/**
 * @author STerOTto
 * @version 2014-8-1 13:55:30
 */
public class DividManageAction {
	private AppInfoDAO appInfoDAO;
	private AppSouDAO appSouDAO;
	private AppAutDAO appAutDAO;
	private UserDAO userDAO;
	private TaxRateDAO taxRateDAO;

	private int appId;
	private int currentPage = 1;
	private int userId;
	private AppAuthority appAut;

	/**
	 * 超级管理员后台点击分成管理找到所有的开发者
	 * 
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String findAllUserJoint() {
		int total = userDAO.findDiviedUserApprovedNum(1);
		PageUtil page = new PageUtil(currentPage, total);
		page.setPageSize(5);
		List<User> userList = userDAO.findDiviedUserApproved(1, currentPage,
				page.getPageSize());
		List<UserApps> userAppsList = new ArrayList<UserApps>();
		for (User user : userList) {
			List<AppInfo> appInfo = appInfoDAO.findUserJointApp(
					user.getCp_id(), 1);
			List<App> appList = new ArrayList<App>();
			for (AppInfo info : appInfo) {
				AppSource sou = appSouDAO.findById(info.getId());
				AppAuthority aut = appAutDAO.findById(info.getId());
				appList.add(new App(info, sou, aut));
			}
			UserApps userApps = new UserApps();
			userApps.setUser(user);
			userApps.setApp(appList);
			userAppsList.add(userApps);
		}
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("userAppsList", userAppsList);
		request.put("page", page);
		return Action.SUCCESS;
	}

	/**
	 * 查询cp的联运的app分成信息
	 * 
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String checkUserJointApps() {
		User user = userDAO.find(userId);
		UserApps userApps = new UserApps();
		int total = appInfoDAO.findUserJointAppNum(user.getCp_id(), 1);
		PageUtil page = new PageUtil(currentPage, total);
		page.setPageSize(3);
		List<AppInfo> appInfo = appInfoDAO.findUserJointApp(user.getCp_id(), 1,
				currentPage, page.getPageSize());
		List<App> appList = new ArrayList<App>();
		for (AppInfo info : appInfo) {
			AppSource sou = appSouDAO.findById(info.getId());
			AppAuthority aut = appAutDAO.findById(info.getId());
			App app = new App(info, sou, aut);
			Date dt=new Date();
			SimpleDateFormat matter1=new SimpleDateFormat("yyyy-MM");
			String time = matter1.format(dt);
			TaxRate taxRate = taxRateDAO.findByYearMonth(time);
			app.setTaxRate(taxRate);
			appList.add(app);
		}
		userApps.setUser(user);
		userApps.setApp(appList);
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("userApps", userApps);
		request.put("page", page);
		return Action.SUCCESS;
	}

	/**
	 * 编辑cp的app的分成信息
	 */
	public void editAppDivided() {
		AppAuthority aut = appAutDAO.findById(appId);
		aut.setDivided(appAut.getDivided());
		appAutDAO.updatePart(aut);
	}

	

	public DividManageAction(AppInfoDAO appInfoDAO, AppSouDAO appSouDAO,
			AppAutDAO appAutDAO, UserDAO userDAO, TaxRateDAO taxRateDAO) {
		super();
		this.appInfoDAO = appInfoDAO;
		this.appSouDAO = appSouDAO;
		this.appAutDAO = appAutDAO;
		this.userDAO = userDAO;
		this.taxRateDAO = taxRateDAO;
	}

	public int getAppId() {
		return appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public AppAuthority getAppAut() {
		return appAut;
	}

	public void setAppAut(AppAuthority appAut) {
		this.appAut = appAut;
	}

}
