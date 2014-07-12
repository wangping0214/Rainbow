package com.rainbow.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.context.annotation.Scope;
import org.springframework.transaction.annotation.Transactional;

import com.rainbow.dao.CpIdSeedDAO;
import com.rainbow.entity.CpIdSeed;

@Transactional
@Scope("prototype")
public class CpIdSeedDAOImpl implements CpIdSeedDAO{
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CpIdSeed> findAll() {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from CpIdSeed u");
		
		System.out.println("enter findAll");
		return query.getResultList();
	}

	@Override
	public CpIdSeed findById(int id) {
		// TODO Auto-generated method stub
		return entityManager.find(CpIdSeed.class,id);
	}

	@Override
	public void save(CpIdSeed cpIdSeed) {
		// TODO Auto-generated method stub
		entityManager.persist(cpIdSeed);
		
	}

	@Override
	public void update(CpIdSeed cpIdSeed) {
		// TODO Auto-generated method stub
		entityManager.merge(cpIdSeed);
		
	}

}
