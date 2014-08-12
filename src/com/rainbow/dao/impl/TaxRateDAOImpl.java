package com.rainbow.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.rainbow.dao.TaxRateDAO;
import com.rainbow.entity.TaxRate;

public class TaxRateDAOImpl implements TaxRateDAO {
	
	@PersistenceContext
	private EntityManager entityManager;
	@Override
	public TaxRate findById(int id) {
		return entityManager.find(TaxRate.class, id);
	}

	@Override
	public TaxRate findByYearMonth(String time) {
		Query query = entityManager.createQuery("select * from TaxRate where time like :time");
		query.setParameter("time", time+"%");
		if(query.getResultList().size()>0){
			return (TaxRate) query.getResultList().get(0);
		}
		else
			return null;
	}

	@Override
	public void save(TaxRate taxRate) {
		entityManager.persist(taxRate);
	}

	@Override
	public void update(TaxRate taxRate) {
		entityManager.merge(taxRate);
	}

}
