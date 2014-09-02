package com.rainbow.appaction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.rainbow.dao.UserDAO;
import com.rainbow.entity.User;

public class AppLoginAction
{
	
	private String username;
	private String password;
	private UserDAO userdao;
	
	//app端的登入验证
	
	public void AppLogin() throws IOException
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		User u1=userdao.login(username, password);
		if(u1!=null)
		{
			out.print(true);
			
		}
		else
		{
			out.print(false);
			
		}
		
		 
	}
	public AppLoginAction(UserDAO userdao)
	{
		super();
		this.userdao = userdao;
	}
	
	public String getUsername()
	{
		return username;
	}
	public void setUsername(String username)
	{
		this.username = username;
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	
}
