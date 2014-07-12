package com.rainbow.action;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.rainbow.dao.PrizeDAO;
import com.rainbow.entity.Prize;

public class PrizeAction {
	private static final int ISSUE = 1;
	private Prize prize;
	
	private PrizeDAO prizeDAO;
	
	private int issue;//期数
	private int prizeLevel;//奖级别
	private String phone;//手机号
	private String id_card;//身份证号
	
	private String selectp;
	private String selectc;
	
	/**
	 * 答对题的联通用户提交信息
	 * 并且设置期数
	 * 默认不中奖
	 * @return
	 */
	public String prizeInfoSub(){
		prize.setIssue(ISSUE);//第一期
		prize.setPrize(0);//不中奖
		prize.setProvince(selectp);
		prize.setCity(selectc);
		prizeDAO.save(prize);
		return Action.SUCCESS;
	}
	
	/**
	 * 显示某期中奖的名单
	 */
	public String showIssuePrize(){
		HttpSession httpSession = ServletActionContext.getRequest().getSession();
		List<Prize> prize = prizeDAO.findPrize(issue);
		System.out.println("prize:"+prize.size()+"\nissue:"+issue);
		httpSession.setAttribute("prize", prize);
		return Action.SUCCESS;
	}
	
	
	/**
	 * 检查某期
	 * @return
	 */
	public String prizeCheckPhone(){
		Prize prize = prizeDAO.findByPhoneIssue(phone, ISSUE);
		if(prize==null)
			return Action.SUCCESS;
		else
			return Action.ERROR;
	}
	
	public String prizeCheckIdCard(){
		Prize prize = prizeDAO.findByIdCardIssue(id_card, ISSUE);
		if(prize==null)
			return Action.SUCCESS;
		else 
			return Action.ERROR;
	}
	
	public Prize getPrize() {
		return prize;
	}

	public void setPrize(Prize prize) {
		this.prize = prize;
	}

	public int getIssue() {
		return issue;
	}

	public void setIssue(int issue) {
		this.issue = issue;
	}

	public int getPrizeLevel() {
		return prizeLevel;
	}

	public void setPrizeLevel(int prizeLevel) {
		this.prizeLevel = prizeLevel;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getId_card() {
		return id_card;
	}

	public void setId_card(String id_card) {
		this.id_card = id_card;
	}
	
	public String getSelectp() {
		return selectp;
	}

	public void setSelectp(String selectp) {
		this.selectp = selectp;
	}

	public String getSelectc() {
		return selectc;
	}

	public void setSelectc(String selectc) {
		this.selectc = selectc;
	}

	public PrizeAction(PrizeDAO prizeDAO) {
		super();
		this.prizeDAO = prizeDAO;
	}
	
}
