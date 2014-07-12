package com.rainbow.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.rainbow.dao.AdminDAO;
import com.rainbow.entity.Admin;
import com.rainbow.entity.User;
public class AdminDAOImpl implements AdminDAO {

	@PersistenceContext
	private EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Admin> findAll()
	{
		Query query = entityManager.createQuery("select u from Admin u");
		return query.getResultList();
	}

	@Override
	public Admin find(Integer id)
	{
		return entityManager.find(Admin.class, id);
	}

	@Override
	public Admin find(String str1,String str2, String string1,String string2)
	{
		// TODO ·ÀÖ¹sql×¢Èë
		Query query = entityManager.createQuery("select u from Admin u where u."+str1+"=:"+str1+" and u."+string1+"=:"+string1);
		query.setParameter(str1, str2);
		query.setParameter(string1, string2);
		query.setMaxResults(1);
		@SuppressWarnings("unchecked")
		List<Admin> Admins = query.getResultList();
		if (Admins.size() > 0)
			return Admins.get(0);
		return null;
	}
	@Override
	public int getNum(String userType){
		Query query = entityManager.createQuery("select u from User u where u.userType=:userType");
		query.setParameter("userType", userType);
		return query.getResultList().size();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Admin> getThrough(String userType,int currentPage,int pageSize){
		Query query = entityManager.createQuery("select u from User u where u.userType=:userType");
		query.setParameter("userType", userType);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}
	@Override
	public void save(Admin admin)
	{
		entityManager.persist(admin);
	}
	
	@Override
	public void update(Admin admin)
	{
		entityManager.merge(admin);
	}

	@Override
	public void remove(Integer id)
	{
		Admin u = find(id);
		if (u != null)
			entityManager.remove(u);		
	}

	@SuppressWarnings("unchecked")
	public List<Admin> findinfo(String str1,String str2){
		// TODO ·ÀÖ¹sql×¢Èë
				Query query = entityManager.createQuery("select u from User u where u."+str1+"=:"+str1);
				query.setParameter(str1, str2);
				return query.getResultList();
	}
	@Override
	public int getRegNum(String userType,int approved){
		Query query = entityManager.createQuery("select u from User u where u.userType!=:userType and u.approved=:approved");
		query.setParameter("userType", userType);
		query.setParameter("approved", approved);
		return query.getResultList().size();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Admin> getRegThrough(String userType,int approved,int currentPage,int pageSize){
		Query query = entityManager.createQuery("select u from User u where u.userType!=:userType and u.approved=:approved");
		query.setParameter("userType", userType);
		query.setParameter("approved", approved);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public Admin findByName(String userName) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from Admin u where u.username=:username");
		query.setParameter("username", userName);
		if(query.getResultList().size()>0)
			return (Admin) query.getResultList().get(0);
		else
			return null;
	}
}
