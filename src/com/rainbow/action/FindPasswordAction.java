package com.rainbow.action;

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
	/**
	 * 根据用户输入的手机或邮箱找到用户并且放入session
	 */
	public String findUserPhoneOrEmail(){
		User userPhone = userDAO.findByPhone(phoneOrEmail);
		User userEmail = userDAO.findByEmail(phoneOrEmail);
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(userPhone != null){
			session.setAttribute("user", userPhone);
			return Action.SUCCESS;
		}
		else if(userEmail != null){
			session.setAttribute("user", userEmail);
			return Action.SUCCESS;
		}
		else
			return Action.ERROR;
	}
	
	/**
	 * 用户重置密码
	 * @return
	 */
	public String changeUserPassword(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
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
	public void sendPasswordToEmail(){
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
	      mailInfo.setContent("尊敬的柴米游戏用户，您设置的密码为："+newPassword+",请妥善保管好您的新密码。<br>点击www.chaimiyouxi.com 完成密码找回！");    
	         //这个类主要来发送邮件   
	      SimpleMailSender sms = new SimpleMailSender();   
	        //  sms.sendTextMail(mailInfo);//发送文体格式    
	          sms.sendHtmlMail(mailInfo);//发送html格式   
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

	public FindPasswordAction(UserDAO userDAO) {
		super();
		this.userDAO = userDAO;
	}
	
	
}
