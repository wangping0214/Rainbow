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

	@SuppressWarnings("unchecked")
	@Override
	public List<User> findByUserCompanyOrName(int approved,String companyOrName,int currentPage,int pageSize) {
		Query query = entityManager.createQuery("select u from User u where u.approved = :approved and (u.userType = 'individualUsers' or u.userType = 'individualGroups' ) and (u.corporatename like :companyOrName or u.username like :companyOrName)");
		query.setParameter("companyOrName", "%"+companyOrName+"%");
		query.setParameter("approved", approved);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public int findByUserCompanyOrNameNum(int approved,
			String companyOrName) {
		Query query = entityManager.createQuery("select u from User u where u.approved = :approved and (u.userType = 'individualUsers' or u.userType = 'individualGroups' ) and (u.corporatename like :companyOrName or u.username like :companyOrName )");
		query.setParameter("companyOrName", "%"+companyOrName+"%");
		query.setParameter("approved", approved);
		return query.getResultList().size();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> findDiviedUserApproved(int approved) {
		Query query = entityManager.createQuery("select u from User u where u.approved = :approved and (u.userType = 'individualUsers' or u.userType = 'individualGroups' )");
		query.setParameter("approved", approved);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> findByUserCompanyOrName(int approved, String companyOrName) {
		Query query = entityManager.createQuery("select u from User u where u.approved = :approved and (u.userType = 'individualUsers' or u.userType = 'individualGroups' ) and (u.corporatename like :companyOrName or u.username like :companyOrName)");
		query.setParameter("companyOrName", "%"+companyOrName+"%");
		query.setParameter("approved", approved);
		return query.getResultList();
	}

	@Override
	public User findByCp_id(String cp_id) {
		Query query = entityManager.createQuery("select u from User u where u.cp_id = :cp_id");
		query.setParameter("cp_id", cp_id);
		if(query.getResultList().size()>0)
			return (User) query.getResultList().get(0);
		else
			return null;
	}

	@Override
	public User login(String name, String password)
	{
		
		// TODO ·ÀÖ¹sql×¢Èë
		Query query = entityManager.createQuery("select u from User u where u.username=:name and u.password=:password");
		query.setParameter("name",name);
		query.setParameter("password",password);

		query.setMaxResults(1);
		@SuppressWarnings("unchecked")
		List<User> users = query.getResultList();
		if (users.size() > 0)
				return users.get(0);
			return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> findDeveloperHasJointApp(int approved, int currentPage,
			int pageSize)
	{
		Query query = entityManager.createQuery("select u from User u,AppInfo s where u.approved = :approved and (u.userType = 'individualUsers' or u.userType = 'individualGroups' ) and u.cp_id = s.cp_id and s.joint = 1 group by u.id");
		query.setParameter("approved", approved);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}
	

	@Override
	public int findDeveloperHasJointAppSize(int approved)
	{
		Query query = entityManager.createQuery("select u from User u,AppInfo s where u.approved = :approved and (u.userType = 'individualUsers' or u.userType = 'individualGroups' ) and u.cp_id = s.cp_id and s.joint = 1 group by u.id");
		query.setParameter("approved", approved);
		return query.getResultList().size();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> findFinancialVisitableUsers(int approved, int visitable,
			int currentPage, int pageSize)
	{
		Query query = entityManager.createQuery("select u from User u,AppInfo s,AppAuthority w where u.approved = :approved and (u.userType = 'individualUsers' or u.userType = 'individualGroups' ) and u.cp_id = s.cp_id and s.joint = 1 and s.id = w.id and w.visitable = :visitable group by u.id");
		query.setParameter("approved", approved);
		query.setParameter("visitable", visitable);
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public int findFinancialVisitableUsersSize(int approved, int visitable)
	{
		Query query = entityManager.createQuery("select u from User u,AppInfo s,AppAuthority w where u.approved = :approved and (u.userType = 'individualUsers' or u.userType = 'individualGroups' ) and u.cp_id = s.cp_id and s.joint = 1 and s.id = w.id and w.visitable = :visitable group by u.id");
		query.setParameter("approved", approved);
		query.setParameter("visitable", visitable);
		return query.getResultList().size();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> findFinancialVisitableUsers(int approved, int visitable)
	{
		Query query = entityManager.createQuery("select u from User u,AppInfo s,AppAuthority w where u.approved = :approved and (u.userType = 'individualUsers' or u.userType = 'individualGroups' ) and u.cp_id = s.cp_id and s.joint = 1 and s.id = w.id and w.visitable = :visitable  group by u.id");
		query.setParameter("approved", approved);
		query.setParameter("visitable", visitable);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> findByUserCompanyOrNameVisitable(int approved,
			String companyOrName, int visitable, int currentPage, int pageSize)
	{
		Query query = entityManager.createQuery("select u from User u,AppInfo s,AppAuthority w where u.approved = :approved and (u.userType = 'individualUsers' or u.userType = 'individualGroups' ) and u.cp_id = s.cp_id and s.joint = 1 and s.id = w.id and w.visitable = :visitable and (u.corporatename like :companyOrName or u.username like :companyOrName) group by u.id");
		query.setParameter("approved", approved);
		query.setParameter("visitable", visitable);
		query.setParameter("companyOrName", "%"+companyOrName+"%");
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public int findByUserCompanyOrNameVisitableSize(int approved,
			String companyOrName, int visitable)
	{
		Query query = entityManager.createQuery("select u from User u,AppInfo s,AppAuthority w where u.approved = :approved and (u.userType = 'individualUsers' or u.userType = 'individualGroups' ) and u.cp_id = s.cp_id and s.joint  =1 and s.id = w.id and w.visitable = :visitable and (u.corporatename like :companyOrName or u.username like :companyOrName) group by u.id");
		query.setParameter("approved", approved);
		query.setParameter("visitable", visitable);
		query.setParameter("companyOrName", "%"+companyOrName+"%");
		return query.getResultList().size();
	}
/**
 * gyn app¶ËÃÜÂëÐÞ¸Ä
 */
	@Override
	public void updatepwd(User user)
	{
		User pwdUser = find(user.getId());
		if(pwdUser.getPassword()!=null||pwdUser.getPassword()!=""){
			user.setPassword(pwdUser.getPassword());
		}
		entityManager.merge(user);
	}

@Override
public User findByEmailOrPhoneAndPassword(String emailOrPhone, String password)
{
	Query query = entityManager.createQuery("select u from User u where (u.email = :emailOrPhone or u.telephone = :emailOrPhone) and u.password = :password");
	query.setParameter("emailOrPhone", emailOrPhone);
	query.setParameter("password", password);
	if(query.getResultList().size()>0)
		return (User) query.getResultList().get(0);
	else
		return null;
}



	

}
