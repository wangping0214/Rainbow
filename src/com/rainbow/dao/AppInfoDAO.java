package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.AppInfo;

public interface AppInfoDAO {
	public List<AppInfo> findAll();
	public AppInfo findById(int id);
	/**用户应用是否上架
	 * @param userName
	 * @param isThrough
	 * @param shelf
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppInfo> findByShelfAndIsThrough(String userName,int isThrough,int shelf,int currentPage,int pageSize);
	public int findByShelfAndIsThroughNum(String userName,int isThrough,int shelf);
	
	/**管理员管理所有用户是否上架
	 * @param isThrough
	 * @param shelf
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppInfo> adminFindByShelf(int isThrough,int shelf,int currentPage,int pageSize);
	public int adminFindByShelfNum(int isThrough,int shelf);
	/**用户应用是否通过审核
	 * @param userName
	 * @param isThrough
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppInfo> findByIsThrough(String userName,int isThrough,int currentPage,int pageSize);
	public int findByIsThroughNum(String userName,int isThrough);
	/**管理员管理所有用户的应用是否通过审核
	 * @param isThrough
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppInfo> adminIsThrough(int isThrough,int currentPage,int pageSize);
	public int adminIsThrough(int isThrough);
	
	
	/**前台根据应用类型找到上架的应用
	 * @param shelf
	 * @param type
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppInfo> findByTypeAndShelf(int shelf,String type,int currentPage,int pageSize);
	public int findByTypeAndShelfNum(int shelf,String type);
	
	/**前台根据分类显示游戏和应用
	 * @param category
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppInfo> findByCategory(int shelf,String category,int currentPage,int pageSize);
	public int findByCategoryNum(int shelf,String category);
	
	/**前台根据具体类别查询上架的应用
	 * @param shelf
	 * @param classification
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppInfo> findByClassification(int shelf,String classification,int currentPage,int pageSize);
	public int findByClassificationNum(int shelf,String classification);
	
	
	/**
	 * 根据联运查找应用
	 * @param shelf
	 * @param joint
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppInfo> findByJoint(String userName,int shelf,int joint,int currentPage,int pageSize);
	public int findJointNum(String userName,int shelf,int joint);
	
	
	/**找到所有用户的联运的应用
	 * @param shelf
	 * @param joint
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppInfo> findAllJoint(int shelf,int joint,int currentPage,int pageSize);
	public int findAllJointNum(int shelf,int joint);
	
	public List<AppInfo> findUserTypeMessage(String userName,int isThrough,String type,int currentPage,int pageSize);
	public int findUserTypeMessageNum(String userName,int isThrough,String type);
	
	public List<AppInfo> findByUserIdAndThrough(String cp_id,int isThrough,int currentPage,int pageSize);
	public int findByUserIdAndThroughNum(String cp_id,int isThrough);
	/**
	 * @param appInfo
	 */
	public void save(AppInfo appInfo);
	/**
	 * @param id
	 * @param appInfo
	 */
	public void update(int id,AppInfo appInfo);
	/**
	 * @param id
	 */
	public void delete(int id);

}
