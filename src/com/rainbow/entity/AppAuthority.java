package com.rainbow.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "appAuthority")
public class AppAuthority implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(name="reasonsNotThrough")
	private String reasonsNotThrough;//Ϊ��ͨ������,���ͨ�����ֶ�Ϊ��
	@Column(name="recomLevel")
	private int recomLevel;//�Ƽ�����1-100������
	@Column(name="score")
	private int score;//ƽ����1-100������
	@Column(name="amountOfDown")
	private int amountOfDown;//���ش���
	@Column(name="divided")
	private float divided;//�ֳɱ���
	@Column(name="visitable")
	private int visitable;//�Բ����Ƿ�ɼ�����1���ɼ�����0�����ɼ�
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
		this.visitable = 1;
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

	public int getVisitable()
	{
		return visitable;
	}

	public void setVisitable(int visitable)
	{
		this.visitable = visitable;
	}
	
}
