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
	//userid
	@Column(name="cp_id")
	private String cp_id;
	
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
	
	public String getCp_id()
	{
		return cp_id;
	}
	public void setCp_id(String cp_id)
	{
		this.cp_id = cp_id;
	}
	
	
	
}
