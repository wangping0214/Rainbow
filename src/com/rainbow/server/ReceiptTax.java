package com.rainbow.server;

import java.io.Serializable;

import com.rainbow.entity.Receipt;
import com.rainbow.entity.TaxRate;

/**
 * ������˰�ʷ����
 * ���������Ͷ��������Ǹ��µ�˰����Ϣ
 * @author STerOTto
 *
 */
public class ReceiptTax implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
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
