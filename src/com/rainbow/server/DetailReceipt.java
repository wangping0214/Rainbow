package com.rainbow.server;

import com.rainbow.entity.User;

/**
 * 具体订单服务层
 * 包含app所有信息，开发者信息，订单具体信息
 * @author STerOTto
 *
 */
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
