package com.rainbow.appaction;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.rainbow.dao.UserDAO;
import com.rainbow.entity.User;

/**
 * @author Gyn 用手机找回密码功能
 *
 */
public class AppForgotPassword
{
	private UserDAO userdao;
	

	private String code;
	private String phone;
	String account = "cf_wcskdxyz";
	String password = "wcsk1212";

	String postUrl = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
	private HttpSession session;

	// 生成并发送验证码

	public void appSendCode() throws IOException
	{

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		  
		User user=userdao.findByPhone(phone);
		if(user!=null)
		{
		try
		{

			session = ServletActionContext.getRequest().getSession();
			// 随机生成6位随机数
			int num = (int) ((Math.random() * 9 + 1) * 100000);
			// 保存num
			session.setAttribute("app_code", String.valueOf(num));

			String content = new String("您的验证码是：" + num
					+ "。请不要把验证码泄露给其他人。如非本人操作，可不用理会！");
			URL url = new URL(postUrl);
			HttpURLConnection connection = (HttpURLConnection) url
					.openConnection();
			connection.setDoOutput(true);// 允许连接提交信息
			connection.setRequestMethod("POST");// 网页提交方式“GET”、“POST”
			connection.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");
			connection.setRequestProperty("Connection", "Keep-Alive");
			StringBuffer sb = new StringBuffer();
			sb.append("account=" + account);
			sb.append("&password=" + password);
			sb.append("&content=" + content);
			sb.append("&mobile=" + phone);
			OutputStream os = connection.getOutputStream();
			os.write(sb.toString().getBytes());
			os.close();
			out.println(Action.SUCCESS); 

		}
		catch (Exception e)
		{
			// TODO: handle exception
			e.printStackTrace(System.out);
		}
		}
		else
		{
			out.println(Action.ERROR); 
		}

	}

	// 判断验证码是否正确

	public void appCheckCode() throws IOException
	{
		session = ServletActionContext.getRequest().getSession();
		String codes = (String) session.getAttribute("app_code");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		if (codes == null)
		{
			out.print(Action.NONE); // "none"
			return;
		}
		if (codes.equalsIgnoreCase(code))
		{
			out.println(Action.SUCCESS);
		}
		else
		{
			out.println(Action.ERROR);
		}
		session.removeAttribute("app_code");

	}

	public String getPhone()
	{
		return phone;
	}

	public void setPhone(String phone)
	{
		this.phone = phone;
	}

	

	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public HttpSession getSession()
	{
		return session;
	}

	public void setSession(HttpSession session)
	{
		this.session = session;
	}
	public AppForgotPassword(UserDAO userdao)
	{
		super();
		this.userdao = userdao;
	}
}
