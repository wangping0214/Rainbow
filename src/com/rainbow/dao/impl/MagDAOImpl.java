package com.rainbow.dao.impl;

import java.io.File;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.struts2.ServletActionContext;
import org.springframework.transaction.annotation.Transactional;

import com.rainbow.dao.MagDAO;

import com.rainbow.entity.Magazine;

@Transactional
public class MagDAOImpl implements MagDAO{
	@PersistenceContext
	private EntityManager entityManager;

	@SuppressWarnings("unchecked")
	@Override
	public List<Magazine> findAll() {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from Magazine u");
		return query.getResultList();
	}

	@Override
	public void save(Magazine mag) {
		// TODO Auto-generated method stub
		entityManager.persist(mag);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Magazine> findByShelf(boolean shelf) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from Magazine u where u.shelf=:shelf");
		query.setParameter("shelf", shelf);
		
		return query.getResultList();
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Magazine> findShelf(boolean shelf, int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from Magazine u where u.shelf=:shelf");
		query.setParameter("shelf", shelf);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		
		return query.getResultList();
		
	}

	@Override
	public int findShelfNum(boolean shelf) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from Magazine u where u.shelf=:shelf");
		query.setParameter("shelf", shelf);
		return query.getResultList().size();
	}

	@Override
	public Magazine findById(int id) {
		// TODO Auto-generated method stub
		return entityManager.find(Magazine.class, id);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Magazine> find(String nowtime,boolean shelf){
		Query query = entityManager.createQuery("select u from Magazine u where u.shelf=:shelf and u.nowtime like'"+nowtime+"%'");
		query.setParameter("shelf", shelf);
		return query.getResultList();
	}

	@Override
	public void update(int id,Magazine mag) {
		// TODO Auto-generated method stub
		Magazine magezine = findById(id);
		magezine.setCover(mag.getCover());
		magezine.setJournal(mag.getJournal());
		magezine.setMagIntroduction(mag.getMagIntroduction());
		magezine.setShelf(mag.getShelf());
		magezine.setNowtime(mag.getNowtime());
		entityManager.merge(magezine);
		
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Magazine mag=findById(id);
		if(mag!=null){
			if(mag.getCover()!=null){
				File file = new File(ServletActionContext.getServletContext().getRealPath("")+mag.getCover());
				file.delete();
			}
				
		}
		entityManager.remove(mag);
		
	}

}
