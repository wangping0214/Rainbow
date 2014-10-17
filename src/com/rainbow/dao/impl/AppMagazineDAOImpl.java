package com.rainbow.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.rainbow.dao.AppMagazineDAO;
import com.rainbow.entity.Magazine;

public class AppMagazineDAOImpl implements AppMagazineDAO
{
	@PersistenceContext
	private EntityManager entityManager;

	//��ѯȫ����־
	@Override
	public List<Magazine> All()
	{
		Query query = entityManager.createQuery("select u from Magazine u");
		return query.getResultList();
	}

	//����id��ѯ��־
	@Override
	public List<Magazine> Accordingid(int id)
	{
		Query query = entityManager.createQuery("select u from Magazine u where u.id=:id");
		query.setParameter("id", id);
		return query.getResultList();
	}

}
