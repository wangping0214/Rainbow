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
	private String userName;//cp�û���
	@Column(name = "appName")
	private String appName;//APP��
	@Column(name = "type")
	private String type;//APP���ͣ���Ϸ��Ӧ�ã�
	@Column(name = "category")
	private String category;//APP����
	@Column(name = "classification")
	private String classification;//APP���
	@Column(name = "language")
	private String language;//����
	@Column(name = "fee")
	private String fee;//��1,2,3,4,��1:û���շ�����;2:���Ӧ�������ð棬���Ѻ����ʹ����������;3:���Ӧ�ð����������ݣ�����飬���ߣ��������������Ʒ;4:���Ӧ�������ð棬���Ѻ����ʹ���������ܣ�ͬʱӦ���а������ѷ��ɹ����������Ʒ.
	@Column(name = "security")
	private String security;//��ȫ�ȼ�����0|0|1|1�����ַ������ͣ��ĸ�����
	@Column(name = "appIntrodution")
	private String appIntrodution;//APP���
	@Column(name = "elaborate")
	private String elaborate;//��ϸ����
	@Column(name = "versionIntrodution")
	private String versionIntrodution;
	@Column(name = "isThrough")//-3�����ƣ�-2���ύ��-1δͨ����0����ˣ�1ͨ�����
	private int isThrough;
	@Column(name = "shelf")
	private int shelf;						//�Ƿ��ϼܣ�-2ǿ���¼ܣ�-1���¼ܣ�0�ȴ�������1���ϼ�
	@Column(name = "releaseTime")
	private String releaseTime;//����ʱ�䣨0ͨ���������������1��ͨ����˵ȴ�������
	@Column(name = "upTime")		
	private String upTime;//�ϴ�ʱ��
	@Column(name="app_id")
	private String app_id;// Ӧ��id
	@Column(name="joint")
	private int joint;//�Ƿ�������Ӫ1��������Ӫ��0��Ӧ���ƹ�
	@Column(name="cp_id")
	private String cp_id;//cp_id
	@Column(name="notify_url")
	private String notify_url;//�ص���ַ
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
