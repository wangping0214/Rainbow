package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.Receipt;

public interface ReceiptDAO
{
	public Receipt findById(int id); 
	public List<Receipt> findByCp_id(String cp_id);
	public List<Receipt> findByCp_idAndApp_id(String cp_id,String app_id);
	public List<Receipt> findByCp_idAndTypeAndTime(String cp_id,String type,String startTime,String endTime);
}
