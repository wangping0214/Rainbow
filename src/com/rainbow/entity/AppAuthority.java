package com.rainbow.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "appAuthority")
public class AppAuthority {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(name="reasonsNotThrough")
	private String reasonsNotThrough;
	@Column(name="recomLevel")
	private int recomLevel;
	@Column(name="score")
	private int score;
	@Column(name="amountOfDown")
	private int amountOfDown;
	@Column(name="divided")
	private float divided;
	@Column(name="channel_message")
	private float channel_message;
	@Column(name="channel_bank")
	private float channel_bank;
	@Column(name="channel_alipay")
	private float channel_alipay;
	@Transient
	private String strRecomLevel;
	@Transient
	private String strScore;
	@Transient
	private String strAmountOfDown;
	
	public AppAuthority() {
		super();
		this.reasonsNotThrough = null;
		this.recomLevel = 0;
		this.score = 0;
		this.amountOfDown = 0;
		this.divided = 0;
		this.channel_message = 0;
		this.channel_bank = 0;
		this.channel_alipay = 0;
	}
	
	public String getStrRecomLevel() {
		return strRecomLevel;
	}

	public void setStrRecomLevel(String strRecomLevel) {
		this.strRecomLevel = strRecomLevel;
	}

	public String getStrScore() {
		return strScore;
	}

	public void setStrScore(String strScore) {
		this.strScore = strScore;
	}

	public String getStrAmountOfDown() {
		return strAmountOfDown;
	}

	public void setStrAmountOfDown(String strAmountOfDown) {
		this.strAmountOfDown = strAmountOfDown;
	}

	public String getReasonsNotThrough() {
		return reasonsNotThrough;
	}
	public void setReasonsNotThrough(String reasonsNotThrough) {
		this.reasonsNotThrough = reasonsNotThrough;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public int getRecomLevel() {
		return recomLevel;
	}
	public void setRecomLevel(int recomLevel) {
		this.recomLevel = recomLevel;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getAmountOfDown() {
		return amountOfDown;
	}
	public void setAmountOfDown(int amountOfDown) {
		this.amountOfDown = amountOfDown;
	}

	public float getDivided() {
		return divided;
	}

	public void setDivided(float divided) {
		this.divided = divided;
	}

	public float getChannel_message() {
		return channel_message;
	}

	public void setChannel_message(float channel_message) {
		this.channel_message = channel_message;
	}

	public float getChannel_bank() {
		return channel_bank;
	}

	public void setChannel_bank(float channel_bank) {
		this.channel_bank = channel_bank;
	}

	public float getChannel_alipay() {
		return channel_alipay;
	}

	public void setChannel_alipay(float channel_alipay) {
		this.channel_alipay = channel_alipay;
	}

	
	
	
	
	

}
