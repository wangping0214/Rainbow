package com.rainbow.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.rainbow.dao.AppADVDAO;
import com.rainbow.entity.ADV;

@Transactional
public class AppADVDAOImpl implements AppADVDAO
{
	@PersistenceContext
	private EntityManager entityManager;
	/**
	 * GYn
	 * ��ȡ���ͼƬ
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<ADV> imlogo(int id)
	{
		Query query = entityManager.createQuery("select u from ADV u where id=:id");
		query.setParameter("id", id);
		return query.getResultList();
	}
	/**
	 * GYn
	 *�ϴ����ͼƬ 
	 */
	@Override
	public void saveimlogo(ADV adv)
	{
		entityManager.persist(adv);	
	}

}
