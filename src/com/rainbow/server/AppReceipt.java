package com.rainbow.server;

import java.io.Serializable;
import java.util.List;

import com.rainbow.entity.User;

/**
 * app�˵������
 * ����app������Ϣ����������Ϣ��������Ϣ������������app��Ǯ�ܶ�
 * @author STerOTto
 *
 */
public class AppReceipt implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user;
	private App app;
	private List<ReceiptTax> receiptTaxList;
	private int orderSun;//��������
	private double payment;//�ܽ��
	public App getApp() {
		return app;
	}
	public void setApp(App app) {
		this.app = app;
	}
	public List<ReceiptTax> getReceiptTaxList() {
		return receiptTaxList;
	}
	public void setReceiptTaxList(List<ReceiptTax> receiptTaxList) {
		this.receiptTaxList = receiptTaxList;
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
