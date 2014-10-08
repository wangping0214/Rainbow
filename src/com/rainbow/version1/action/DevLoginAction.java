package com.rainbow.version1.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.rainbow.dao.UserDAO;
import com.rainbow.entity.User;

/**
 * @author STerOTto
 * ¿ª·¢ÕßµÇÂ¼
 */
public class DevLoginAction
{
	private UserDAO userDAO;
	private String loginName;
	private String password;
	
	public void devLogin() throws IOException
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		User user = userDAO.findByEmailOrPhoneAndPassword(loginName, password);	
		if(null ==user)
			response.getWriter().println("0");
		else
		{
			response.getWriter().println("1");
			session.setAttribute("user", user);
		}
	}
	public String getLoginName()
	{
		return loginName;
	}
	public void setLoginName(String loginName)
	{
		this.loginName = loginName;
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public DevLoginAction(UserDAO userDAO)
	{
		super();
		this.userDAO = userDAO;
	}
}
