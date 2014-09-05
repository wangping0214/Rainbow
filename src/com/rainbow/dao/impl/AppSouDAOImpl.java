package com.rainbow.dao.impl;

import java.io.File;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.struts2.ServletActionContext;
import org.springframework.transaction.annotation.Transactional;

import com.rainbow.dao.AppSouDAO;
import com.rainbow.entity.AppSource;

/**
 * @author Administrator
 *
 */
@Transactional
public class AppSouDAOImpl implements AppSouDAO {
	@PersistenceContext
	private EntityManager entityManager;

	@SuppressWarnings("unchecked")
	@Override
	public List<AppSource> findAll() {
		// TODO Auto-generated method stub
		Query query = entityManager.createQuery("select u from AppSource u");
		return query.getResultList();
	}

	@Override
	public AppSource findById(int id) {
		// TODO Auto-generated method stub
		return entityManager.find(AppSource.class, id);
	}

	@Override
	public void save(AppSource appSou) {
		// TODO Auto-generated method stub
		entityManager.persist(appSou);

	}

	/**
	 * @author Administrator 如果两个文件名不相等并且不空的话说明上传了新的文件，则需要删除原来的文件 跟新数据库相应字段
	 */
	@Override
	public void update(int id, AppSource appSou) {
		// TODO Auto-generated method stub
		AppSource tmp = findById(id);
		if (appSou.getGamePhoto1() != null) {
			if (tmp.getGamePhoto1() == null)
				tmp.setGamePhoto1(appSou.getGamePhoto1());
			else if (!tmp.getGamePhoto1().equals(appSou.getGamePhoto1())) {
				File file = new File(ServletActionContext.getServletContext()
						.getRealPath("") + tmp.getGamePhoto1());
				file.delete();
				tmp.setGamePhoto1(appSou.getGamePhoto1());
			}
		}
		if (appSou.getGamePhoto2() != null) {
			if (tmp.getGamePhoto2() == null)
				tmp.setGamePhoto2(appSou.getGamePhoto2());
			else if (!tmp.getGamePhoto2().equals(appSou.getGamePhoto2())) {
				File file = new File(ServletActionContext.getServletContext()
						.getRealPath("") + tmp.getGamePhoto2());
				file.delete();
				tmp.setGamePhoto2(appSou.getGamePhoto2());
			}
		}
		if (appSou.getGamePhoto3() != null) {
			if (tmp.getGamePhoto3() == null)
				tmp.setGamePhoto3(appSou.getGamePhoto3());
			else if (!tmp.getGamePhoto3().equals(appSou.getGamePhoto3())) {
				File file = new File(ServletActionContext.getServletContext()
						.getRealPath("") + tmp.getGamePhoto3());
				file.delete();
				tmp.setGamePhoto3(appSou.getGamePhoto3());
			}
		}
		if (appSou.getGamePhoto4() != null) {
			if (tmp.getGamePhoto4() == null)
				tmp.setGamePhoto4(appSou.getGamePhoto4());
			else if (!tmp.getGamePhoto4().equals(appSou.getGamePhoto4())) {
				File file = new File(ServletActionContext.getServletContext()
						.getRealPath("") + tmp.getGamePhoto4());
				file.delete();
				tmp.setGamePhoto4(appSou.getGamePhoto4());
			}
		}
		if (appSou.getGamePhoto5() != null) {
			if (tmp.getGamePhoto5() == null)
				tmp.setGamePhoto5(appSou.getGamePhoto5());
			else if (!tmp.getGamePhoto5().equals(appSou.getGamePhoto5())) {
				File file = new File(ServletActionContext.getServletContext()
						.getRealPath("") + tmp.getGamePhoto5());
				file.delete();
				tmp.setGamePhoto5(appSou.getGamePhoto5());
			}
		}
		if (appSou.getLogo1() != null) {
			if (tmp.getLogo1() == null)
				tmp.setLogo1(appSou.getLogo1());
			else if (!tmp.getLogo1().equals(appSou.getLogo1())) {
				File file = new File(ServletActionContext.getServletContext()
						.getRealPath("") + tmp.getLogo1());
				file.delete();
				tmp.setLogo1(appSou.getLogo1());
			}
		}
		if (appSou.getLogo2() != null) {
			if (tmp.getLogo2() == null)
				tmp.setLogo2(appSou.getLogo2());
			else if (!tmp.getLogo2().equals(appSou.getLogo2())) {
				File file = new File(ServletActionContext.getServletContext()
						.getRealPath("") + tmp.getLogo2());
				file.delete();
				tmp.setLogo2(appSou.getLogo2());
			}
		}
		if (appSou.getPackge() != null) {
			
			if (tmp.getPackge() == null){
				tmp.setPackge(appSou.getPackge());
				tmp.setPackgeSize(appSou.getPackgeSize());
			}
			else if (!tmp.getPackge().equals(appSou.getPackge())) {//包跟换
				tmp.setPackgeSize(appSou.getPackgeSize());
				File file = new File(ServletActionContext.getServletContext()
						.getRealPath("") + tmp.getPackge());
				file.delete();
				tmp.setPackge(appSou.getPackge());
			}
		}

		entityManager.merge(tmp);

	}

	/**
	 * @author Administrator 先删除文件 在删除数据库对应一项
	 */
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		AppSource tmp = findById(id);
		if (tmp != null) {
			if (tmp.getGamePhoto1() != null) {
				File file = new File(ServletActionContext.getServletContext()
						.getRealPath("") + tmp.getGamePhoto1());
				file.delete();
			}
			if (tmp.getGamePhoto2() != null) {
				File file = new File(ServletActionContext.getServletContext()
						.getRealPath("") + tmp.getGamePhoto2());
				file.delete();
			}
			if (tmp.getGamePhoto3() != null) {
				File file = new File(ServletActionContext.getServletContext()
						.getRealPath("") + tmp.getGamePhoto3());
				file.delete();
			}
			if (tmp.getGamePhoto4() != null) {
				File file = new File(ServletActionContext.getServletContext()
						.getRealPath("") + tmp.getGamePhoto4());
				file.delete();
			}
			if (tmp.getGamePhoto5() != null) {
				File file = new File(ServletActionContext.getServletContext()
						.getRealPath("") + tmp.getGamePhoto5());
				file.delete();
			}
			if (tmp.getLogo1() != null) {
				File file = new File(ServletActionContext.getServletContext()
						.getRealPath("") + tmp.getLogo1());
				file.delete();
			}
			if (tmp.getLogo2() != null) {
				File file = new File(ServletActionContext.getServletContext()
						.getRealPath("") + tmp.getLogo2());
				file.delete();
			}
			if (tmp.getPackge() != null) {
				File file = new File(ServletActionContext.getServletContext()
						.getRealPath("") + tmp.getPackge());
				file.delete();
			}
		}
		entityManager.remove(tmp);

	}

	@Override
	public List<AppSource> Section(int num)
	{
		
		Query query = entityManager.createQuery("select u from AppSource u order by u.id asc");
		//从第几行 开始查询
		//query.setFirstResult(2);
		//显示几行
		query.setMaxResults(num);
		
		return query.getResultList();
		// TODO Auto-generated method stub
		
		
	}

}
