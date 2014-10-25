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
		private String name;//��־����
		@Column(name="Period")
		private String Period;//��־����
		@Column(name="Introduction")
		private String Introduction;//��־���
		@Column(name="img")
		private String img;//����ͼƬ
		@Column(name="time")
		private String time;//��־�ϴ�ʱ��
		
		@Column(name="Physicalpath")
		private String Physicalpath;//��־�ϴ������ַ
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
