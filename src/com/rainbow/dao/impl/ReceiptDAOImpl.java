package com.rainbow.dao.impl;

import java.util.List;

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
		Query query = entityManager.createQuery("select u from Receipt u where u.cp_id = :cp_id and u.order_id REGEXP :reg and u.receipt_time BETWEEN :startTime and :endTime");
		query.setParameter("cp_id", cp_id);
		query.setParameter("reg", reg);
		query.setParameter("startTime", startTime);
		query.setParameter("endTime", endTime);
		return query.getResultList();
	}

}
