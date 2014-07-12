package com.rainbow.server;

import com.rainbow.entity.MessagePayment;
import com.rainbow.entity.OtherPayment;

/**
 * Ö§¸¶·þÎñ²ã
 * @author STerOTto
 *@version 2014-7-1 15:57:47
 */
public class Pay {
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
