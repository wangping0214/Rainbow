package com.rainbow.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.rainbow.dao.AppMagazineContentDAO;

import com.rainbow.entity.MagazineContent;
@Transactional
public class AppMagazineContentDAOImpl implements AppMagazineContentDAO
{
	@PersistenceContext
	private EntityManager entityManager;

	//����������ҳ����ѯ��־
	@Override
	public MagazineContent Pagesperiod(String period, int Pages)
	{
		Query query = entityManager.createQuery("select m from MagazineContent m where period=:period and pages=:Pages");	
		query.setParameter("period", period);
		query.setParameter("Pages", Pages);
		return (MagazineContent) query.getResultList().get(0);
		
	}
	//����������ѯ��־
	@Override
	public List<MagazineContent> Pagesperiod(String period)
	{
		Query query = entityManager.createQuery("select n from MagazineContent n where n.period=:period order by n.pages asc");	
		query.setParameter("period", period);
		return query.getResultList();
		
	}
	//���ݲ�ѯȫ����־
	@Override
	public List<MagazineContent> All()
	{
		Query query = entityManager.createQuery("select m from MagazineContent m");	
		
		return query.getResultList();
	}
	@Override
	public void save(MagazineContent magazineContent)
	{
		entityManager.persist(magazineContent);
	}
	@Override
	public void delete(MagazineContent magazineContent)
	{
		entityManager.remove(magazineContent);
	}

}
