package com.rainbow.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * ¶Ì´úÊµÌå
 * @author STerOTto
 *@version 2014-7-1 14:55:22
 *
 */
@Entity
@Table(name="messagePayment")
public class MessagePayment {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(name="cp_id")
	private String cp_id;
	@Column(name="app_id")
	private String app_id;
	@Column(name="product_id")
	private String product_id;
	@Column(name="name")
	private String name;
	@Column(name="china_unicom_product_id")
	private String china_unicom_product_id;
	@Column(name="china_unicom_consume_code")
	private String china_unicom_consume_code;
	@Column(name="description")
	private String description;
	@Column(name="price")
	private int price;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getChina_unicom_product_id() {
		return china_unicom_product_id;
	}
	public void setChina_unicom_product_id(String china_unicom_product_id) {
		this.china_unicom_product_id = china_unicom_product_id;
	}
	public String getChina_unicom_consume_code() {
		return china_unicom_consume_code;
	}
	public void setChina_unicom_consume_code(String china_unicom_consume_code) {
		this.china_unicom_consume_code = china_unicom_consume_code;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
}
