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

/**
 * @author Gyn ���ֻ��һ����빦��
 *
 */
public class AppForgotPassword
{
	private String num;
	private String phone;
	String account = "cf_wcskdxyz";
	String password = "wcsk1212";

	String postUrl = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
	private HttpSession session;

	// ���ɲ�������֤��

	public void appSendCode() throws IOException
	{
		try
		{

			session = ServletActionContext.getRequest().getSession();
			// �������6λ�����
			int numb = (int) ((Math.random() * 9 + 1) * 100000);
			// ����numb
			session.setAttribute("app_code", String.valueOf(numb));

			String content = new String("������֤���ǣ�" + numb
					+ "���벻Ҫ����֤��й¶�������ˡ���Ǳ��˲������ɲ�����ᣡ");
			URL url = new URL(postUrl);
			HttpURLConnection connection = (HttpURLConnection) url
					.openConnection();
			connection.setDoOutput(true);// ���������ύ��Ϣ
			connection.setRequestMethod("POST");// ��ҳ�ύ��ʽ��GET������POST��
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

		}
		catch (Exception e)
		{
			// TODO: handle exception
			e.printStackTrace(System.out);
		}

	}

	// �ж���֤���Ƿ���ȷ

	public void appCheckCode() throws IOException
	{
		session = ServletActionContext.getRequest().getSession();
		String code = (String) session.getAttribute("app_code");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		if (code == null)
		{
			out.print(Action.NONE); // "none"
			return;
		}
		if (code.equalsIgnoreCase(num))
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

	public String getNum()
	{
		return num;
	}

	public void setNum(String num)
	{
		this.num = num;
	}

	public HttpSession getSession()
	{
		return session;
	}

	public void setSession(HttpSession session)
	{
		this.session = session;
	}
}
