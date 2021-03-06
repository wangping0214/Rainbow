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
	 * 获取广告图片
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<ADV> imlogo(int currentPage,int pageSize)
	{
		Query query = entityManager.createQuery("select u from ADV u order by u.logotime desc");
		//query.setMaxResults(4);
		//currentPage页数
		int startRow = (currentPage-1)*pageSize;
		if(startRow<0){
			startRow=0;
		}
		//第几页
		query.setFirstResult(startRow);
		//每页显示几条数据
		query.setMaxResults(pageSize);
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
	@Override
	public List<ADV> imlogo()
	{
		Query query = entityManager.createQuery("select b from ADV b order by b.logotime desc ");
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
