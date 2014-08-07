package com.rainbow.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.rainbow.dao.ReceiptDAO;
import com.rainbow.entity.Receipt;
@Transactional
public class ReceiptDAOImpl implements ReceiptDAO
{
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Receipt findById(int id)
	{
		return entityManager.find(Receipt.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Receipt> findByCp_id(String cp_id)
	{
		Query query = entityManager.createQuery("select u from Receipt u where u.cp_id = :cp_id");
		query.setParameter("cp_id", cp_id);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Receipt> findByCp_idAndApp_id(String cp_id, String app_id)
	{
		Query query = entityManager.createQuery("select u from Receipt u where u.cp_id = :cp_id and u.app_id = :app_id");
		query.setParameter("cp_id", cp_id);
		query.setParameter("app_id", app_id);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Receipt> findByCp_idAndTypeAndTime(String cp_id,String type, String startTime,
			String endTime)
	{
		String reg = "^[0-9]{12}"+type+"[0-9]*$";
		Query query = entityManager.createQuery("select u from Receipt u where u.cp_id = :cp_id and u.receipt_time BETWEEN :startTime and :endTime");
		query.setParameter("cp_id", cp_id);
		query.setParameter("startTime", startTime);
		query.setParameter("endTime", endTime);
		List<Receipt> receiptList = query.getResultList();
		List<Receipt> receiptRmList = new ArrayList<Receipt>();
		for(Receipt receipt:receiptList){
			if(!Pattern.matches(reg,receipt.getOrder_id()))
				receiptRmList.add(receipt);
		}
		receiptList.removeAll(receiptRmList);
		return receiptList;
	}

	@Override
	public int findByCp_idNum(String cp_id) {
		Query query = entityManager.createQuery("select u from Receipt u where u.cp_id = :cp_id");
		query.setParameter("cp_id", cp_id);
		return query.getResultList().size();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Receipt> findByCp_idAndTime(String cp_id, String startTime,
			String endTime) {
		Query query = entityManager.createQuery("select u from Receipt u where u.cp_id = :cp_id and u.receipt_time BETWEEN :startTime and :endTime");
		query.setParameter("cp_id", cp_id);
		query.setParameter("startTime", startTime);
		query.setParameter("endTime", endTime);
		return query.getResultList();
	}

	@Override
	public Receipt findByOrder_id(String order_id) {
		Query query = entityManager.createQuery("select u from Receipt u where u.order_id = :order_id");
		query.setParameter("order_id", order_id);
		if(query.getResultList().size()>0)
			return (Receipt) query.getResultList().get(0);
		else return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Receipt> findByTypeAndTime(String type, String startTime,
			String endTime) {
		String reg = "^[0-9]{12}"+type+"[0-9]*$";
		Query query = entityManager.createQuery("select u from Receipt u where u.receipt_time BETWEEN :startTime and :endTime");
		query.setParameter("startTime", startTime);
		query.setParameter("endTime", endTime);
		List<Receipt> receiptList = query.getResultList();
		List<Receipt> receiptRmList = new ArrayList<Receipt>();
		for(Receipt receipt:receiptList){
			if(!Pattern.matches(reg,receipt.getOrder_id()))
				receiptRmList.add(receipt);
		}
		receiptList.removeAll(receiptRmList);
		return receiptList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Receipt> findByTime(String startTime, String endTime) {
		Query query = entityManager.createQuery("select u from Receipt u where u.receipt_time BETWEEN :startTime and :endTime");
		query.setParameter("startTime", startTime);
		query.setParameter("endTime", endTime);
		return query.getResultList();
	}

}
