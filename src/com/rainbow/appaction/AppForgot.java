package com.rainbow.appaction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.rainbow.dao.UserDAO;
import com.rainbow.entity.User;

public class AppForgot
{
	private String username;
	private String password;
	private String newpassword;
	private UserDAO userdao;
	/**
	 * gyn app端密码修改
	 * 
	 */
	public void udpwd() throws IOException{
		System.out.println("进入updatepwd");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		User user=new User();
		System.out.println(username);
		System.out.println(password);
		System.out.println(newpassword);
		
		user=userdao.login(username, password);
		
		System.out.println(user);
		
		if(user!=null){
			
			user.setPassword(newpassword);
			userdao.updatepwd(user);
			
			user=userdao.find(user.getId());
			out.print(true);
			out.print("新密码是:"+user.getPassword());
			
		}else{
			out.print(false);
		}
		
		
	}
	
	public String getNewpassword()
	{
		return newpassword;
	}

	public void setNewpassword(String newpassword)
	{
		this.newpassword = newpassword;
	}

	public AppForgot(UserDAO userdao)
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
