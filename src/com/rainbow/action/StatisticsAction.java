package com.rainbow.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.dao.ReviewDAO;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.entity.Review;
import com.rainbow.entity.User;
import com.rainbow.server.App;
import com.rainbow.util.PageUtil;

/**
 * @author SterOtto
 *@version 2014-7-19 22:53:21
 *统计列表  统计用户上传应用的下载次数和评论数
 */
public class StatisticsAction
{
	private static final Log logger = LogFactory.getLog(StatisticsAction.class);
	private AppInfoDAO appInfoDAO;
	private AppAutDAO appAutDAO;
	private AppSouDAO appSouDAO;
	private ReviewDAO reviewDAO;
	
	private String cp_id;
	private int currentPage = 1 ;
	private int appId;
	
	/**
	 * 根据cp_id找到用户的通过审核的应用
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String showUserStatistics()
	{ 
		HttpSession httpSession = ServletActionContext.getRequest()
				.getSession(); 
		User user = (User) httpSession.getAttribute("user");
		cp_id = user.getCp_id();
		int total = appInfoDAO.findByUserIdAndThroughNum(cp_id, 1);
		PageUtil page = new PageUtil(currentPage, total);
		page.setPageSize(5);
		List<AppInfo> appInfo = appInfoDAO.findByUserIdAndThrough(cp_id, 1, currentPage, page.getPageSize());
		List<App> appList = new ArrayList<>();
		for(AppInfo info:appInfo)
		{
			int appId = info.getId();
			AppSource sou = appSouDAO.findById(appId);
			AppAuthority aut = appAutDAO.findById(appId);
			List<Review> review = reviewDAO.findByAppId(appId);
			App app = new App(info, sou, aut);
			app.setReview(review);
			appList.add(app);
		}
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("app", appList);
		request.put("page", page);
		return Action.SUCCESS;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String showAppStatistics(){
		int total = 1;
		PageUtil page = new PageUtil(currentPage, total);
		page.setPageSize(5);
		List<App> appList = new ArrayList<>();
		AppInfo info = appInfoDAO.findById(appId);
		AppSource sou = appSouDAO.findById(appId);
		AppAuthority aut = appAutDAO.findById(appId);
		List<Review> review = reviewDAO.findByAppId(appId);
		App app = new App(info, sou, aut);
		app.setReview(review);
		appList.add(app);
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("app", appList);
		request.put("page", page);
		return Action.SUCCESS;
	}
	
	public StatisticsAction(AppInfoDAO appInfoDAO, AppAutDAO appAutDAO,
			AppSouDAO appSouDAO, ReviewDAO reviewDAO)
	{
		super();
		this.appInfoDAO = appInfoDAO;
		this.appAutDAO = appAutDAO;
		this.appSouDAO = appSouDAO;
		this.reviewDAO = reviewDAO;
	}

	public String getCp_id()
	{
		return cp_id;
	}

	public void setCp_id(String cp_id)
	{
		this.cp_id = cp_id;
	}

	public int getCurrentPage()
	{
		return currentPage;
	}
	
	public int getAppId() {
		return appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}

	public void setCurrentPage(int currentPage)
	{
		this.currentPage = currentPage;
	}
	
}
