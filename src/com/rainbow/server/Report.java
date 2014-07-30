package com.rainbow.server;

import com.rainbow.entity.Receipt;
import com.rainbow.entity.User;

public class Report
{
	private App app;
	private User user;
	private Receipt receipt;
	public App getApp()
	{
		return app;
	}
	public void setApp(App app)
	{
		this.app = app;
	}
	public User getUser()
	{
		return user;
	}
	public void setUser(User user)
	{
		this.user = user;
	}
	public Receipt getReceipt()
	{
		return receipt;
	}
	public void setReceipt(Receipt receipt)
	{
		this.receipt = receipt;
	}
	
	
}
