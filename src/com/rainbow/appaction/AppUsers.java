package com.rainbow.appaction;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.rainbow.dao.UserDAO;
import com.rainbow.email.MailSenderInfo;
import com.rainbow.email.SimpleMailSender;
import com.rainbow.entity.User;

public class AppUsers
{
	private UserDAO userdao;//使用的dao
	User u=new User();//创建User对象
	
	private String code;//验证码
	private String phone;//手机号
	String account = "cf_wcskdxyz";//用户名
	String pwd = "wcsk1212";//密码
	String postUrl = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";//地址
	
	
	private HttpSession session;
	private String Email;//Email
	private String username;//用户名
	private String password;//密码
	private String newpassword;//新密码
	private int id;//用户id
	
	private String realname;//用户实名
	private String  address;//地址
	/**
	 * gyn
	 * app用户修改个人资料
	 * realname 
	 * Email
	 * address
	 */
	public void Mpi() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		u=userdao.find(id);
		if(u==null){
			out.print("NULL");
			return;
		}
		if(realname!=null){
			u.setRealname(realname);
		}
		if(Email!=null){
			u.setEmail(Email);
		}
		if(address!=null){	
			u.setAddress(address);
		}
		if(phone!=null){
			u.setTelephone(phone);
		}
		userdao.update(u);
		out.print(true);
	}
	/**
	 * gyn
	 * app用户获取个人资料
	 * @throws IOException 
	 * id 用户id
	 */
	public void Pin() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		u=userdao.find(id);
		//实例化
		Gson gson = new Gson();
		//声明和赋空值
		String result = "";		
		result = gson.toJson(u);
		out.print(result);
	}
	
	
	/**
	 * gyn 
	 * app用户密码修改
	 * id 用户id
	 * password 原密码
	 * newpassword 新密码
	 */
	public void udpwd() throws IOException{
		System.out.println("进入updatepwd");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		u=userdao.find(id);
		if(u!=null){
		if(u.getPassword().equals(password)){
			u.setPassword(newpassword);
			userdao.updatepwd(u);	
			u=userdao.find(u.getId());
			out.print(true);
			out.print("新密码是:"+u.getPassword());
		
		}else{
			out.print("原密码不对");
			out.print(false);
		}
		}else{
			out.print("没有这个用户");
			out.print(false);
		}				
	}
	
	
	/**
	 * gyn
	 * app用户登入验证
	 * 需要username 用户名
	 * password 密码
	 */
	public void AppLogin() throws IOException
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
	    u=userdao.login(username, password);
		if(u!=null)
		{
			
			out.print(true);
			
		}
		else
		{
			out.print(false);
			
		}
		
		 
	}
	
	
	/**
	 * gyn
	 * 新用户注册
	 * 需要username 用户名
	 * password 密码
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
			out.print(false);
			return; 

		}
		u.setUsername(username);
		u.setPassword(password);
		userdao.save(u);
		out.print(true);
		

	}
	
	
	/**
	 * gyn
	 * 向电子邮件发送改密码网站
	 * 需要Email 已经绑定的Email
	 */
	public void forgotEmail() throws IOException
	{
		  
		  HttpServletResponse response = ServletActionContext.getResponse();
		  response.setContentType("application/json");
		  response.setCharacterEncoding("UTF-8");
		  PrintWriter out = response.getWriter();
		  if(Email==null)
		  {
			  out.print("NULL");
				return;
		  }
		  User u=userdao.findByEmail(Email);
		  //判断是否有这个邮箱
		  if(u!=null)
		  {
		  //发送邮件
		  MailSenderInfo mailInfo = new MailSenderInfo();    
	      mailInfo.setMailServerHost("smtp.chaimiyouxi.com");    
	      mailInfo.setMailServerPort("25"); 
	      mailInfo.setValidate(true);    
	      mailInfo.setUserName("system@chaimiyouxi.com");    
	      mailInfo.setPassword("nandayong11");//邮箱密码    
	      mailInfo.setFromAddress("system@chaimiyouxi.com");   
	      //发送的地址
	      mailInfo.setToAddress(Email); 
	      //标题
	      mailInfo.setSubject("柴米游戏"); 
	      //时间
	      SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	      String nowTime = df.format(new Date());
	      mailInfo.setContent(""
	      		+ "请点击以下链接来修改密码"
	      		+"http://localhost:8080/Rainbow/forgotEmail"
	    		  );    
	         //这个类主要来发送邮件   
	      SimpleMailSender sms = new SimpleMailSender();   
	          //sms.sendTextMail(mailInfo);//发送文体格式    
	          sms.sendHtmlMail(mailInfo);//发送html格式   
	          
	          out.println(true);
		  }
		  else
		  {
			  out.println(false);
		  }
		  
		 
	}
	
	

	/**
	 * gyn
	 * 生成并发送验证码
	 * @throws IOException
	 * 需要phone 已经绑定的手机号
	 * 
	 */

	public void appSendCode() throws IOException
	{

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		if(phone==null)
		{
			out.print("NULL"); 
			return;
		}
		
		User user=userdao.findByPhone(phone);
		if(user!=null)
		{
		try
		{
			out.println(user.getTelephone());
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
			sb.append("&account=" + account);
			sb.append("&password=" + pwd);
			sb.append("&content=" + content);
			sb.append("&mobile=" + phone);
			OutputStream os = connection.getOutputStream();
			os.write(sb.toString().getBytes());
			os.close();
			out.println(true); 
			String line, result = "";
			BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
			while ((line = in.readLine()) != null) {
				result += line + "\n";
			}
			in.close();
			out.println(result);

		}
		catch (Exception e)
		{
			// TODO: handle exception
			e.printStackTrace(System.out);
		}
		}
		else
		{
			out.println(false); 
		}
		
	

	}
	
	
	/**
	 * gyn
	 *  判断验证码是否正确
	 * @throws IOException
	 * 需要code参数  已经发送的手机验证码
	 */

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
			out.print("NULL"); // "none"
			return;
		}
		if (codes.equalsIgnoreCase(code))
		{
			out.println(true);
		}
		else
		{
			out.println(false);
		}
		session.removeAttribute("app_code");

	}
	
	
	
	
	
	public String getAddress()
	{
		return address;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	public String getRealname()
	{
		return realname;
	}
	public void setRealname(String realname)
	{
		this.realname = realname;
	}
	public String getCode()
	{
		return code;
	}


	public void setCode(String code)
	{
		this.code = code;
	}


	public String getPhone()
	{
		return phone;
	}


	public void setPhone(String phone)
	{
		this.phone = phone;
	}


	public HttpSession getSession()
	{
		return session;
	}


	public void setSession(HttpSession session)
	{
		this.session = session;
	}


	public String getEmail()
	{
		return Email;
	}


	public void setEmail(String email)
	{
		Email = email;
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
	public String getNewpassword()
	{
		return newpassword;
	}
	public void setNewpassword(String newpassword)
	{
		this.newpassword = newpassword;
	}
	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public AppUsers(UserDAO userdao)
	{
		super();
		this.userdao = userdao;
	}

}
