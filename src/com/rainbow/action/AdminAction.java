package com.rainbow.action;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.rainbow.dao.AdminDAO;
import com.rainbow.dao.CpIdSeedDAO;
import com.rainbow.dao.UserDAO;
import com.rainbow.entity.Admin;
import com.rainbow.entity.CpIdSeed;
import com.rainbow.entity.User;
import com.rainbow.util.IdGenerator;
import com.rainbow.util.PageUtil;

/**
 * 管理员权限
 * @author STerOTto
 * @version 2014-6-25
 *
 */
public class AdminAction {
	private AdminDAO adminDAO;
	private Admin admin;
	private UserDAO userDAO;
	private int isCurrentPage=1;
	private String isuserType;
	private String memusername;
	private String memusertype;
	private String radioselect;
	private CpIdSeedDAO cpIdSeedDAO;
	public Admin getAdmin()
	{
		return admin;
	}

	public void setAdmin(Admin admin)
	{
		this.admin = admin;
	}

	public int getIsCurrentPage() {
		return isCurrentPage;
	}

	public void setIsCurrentPage(int isCurrentPage) {
		this.isCurrentPage = isCurrentPage;
	}

	public String getIsuserType() {
		return isuserType;
	}

	public void setIsuserType(String isuserType) {
		this.isuserType = isuserType;
	}
	
	public String getMemusername() {
		return memusername;
	}

	public void setMemusername(String memusername) {
		this.memusername = memusername;
	}

	public String getMemusertype() {
		return memusertype;
	}

	public void setMemusertype(String memusertype) {
		this.memusertype = memusertype;
	}

	public String getRadioselect() {
		return radioselect;
	}

	public void setRadioselect(String radioselect) {
		this.radioselect = radioselect;
	}

	public AdminAction(AdminDAO adminDAO,UserDAO userDAO)
	{
		super();
		this.adminDAO = adminDAO;
		this.userDAO=userDAO;
	}
	/**
	 * 管理员登陆
	 * @return
	 */
	public String login_admin()
	{
		Admin findAdmin = adminDAO.find("username",admin.getUsername(), "password",admin.getPassword());
		if (findAdmin != null){
			HttpSession httpSession = ServletActionContext.getRequest().getSession();
			System.out.println("username"+findAdmin.getUsername());
			httpSession.setAttribute("username", findAdmin.getUsername());
			httpSession.setAttribute("password", findAdmin.getPassword());
			return Action.SUCCESS;
			}
			else return Action.ERROR;
		}
	/**
	 * 分类别显示会员管理
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String mem_manager(){

			int total=adminDAO.getNum(isuserType);
			int groupstotal=adminDAO.getNum("individualGroups");
			int userstotal=adminDAO.getNum("individualUsers");
			int commontotal=adminDAO.getNum("individualCommon");
			HttpSession httpSession = ServletActionContext.getRequest().getSession();
			httpSession.setAttribute("groupstotal", groupstotal);
			httpSession.setAttribute("userstotal", userstotal);
			httpSession.setAttribute("ctotal", commontotal);
			PageUtil page=new PageUtil(isCurrentPage,total);
			List<Admin> member=adminDAO.getThrough(isuserType,isCurrentPage, page.getPageSize());
			
			int regtotal=adminDAO.getRegNum("individualCommon",0);
			httpSession.setAttribute("regtotal", regtotal);
			PageUtil regpage=new PageUtil(isCurrentPage,regtotal);
			List<Admin> regmember=adminDAO.getRegThrough("individualCommon",0,1, regpage.getPageSize());
			
			@SuppressWarnings("rawtypes")
			Map request = (Map) ActionContext.getContext().get("request");
			request.put("member", member);
			request.put("page", page);
			request.put("regmember", regmember);
			request.put("regpage", regpage);
			String str="";
			if(getIsuserType().equals("individualGroups")) str="groups";
			else if(getIsuserType().equals("individualUsers"))str="users";
			else if(getIsuserType().equals("individualCommon"))str="common";
			else if(getIsuserType().equals("individualwait"))str="wait";
			return str;
	}
		/**
		 * 禁用用户权限
		 * @throws UnsupportedEncodingException 
		 */
		public void stop_individual() throws UnsupportedEncodingException{
			
				User stop_user=userDAO.find("username", memusername);
				if(stop_user!=null){
					stop_user.setApproved(-1);
					userDAO.update(stop_user);
			}
		}
		/**
		 * 启用用户权限
		 * @throws UnsupportedEncodingException 
		 */
		public void start_individual() throws UnsupportedEncodingException{
			User start_user=userDAO.find("username", memusername);
			if(start_user!=null){
				start_user.setApproved(1);
				userDAO.update(start_user);
			}
		}
		/**
		 * 显示用户信息
		 * @return
		 * @throws UnsupportedEncodingException 
		 */
		@SuppressWarnings("unchecked")
		public String information() throws UnsupportedEncodingException{
			if(getMemusertype().equals("individualGroups")){
				User group_info=userDAO.find("username", memusername,"userType",getMemusertype());
				@SuppressWarnings("rawtypes")
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("group_info", group_info);
				return "group_info";
			}
			else if(getMemusertype().equals("individualUsers")){
				User user_info=userDAO.find("username", memusername,"userType",getMemusertype());
				@SuppressWarnings("rawtypes")
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("user_info", user_info);
				return "user_info";
			}
			else if(getMemusertype().equals("individualCommon")){
				User user=userDAO.find("username", memusername,"userType",getMemusertype());
				@SuppressWarnings("rawtypes")
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("info", user);
				return "common_info";
			}
			else return Action.ERROR;
			
		}
		/**
		 * 显示注册信息
		 * @return
		 * @throws UnsupportedEncodingException 
		 */
		@SuppressWarnings("unchecked")
		public String reg_information() throws UnsupportedEncodingException{
			if(getMemusertype().equals("individualGroups")){
				User group_info=userDAO.find("username", memusername,"userType",getMemusertype());
				HttpSession httpSession = ServletActionContext.getRequest().getSession();
				httpSession.setAttribute("reg_group_info", group_info);
				System.out.println("group_info.getCorporatename()"+group_info);
				httpSession.setAttribute("corporatename", group_info.getCorporatename());
				httpSession.setAttribute("reg_username", group_info.getUsername());
				@SuppressWarnings("rawtypes")
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("group_info", group_info);
				return "group_info";
			}
			else if(getMemusertype().equals("individualUsers")){
				User user_info=userDAO.find("username", memusername,"userType",getMemusertype());
				HttpSession httpSession = ServletActionContext.getRequest().getSession();
				httpSession.setAttribute("reg_user_info", user_info);
				httpSession.setAttribute("realname", user_info.getRealname());
				httpSession.setAttribute("reg_username", user_info.getUsername());
				@SuppressWarnings("rawtypes")
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("user_info", user_info);
				return "user_info";
			}
			else return Action.ERROR;
			
		}
		/**
		 * 开发者注册审核通过
		 * @return
		 */
		public String reg_approved(){
			if(("ok").equals(getRadioselect())){
				HttpSession httpSession = ServletActionContext.getRequest().getSession();
				User reg_user=userDAO.find("username", (String)httpSession.getAttribute("reg_username"));
				if(reg_user!=null){
					reg_user.setApproved(1);//审核通过
					/*
					 * 生成	商户ID
					 * 根据当前用户注册id生成一个长度为8位的商户id传入数据库中
					 */
					int id = reg_user.getId();
					String cp_id = "";
					cp_id = String.format("%08d", id);
					reg_user.setCp_id(IdGenerator.getInstance().getNextCpId());
					userDAO.update(reg_user);
					}
				return Action.SUCCESS;
			}
				else if(("no_ok").equals(getRadioselect())){
					HttpSession httpSession = ServletActionContext.getRequest().getSession();
					User reg_user=userDAO.find("username", (String)httpSession.getAttribute("reg_username"));
					if(reg_user!=null){		
							File file1 = new File(ServletActionContext.getServletContext().getRealPath("")+reg_user.getPhoto1());
							file1.delete();	
							reg_user.setPhoto1(null);
							File file2 = new File(ServletActionContext.getServletContext().getRealPath("")+reg_user.getPhoto2());
							file2.delete();	
							reg_user.setPhoto2(null);
						reg_user.setApproved(0);
						reg_user.setUserType("individualCommon");
						reg_user.setAddress(null);
						reg_user.setCorporatename(null);
						reg_user.setWebsite(null);
						reg_user.setRealname(null);
						reg_user.setQqname(null);
						reg_user.setDuty(null);
						userDAO.update(reg_user);
						}
					return Action.SUCCESS;
				}
			else return Action.ERROR;
			}
		

		
}