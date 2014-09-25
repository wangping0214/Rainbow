package com.rainbow.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="advertisement")
public class ADV implements Serializable
{
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	//图片的相对路径
	@Column(name="logo")
	private String logo;
	//图片类型
	@Column(name="type")
	private String type;
	//存图片的时间
	@Column(name="logotime")
	private String logotime;
	
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public String getLogotime()
	{
		return logotime;
	}
	public void setLogotime(String logotime)
	{
		this.logotime = logotime;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getLogo()
	{
		return logo;
	}
	public void setLogo(String logo)
	{
		this.logo = logo;
	}
	public static long getSerialversionuid()
	{
		return serialVersionUID;
	}
	
	
	
	
	
}
