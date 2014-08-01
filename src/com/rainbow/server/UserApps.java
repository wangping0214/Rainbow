package com.rainbow.server;

import java.util.List;

import com.rainbow.entity.User;

public class UserApps {
	private User user;
	private List<App> app;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<App> getApp() {
		return app;
	}
	public void setApp(List<App> app) {
		this.app = app;
	}

}
