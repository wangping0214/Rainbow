package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.Magazine;

public interface AppMagazineDAO
{
	
	//查询全部杂志
	public List<Magazine> All();
	//根据id查询杂志
	public Magazine Accordingid(int id);
	//添加
	public void save(Magazine magazine);
	//分页查询
	public List<Magazine> Fenye(int currentPage,int pageSize);
	//根据对象删除杂志
	public void delete(Magazine magazine);
}
