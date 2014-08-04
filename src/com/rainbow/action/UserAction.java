package com.rainbow.action;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.rainbow.dao.UserDAO;
import com.rainbow.entity.User;
import com.rainbow.util.OpeFunction;

public class UserAction
{
	private UserDAO userDAO;
	private User user;
	private String inusername;
	private String inemail;
	private String intelephone;
	private String inputname;
	
	/**
	 * 注册检查用户名是否被注册
	 * @return
	 */
	public String checkusername()
	{
		User username=userDAO.find("username",getInusername());
		if(username==null)return "UsernameSuccess";
		else return "UsernameError";
		//return Action.
	}
	/**
	 * 注册检查邮箱是否被注册
	 * @return
	 */
	public String checkemail()
	{
		User email=userDAO.find("email",getInemail());
		if(email==null)return "EmailSuccess";
		else return "EmailError";
		//return Action.
	}
	/**
	 * 注册检查手机是否被注册
	 * @return
	 */
	public String checktelephone()
	{
		User telephone=userDAO.find("telephone",getIntelephone());
		if(telephone==null)return "TelephoneSuccess";
		else return "TelephoneError";
		//return Action.
	}
	/**
	 * 前台不同用户登录
	 * 可以邮箱登录，手机登陆
	 * @return
	 * @throws IOException 
	 */
	public String login_form() throws IOException
	{	
		User findUser = userDAO.find("email",getInputname(), "password",user.getPassword());
		User findUser1 = userDAO.find("telephone",getInputname(), "password",user.getPassword());

		if (findUser != null){
				HttpSession httpSession = ServletActionContext.getRequest().getSession();
				httpSession.setAttribute("user", findUser);
				return Action.SUCCESS;
		}else if(findUser1 != null){

				HttpSession httpSession = ServletActionContext.getRequest().getSession();
				httpSession.setAttribute("user", findUser1);
				return Action.SUCCESS;
			}
		else return Action.ERROR;
	}
	/**
	 * 用户登录退出
	 * 清除session中的user信息
	 */
	public void webLoginExit(){
		HttpSession httpSession = ServletActionContext.getRequest().getSession();
		httpSession.removeAttribute("user");
	}
	/**
	 * 邮箱注册
	 * @return
	 */
	public String email_register(){
		User findUser=userDAO.find("email",user.getEmail());
		if(findUser==null){
			user.setApproved(0);
			user.setUserType("individualCommon");
			user.setNowtime(OpeFunction.getNowTime());
			System.out.println(OpeFunction.getNowTime());
			userDAO.save(user);
			return Action.SUCCESS;
		}
		else return Action.ERROR;
	}
	/**
	 * 手机注册
	 * @return
	 */
	public String tel_register(){
		User findUser=userDAO.find("telephone",user.getTelephone());
		if(findUser==null){
			user.setApproved(0);
			user.setUserType("individualCommon");
			user.setNowtime(OpeFunction.getNowTime());
			userDAO.save(user);
			return Action.SUCCESS;
		}
		else return Action.ERROR;
	}
	
	
	
	
	
	public String getInusername() {
		return inusername;
	}

	public void setInusername(String inusername) {
		this.inusername = inusername;
	}

	public String getInemail() {
		return inemail;
	}

	public void setInemail(String inemail) {
		this.inemail = inemail;
	}

	public String getIntelephone() {
		return intelephone;
	}

	public void setIntelephone(String intelephone) {
		this.intelephone = intelephone;
	}

	public String getInputname() {
		return inputname;
	}

	public void setInputname(String inputname) {
		this.inputname = inputname;
	}

	public User getUser()
	{
		return user;
	}

	public void setUser(User user)
	{
		this.user = user;
	}
	public UserAction(UserDAO userDAO)
	{
		this.userDAO = userDAO;
	}
}
