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
@Table(name="magcontent")
public class MagCon implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(name="journal")
	private String journal;
	@Column(name="catalog")
	private String catalog;
	@Column(name="content")
	private String content;
	
	
	@Transient
	private String[] catelogTmp;
	
	@Transient
	private String[] contentTmp;
	
	
	
	
	public String[] getCatelogTmp() {
		return catelogTmp;
	}
	public void setCatelogTmp(String[] catelogTmp) {
		this.catelogTmp = catelogTmp;
	}
	public String[] getContentTmp() {
		return contentTmp;
	}
	public void setContentTmp(String[] contentTmp) {
		this.contentTmp = contentTmp;
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
	public String getCatalog() {
		return catalog;
	}
	public void setCatalog(String catalog) {
		this.catalog = catalog;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

}
