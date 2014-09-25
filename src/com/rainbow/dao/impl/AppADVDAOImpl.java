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
	 * 获取广告图片
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<ADV> imlogo()
	{
		Query query = entityManager.createQuery("select u from ADV u order by u.logotime desc");
		//query.setMaxResults(4);
		return query.getResultList();
	}
	/**
	 * GYn
	 *上传广告图片 
	 */
	@Override
	public void saveimlogo(ADV adv)
	{
		entityManager.persist(adv);	
	}
	/**
	 * gyn
	 * 通过对象删除图片
	 */
	@Override
	public void deleteimglogo(ADV adv)
	{
		// TODO Auto-generated method stub
		entityManager.remove(adv);
	}
	/**
	 * gyn通过id查询图片
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

}
