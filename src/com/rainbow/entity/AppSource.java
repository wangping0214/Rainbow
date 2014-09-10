package com.rainbow.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author STerOTto
 *
 */
@Entity
@Table(name="appsource")
public class AppSource implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(name="packge")
	private String packge;//apk包的相对路径
	@Column(name="packgeSize")
	private float packgeSize;//包大小
	@Column(name="logo1")
	private String logo1;//48*48的logo路径
	@Column(name="logo2")
	private String logo2;//94*94的logo路径
	@Column(name="gamePhoto1")
	private String gamePhoto1;//游戏截图1-5的路径
	@Column(name="gamePhoto2")
	private String gamePhoto2;
	@Column(name="gamePhoto3")
	private String gamePhoto3;
	@Column(name="gamePhoto4")
	private String gamePhoto4;
	@Column(name="gamePhoto5")
	private String gamePhoto5;
	
	
	public AppSource() {
		super();
		this.gamePhoto1=null;
		this.gamePhoto2=null;
		this.gamePhoto3=null;
		this.gamePhoto5=null;
		this.logo1=null;
		this.logo2=null;
		this.packge=null;
	}
	
	public float getPackgeSize() {
		return packgeSize;
	}

	public void setPackgeSize(float packgeSize) {
		this.packgeSize = packgeSize;
	}

	public String getGamePhoto5() {
		return gamePhoto5;
	}
	public void setGamePhoto5(String gamePhoto5) {
		this.gamePhoto5 = gamePhoto5;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPackge() {
		return packge;
	}
	public void setPackge(String packge) {
		this.packge = packge;
	}
	public String getLogo1() {
		return logo1;
	}
	public void setLogo1(String logo1) {
		this.logo1 = logo1;
	}
	public String getLogo2() {
		return logo2;
	}
	public void setLogo2(String logo2) {
		this.logo2 = logo2;
	}
	public String getGamePhoto1() {
		return gamePhoto1;
	}
	public void setGamePhoto1(String gamePhoto1) {
		this.gamePhoto1 = gamePhoto1;
	}
	public String getGamePhoto2() {
		return gamePhoto2;
	}
	public void setGamePhoto2(String gamePhoto2) {
		this.gamePhoto2 = gamePhoto2;
	}
	public String getGamePhoto3() {
		return gamePhoto3;
	}
	public void setGamePhoto3(String gamePhoto3) {
		this.gamePhoto3 = gamePhoto3;
	}
	public String getGamePhoto4() {
		return gamePhoto4;
	}
	public void setGamePhoto4(String gamePhoto4) {
		this.gamePhoto4 = gamePhoto4;
	}
	
	
}
