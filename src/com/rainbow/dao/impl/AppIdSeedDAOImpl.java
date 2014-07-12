package com.rainbow.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.context.annotation.Scope;
import org.springframework.transaction.annotation.Transactional;

import com.rainbow.dao.AppIdSeedDAO;
import com.rainbow.entity.AppIdSeed;

@Transactional
@Scope("prototype")
public class AppIdSeedDAOImpl implements AppIdSeedDAO{

	@PersistenceContext
	private EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<AppIdSeed> findAll() {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from AppIdSeed u");
		return query.getResultList();
	}

	@Override
	public AppIdSeed findByName(String name) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from AppIdSeed u where u.name = :name");
		query.setParameter("name", name);
		if(query.getResultList().size()>0)
			return (AppIdSeed) query.getResultList().get(0);
		else return null;
	}

	@Override
	public void update(AppIdSeed appIdSeed) {
		// TODO Auto-generated method stub
		entityManager.merge(appIdSeed);
	}

	@Override
	public void sava(AppIdSeed appIdSeed) {
		// TODO Auto-generated method stub
		entityManager.persist(appIdSeed);
	}

}
