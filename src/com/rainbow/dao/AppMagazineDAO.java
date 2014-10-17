package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.Magazine;

public interface AppMagazineDAO
{
	//查询全部杂志
	public List<Magazine> All();
	//根据id查询杂志
	public List<Magazine> Accordingid(int id);
}
