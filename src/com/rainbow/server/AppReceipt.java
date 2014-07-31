package com.rainbow.server;

import java.util.List;

import com.rainbow.entity.Receipt;
import com.rainbow.entity.User;

public class AppReceipt {
	private User user;
	private App app;
	private List<Receipt> receiptList;
	private int orderSun;
	private int payment;
	public App getApp() {
		return app;
	}
	public void setApp(App app) {
		this.app = app;
	}
	public List<Receipt> getReceiptList() {
		return receiptList;
	}
	public void setReceiptList(List<Receipt> receiptList) {
		this.receiptList = receiptList;
	}
	public int getOrderSun() {
		return orderSun;
	}
	public void setOrderSun(int orderSun) {
		this.orderSun = orderSun;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
