package com.rainbow.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="magazine")
public class Magazine implements Serializable
{
	
		private static final long serialVersionUID = 1L;
		@Id
		@Column(name="id")
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		private int id;
		
		@Column(name="name")
		private String name;//杂志名称
		@Column(name="Period")
		private String Period;//杂志期数
		@Column(name="Introduction")
		private String Introduction;//杂志简介
		@Column(name="img")
		private String img;//封面图片
		@Column(name="time")
		private String time;//杂志上传时间
		
		@Column(name="Physicalpath")
		private String Physicalpath;//杂志上传物理地址
		public int getId()
		{
			return id;
		}
		public void setId(int id)
		{
			this.id = id;
		}
		public String getName()
		{
			return name;
		}
		public void setName(String name)
		{
			this.name = name;
		}
		public String getPeriod()
		{
			return Period;
		}
		public void setPeriod(String period)
		{
			Period = period;
		}
		public String getIntroduction()
		{
			return Introduction;
		}
		public void setIntroduction(String introduction)
		{
			Introduction = introduction;
		}
		public String getImg()
		{
			return img;
		}
		public void setImg(String img)
		{
			this.img = img;
		}
		public String getTime()
		{
			return time;
		}
		public void setTime(String time)
		{
			this.time = time;
		}
		public String getPhysicalpath()
		{
			return Physicalpath;
		}
		public void setPhysicalpath(String physicalpath)
		{
			Physicalpath = physicalpath;
		}
		

}
