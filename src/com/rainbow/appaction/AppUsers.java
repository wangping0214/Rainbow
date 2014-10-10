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
	private UserDAO userdao;//ʹ�õ�dao
	User u=new User();//����User����
	
	private String code;//��֤��
	private String phone;//�ֻ���
	String account = "cf_wcskdxyz";//�û���
	String pwd = "wcsk1212";//����
	String postUrl = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";//��ַ
	
	
	private HttpSession session;
	private String Email;//Email
	private String username;//�û���
	private String password;//����
	private String newpassword;//������
	private int id;//�û�id
	
	private String realname;//�û�ʵ��
	private String  address;//��ַ
	/**
	 * gyn
	 * app�û��޸ĸ�������
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
	 * app�û���ȡ��������
	 * @throws IOException 
	 * id �û�id
	 */
	public void Pin() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		u=userdao.find(id);
		//ʵ����
		Gson gson = new Gson();
		//�����͸���ֵ
		String result = "";		
		result = gson.toJson(u);
		out.print(result);
	}
	
	
	/**
	 * gyn 
	 * app�û������޸�
	 * id �û�id
	 * password ԭ����
	 * newpassword ������
	 */
	public void udpwd() throws IOException{
		System.out.println("����updatepwd");
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
			out.print("��������:"+u.getPassword());
		
		}else{
			out.print("ԭ���벻��");
			out.print(false);
		}
		}else{
			out.print("û������û�");
			out.print(false);
		}				
	}
	
	
	/**
	 * gyn
	 * app�û�������֤
	 * ��Ҫusername �û���
	 * password ����
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
	 * ���û�ע��
	 * ��Ҫusername �û���
	 * password ����
	 */
	public void Signup() throws IOException
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		//�ж���ע���û��Ƿ����
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
	 * ������ʼ����͸�������վ
	 * ��ҪEmail �Ѿ��󶨵�Email
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
		  //�ж��Ƿ����������
		  if(u!=null)
		  {
		  //�����ʼ�
		  MailSenderInfo mailInfo = new MailSenderInfo();    
	      mailInfo.setMailServerHost("smtp.chaimiyouxi.com");    
	      mailInfo.setMailServerPort("25"); 
	      mailInfo.setValidate(true);    
	      mailInfo.setUserName("system@chaimiyouxi.com");    
	      mailInfo.setPassword("nandayong11");//��������    
	      mailInfo.setFromAddress("system@chaimiyouxi.com");   
	      //���͵ĵ�ַ
	      mailInfo.setToAddress(Email); 
	      //����
	      mailInfo.setSubject("������Ϸ"); 
	      //ʱ��
	      SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	      String nowTime = df.format(new Date());
	      mailInfo.setContent(""
	      		+ "���������������޸�����"
	      		+"http://localhost:8080/Rainbow/forgotEmail"
	    		  );    
	         //�������Ҫ�������ʼ�   
	      SimpleMailSender sms = new SimpleMailSender();   
	          //sms.sendTextMail(mailInfo);//���������ʽ    
	          sms.sendHtmlMail(mailInfo);//����html��ʽ   
	          
	          out.println(true);
		  }
		  else
		  {
			  out.println(false);
		  }
		  
		 
	}
	
	

	/**
	 * gyn
	 * ���ɲ�������֤��
	 * @throws IOException
	 * ��Ҫphone �Ѿ��󶨵��ֻ���
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
			// �������6λ�����
			int num = (int) ((Math.random() * 9 + 1) * 100000);
			// ����num
			session.setAttribute("app_code", String.valueOf(num));

			String content = new String("������֤���ǣ�" + num
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
	 *  �ж���֤���Ƿ���ȷ
	 * @throws IOException
	 * ��Ҫcode����  �Ѿ����͵��ֻ���֤��
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
