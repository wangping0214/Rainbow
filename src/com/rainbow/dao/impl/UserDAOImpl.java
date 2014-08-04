package com.rainbow.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.rainbow.dao.UserDAO;
import com.rainbow.entity.User;

@Transactional
public class UserDAOImpl implements UserDAO
{
	@PersistenceContext
	private EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> findAll()
	{
		Query query = entityManager.createQuery("select u from User u");
		return query.getResultList();
	}

	@Override
	public User find(Integer id)
	{
		return entityManager.find(User.class, id);
	}

	@Override
	public User find(String str1,String str2)
	{
		// TODO ·ÀÖ¹sql×¢Èë
		Query query = entityManager.createQuery("select u from User u where u."+str1+"=:"+str1);
		query.setParameter(str1, str2);
		query.setMaxResults(1);
		@SuppressWarnings("unchecked")
		List<User> users = query.getResultList();
		if (users.size() > 0)
			return users.get(0);
		return null;
	}
	@Override
	public User find(String str1,String str2, String string1,String string2)
	{
		// TODO ·ÀÖ¹sql×¢Èë
		Query query = entityManager.createQuery("select u from User u where u."+str1+"=:"+str1+" and u."+string1+"=:"+string1);
		query.setParameter(str1, str2);
		query.setParameter(string1, string2);
		query.setMaxResults(1);
		@SuppressWarnings("unchecked")
		List<User> users = query.getResultList();
		if (users.size() > 0)
			return users.get(0);
		return null;
	}
	@Override
	public User find(String str1,String str2, String string1,int string2)
	{
		// TODO ·ÀÖ¹sql×¢Èë
		Query query = entityManager.createQuery("select u from User u where u."+str1+"=:"+str1+" and u."+string1+"=:"+string1);
		query.setParameter(str1, str2);
		query.setParameter(string1, string2);
		query.setMaxResults(1);
		@SuppressWarnings("unchecked")
		List<User> users = query.getResultList();
		if (users.size() > 0)
			return users.get(0);
		return null;
	}
	@Override
	public User find(String str1,String str2, String string1,String string2,String stri1,String stri2)
	{
		// TODO ·ÀÖ¹sql×¢Èë
		Query query = entityManager.createQuery("select u from User u where u."+str1+"=:"+str1+" and u."+string1+"=:"+string1+" and u."+stri1+"=:"+stri1);
		query.setParameter(str1, str2);
		query.setParameter(string1, string2);
		query.setParameter(stri1, stri2);
		query.setMaxResults(1);
		@SuppressWarnings("unchecked")
		List<User> users = query.getResultList();
		if (users.size() > 0)
			return users.get(0);
		return null;
	}
	@Override
	public User findByUser(String username) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from User u where u.username=:username");
		query.setParameter("username", username);
		if(query.getResultList().size()>0)
			return (User) query.getResultList().get(0);
		else return null;
	}
	@Override
	public void save(User user)
	{
		entityManager.persist(user);
	}
	
	@Override
	public void update(User user)
	{
		User oldUser = find(user.getId());
		if(oldUser.getCp_id()!=null||oldUser.getCp_id()!=""){
			user.setCp_id(oldUser.getCp_id());
		}
		entityManager.merge(user);
	}

	@Override
	public void remove(Integer id)
	{
		User u = find(id);
		if (u != null)
			entityManager.remove(u);		
	}

	@Override
	public User findByPhone(String phone) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from User u where u.telephone = :phone");
		query.setParameter("phone", phone);
		if(query.getResultList().size()>0){
			return (User) query.getResultList().get(0);
		}
		else return null;
	}

	@Override
	public User findByEmail(String email) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from User u where u.email = :email");
		query.setParameter("email", email);
		if(query.getResultList().size()>0){
			return (User) query.getResultList().get(0);
		}
		else return null;
	}

	@Override
	public List<User> findByUserType(String userType, int currentPage,
			int pageSize) {
		return null;
	}

	@Override
	public int findByUserTypeNum(String userType) {
		return 0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> findDiviedUserApproved(int approved, int currentPage,
			int pageSize) {
		Query query = entityManager.createQuery("select u from User u where u.approved = :approved and (u.userType = 'individualUsers' or u.userType = 'individualGroups' )");
		query.setParameter("approved", approved);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public int findDiviedUserApprovedNum(int approved) {
		Query query = entityManager.createQuery("select u from User u where u.approved = :approved and (u.userType = 'individualUsers' or u.userType = 'individualGroups' )");
		query.setParameter("approved", approved);
		return query.getResultList().size();
	}

	

}
