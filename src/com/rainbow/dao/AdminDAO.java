package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.Admin;

public interface AdminDAO {
	public List<Admin> findAll();
	public Admin find(Integer id);
	public Admin findByName(String userName);
	public Admin find(String str1,String str2,String string1,String string2);
	public Admin findUserNameAndPassword(String userName,String password);
	public int getNum(String userType);
	public int getRegNum(String userType,int approved);
	public List<Admin> getRegThrough(String userType,int approved,int currentPage,int pageSize);
	public List<Admin> getThrough(String userType,int currentPage,int pageSize);
	public void save(Admin admin);
	public void update(Admin admin);
	public void remove(Integer id);
	
	public List<Admin> findinfo(String str1,String str2);
}
