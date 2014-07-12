package com.rainbow.entity;

import java.io.File;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="magazine")
public class Magazine {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(name="journal")
	private String journal;
	@Column(name="cover")
	private String cover;
	@Column(name="shelf")
	private int shelf;
	@Column(name="magIntroduction")
	private String magIntroduction;
	@Column(name="nowtime")
	private String nowtime;
	
	
	@Transient
	private String[] mulu;
	
	@Transient
	private File coverContent;
	@Transient
	private String coverContentContentType;
	@Transient
	private String coverContentFileName;
	

	
	
	
	
	public String getNowtime() {
		return nowtime;
	}
	public void setNowtime(String nowtime) {
		this.nowtime = nowtime;
	}
	public File getCoverContent() {
		return coverContent;
	}
	public void setCoverContent(File coverContent) {
		this.coverContent = coverContent;
	}
	public String getCoverContentContentType() {
		return coverContentContentType;
	}
	public void setCoverContentContentType(String coverContentContentType) {
		this.coverContentContentType = coverContentContentType;
	}
	public String getCoverContentFileName() {
		return coverContentFileName;
	}
	public void setCoverContentFileName(String coverContentFileName) {
		this.coverContentFileName = coverContentFileName;
	}

	

	public String[] getMulu() {
		return mulu;
	}
	public void setMulu(String[] mulu) {
		this.mulu = mulu;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getJournal() {
		return journal;
	}
	public void setJournal(String journal) {
		this.journal = journal;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	
	public int getShelf() {
		return shelf;
	}
	public void setShelf(int shelf) {
		this.shelf = shelf;
	}
	public String getMagIntroduction() {
		return magIntroduction;
	}
	public void setMagIntroduction(String magIntroduction) {
		this.magIntroduction = magIntroduction;
	}
	
	
	
	

}
