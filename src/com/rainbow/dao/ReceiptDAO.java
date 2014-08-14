package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.Receipt;

public interface ReceiptDAO
{
	public Receipt findById(int id); 
	public List<Receipt> findByCp_id(String cp_id);
	public List<Receipt> findByCp_idAndApp_id(String cp_id,String app_id);
	/**
	 * type 00短代 01支付宝 11银联
	 */
	public List<Receipt> findByCp_idAndTypeAndTime(String cp_id,String type,String startTime,String endTime);
	public List<Receipt> findByTypeAndTime(String type,String startTime,String endTime);
	public List<Receipt> findByCp_idAndTime(String cp_id,String startTime,String endTime);
	public List<Receipt> findByTime(String startTime,String endTime);
	public List<Receipt> findByUserAppYearMonth(String cp_id,String app_id,String yearMonth);
	public List<Receipt> findByUserAppYearMonthCheckOut(String cp_id,String app_id,String yearMonth,int check_out);
	public Receipt findByOrder_id(String order_id);
	public int findByCp_idNum(String cp_id);
	public void update(Receipt receipt);
}
