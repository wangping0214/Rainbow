package com.rainbow.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.rainbow.dao.PrizeDAO;
import com.rainbow.entity.Prize;

@Transactional
public class PrizeDAOImpl implements PrizeDAO{

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public Prize findById(int id) {
		// TODO Auto-generated method stub
		return entityManager.find(Prize.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Prize> findByIssuePrize(int issue, int prize) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from Prize u where u.issue = :issue and u.prize = :prize");
		query.setParameter("issue", issue);
		query.setParameter("prize", prize);
		return query.getResultList();
	}

	@Override
	public Prize findByPhoneIssue(String phone,int issue) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from Prize u where u.phone = :phone and u.issue = :issue");
		query.setParameter("phone", phone);
		query.setParameter("issue", issue);
		if(query.getResultList().size()>0)
			return (Prize) query.getResultList().get(0);
		else return null;
	}

	@Override
	public Prize findByIdCardIssue(String id_card,int issue) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from Prize u where u.id_card = :id_card and u.issue = :issue");
		query.setParameter("id_card", id_card);
		query.setParameter("issue", issue);
		if(query.getResultList().size()>0)
			return (Prize) query.getResultList().get(0);
		else return null;
	}

	@Override
	public void save(Prize prize) {
		// TODO Auto-generated method stub
		entityManager.persist(prize);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Prize> findPrize(int issue) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from Prize u where u.issue = :issue and u.prize !=0");
		query.setParameter("issue", issue);

		return query.getResultList();
	}

}
