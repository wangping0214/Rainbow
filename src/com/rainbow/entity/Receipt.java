package com.rainbow.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "receipt")
public class Receipt {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "cp_id")
	private String cp_id;
	@Column(name = "app_id")
	private String app_id;
	@Column(name = "product_id")
	private String product_id;
	@Column(name = "order_id")
	private String order_id;
	@Column(name = "custom_data")
	private String custom_data;
	@Column(name = "receipt_time")
	private String receipt_time;
	@Column(name = "price")
	private float price;
	@Column(name = "has_notify")
	private int has_notify;
	@Column(name = "check_out")
	private int check_out;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCp_id() {
		return cp_id;
	}

	public void setCp_id(String cp_id) {
		this.cp_id = cp_id;
	}

	public String getApp_id() {
		return app_id;
	}

	public void setApp_id(String app_id) {
		this.app_id = app_id;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getCustom_data() {
		return custom_data;
	}

	public void setCustom_data(String custom_data) {
		this.custom_data = custom_data;
	}

	public String getReceipt_time() {
		return receipt_time;
	}

	public void setReceipt_time(String receipt_time) {
		this.receipt_time = receipt_time;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getHas_notify() {
		return has_notify;
	}

	public void setHas_notify(int has_notify) {
		this.has_notify = has_notify;
	}

	public int getCheck_out() {
		return check_out;
	}

	public void setCheck_out(int check_out) {
		this.check_out = check_out;
	}

}
