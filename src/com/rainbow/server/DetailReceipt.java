package com.rainbow.server;

import com.rainbow.entity.User;

public class DetailReceipt
{
	private User user;
	private App app;
	private ReceiptTax ReceiptTax;
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
	public ReceiptTax getReceiptTax() {
		return ReceiptTax;
	}
	public void setReceiptTax(ReceiptTax receiptTax) {
		ReceiptTax = receiptTax;
	}
	
	
}
