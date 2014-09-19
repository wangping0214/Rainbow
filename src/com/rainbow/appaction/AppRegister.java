package com.rainbow.appaction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.rainbow.dao.UserDAO;
import com.rainbow.entity.User;

public class AppRegister
{
	private UserDAO userdao;
	private String username;
	private String password;
	/**
	 * gyn
	 * 新用户注册
	 * @throws IOException
	 */
	public void Signup() throws IOException
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		//判断新注册用户是否存在
		if(userdao.findByUser(username)!=null)
		{
			out.print(Action.ERROR);
			return; 

		}
		
		User u=new User();
		u.setUsername(username);
		u.setPassword(password);
		userdao.save(u);
		out.print(Action.SUCCESS);
		// TODO Auto-generated method stub

	}
	
	public AppRegister(UserDAO userdao)
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
