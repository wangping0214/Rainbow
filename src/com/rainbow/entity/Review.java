package com.rainbow.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="review")
public class Review implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(name="app_id")
	private int app_id;//app id 通过此字段可查询是对于那个app的评论
	@Column(name="user_id")
	private int user_id;//use id
	@Column(name="userName")
	private String userName;//评论的用户，若为匿名用户，此字段为“匿名用户”
	@Column(name="time")
	private String time;//发表评论的时间
	@Column(name="terminal")
	private String terminal;//终端类型：用户通过哪种终端进行的评论
	@Column(name="content")
	private String content;//评论内容
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public int getApp_id() {
		return app_id;
	}
	public void setApp_id(int app_id) {
		this.app_id = app_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		System.out.println("enter setUserId");
		this.user_id = user_id;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTerminal() {
		return terminal;
	}
	public void setTerminal(String terminal) {
		this.terminal = terminal;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		System.out.println("enter setusername");
		this.userName = userName;
	}
	
	
}
