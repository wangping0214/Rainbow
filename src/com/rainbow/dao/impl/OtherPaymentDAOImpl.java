package com.rainbow.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.rainbow.dao.OtherPaymentDAO;
import com.rainbow.entity.OtherPayment;

@Transactional
public class OtherPaymentDAOImpl implements OtherPaymentDAO
{
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public OtherPayment findById(int id)
	{
		return entityManager.find(OtherPayment.class, id);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OtherPayment> findByAppId(String app_id)
	{
		Query query = entityManager
				.createQuery("select u from OtherPayment u where u.app_id = :app_id");
		query.setParameter("app_id", app_id);
		return query.getResultList();
	}

	@Override
	public void save(OtherPayment otherPayment)
	{
		entityManager.persist(otherPayment);

	}

	@Override
	public void update(OtherPayment otherPayment)
	{
		entityManager.merge(otherPayment);

	}

	@Override
	public void delete(OtherPayment otherPayment)
	{
		entityManager.remove(otherPayment);

	}

	@Override
	public OtherPayment findByProductId(String product_id)
	{
		Query query = entityManager
				.createQuery("select u from OtherPayment u where u.product_id = :product_id");
		query.setParameter("product_id", product_id);
		if (query.getResultList().size() > 0)
			return (OtherPayment) query.getResultList().get(0);
		else
			return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OtherPayment> findByAppIdAndCpId(String app_id, String cp_id)
	{
		Query query = entityManager
				.createQuery("select u from OtherPayment u where u.app_id = :app_id and u.cp_id = :cp_id");
		query.setParameter("app_id", app_id);
		query.setParameter("cp_id", cp_id);
		return query.getResultList();
	}

}
