package com.rainbow.constant;

/**
 * @author STerOTto
 * ”√ªß «∑Ò∑‚Õ£
 */
public enum UserAvailable
{
	NOT_AVAILABLE("not_available",-1),
	AVAILABLE("available",1);
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
	
	private UserAvailable(String description, int value)
	{
		this.description = description;
		this.value = value;
	}
}
