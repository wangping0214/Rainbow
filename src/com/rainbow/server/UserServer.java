package com.rainbow.server;

import com.rainbow.entity.User;

public class UserServer
{
	private User user;
	private App app;
	
	public User getUser()
	{
		return user;
	}
	public void setUser(User user)
	{
		this.user = user;
	}
	public App getApp()
	{
		return app;
	}
	public void setApp(App app)
	{
		this.app = app;
	}
	
}
