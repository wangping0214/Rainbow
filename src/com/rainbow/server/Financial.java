package com.rainbow.server;

import java.util.List;

import com.rainbow.entity.Receipt;
import com.rainbow.entity.TaxRate;

/**
 * app的财务信息
 * 包含是否结算，app，这个app的订单，查询月份的税率，总的金额，短代的总额，支付宝总额，银联总额，结算总额
 * 结算公式：结算金额=｛[短代当月收入*（1-短代比率）+支付宝当月收入*（1-支付宝比率）+银联当月总收入*（1-支付宝比率）]*（1-税率）｝*分成比率
 * @author STerOTto
 *
 */
public class Financial {
	private int check_out;
	private App app;
	private List<Receipt> receiptList;
	private TaxRate taxRate;
	private double sum;
	private double massageSum;
	private double alipaySum;
	private double bankSum;
	private double paySum;
	public int getCheck_out() {
		return check_out;
	}
	public void setCheck_out(int check_out) {
		this.check_out = check_out;
	}
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
	public TaxRate getTaxRate() {
		return taxRate;
	}
	public void setTaxRate(TaxRate taxRate) {
		this.taxRate = taxRate;
	}
	public double getSum() {
		return sum;
	}
	public void setSum(double sum) {
		this.sum = sum;
	}
	public double getMassageSum() {
		return massageSum;
	}
	public void setMassageSum(double massageSum) {
		this.massageSum = massageSum;
	}
	public double getAlipaySum() {
		return alipaySum;
	}
	public void setAlipaySum(double alipaySum) {
		this.alipaySum = alipaySum;
	}
	public double getBankSum() {
		return bankSum;
	}
	public void setBankSum(double bankSum) {
		this.bankSum = bankSum;
	}
	public double getPaySum() {
		return paySum;
	}
	public void setPaySum(double paySum) {
		this.paySum = paySum;
	}
	
}
