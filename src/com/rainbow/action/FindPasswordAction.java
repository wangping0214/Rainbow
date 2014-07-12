package com.rainbow.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.rainbow.dao.UserDAO;
import com.rainbow.email.MailSenderInfo;
import com.rainbow.email.SimpleMailSender;
import com.rainbow.entity.User;

/**
 * �û��һ�����
 *@author STerOTto
 *@version 2014-7-11 10:23:49
 */
public class FindPasswordAction {
	
	private UserDAO userDAO;
	
	private String phoneOrEmail;
	private String newPassword;
	/**
	 * �����û�������ֻ��������ҵ��û����ҷ���session
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
	 * �û���������
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
	 * �������뷢�͸��û�
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
	      mailInfo.setPassword("nandayong11");//��������    
	      mailInfo.setFromAddress("system@chaimiyouxi.com");    
	      mailInfo.setToAddress(user.getEmail());    
	      mailInfo.setSubject("������Ϸ");    
	      mailInfo.setContent("�𾴵Ĳ�����Ϸ�û��������õ�����Ϊ��"+newPassword+",�����Ʊ��ܺ����������롣<br>���www.chaimiyouxi.com ��������һأ�");    
	         //�������Ҫ�������ʼ�   
	      SimpleMailSender sms = new SimpleMailSender();   
	        //  sms.sendTextMail(mailInfo);//���������ʽ    
	          sms.sendHtmlMail(mailInfo);//����html��ʽ   
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
