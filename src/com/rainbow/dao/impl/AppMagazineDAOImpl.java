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

	//查询全部杂志
	@Override
	public List<Magazine> All()
	{
		Query query = entityManager.createQuery("select u from Magazine u");
		//每页显示几6条数据
		query.setMaxResults(6);
		return query.getResultList();
	}

	//根据id查询杂志
	@Override
	public Magazine Accordingid(int id)
	{
		Query query = entityManager.createQuery("select u from Magazine u where u.id=:id");
		query.setParameter("id", id);
		return (Magazine) query.getResultList().get(0);
	}
	//添加杂志
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
		//第几页
		query.setFirstResult(startRow);
		//每页显示几条数据
		query.setMaxResults(pageSize);
		return query.getResultList();
	}
	//根据对象删除杂志
	@Override
	public void delete(Magazine magazine)
	{
		entityManager.remove(magazine);
		
	}



}
