package com.rainbow.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import com.rainbow.dao.AppInfoDAO;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.ADV;

@Transactional
public class AppInfoDAOImpl implements AppInfoDAO{
	
	@PersistenceContext
	private EntityManager entityManager;

	@SuppressWarnings("unchecked")
	@Override
	public List<AppInfo> findAll() {
		Query query = entityManager.createQuery("select u from AppInfo u");
		return query.getResultList();
	}

	@Override
	public AppInfo findById(int id) {
		return entityManager.find(AppInfo.class, id);
	}

	@Override
	public void save(AppInfo appInfo) {
		entityManager.persist(appInfo);
		
	}

	/* 
	 * 跟新时app_id cp_id不能跟新
	 * (non-Javadoc)
	 * @see com.rainbow.dao.AppInfoDAO#update(int, com.rainbow.entity.AppInfo)
	 */
	@Override
	public void update(int id, AppInfo appInfo) {
		AppInfo tmp = findById(id);
		if(appInfo.getAppIntrodution()!=null)
			tmp.setAppIntrodution(appInfo.getAppIntrodution());
		if(appInfo.getAppName()!=null)
			tmp.setAppName(appInfo.getAppName());
		if(appInfo.getCategory()!=null)
			tmp.setCategory(appInfo.getCategory());
		if(appInfo.getFee()!=null)
			tmp.setFee(appInfo.getFee());
		if(appInfo.getLanguage()!=null)
			tmp.setLanguage(appInfo.getLanguage());
		if(appInfo.getSecurity()!=null)
			tmp.setSecurity(appInfo.getSecurity());
		if(appInfo.getType()!=null)
			tmp.setType(appInfo.getType());
		if(appInfo.getVersionIntrodution()!=null)
			tmp.setVersionIntrodution(appInfo.getVersionIntrodution());
		if(appInfo.getClassification()!=null)
			tmp.setClassification(appInfo.getClassification());
		if(appInfo.getElaborate()!=null)
			tmp.setElaborate(appInfo.getElaborate());
		if(appInfo.getUpTime()!=null)
			tmp.setUpTime(appInfo.getUpTime());
		if(appInfo.getReleaseTime()!=null)
			tmp.setReleaseTime(appInfo.getReleaseTime());
		tmp.setIsThrough(appInfo.getIsThrough());
		tmp.setShelf(appInfo.getShelf());
		tmp.setUpTime(appInfo.getUpTime());
		tmp.setJoint(appInfo.getJoint());
		
		
		entityManager.merge(tmp);
		
	}

	@Override
	public void delete(int id) {
		AppInfo tmp = findById(id);
		entityManager.remove(tmp);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AppInfo> findByIsThrough(String userName, int isThrough,
			int currentPage, int pageSize) {
		Query query = entityManager.createQuery("select u from AppInfo u where u.userName"
				+ "=:userName and u.isThrough=:isThrough");
		query.setParameter("userName", userName);
		query.setParameter("isThrough", isThrough);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		
		return query.getResultList();	
	}

	@Override
	public int findByIsThroughNum(String userName, int isThrough) {
		Query query = entityManager.createQuery("select u from AppInfo u where u.userNam"
				+ "e=:userName and u.isThrough=:isThrough");
		query.setParameter("userName", userName);
		query.setParameter("isThrough", isThrough);
		return query.getResultList().size();
	}

	/* 通过审核，查找是否上架
	 * (non-Javadoc)
	 * @see com.rainbow.dao.AppInfoDAO#findByShelfAndIsThrough(java.lang.String, int, int, int, int)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<AppInfo> findByShelfAndIsThrough(String userName,
			int isThrough, int shelf, int currentPage, int pageSize) {
		Query query = entityManager.createQuery("select u from AppInfo u where u.userNam"
				+ "e=:userName and u.isThrough=:isThrough and u.shelf=:shelf");
		query.setParameter("userName", userName);
		query.setParameter("isThrough", isThrough);
		query.setParameter("shelf", shelf);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		
		return query.getResultList();
	}

	@Override
	public int findByShelfAndIsThroughNum(String userName, int isThrough,
			int shelf) {
		Query query = entityManager.createQuery("select u from AppInfo u where "
				+ "u.userName=:userName and u.isThrough=:isThrough and u.shelf=:shelf");
		query.setParameter("userName", userName);
		query.setParameter("isThrough", isThrough);
		query.setParameter("shelf", shelf);
		return query.getResultList().size();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AppInfo> adminIsThrough(int isThrough, int currentPage,
			int pageSize) {
		Query query = entityManager.createQuery("select u from AppInfo u "
				+ "where u.isThrough=:isThrough");
		query.setParameter("isThrough", isThrough);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		
		return query.getResultList();	
	}

	@Override
	public int adminIsThrough(int isThrough) {
		Query query = entityManager.createQuery("select u from AppInfo u"
				+ " where u.isThrough=:isThrough");
		query.setParameter("isThrough", isThrough);
		return query.getResultList().size();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AppInfo> adminFindByShelf(int isThrough, int shelf,
			int currentPage, int pageSize) {
		Query query = entityManager.createQuery("select u from AppInfo u "
				+ "where u.isThrough=:isThrough and u.shelf=:shelf");
		query.setParameter("isThrough", isThrough);
		query.setParameter("shelf", shelf);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		
		return query.getResultList();
	}

	@Override
	public int adminFindByShelfNum(int isThrough, int shelf) {
		Query query = entityManager.createQuery("select u from AppInfo u "
				+ "where u.isThrough=:isThrough and u.shelf=:shelf");
		query.setParameter("isThrough", isThrough);
		query.setParameter("shelf", shelf);
		return query.getResultList().size();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AppInfo> findByTypeAndShelf(int shelf, String type,
			int currentPage, int pageSize) {
		Query query = entityManager.createQuery("select u from AppInfo u "
				+ "where u.shelf=:shelf and u.type=:type");
		query.setParameter("shelf", shelf);
		query.setParameter("type", type);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		
		return query.getResultList();
	}

	@Override
	public int findByTypeAndShelfNum(int shelf, String type) {
		Query query = entityManager.createQuery("select u from AppInfo u"
				+ " where u.shelf=:shelf and u.type=:type");
		query.setParameter("shelf", shelf);
		query.setParameter("type", type);
		return query.getResultList().size();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AppInfo> findByClassification(int shelf, String classification,
			int currentPage, int pageSize) {
		Query query = entityManager.createQuery("select u from AppInfo u , "
				+ "AppAuthority s where s.id=u.id and u.shelf=:shelf and u.classification"
				+ "=:classification order by s.recomLevel desc, s.score desc,s.amountOfDown desc,u.upTime desc");
		query.setParameter("shelf", shelf);
		query.setParameter("classification", classification);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		
		return query.getResultList();
	}

	@Override
	public int findByClassificationNum(int shelf, String classification) {
		Query query = entityManager.createQuery("select u from AppInfo u, AppAuthority"
				+ " s where s.id=u.id and u.shelf=:shelf and u.classification=:classification");
		query.setParameter("shelf", shelf);
		query.setParameter("classification", classification);
		return query.getResultList().size();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AppInfo> findByCategory(int shelf, String category,
			int currentPage, int pageSize) {
		Query query = entityManager.createQuery("select u from AppInfo u , AppAuthority"
				+ " s where s.id=u.id and u.shelf=:shelf and u.category=:category order"
				+ " by s.recomLevel desc, s.score desc,s.amountOfDown desc,u.upTime desc");
		query.setParameter("shelf", shelf);
		query.setParameter("category", category);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		
		return query.getResultList();
	}

	@Override
	public int findByCategoryNum(int shelf, String category) {
		Query query = entityManager.createQuery("select u from AppInfo u where"
				+ " u.shelf=:shelf and u.category=:category");
		query.setParameter("shelf", shelf);
		query.setParameter("category", category);
		return query.getResultList().size();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AppInfo> findByJoint(String userName,int shelf, int joint, int currentPage,
			int pageSize) {
		Query query = entityManager.createQuery("select u from AppInfo u where"
				+ " u.userName=:userName and u.isThrough=1 and u.shelf=:shelf and u.joint=:joint ");
		query.setParameter("shelf", shelf);
		query.setParameter("joint", joint);
		query.setParameter("userName", userName);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public int findJointNum(String userName,int shelf, int joint) {
		Query query = entityManager.createQuery("select u from AppInfo u where"
				+ " u.userName=:userName and u.isThrough=1 and u.shelf=:shelf and u.joint=:joint ");
		query.setParameter("shelf", shelf);
		query.setParameter("joint", joint);
		query.setParameter("userName", userName);
		return query.getResultList().size();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AppInfo> findUserTypeMessage(String userName, int isThrough,
			String type, int currentPage, int pageSize) {
		Query query = entityManager.createQuery("select u from AppInfo u where u.userName "
				+ "= :userName and u.isThrough = :isThrough and u.type = :type");
		query.setParameter("userName", userName);
		query.setParameter("isThrough", isThrough);
		query.setParameter("type", type);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public int findUserTypeMessageNum(String userName, int isThrough,
			String type) {
		Query query = entityManager.createQuery("select u from AppInfo u where u.userName "
				+ "= :userName and u.isThrough = :isThrough and u.type = :type");
		query.setParameter("userName", userName);
		query.setParameter("isThrough", isThrough);
		query.setParameter("type", type);
		return query.getResultList().size();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AppInfo> findAllJoint(int shelf, int joint, int currentPage,
			int pageSize) {
		Query query = entityManager.createQuery("select u from AppInfo u,AppAuthority s "
				+ "where u.id=s.id and u.isThrough=1 and u.shelf=:shelf and u.joint=:joint"
				+ " order by s.recomLevel desc,s.score desc, s.amountOfDown desc ");
		query.setParameter("shelf", shelf);
		query.setParameter("joint", joint);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public int findAllJointNum(int shelf, int joint) {
		Query query = entityManager.createQuery("select u from AppInfo u where u.isThrough=1 "
				+ "and u.shelf=:shelf and u.joint=:joint ");
		query.setParameter("shelf", shelf);
		query.setParameter("joint", joint);
		return query.getResultList().size();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AppInfo> findByUserIdAndThrough(String cp_id, int isThrough,
			int currentPage, int pageSize)
	{
		Query query = entityManager.createQuery("select u from AppInfo u where u.cp_id"
				+ " = :cp_id and u.isThrough = :isThrough");
		query.setParameter("cp_id", cp_id);
		query.setParameter("isThrough", isThrough);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public int findByUserIdAndThroughNum(String cp_id, int isThrough)
	{
		Query query = entityManager.createQuery("select u from AppInfo u where u.cp_id"
				+ " = :cp_id and u.isThrough = :isThrough");
		query.setParameter("cp_id", cp_id);
		query.setParameter("isThrough", isThrough);
		return query.getResultList().size();
	}

	@Override
	public void updataPart(AppInfo appInfo)
	{
		entityManager.merge(appInfo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AppInfo> findUserIsJointApp(String cp_id, int joint,
			int isThrough, int shelf, int currentPage, int pageSize)
	{
		Query query = entityManager.createQuery("select u from AppInfo u where u.cp_id "
				+ "= :cp_id and u.joint = :joint and u.isThrough = :isThrough and u.shelf=:shelf");
		query.setParameter("cp_id", cp_id);
		query.setParameter("joint", joint);
		query.setParameter("isThrough", isThrough);
		query.setParameter("shelf", shelf);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public int findUserIsJointAppNum(String cp_id, int joint, int isThrough, int shelf)
	{
		Query query = entityManager.createQuery("select u from AppInfo u where u.cp_id"
				+ " = :cp_id and u.joint = :joint and u.isThrough = :isThrough and u.shelf=:shelf");
		query.setParameter("cp_id", cp_id);
		query.setParameter("joint", joint);
		query.setParameter("isThrough", isThrough);
		query.setParameter("shelf", shelf);
		return query.getResultList().size();
	}

	@Override
	public List<AppInfo> findByKeyword(String keyword, int crrentPage,
			int pageSize) {
		Query query = entityManager.createQuery("se");
		return null;
	}

	@Override
	public int findByKeywordNum(String keyword) {
		return 0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AppInfo> findUserJointApp(String cp_id, int joint) {
		Query query = entityManager.createQuery("select u from AppInfo u where u.cp_id "
				+ "= :cp_id and u.joint = :joint");
		query.setParameter("cp_id", cp_id);
		query.setParameter("joint", joint);
		return query.getResultList();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<AppInfo> findUserJointAppVisitable(String cp_id, int joint, int visitable) {
		Query query = entityManager.createQuery("select u from AppInfo u,AppAuthority s"
				+ " where u.cp_id = :cp_id and u.id=s.id and u.joint = :joint and s.visitable"
				+ " = :visitable group by u.id");
		query.setParameter("cp_id", cp_id);
		query.setParameter("joint", joint);
		query.setParameter("visitable", visitable);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AppInfo> findUserJointAppByAppName(String cp_id, int joint,String appName) {
		Query query = entityManager.createQuery("select u from AppInfo u where u.cp_id = "
				+ ":cp_id and u.joint = :joint and u.appName like :appName");
		query.setParameter("cp_id", cp_id);
		query.setParameter("joint", joint);
		query.setParameter("appName", "%"+appName+"%");
		return query.getResultList();
	}

	@Override
	public AppInfo findByCp_idAndApp_id(String cp_id, String app_id) {
		Query query = entityManager.createQuery("select u from AppInfo u where u.cp_id = :cp_id and u.app_id = :app_id");
		query.setParameter("cp_id", cp_id);
		query.setParameter("app_id", app_id);
		if(query.getResultList().size()>0)
			return (AppInfo) query.getResultList().get(0);
		else return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AppInfo> findUserJointApp(String cp_id, int joint,
			int currentPage, int pageSize) {
		Query query = entityManager.createQuery("select u from AppInfo u where u.cp_id = :cp_id and u.joint = :joint");
		query.setParameter("cp_id", cp_id);
		query.setParameter("joint", joint);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public int findUserJointAppNum(String cp_id, int joint) {
		Query query = entityManager.createQuery("select u from AppInfo u where u.cp_id = :cp_id and u.joint = :joint");
		query.setParameter("cp_id", cp_id);
		query.setParameter("joint", joint);
		return query.getResultList().size();
	}

	@Override
	public int findAllJointNum(int joint) {
		Query query = entityManager.createQuery("select u from AppInfo u where u.joint = :joint");
		query.setParameter("joint", joint);
		return query.getResultList().size();
	}

	@Override
	public AppInfo findJointAppByAppName(int joint, String appName) {
		Query query = entityManager.createQuery("select u from AppInfo u where u.joint = :joint and u.appName = :appName");
		query.setParameter("joint", joint);
		query.setParameter("appName", appName);
		if(query.getResultList().size()>0)
			return (AppInfo) query.getResultList().get(0);
		else
			return null;
	}
	@Override
	public AppInfo findJointAppByAppName(int joint, String appName,int visitable) {
		Query query = entityManager.createQuery("select u from AppInfo u,AppAuthority s where u.id = s.id and u.joint = :joint and u.appName = :appName and s.visitable = :visitable group by u.id");
		query.setParameter("joint", joint);
		query.setParameter("appName", appName);
		query.setParameter("visitable", visitable);
		if(query.getResultList().size()>0)
			return (AppInfo) query.getResultList().get(0);
		else
			return null;
	}

	@Override
	//按下app载量  倒序 排列
	public List<AppInfo> Section(int num)
	{
		Query query = entityManager.createQuery("select u from AppInfo u,AppAuthority y "
				+ "  where  u.id=y.id  and u.isThrough=1 and u.shelf=1 order by "
				+ "y.amountOfDown desc");
		//从第几行 开始查询
		//query.setFirstResult(2);
		//显示几行
		query.setMaxResults(num);
		return query.getResultList();
		// TODO Auto-generated method stub
	}
	//按照app游戏类型查找前几个app
	@Override
	public List<AppInfo> classification(String str)
	{
		Query query = entityManager.createQuery("select u from AppInfo u,"
				+ "AppAuthority y  where  u.id=y.id and u.classification=:str"
						+ " order by y.amountOfDown desc");
		query.setParameter("str", str);
		return query.getResultList();
		// TODO Auto-generated method stub
	}
	/**
	 * Gyn跟根据是否收费 返回app信息
	 * @param num
	 * @return
	 */
	@Override
	public List<AppInfo> fee(String str)
	{
		Query query = entityManager.createQuery("select u from AppInfo u,"
				+ "AppAuthority y  where  u.id=y.id and u.isThrough=1 and u.shelf=1 and u.fee=:str"
						+ " order by y.amountOfDown desc");
		query.setParameter("str", str);
		return query.getResultList();
		// TODO Auto-generated method stub
	}

	@Override
	public List<AppInfo> Fuzzy(String str)
	{
		Query query = entityManager.createQuery("select u "
				+ "from AppInfo u, AppAuthority b  where  u.id=b.id "
				+ "and u.isThrough=1 and u.shelf=1 and u.appName like :str order by b.amountOfDown desc ");
		query.setParameter("str", "%"+str+"%");
		
		query.setMaxResults(10);
		return query.getResultList();
		// TODO Auto-generated method stub
	}

	@Override
	public List<AppInfo> Thisweek()
	{
		Query query = entityManager.createQuery("select a from AppInfo a, AppAuthority"
				+ " y where  a.id=y.id and "
				+ "a.isThrough=1 and a.shelf=1 and"
				+ "WEEKOFYE"
				+ "AR(a.upTime)=WEEKOFYEAR(NOW())  order by"
				+ " y.amountOfDown desc ");
		
		query.setMaxResults(3);
		return query.getResultList();
	}

	@Override
	public List<AppInfo> category(String str)
	{
		Query query = entityManager.createQuery("select u from AppInfo u,"
				+ "AppAuthority y  where  u.id=y.id and isThrough=1 and shelf=1 and u.category=:str"
						+ " order by y.amountOfDown desc");
		query.setParameter("str", str);
		return query.getResultList();
	}
	
	


}
