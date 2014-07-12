package com.rainbow.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.rainbow.dao.ReviewDAO;
import com.rainbow.entity.Review;

@Transactional
public class ReviewDAOImpl implements ReviewDAO{

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public Review findById(int id) {
		// TODO Auto-generated method stub
		return entityManager.find(Review.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Review> findByAppId(int app_id) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from Review u where u.app_id = :app_id order by u.time desc,u.id desc");
		query.setParameter("app_id",app_id);
		return query.getResultList();
	}

	@Override
	public void sava(Review review) {
		// TODO Auto-generated method stub
		entityManager.persist(review);
		
	}

	@Override
	public void delete(Review review) {
		// TODO Auto-generated method stub
		entityManager.remove(review);
	}
	
	

}
