package com.rainbow.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "appInfo")
public class AppInfo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "userName")
	private String userName;//cp用户名
	@Column(name = "appName")
	private String appName;//APP名
	@Column(name = "type")
	private String type;//APP类型（游戏，应用）
	@Column(name = "category")
	private String category;//APP分类
	@Column(name = "classification")
	private String classification;//APP类别
	@Column(name = "language")
	private String language;//语言
	@Column(name = "fee")
	private String fee;//（1,2,3,4,）1:没有收费内容;2:这个应用是试用版，付费后才能使用完整功能;3:这个应用包含付费内容，如表情，道具，电子书等虚拟物品;4:这个应用是试用版，付费后才能使用完整功能，同时应用中包含付费方可购买的虚拟物品.
	@Column(name = "security")
	private String security;//安全等级（“0|0|1|1”）字符串类型，四个级别
	@Column(name = "appIntrodution")
	private String appIntrodution;//APP简介
	@Column(name = "elaborate")
	private String elaborate;//详细描述
	@Column(name = "versionIntrodution")
	private String versionIntrodution;
	@Column(name = "isThrough")//-3待完善，-2待提交，-1未通过，0待审核，1通过审核
	private int isThrough;
	@Column(name = "shelf")
	private int shelf;						//是否上架，-2强制下架，-1已下架，0等待发布，1已上架
	@Column(name = "releaseTime")
	private String releaseTime;//发布时间（0通过审核立即发布，1：通过审核等待发布）
	@Column(name = "upTime")		
	private String upTime;//上传时间
	@Column(name="app_id")
	private String app_id;// 应用id
	@Column(name="joint")
	private int joint;//是否联合运营1：联合运营；0：应用推广
	@Column(name="cp_id")
	private String cp_id;//cp_id
	@Column(name="notify_url")
	private String notify_url;//回调地址
	@Column(name="md5_key")
	private String md5_key;//MD5_KEY
	
	public AppInfo() {
		super();
		this.userName = null;
		this.appName = null;
		this.type = null;
		this.category = null;
		this.language = null;
		this.fee = null;
		this.security = null;
		this.appIntrodution = null;
		this.elaborate = null;
		this.versionIntrodution = null;
		this.isThrough = 0;
		this.shelf = 0;
		this.releaseTime = null;
		this.app_id = null;
		this.joint = 0;
		this.cp_id = null;
	}
	
	public String getCp_id() {
		return cp_id;
	}

	public void setCp_id(String cp_id) {
		this.cp_id = cp_id;
	}

	public int getJoint() {
		return joint;
	}

	public void setJoint(int joint) {
		this.joint = joint;
	}

	public String getUpTime() {
		return upTime;
	}

	public void setUpTime(String upTime) {
		this.upTime = upTime;
	}

	public String getClassification() {
		return classification;
	}

	public void setClassification(String classification) {
		this.classification = classification;
	}

	public int getShelf() {
		return shelf;
	}
	public void setShelf(int shelf) {
		this.shelf = shelf;
	}
	public String getElaborate() {
		return elaborate;
	}
	public void setElaborate(String elaborate) {
		this.elaborate = elaborate;
	}
	public String getReleaseTime() {
		return releaseTime;
	}
	public void setReleaseTime(String releaseTime) {
		this.releaseTime = releaseTime;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAppName() {
		return appName;
	}
	public void setAppName(String appName) {
		this.appName = appName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getFee() {
		return fee;
	}
	public void setFee(String fee) {
		this.fee = fee;
	}
	public String getSecurity() {
		return security;
	}
	public void setSecurity(String security) {
		this.security = security;
	}
	public String getAppIntrodution() {
		return appIntrodution;
	}
	public void setAppIntrodution(String appIntrodution) {
		this.appIntrodution = appIntrodution;
	}
	public String getVersionIntrodution() {
		return versionIntrodution;
	}
	public void setVersionIntrodution(String versionIntrodution) {
		this.versionIntrodution = versionIntrodution;
	}
	public int getIsThrough() {
		return isThrough;
	}
	public void setIsThrough(int isThrough) {
		this.isThrough = isThrough;
	}

	public String getApp_id() {
		return app_id;
	}

	public void setApp_id(String app_id) {
		this.app_id = app_id;
	}

	public String getNotify_url()
	{
		return notify_url;
	}

	public void setNotify_url(String notify_url)
	{
		this.notify_url = notify_url;
	}

	public String getMd5_key() {
		return md5_key;
	}

	public void setMd5_key(String md5_key) {
		this.md5_key = md5_key;
	}
	
	
	

}
