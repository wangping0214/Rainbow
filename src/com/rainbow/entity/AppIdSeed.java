package com.rainbow.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;

@Entity

@Table(name = "appIdSeed")
public class AppIdSeed {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(name="name")
	private String name;
	@Column(name="appIdSeed")
	private long appIdSeed;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getAppIdSeed() {
		return appIdSeed;
	}
	public void setAppIdSeed(long appIdSeed) {
		this.appIdSeed = appIdSeed;
	}
	

}
