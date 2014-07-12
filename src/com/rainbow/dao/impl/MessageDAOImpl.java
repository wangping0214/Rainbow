package com.rainbow.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.rainbow.dao.MessageDAO;
import com.rainbow.entity.MessagePayment;

@Transactional
public class MessageDAOImpl implements MessageDAO{

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public MessagePayment findById(int id) {
		// TODO Auto-generated method stub
		return entityManager.find(MessagePayment.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MessagePayment> findByAppId(String app_id) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from MessagePayment u where u.app_id = :app_id");
		query.setParameter("app_id", app_id);
		
		return query.getResultList();
	}

	@Override
	public void save(MessagePayment mesPay) {
		// TODO Auto-generated method stub
		entityManager.persist(mesPay);
		
	}

	@Override
	public void update(MessagePayment mesPay) {
		// TODO Auto-generated method stub
		entityManager.merge(mesPay);
		
	}

	@Override
	public void delete(MessagePayment mesPay) {
		// TODO Auto-generated method stub
		entityManager.remove(mesPay);
	}

	@Override
	public MessagePayment findByProductId(String product_id) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from MessagePayment u where u.product_id = :product_id");
		query.setParameter("product_id", product_id);
		if(query.getResultList().size()>0)
			return (MessagePayment) query.getResultList().get(0);
		else
			return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MessagePayment> findByAppIdCpId(String app_id, String cp_id) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from MessagePayment u where u.app_id = :app_id and u.cp_id = :cp_id");
		query.setParameter("app_id", app_id);
		query.setParameter("cp_id", cp_id);
		
		return query.getResultList();
	}

}
