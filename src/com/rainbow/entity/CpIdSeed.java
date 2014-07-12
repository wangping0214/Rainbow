package com.rainbow.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;

@Entity
@Scope("prototype")
@Table(name = "cpIdSeed")
public class CpIdSeed {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(name="cpIdSeed")
	private Integer cpIdSeed;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCpIdSeed() {
		return cpIdSeed;
	}
	public void setCpIdSeed(Integer cpIdSeed) {
		this.cpIdSeed = cpIdSeed;
	}
	
}
