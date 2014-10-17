package com.rainbow.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.rainbow.dao.AppAutDAO;
import com.rainbow.entity.AppAuthority;

@Transactional
public class AppAutDAOImpl implements AppAutDAO{
	@PersistenceContext
	private EntityManager entityManager;

	@SuppressWarnings("unchecked")
	@Override
	public List<AppAuthority> findAll() {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from AppAuthority u");
		return query.getResultList();
	}

	@Override
	public AppAuthority findById(int id) {
		// TODO Auto-generated method stub
		return entityManager.find(AppAuthority.class, id);
	}

	@Override
	public void save(AppAuthority appAut) {
		// TODO Auto-generated method stub
		entityManager.persist(appAut);
		
	}

	@Override
	public void update(int id, AppAuthority appAut) {
		// TODO Auto-generated method stub
		AppAuthority tmp = findById(id);
		tmp.setReasonsNotThrough(appAut.getReasonsNotThrough());
		tmp.setAmountOfDown(appAut.getAmountOfDown());
		tmp.setRecomLevel(appAut.getRecomLevel());
		tmp.setScore(appAut.getScore());
		entityManager.merge(tmp);
		
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		AppAuthority tmp = findById(id);
		entityManager.remove(tmp);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AppAuthority> findByRecomLevel(int recomLevel, int currentPage,
			int pageSize) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from AppAuthority u , AppInfo s where s.id=u.id and s.shelf = 1 and u.recomLevel > 0 order by u.recomLevel desc");
	//	query.setParameter("recomLevel", recomLevel);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public int findByRecomLevelNum(int recomLevel) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from AppAuthority u where u.recomLevel > 0");
	//	query.setParameter("recomLevel", recomLevel);
		return query.getResultList().size();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AppAuthority> findByScoreAndDown(int score, int currentPage,
			int pageSize) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from AppAuthority u , AppInfo s  where s.id=u.id and s.shelf = 1 and u.score >:score order by u.score desc, u.amountOfDown desc");
			query.setParameter("score", score);
			int startRow = (currentPage-1)*pageSize;
			query.setFirstResult(startRow);
			query.setMaxResults(pageSize);
			return query.getResultList();
	}

	@Override
	public int findByScoreAndDownNum(int score) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from AppAuthority u where u.score >:score");
			query.setParameter("score", score);
			return query.getResultList().size();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AppAuthority> findRank(int score, int shelf, int currentPage,
			int pageSize) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from AppAuthority u , AppInfo s where s.id=u.id and s.shelf =:shelf order by u.recomLevel desc, u.score desc");
		query.setParameter("shelf", shelf);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public int findRankNum(int score, int shelf) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from AppAuthority u , AppInfo s where u.id=s.id and s.shelf =:shelf");
		query.setParameter("shelf", shelf);
		return query.getResultList().size();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AppAuthority> findByBoutique(int recomLevel, int score,
			int currentPage, int pageSize) {
		Query query = entityManager.createQuery("select u from AppAuthority u , AppInfo s where u.id=s.id and s.shelf = 1 and u.recomLevel >:recomLevel and u.score >:score order by u.recomLevel desc, u.score desc,u.amountOfDown desc,s.upTime desc");
		query.setParameter("recomLevel", recomLevel);
		query.setParameter("score", score);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AppAuthority> findByTypeRank(String type, int recomLevel,
			int score, int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from AppAuthority u , AppInfo s where u.id=s.id and s.type=:type and s.shelf = 1 and u.recomLevel >:recomLevel and u.score >:score order by u.recomLevel desc, u.score desc,u.amountOfDown desc,s.upTime desc");
		query.setParameter("type", type);
		query.setParameter("recomLevel", recomLevel);
		query.setParameter("score", score);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}
	
	public int findByTypeRankNum(String type,int recomLevel,int score){
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from AppAuthority u , AppInfo s where u.id=s.id and s.type=:type and s.shelf = 1 and u.recomLevel >:recomLevel and u.score >:score");
		query.setParameter("type", type);
		query.setParameter("recomLevel", recomLevel);
		query.setParameter("score", score);
		return query.getResultList().size();
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<AppAuthority> findByClassification(String classification,int id,
			int recomLevel, int score, int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from AppAuthority u , AppInfo s where u.id=s.id and u.id!=:id and s.classification=:classification and s.shelf = 1 and u.recomLevel >:recomLevel and u.score >:score order by u.recomLevel desc, u.score desc,u.amountOfDown desc,s.upTime desc");
		query.setParameter("id", id);
		query.setParameter("classification", classification);
		query.setParameter("recomLevel", recomLevel);
		query.setParameter("score", score);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public void updatePart(AppAuthority appAut) {
		entityManager.merge(appAut);
	}

	@Override
	public List<AppAuthority> Section()
	{
		Query query = entityManager.createQuery("select u from AppAuthority u order by u.id asc");
		//从第几行 开始查询
		//query.setFirstResult(2);
		//显示几行
		//query.setMaxResults(num);
		
		return query.getResultList();
		// TODO Auto-generated method stub
	}
	//按照推荐级别排行app信息 前num行
	//已上架
	//通过审核
	@Override
	public List<AppAuthority> RecomLevel(int num)
	{
		
		Query query = entityManager.createQuery("select u from AppAuthority u,AppInfo a where a.id=u.id and isThrough=1 and shelf=1 order by  u.recomLevel desc");
		query.setMaxResults(num);
		return query.getResultList();
		
	}
	

}
