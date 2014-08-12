package com.rainbow.server;

import java.util.List;

import com.rainbow.entity.User;

public class UserApps {
	private User user;
	private List<App> app;
	private List<ReceiptTax> receiptTaxList;
	private double paySum ;
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
	public double getPaySum() {
		return paySum;
	}
	public void setPaySum(double paySum) {
		this.paySum = paySum;
	}
	public List<ReceiptTax> getReceiptTaxList() {
		return receiptTaxList;
	}
	public void setReceiptTaxList(List<ReceiptTax> receiptTaxList) {
		this.receiptTaxList = receiptTaxList;
	}
	
	
}
