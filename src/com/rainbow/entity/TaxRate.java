package com.rainbow.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="taxRate")
public class TaxRate implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(name="time")
	private String time;
	@Column(name="tax_rate")
	private float tax_rate;
	@Column(name="channel_message")
	private float channel_message;
	@Column(name="channel_bank")
	private float channel_bank;
	@Column(name="channel_alipay")
	private float channel_alipay;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
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
	
	
}
