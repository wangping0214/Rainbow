package com.rainbow.entity;

import java.io.File;
import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.Transient;

@Entity
@Table(name="users")
public class User implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(name="username")
	private String username;
	@Column(name="password")
	private String password;
	@Column(name="email")
	private String email;
	@Column(name="telephone")
	private String telephone;
	@Column(name="realname")
	private String realname;
	@Column(name="duty")
	private String duty;
	@Column(name="corporatename")
	private String corporatename;
	@Column(name="website")
	private String website;
	@Column(name="address")
	private String address;
	@Column(name="qqname")
	private String qqname;
	@Column(name="photo1")
	private String photo1;
	@Column(name="photo2")
	private String photo2;
	@Column(name="ad")
	private String ad;
	@Column(name="userType")
	private String userType;
	@Column(name="approved")
	private int approved;
	@Column(name="nowtime")
	private String nowtime;
	@Column(name="cp_id")
	private String cp_id;
	@Transient
	File cardphoto1;
	@Transient
	String cardphoto1FileName;
	@Transient
	String  cardphoto1ContentType;
	@Transient
	File cardphoto2;
	@Transient
	String cardphoto2FileName;
	@Transient
	String  cardphoto2ContentType;
	@Transient
	File newad;
	@Transient
	String newadFileName;
	@Transient
	String  newadContentType;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
	}
	public String getCorporatename() {
		return corporatename;
	}
	public void setCorporatename(String corporatename) {
		this.corporatename = corporatename;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getQqname() {
		return qqname;
	}
	public void setQqname(String qqname) {
		this.qqname = qqname;
	}
	public String getPhoto1() {
		return photo1;
	}
	public void setPhoto1(String photo1) {
		this.photo1 = photo1;
	}
	public String getPhoto2() {
		return photo2;
	}
	public void setPhoto2(String photo2) {
		this.photo2 = photo2;
	}
	
	public String getAd() {
		return ad;
	}
	public void setAd(String ad) {
		this.ad = ad;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public int getApproved() {
		return approved;
	}
	public void setApproved(int approved) {
		this.approved = approved;
	}
	public String getNowtime() {
		return nowtime;
	}
	public void setNowtime(String nowtime) {
		this.nowtime = nowtime;
	}
	public File getCardphoto1() {
		return cardphoto1;
	}
	public void setCardphoto1(File cardphoto1) {
		this.cardphoto1 = cardphoto1;
	}
	public String getCardphoto1FileName() {
		return cardphoto1FileName;
	}
	public void setCardphoto1FileName(String cardphoto1FileName) {
		this.cardphoto1FileName = cardphoto1FileName;
	}
	public String getCardphoto1ContentType() {
		return cardphoto1ContentType;
	}
	public void setCardphoto1ContentType(String cardphoto1ContentType) {
		this.cardphoto1ContentType = cardphoto1ContentType;
	}
	public File getCardphoto2() {
		return cardphoto2;
	}
	public void setCardphoto2(File cardphoto2) {
		this.cardphoto2 = cardphoto2;
	}
	public String getCardphoto2FileName() {
		return cardphoto2FileName;
	}
	public void setCardphoto2FileName(String cardphoto2FileName) {
		this.cardphoto2FileName = cardphoto2FileName;
	}
	public String getCardphoto2ContentType() {
		return cardphoto2ContentType;
	}
	public void setCardphoto2ContentType(String cardphoto2ContentType) {
		this.cardphoto2ContentType = cardphoto2ContentType;
	}
	public File getNewad() {
		return newad;
	}
	public void setNewad(File newad) {
		this.newad = newad;
	}
	public String getNewadFileName() {
		return newadFileName;
	}
	public void setNewadFileName(String newadFileName) {
		this.newadFileName = newadFileName;
	}
	public String getNewadContentType() {
		return newadContentType;
	}
	public void setNewadContentType(String newadContentType) {
		this.newadContentType = newadContentType;
	}
	public String getCp_id() {
		return cp_id;
	}
	public void setCp_id(String cp_id) {
		this.cp_id = cp_id;
	}
	
	
}