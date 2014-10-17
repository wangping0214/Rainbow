package com.rainbow.dao;

import java.util.List;


import com.rainbow.entity.MagazineContent;

public interface AppMagazineContentDAO 
{
	//根据期数和页数查询杂志
	public MagazineContent Pagesperiod(String period,int Pages);
	//根据期数查询杂志
	public List<MagazineContent> Pagesperiod(String period);
	//查询全部
	public List<MagazineContent> All();
}
