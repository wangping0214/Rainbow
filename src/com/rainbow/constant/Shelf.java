package com.rainbow.constant;

/**
 * @author STerOTto
 * 上架管理常量
 */
public enum Shelf
{
	DROP_FORCE("drop_force",-2),
	DROP("drop",-1),
	WAIT_PUBLISH("wait_publish",0),
	SHELF("shelf",1);
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
	private Shelf(String description, int value)
	{
		this.description = description;
		this.value = value;
	}
}
