package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.User;

public interface UserDAO

{
	
	public List<User> findAll();
	public User find(Integer id);
	public User findByUser(String username);
	public User find(String str1,String str2);
	public User login(String name,String password);
	public User find(String str1,String str2,String string1,String string2);
	public User find(String str1,String str2,String string1,int string2);
	public User find(String str1,String str2,String string1,String string2,String stri1,String stri2);
	
	public User findByPhone(String phone);
	public User findByEmail(String email);
	
	/*
	 * Edit by STerOTto
	 */
	public User findByEmailOrPhoneAndPassword(String emailOrPhone,String password);
	public List<User> findByUserType(String userType,int currentPage,int pageSize);
	public int findByUserTypeNum(String userType);
	public List<User> findDiviedUserApproved(int approved,int currentPage,int pageSize);//找到所有可以分成的用户
	public List<User> findDiviedUserApproved(int approved);//不分页
	public List<User> findByUserCompanyOrName(int approved,String companyOrName,int currentPage,int pageSize);
	public List<User> findByUserCompanyOrNameVisitable(int approved,String companyOrName,int visitable,int currentPage,int pageSize);
	public List<User> findByUserCompanyOrName(int approved,String companyOrName);
	public User findByCp_id(String cp_id);
	public int findByUserCompanyOrNameNum(int approved,String companyOrName);
	public int findDiviedUserApprovedNum(int approved);
	public int findByUserCompanyOrNameVisitableSize(int approved,String companyOrName,int visitable);
	public List<User> findDeveloperHasJointApp(int approved,int currentPage,int pageSize);
	public int findDeveloperHasJointAppSize(int approved);
	public List<User> findFinancialVisitableUsers(int approved,int visitable);
	public List<User> findFinancialVisitableUsers(int approved,int visitable,int currentPage,int pageSize);
	public int findFinancialVisitableUsersSize(int approved,int visitable);
	public void save(User user);
	public void update(User user);
	public void remove(Integer id);
	public void updatepwd(User user);//app端密码修改

}