package com.rainbow.server;

import java.io.Serializable;
import java.util.List;

import com.rainbow.entity.ADV;

public class AdvAndApp implements Serializable
{
	private static final long serialVersionUID = 1L;
	private List<ADV> advList;
	private List<App> appList;
	public AdvAndApp(List<ADV> advList, List<App> appList)
	{
		super();
		this.advList = advList;
		this.appList = appList;
	}
	public List<ADV> getAdvList()
	{
		return advList;
	}
	public void setAdvList(List<ADV> advList)
	{
		this.advList = advList;
	}
	public List<App> getAppList()
	{
		return appList;
	}
	public void setAppList(List<App> appList)
	{
		this.appList = appList;
	}
	
}