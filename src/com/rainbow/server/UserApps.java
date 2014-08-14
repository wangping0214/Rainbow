package com.rainbow.server;

import java.util.List;

import com.rainbow.entity.User;

/**
 * 开发者app服务层
 * 包含开发者信息，某开发者的所有app信息，某开发者所有订单信息
 * @author STerOTto
 *
 */
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
