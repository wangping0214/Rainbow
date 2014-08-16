package com.rainbow.server;

import java.util.List;

import com.rainbow.entity.User;

/**
 * 开发者财务信息
 * 包含：开发者信息，这个开发者的所有app的财务信息
 * @author STerOTto
 *
 */
public class FinancialSev {
	private User user;
	private List<Financial> financialList;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<Financial> getFinancialList() {
		return financialList;
	}
	public void setFinancialList(List<Financial> financialList) {
		this.financialList = financialList;
	}
	

}
