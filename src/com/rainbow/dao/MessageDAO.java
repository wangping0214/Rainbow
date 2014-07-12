package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.MessagePayment;

public interface MessageDAO {
	public MessagePayment findById(int id);
	public List<MessagePayment> findByAppId(String app_id);
	public List<MessagePayment> findByAppIdCpId(String app_id,String cp_id);
	public MessagePayment findByProductId(String product_id);
	public void save(MessagePayment mesPay);
	public void update(MessagePayment mesPay);
	public void delete(MessagePayment mesPay);
}
