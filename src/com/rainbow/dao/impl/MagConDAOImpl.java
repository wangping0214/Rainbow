package com.rainbow.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.rainbow.dao.MagConDAO;
import com.rainbow.entity.MagCon;
@Transactional
public class MagConDAOImpl implements MagConDAO{

	
	@PersistenceContext
	private EntityManager entityManager;

	
	@SuppressWarnings("unchecked")
	@Override
	public List<MagCon> findAll() {
		// TODO Auto-generated method stub
		
			
			Query query = entityManager.createQuery("select u from Magcontent u");
			return query.getResultList();
		
	}


	@Override
	public void save(MagCon magCon) {
		// TODO Auto-generated method stub
		entityManager.persist(magCon);
	}

}
