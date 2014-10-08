package com.rainbow.appaction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.rainbow.dao.UserDAO;
import com.rainbow.entity.User;

public class AppLoginAction
{
	private String newpassword;
	private String username;
	private String password;
	private UserDAO userdao;
	
	/**
	 * gyn
	 * app端的登入验证
	 * @throws IOException
	 */
	
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
	/**
	 * gyn   、
	 * app端密码修改
	 * @throws IOException
	 */
	public void updatepwd() throws IOException{
		System.out.println("进入updatepwd");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		if(username==null&&password==null){
			out.print("用户名密码为空");
		}else if(username==null){
			out.print("用户名为空");
		}else{
			out.print("密码为空");
		}
		User user=new User();
		user=userdao.login(username, password);
		System.out.println(username);
		System.out.println(password);
		System.out.println(newpassword);
		if(user!=null){
			System.out.println(user.getId());
			int id=0;
			id=user.getId();
			user.setPassword(newpassword);
			userdao.updatepwd(user);
			out.print(true);
			user=userdao.find(id);
			
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
