package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.Receipt;

public interface ReceiptDAO
{
	public Receipt findById(int id); 
	public List<Receipt> findByCp_id(String cp_id);
	public List<Receipt> findByCp_idAndApp_id(String cp_id,String app_id);
	/**
	 * type 00�̴� 01֧���� 11����
	 */
	public List<Receipt> findByCp_idAndTypeAndTime(String cp_id,String type,String startTime,String endTime);
	public List<Receipt> findByCp_idAndTime(String cp_id,String startTime,String endTime);
	public Receipt findByOrder_id(String order_id);
	public int findByCp_idNum(String cp_id);
}
