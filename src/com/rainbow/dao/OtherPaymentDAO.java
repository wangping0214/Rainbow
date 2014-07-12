package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.OtherPayment;

public interface OtherPaymentDAO {
	public OtherPayment findById(int id);
	public List<OtherPayment> findByAppId(String app_id);
	public OtherPayment findByProductId(String product_id);
	public void save(OtherPayment otherPayment);
	public void update(OtherPayment otherPayment);
	public void delete(OtherPayment otherPayment);

}
