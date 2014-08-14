package com.rainbow.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.rainbow.dao.TaxRateDAO;
import com.rainbow.entity.TaxRate;
import com.rainbow.server.TaxRateSev;

public class TaxRateAction {

	private TaxRateDAO taxRateDAO;

	private String year;
	private int taxRateId;
	private float tax_rate;
	private float channel_message;
	private float channel_bank;
	private float channel_alipay;

	/**
	 * 税率管理初始化
	 * 
	 * @return
	 * @throws ParseException
	 */
	@SuppressWarnings("deprecation")
	public String initTaxRate() throws ParseException {
		if (year == null||"".equals(year)||"年份".equals(year)) {
			// 如果年份为空则获取当前年
			Calendar now = Calendar.getInstance();
			year = String.valueOf(now.get(Calendar.YEAR));
		}
		List<TaxRate> taxRateList = taxRateDAO.findByYear(year);
		List<TaxRateSev> taxRateSevList = new ArrayList<TaxRateSev>();
		for (TaxRate taxRate : taxRateList) {
			// 将税率时间格式化
			SimpleDateFormat matter = new SimpleDateFormat("yyyy-MM");
			Date date = new Date();
			date = matter.parse(taxRate.getTime());
			TaxRateSev taxRateSev = new TaxRateSev();
			taxRateSev.setTaxRate(taxRate);
			taxRateSev.setYear(String.valueOf(date.getYear()));
			taxRateSev.setMonth(String.valueOf(date.getMonth()+1));
			taxRateSevList.add(taxRateSev);

		}
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("year", year);
		session.setAttribute("taxRateSevList", taxRateSevList);
		return Action.SUCCESS;
	}

	/**
	 * 跟新某个税率
	 */
	public void updateTaxRate() {
		TaxRate taxRate = taxRateDAO.findById(taxRateId);
		taxRate.setTax_rate(tax_rate);
		taxRate.setChannel_message(channel_message);
		taxRate.setChannel_alipay(channel_alipay);
		taxRate.setChannel_bank(channel_bank);
		taxRateDAO.update(taxRate);
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public int getTaxRateId() {
		return taxRateId;
	}

	public void setTaxRateId(int taxRateId) {
		this.taxRateId = taxRateId;
	}

	public float getTax_rate() {
		return tax_rate;
	}

	public void setTax_rate(float tax_rate) {
		this.tax_rate = tax_rate;
	}

	public float getChannel_message() {
		return channel_message;
	}

	public void setChannel_message(float channel_message) {
		this.channel_message = channel_message;
	}

	public float getChannel_bank() {
		return channel_bank;
	}

	public void setChannel_bank(float channel_bank) {
		this.channel_bank = channel_bank;
	}

	public float getChannel_alipay() {
		return channel_alipay;
	}

	public void setChannel_alipay(float channel_alipay) {
		this.channel_alipay = channel_alipay;
	}

	public TaxRateAction(TaxRateDAO taxRateDAO) {
		super();
		this.taxRateDAO = taxRateDAO;
	}
	
	
}
