package com.rainbow.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.context.annotation.Scope;
import org.springframework.transaction.annotation.Transactional;

import com.rainbow.dao.TaxRateDAO;
import com.rainbow.entity.TaxRate;

@Transactional
@Scope("prototype")
public class TaxRateDAOImpl implements TaxRateDAO {
	
	@PersistenceContext
	private EntityManager entityManager;
	@Override
	public TaxRate findById(int id) {
		return entityManager.find(TaxRate.class, id);
	}

	@Override
	public TaxRate findByYearMonth(String time) {
		Query query = entityManager.createQuery("select u from TaxRate u where u.time like :time");
		query.setParameter("time", time+"%");
		if(query.getResultList().size()>0){
			return (TaxRate) query.getResultList().get(0);
		}
		else
			return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<TaxRate> findByYear(String year) {
		Query query = entityManager.createQuery("select u from TaxRate u where u.time like :year order by u.time");
		query.setParameter("year", year+"%");
		return query.getResultList();
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
