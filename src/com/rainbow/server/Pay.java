package com.rainbow.server;

import java.io.Serializable;

import com.rainbow.entity.MessagePayment;
import com.rainbow.entity.OtherPayment;

/**
 * 支付服务层
 * 包含短代支付和其它支付（支付宝和银联）
 * @author STerOTto
 *@version 2014-7-1 15:57:47
 */
public class Pay implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private MessagePayment mesPay;
	private OtherPayment otherPay;
	
	public Pay(MessagePayment mesPay, OtherPayment otherPay) {
		super();
		this.mesPay = mesPay;
		this.otherPay = otherPay;
	}
	public MessagePayment getMesPay() {
		return mesPay;
	}
	public void setMesPay(MessagePayment mesPay) {
		this.mesPay = mesPay;
	}
	public OtherPayment getOtherPay() {
		return otherPay;
	}
	public void setOtherPay(OtherPayment otherPay) {
		this.otherPay = otherPay;
	}
	
}
