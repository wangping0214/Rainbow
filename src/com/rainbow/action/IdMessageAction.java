package com.rainbow.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.rainbow.dao.AdminDAO;
import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.dao.UserDAO;
import com.rainbow.entity.Admin;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.entity.User;
import com.rainbow.server.App;
import com.rainbow.util.PageUtil;

/**
 * @author STerOTto
 * @version 2014-7-3 16:01:59 cp查看id信息
 */
public class IdMessageAction
{

	private AdminDAO adminDAO;
	private UserDAO userDAO;
	private AppAutDAO appAutDAO;
	private AppInfoDAO appInfoDAO;
	private AppSouDAO appSouDAO;

	private int apkId;
	private int currentPage;
	private String type;

	/**
	 * 找到用户所有通过应用的id信息
	 */
	@SuppressWarnings(
	{ "rawtypes", "unchecked" })
	public String showAllIdMessage()
	{
		HttpSession httpSession = ServletActionContext.getRequest()
				.getSession();
		String userName = (String) httpSession.getAttribute("username");
		httpSession.removeAttribute("type");
		int total = appInfoDAO.findByIsThroughNum(userName, 1);
		PageUtil page = new PageUtil(currentPage, total);
		page.setPageSize(10);
		List<AppInfo> appInfo = appInfoDAO.findByIsThrough(userName, 1,
				currentPage, page.getPageSize());
		List<App> app = new ArrayList<>();
		for (int i = 0; i < appInfo.size(); i++)
		{
			AppInfo info = appInfo.get(i);
			AppSource sou = appSouDAO.findById(info.getId());
			AppAuthority aut = appAutDAO.findById(info.getId());
			app.add(new App(info, sou, aut));
		}
		System.out.println("userName:" + userName + "\nsize:" + app.size());
		Map request = (Map) ActionContext.getContext().get("request");
		Admin admin = adminDAO.findByName(userName);
		User user = userDAO.findByUser(userName);
		if (admin != null)
		{
			request.put("cp_id", admin.getCp_id());
			request.put("company", "北京五彩时空科技有限公司");
		} else
		{
			request.put("cp_id", user.getCp_id());
			request.put("company", user.getCorporatename());
		}
		request.put("app", app);
		request.put("page", page);
		return Action.SUCCESS;
	}

	/**
	 * 根据类型查找id信息
	 */
	@SuppressWarnings("unchecked")
	public String showApplicationMessage()
	{
		HttpSession httpSession = ServletActionContext.getRequest()
				.getSession();
		String userName = (String) httpSession.getAttribute("username");
		httpSession.setAttribute("type", type);
		int total = appInfoDAO.findUserTypeMessageNum(userName, 1, type);
		PageUtil page = new PageUtil(currentPage, total);
		page.setPageSize(10);
		List<AppInfo> appInfo = appInfoDAO.findUserTypeMessage(userName, 1,
				type, currentPage, page.getPageSize());
		List<App> app = new ArrayList<>();
		for (int i = 0; i < appInfo.size(); i++)
		{
			AppInfo info = appInfo.get(i);
			AppSource sou = appSouDAO.findById(info.getId());
			AppAuthority aut = appAutDAO.findById(info.getId());
			app.add(new App(info, sou, aut));
		}
		@SuppressWarnings("rawtypes")
		Map request = (Map) ActionContext.getContext().get("request");
		Admin admin = adminDAO.findByName(userName);
		User user = userDAO.findByUser(userName);
		if (admin != null)
		{
			request.put("cp_id", admin.getCp_id());
			request.put("company", "北京五彩时空科技有限公司");
		} else
		{
			request.put("cp_id", user.getCp_id());
			request.put("company", user.getCorporatename());
		}
		request.put("app", app);
		request.put("page", page);
		return Action.SUCCESS;
	}

	public int getApkId()
	{
		return apkId;
	}

	public void setApkId(int apkId)
	{
		this.apkId = apkId;
	}

	public int getCurrentPage()
	{
		return currentPage;
	}

	public void setCurrentPage(int currentPage)
	{
		this.currentPage = currentPage;
	}

	public String getType()
	{
		return type;
	}

	public void setType(String type)
	{
		this.type = type;
	}

	public IdMessageAction(AdminDAO adminDAO, UserDAO userDAO,
			AppAutDAO appAutDAO, AppInfoDAO appInfoDAO, AppSouDAO appSouDAO)
	{
		super();
		this.adminDAO = adminDAO;
		this.userDAO = userDAO;
		this.appAutDAO = appAutDAO;
		this.appInfoDAO = appInfoDAO;
		this.appSouDAO = appSouDAO;
	}

}
