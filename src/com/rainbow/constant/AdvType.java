package com.rainbow.constant;

public enum AdvType
{
	RECOMMEND("ÍÆ¼ö",1);
	private String descript;
	private int value;
	private AdvType(String descript, int value)
	{
		this.descript = descript;
		this.value = value;
	}
	public String getDescript()
	{
		return descript;
	}
	public void setDescript(String descript)
	{
		this.descript = descript;
	}
	public int getValue()
	{
		return value;
	}
	public void setValue(int value)
	{
		this.value = value;
	}
	
}
