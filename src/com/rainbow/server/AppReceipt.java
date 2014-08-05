package com.rainbow.server;

import java.util.List;

import com.rainbow.entity.Receipt;
import com.rainbow.entity.User;

public class AppReceipt {
	private User user;
	private App app;
	private List<Receipt> receiptList;
	private int orderSun;//订单总数
	private double payment;//总金额
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
	
	public double getPayment() {
		return payment;
	}
	public void setPayment(double payment) {
		this.payment = payment;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
