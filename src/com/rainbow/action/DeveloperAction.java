package com.rainbow.action;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.rainbow.dao.UserDAO;
import com.rainbow.entity.User;
import com.rainbow.util.OpeFunction;

public class DeveloperAction {
	private UserDAO userDAO;
	private User user;
	private String input;
	private OpeFunction func;
	private String inemail;
	private String intelephone;
	private int inid;
	
	public String getInput() {
		return input;
	}

	public void setInput(String input) {
		this.input = input;
	}

	public User getUser()
	{
		return user;
	}

	public void setUser(User user)
	{
		this.user = user;
	}
	
	
	public OpeFunction getFunc() {
		return func;
	}

	public void setFunc(OpeFunction func) {
		this.func = func;
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

	public int getInid() {
		return inid;
	}

	public void setInid(int inid) {
		this.inid = inid;
	}

	public DeveloperAction(UserDAO userDAO)
	{
		this.userDAO = userDAO;
	}
	public String changeemail()
	{
		User email=userDAO.find("email",getInemail());
		User email0=userDAO.find("email",getInemail(),"id",getInid());
		
		if(email==null||email0!=null)return "EmailSuccess";
		else return "EmailError";
		//return Action.
	}
	public String changetelephone()
	{
		User telephone=userDAO.find("telephone",getIntelephone());
		User telephone0=userDAO.find("telephone",getIntelephone(),"id",getInid());
		if(telephone==null||telephone0!=null)return "TelephoneSuccess";
		else return "TelephoneError";
		//return Action.
	}
	public String login_developer()
	{
		User findUser = userDAO.find("email",getInput(), "password",user.getPassword());
		User findUser1 = userDAO.find("telephone",getInput(), "password",user.getPassword());
		if (findUser != null){
			HttpSession httpSession = ServletActionContext.getRequest().getSession();
			httpSession.setAttribute("username", findUser.getUsername());
			httpSession.setAttribute("password", findUser.getPassword());
			if((findUser.getUserType().equals("individualCommon"))||(findUser.getUserType().equals("individualUsers")&&findUser.getApproved()==0)||(findUser.getUserType().equals("individualGroups")&&findUser.getApproved()==0)){
				return "usersuccess0";
			}
			else if(findUser.getUserType().equals("individualUsers")){
				if(findUser.getApproved()==1)return "usersuccess1";
				else if(findUser.getApproved()==-1)return "usererror";
				else return Action.ERROR;
			}
			else if(findUser.getUserType().equals("individualGroups")){
				if(findUser.getApproved()==1)return "usersuccess2";
				else if(findUser.getApproved()==-1)return "usererror";
				else return Action.ERROR;
			}
			else return Action.ERROR;
		}else if(findUser1 != null){
			HttpSession httpSession = ServletActionContext.getRequest().getSession();
			httpSession.setAttribute("username", findUser1.getUsername());
			httpSession.setAttribute("password", findUser1.getPassword());
			if((findUser1.getUserType().equals("individualCommon")&&findUser1.getApproved()==0)||(findUser1.getUserType().equals("individualUsers")&&findUser1.getApproved()==0)||(findUser1.getUserType().equals("individualGroups")&&findUser1.getApproved()==0)){
				return "usersuccess0";
			}
			else if(findUser1.getUserType().equals("individualUsers")&&findUser1.getApproved()==1){
				return "usersuccess1";
			}
				else if(findUser1.getUserType().equals("individualGroups")&&findUser1.getApproved()==1){
					return "usersuccess2";
				}
			else return Action.ERROR;
			}
		else return Action.ERROR;
	}
	@SuppressWarnings("unchecked")
	public String modify(){
		HttpSession httpSession = ServletActionContext.getRequest().getSession();
		user=userDAO.find("username", (String)httpSession.getAttribute("username"));
		httpSession.setAttribute("photo1",user.getPhoto1());
		httpSession.setAttribute("photo2",user.getPhoto2());
		if(user!=null&&user.getUserType().equals("individualCommon")){
			@SuppressWarnings("rawtypes")
			Map request=(Map) ActionContext.getContext().get("request");
			request.put("user", user);
		return "common_success";	
		}
		else if(user!=null&&user.getUserType().equals("individualUsers")){
			if(user.getApproved()==0){
				return "wait_success";
			}
			else{
				@SuppressWarnings("rawtypes")
				Map request=(Map) ActionContext.getContext().get("request");
				request.put("inuser", user);
				return "users_success";	
				}
		}
		else if(user!=null&&user.getUserType().equals("individualGroups")){
			if(user.getApproved()==0){
				return "wait_success";
			}
			else{
			@SuppressWarnings("rawtypes")
			Map request=(Map) ActionContext.getContext().get("request");
			request.put("ingroup", user);
		return "groups_success";	
		}
		}
		else return Action.ERROR;
	}
	@SuppressWarnings("static-access")
	public String upDate_user() throws IOException{
		HttpSession httpSession = ServletActionContext.getRequest().getSession();
		User user0 =userDAO.find("username", (String)httpSession.getAttribute("username"));
		if (null != user0)
		{
			if (user.getCardphoto1()!= null){
				File file = new File(ServletActionContext.getServletContext().getRealPath("")+user0.getPhoto1());
				System.out.print(user0.getPhoto1());
				file.delete();
				user0.setPhoto1(func.fileToServer("/user_card",user.getCardphoto1(), 
						user.getCardphoto1FileName(),
						user.getCardphoto1ContentType(),
						true));
				
			}
			if (user.getCardphoto2()!= null){
				File file = new File(ServletActionContext.getServletContext().getRealPath("")+user0.getPhoto2());
				System.out.print(user0.getPhoto2());
				file.delete();
				user0.setPhoto2(func.fileToServer("/user_card",user.getCardphoto2(), 
						user.getCardphoto2FileName(),
						user.getCardphoto2ContentType(),
						true));
				
			}

			user0.setEmail(user.getEmail());
			user0.setTelephone(user.getTelephone());	
			user0.setRealname(user.getRealname());
			user0.setDuty(user.getDuty());
			user0.setCorporatename(user.getCorporatename());
			user0.setWebsite(user.getWebsite());
			user0.setAddress(user.getAddress());
			user0.setQqname(user.getQqname());
			user0.setUserType("individualUsers");
			user0.setApproved(0);
			userDAO.update(user0);
			return Action.SUCCESS;
		}
		else return Action.ERROR;
	}
	@SuppressWarnings("static-access")
	public String upDate_group() throws IOException{
		HttpSession httpSession = ServletActionContext.getRequest().getSession();
		User user1 =userDAO.find("username", (String)httpSession.getAttribute("username"));
		//System.out.println(user1);
		if (null != user1)
		{
			if (user.getCardphoto1()!= null){
				File file = new File(ServletActionContext.getServletContext().getRealPath("")+user1.getPhoto1());
				file.delete();
				user1.setPhoto1(func.fileToServer("/group_card",user.getCardphoto1(), 
						user.getCardphoto1FileName(),
						user.getCardphoto1ContentType(),
						true));
				
			}
			user1.setEmail(user.getEmail());
			user1.setTelephone(user.getTelephone());	
			user1.setRealname(user.getRealname());
			user1.setDuty(user.getDuty());
			user1.setCorporatename(user.getCorporatename());
			user1.setWebsite(user.getWebsite());
			user1.setAddress(user.getAddress());
			user1.setQqname(user.getQqname());
			user1.setUserType("individualGroups");
			user1.setApproved(0);
			userDAO.update(user1);
			return Action.SUCCESS;
		}
		else return Action.ERROR;
	}
	@SuppressWarnings("unchecked")
	public String modify_ad(){
		HttpSession httpSession = ServletActionContext.getRequest().getSession();
		user=userDAO.find("username", (String)httpSession.getAttribute("username"));
		httpSession.setAttribute("adphoto",user.getAd());
		if(user!=null){
			@SuppressWarnings("rawtypes")
			Map request=(Map) ActionContext.getContext().get("request");
			request.put("user", user);
		return Action.SUCCESS;	
		}
		else return Action.ERROR;
	}
	@SuppressWarnings("static-access")
	public String new_ad() throws IOException{
		HttpSession httpSession = ServletActionContext.getRequest().getSession();
		User aduser =userDAO.find("username", (String)httpSession.getAttribute("username"));
		if (null != aduser)
		{
			if (user.getNewad()!= null){
				File file = new File(ServletActionContext.getServletContext().getRealPath("")+aduser.getAd());
				file.delete();
				aduser.setAd(func.fileToServer("/newad",
						user.getNewad(),
						user.getNewadFileName(),
						user.getNewadContentType(),
						true));
				
			}
			userDAO.update(aduser);
			return Action.SUCCESS;
		}
		else return Action.ERROR;
	}
	public String modify_password(){
		HttpSession httpSession = ServletActionContext.getRequest().getSession();
		User user2=userDAO.find("username", (String)httpSession.getAttribute("username"),"password",(String)httpSession.getAttribute("password"));
		if(user2!=null){
			user2.setPassword(user.getPassword());
			userDAO.update(user2);
			return Action.SUCCESS;
		}
		else return Action.ERROR;
	}
	public String developer_logout()
	{
		HttpSession httpSession = ServletActionContext.getRequest().getSession();
		httpSession.removeAttribute("username");
		return Action.SUCCESS;
	}
}
