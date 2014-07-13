package com.rainbow.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.rainbow.dao.UserDAO;
import com.rainbow.email.MailSenderInfo;
import com.rainbow.email.SimpleMailSender;
import com.rainbow.entity.User;

/**
 * 用户找回密码
 *@author STerOTto
 *@version 2014-7-11 10:23:49
 */
public class FindPasswordAction {
	
	private UserDAO userDAO;
	
	private String phoneOrEmail;
	private String newPassword;
	private int userId;
	/**
	 * 根据用户输入的手机或邮箱找到用户并且放入session
	 */
	public String findUserPhoneOrEmail(){
		User userPhone = userDAO.findByPhone(phoneOrEmail);
		User userEmail = userDAO.findByEmail(phoneOrEmail);
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(userPhone != null){
			session.setAttribute("user", userPhone);
			return "phone";
		}
		else if(userEmail != null){
			session.setAttribute("user", userEmail);
			return "email";
		}
		else
			return Action.ERROR;
	}
	
	/**
	 * 用户重置密码
	 * @return
	 */
	public String changeUserPassword(){

		User user = userDAO.find(userId);
		if(user != null){
			user.setPassword(newPassword);
			userDAO.update(user);
			return Action.SUCCESS;
		}
		else
			return Action.ERROR;
		
	}
	
	/**
	 * 将新密码发送给用户
	 */
	@SuppressWarnings("static-access")
	public String sendPasswordToEmail(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		MailSenderInfo mailInfo = new MailSenderInfo();    
	      mailInfo.setMailServerHost("smtp.chaimiyouxi.com");    
	      mailInfo.setMailServerPort("25"); 
	      mailInfo.setValidate(true);    
	      mailInfo.setUserName("system@chaimiyouxi.com");    
	      mailInfo.setPassword("nandayong11");//邮箱密码    
	      mailInfo.setFromAddress("system@chaimiyouxi.com");    
	      mailInfo.setToAddress(user.getEmail());    
	      mailInfo.setSubject("柴米游戏"); 
	      SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	      String nowTime = df.format(new Date());
	      mailInfo.setContent("尊敬的柴米游戏用户:<br><br>"
	      		+ "您好！您使用了柴米游戏账号的修改密码功能，请点击“找回密码”完成操作。<br><br>"
	      		+ "<a href=\"http://182.92.65.140/Rainbow/login/password_find4.jsp?email="
	      		+user.getEmail()+"&userId="+user.getId()
	      		+ "\" >"
	      		+ "<lable style=\"font-size:14px;color:blue\">找回密码</lable></a>"
	      		+ "<br><br><br> 感谢您使用柴米游戏的服务。如果您没有提出过密码修改申请，请忽略此邮件。 "
	      		+"<br><br><br>柴米游戏<br>"
	      		+nowTime
	      		+"<br><br><br>此邮件为系统自动发出的邮件，请勿直接回复。");    
	         //这个类主要来发送邮件   
	      SimpleMailSender sms = new SimpleMailSender();   
	        //  sms.sendTextMail(mailInfo);//发送文体格式    
	          sms.sendHtmlMail(mailInfo);//发送html格式   
	          
	      return Action.SUCCESS;
	}

	public String getPhoneOrEmail() {
		return phoneOrEmail;
	}

	public void setPhoneOrEmail(String phoneOrEmail) {
		this.phoneOrEmail = phoneOrEmail;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public FindPasswordAction(UserDAO userDAO) {
		super();
		this.userDAO = userDAO;
	}
	
	
}
