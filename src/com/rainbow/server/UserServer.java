package com.rainbow.server;

import java.io.Serializable;

import com.rainbow.entity.User;

public class UserServer implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
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
