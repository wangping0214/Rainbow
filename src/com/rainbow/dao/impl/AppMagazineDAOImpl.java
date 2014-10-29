package com.rainbow.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.rainbow.dao.AppMagazineDAO;
import com.rainbow.entity.Magazine;
@Transactional
public class AppMagazineDAOImpl implements AppMagazineDAO
{
	@PersistenceContext
	private EntityManager entityManager;

	//��ѯȫ����־
	@Override
	public List<Magazine> All()
	{
		Query query = entityManager.createQuery("select u from Magazine u");
		//ÿҳ��ʾ��6������
		query.setMaxResults(6);
		return query.getResultList();
	}

	//����id��ѯ��־
	@Override
	public Magazine Accordingid(int id)
	{
		Query query = entityManager.createQuery("select u from Magazine u where u.id=:id");
		query.setParameter("id", id);
		return (Magazine) query.getResultList().get(0);
	}
	//�����־
	@Override
	public void save(Magazine magazine)
	{
		entityManager.persist(magazine);
		
	}

	@Override
	public List<Magazine> Fenye(int currentPage,int pageSize)
	{
		Query query = entityManager.createQuery("select u from Magazine u");
		int startRow = (currentPage-1)*pageSize;
		if(startRow<0){
			startRow=0;
		}
		//�ڼ�ҳ
		query.setFirstResult(startRow);
		//ÿҳ��ʾ��������
		query.setMaxResults(pageSize);
		return query.getResultList();
	}
	//���ݶ���ɾ����־
	@Override
	public void delete(Magazine magazine)
	{
		entityManager.remove(magazine);
		
	}



}
