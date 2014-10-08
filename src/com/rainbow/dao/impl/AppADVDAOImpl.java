package com.rainbow.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.rainbow.dao.AppADVDAO;
import com.rainbow.entity.ADV;
import com.rainbow.entity.AppInfo;

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
	public List<ADV> imlogo(int currentPage,int pageSize)
	{
		Query query = entityManager.createQuery("select u from ADV u order by u.logotime desc");
		//query.setMaxResults(4);
		//currentPageҳ��
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
	/**
	 * GYn
	 *�ϴ����ͼƬ 
	 */
	@Override
	public void saveimlogo(ADV adv)
	{
		entityManager.persist(adv);	
	}
	/**
	 * gyn
	 * ͨ������ɾ��ͼƬ
	 */
	@Override
	public void deleteimglogo(ADV adv)
	{
		// TODO Auto-generated method stub
		entityManager.remove(adv);
	}
	/**
	 * gynͨ��id��ѯͼƬ
	 */
	@Override
	public ADV select(int id)
	{
		Query query = entityManager.createQuery("select u from ADV u where u.id=:id");
		query.setParameter("id", id);
		if(query.getResultList().size()>0)
			return (ADV) query.getResultList().get(0);
		else return null;
		
	
	}
	@Override
	public List<ADV> imlogo()
	{
		Query query = entityManager.createQuery("select u from ADV u order by u.logotime desc");
		return query.getResultList();
		
		
	}
	@Override
	public List<ADV> type(String type)
	{
		Query query = entityManager.createQuery("select u from ADV u where u.type=:type order by u.logotime desc ");
		query.setParameter("type", type);
		return query.getResultList();
		
	}

}
