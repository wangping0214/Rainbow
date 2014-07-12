package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.Prize;

public interface PrizeDAO {
	public Prize findById(int id);
	public List<Prize> findByIssuePrize(int issue,int prize);
	public List<Prize> findPrize(int issue);
	public Prize findByPhoneIssue(String phone,int issue);
	public Prize findByIdCardIssue(String id_card,int issue);
	public void save(Prize prize);
}
