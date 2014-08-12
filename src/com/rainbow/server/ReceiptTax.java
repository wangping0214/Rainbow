package com.rainbow.server;

import com.rainbow.entity.Receipt;
import com.rainbow.entity.TaxRate;

public class ReceiptTax {
	private Receipt receipt ;
	private TaxRate taxRate;
	public Receipt getReceipt() {
		return receipt;
	}
	public void setReceipt(Receipt receipt) {
		this.receipt = receipt;
	}
	public TaxRate getTaxRate() {
		return taxRate;
	}
	public void setTaxRate(TaxRate taxRate) {
		this.taxRate = taxRate;
	}
}
