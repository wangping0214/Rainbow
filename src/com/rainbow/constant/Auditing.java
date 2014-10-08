package com.rainbow.constant;

/**
 * @author STerOTto
 * 审核管理常量
 */
public enum Auditing 
{
	WAIT_PERFECT("wait_perfect",-3),
	WAIT_SUBMIT("wait_submit",-2),
	NOT_APPROVED("not_approved",-1),
	WAIT_APPROVED("wait_approved",0),
	APPROVED("approved",1);
	private String description;
	private int value;
	public String getDescription()
	{
		return description;
	}
	public void setDescription(String description)
	{
		this.description = description;
	}
	public int getValue()
	{
		return value;
	}
	public void setValue(int value)
	{
		this.value = value;
	}
	private Auditing(String description, int value)
	{
		this.description = description;
		this.value = value;
	}		
}
