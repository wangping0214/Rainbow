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
	private int divided;
	@Column(name="channel_message")
	private int channel_message;
	@Column(name="channel_bank")
	private int channel__bank;
	@Column(name="channel_alipay")
	private int channel_alipay;
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
		this.divided = -1;
		this.channel_message = -1;
		this.channel__bank = -1;
		this.channel_alipay = -1;
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

	public int getDivided() {
		return divided;
	}

	public void setDivided(int divided) {
		this.divided = divided;
	}

	public int getChannel_message() {
		return channel_message;
	}

	public void setChannel_message(int channel_message) {
		this.channel_message = channel_message;
	}

	public int getChannel__bank() {
		return channel__bank;
	}

	public void setChannel__bank(int channel__bank) {
		this.channel__bank = channel__bank;
	}

	public int getChannel_alipay() {
		return channel_alipay;
	}

	public void setChannel_alipay(int channel_alipay) {
		this.channel_alipay = channel_alipay;
	}
	
	
	
	

}
