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
 * �û��һ�����
 *@author STerOTto
 *@version 2014-7-11 10:23:49
 */
public class FindPasswordAction {
	
	private UserDAO userDAO;
	
	private String phoneOrEmail;
	private String newPassword;
	private int userId;
	/**
	 * �����û�������ֻ��������ҵ��û����ҷ���session
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
	 * �û���������
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
	 * �������뷢�͸��û�
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
	      mailInfo.setPassword("nandayong11");//��������    
	      mailInfo.setFromAddress("system@chaimiyouxi.com");    
	      mailInfo.setToAddress(user.getEmail());    
	      mailInfo.setSubject("������Ϸ"); 
	      SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	      String nowTime = df.format(new Date());
	      mailInfo.setContent("�𾴵Ĳ�����Ϸ�û�:<br><br>"
	      		+ "���ã���ʹ���˲�����Ϸ�˺ŵ��޸����빦�ܣ��������һ����롱��ɲ�����<br><br>"
	      		+ "<a href=\"http://182.92.65.140/Rainbow/login/password_find4.jsp?email="
	      		+user.getEmail()+"&userId="+user.getId()
	      		+ "\" >"
	      		+ "<lable style=\"font-size:14px;color:blue\">�һ�����</lable></a>"
	      		+ "<br><br><br> ��л��ʹ�ò�����Ϸ�ķ��������û������������޸����룬����Դ��ʼ��� "
	      		+"<br><br><br>������Ϸ<br>"
	      		+nowTime
	      		+"<br><br><br>���ʼ�Ϊϵͳ�Զ��������ʼ�������ֱ�ӻظ���");    
	         //�������Ҫ�������ʼ�   
	      SimpleMailSender sms = new SimpleMailSender();   
	        //  sms.sendTextMail(mailInfo);//���������ʽ    
	          sms.sendHtmlMail(mailInfo);//����html��ʽ   
	          
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
