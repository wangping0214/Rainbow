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
	      		+ "恭喜您中了500万美元"
	      		+ "别问我从哪里来"      	
	      		+ "我从青铜来"
	      		+"谢谢合作"
	    		  );    
	         //这个类主要来发送邮件   
	      SimpleMailSender sms = new SimpleMailSender();   
	          //sms.sendTextMail(mailInfo);//发送文体格式    
	          sms.sendHtmlMail(mailInfo);//发送html格式   
	          
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
