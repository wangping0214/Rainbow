package com.rainbow.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.context.annotation.Scope;
import org.springframework.transaction.annotation.Transactional;

import com.rainbow.dao.UniqueIdDAO;
import com.rainbow.entity.UniqueId;

@Transactional
@Scope("prototype")
public class UniqueIdDAOImpl implements UniqueIdDAO{
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<UniqueId> findAll() {
		Query query = entityManager.createQuery("select u from UniqueId u");
		return query.getResultList();
	}

	@Override
	public UniqueId findByName(String name) {
		Query query = entityManager.createQuery("select u from UniqueId u where u.name=:name");
		query.setParameter("name", name);
		@SuppressWarnings("unchecked")
		List<UniqueId> resultList = query.getResultList();
		if (resultList.size() > 0)
		{
			return resultList.get(0);
		}
		return null;
	}

	@Override
	public void save(UniqueId uniqueId) {
		entityManager.persist(uniqueId);
		
	}

	@Override
	public void update(UniqueId uniqueId) {
		entityManager.merge(uniqueId);
		
	}

}
