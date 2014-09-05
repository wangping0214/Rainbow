package com.rainbow.appaction;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.rainbow.dao.UserDAO;
import com.rainbow.email.MailSenderInfo;
import com.rainbow.email.SimpleMailSender;
import com.rainbow.entity.User;

public class AppForgotEmail
{
	
	private UserDAO userdao;
	

	private String Email;
	
	public void forgotEmail() throws IOException
	{
		  Email="372533079@qq.com";
		  HttpServletResponse response = ServletActionContext.getResponse();
		  response.setContentType("application/json");
		  response.setCharacterEncoding("UTF-8");
		  PrintWriter out = response.getWriter();
		  if(Email==null)
		  {
			  out.print(Action.NONE); // "none"
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
	      		+ "��ϲ������500����Ԫ"
	      		+ "�����Ҵ�������"      	
	      		+ "�Ҵ���ͭ��"
	      		+"лл����"
	    		  );    
	         //�������Ҫ�������ʼ�   
	      SimpleMailSender sms = new SimpleMailSender();   
	          //sms.sendTextMail(mailInfo);//���������ʽ    
	          sms.sendHtmlMail(mailInfo);//����html��ʽ   
	          
	          out.println(Action.SUCCESS);
		  }
		  else
		  {
			  out.println(Action.ERROR);
		  }
		  
		 
	}
	public AppForgotEmail(UserDAO userdao)
	{
		super();
		this.userdao = userdao;
	}
	public String getEmail()
	{
		return Email;
	}
	public void setEmail(String email)
	{
		Email = email;
	}
	

}
