package com.rainbow.server;

import java.io.Serializable;

import com.rainbow.entity.TaxRate;

/**
 * 税率服务层
 * 把年月分解出来
 * @author STerOTto
 *
 */
public class TaxRateSev implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private TaxRate taxRate;
	private String year;
	private String month;
	public TaxRate getTaxRate() {
		return taxRate;
	}
	public void setTaxRate(TaxRate taxRate) {
		this.taxRate = taxRate;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	

}
