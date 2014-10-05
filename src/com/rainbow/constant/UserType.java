package com.rainbow.constant;

/**
 * @author STerOTto
 * 三种用户枚举常量
 */
public enum UserType 
{
	INDIVIDUAL_COMMON("individualCommon"), 
	INDIVIDUAL_USERS("individualUsers"), 
	INDIVIDUAL_GROUPS("individualGroups");
	
	private String context;

	private UserType(String context) 
	{
		this.context = context;
	}

	public String getContext() 
	{
		return context;
	}

	public void setContext(String context) 
	{
		this.context = context;
	}
}
