package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.ADV;

public interface AppInfoDAO {
	/**
	 * gyn模糊查询  根据app name按下载量查询
	 * @param str
	 * @return
	 */
	public List<AppInfo> Fuzzy(String str);
	/**
	 * Gyn跟根据是否收费 返回app信息
	 * @param num
	 * @return
	 */
	public List<AppInfo> fee(String str);
	/**
	 * Gyn
	 * 根据前台需要几个app信息  就返回几个app信息
	 * @return
	 */
	public List<AppInfo> Section(int num);
	/**
	 * Gyn
	 * 根据app游戏类型 查找app
	 * @param str
	 * @return
	 */
	public List<AppInfo> classification(String str);
	public List<AppInfo> findAll();
	public AppInfo findById(int id);
	
	
	public AppInfo findByCp_idAndApp_id(String cp_id,String app_id);
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
	
	//找到联运应用的数量 不管是否上架，是否通过审核
	public int findAllJointNum(int joint);
	
	public List<AppInfo> findUserTypeMessage(String userName,int isThrough,String type,int currentPage,int pageSize);
	public int findUserTypeMessageNum(String userName,int isThrough,String type);
	
	public List<AppInfo> findByUserIdAndThrough(String cp_id,int isThrough,int currentPage,int pageSize);
	public int findByUserIdAndThroughNum(String cp_id,int isThrough);
	
	/**找到用户所有联运的应用
	 * @param cp_id
	 * @param joint
	 * @param isThrough
	 * @param shelf
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppInfo> findUserIsJointApp(String cp_id,int joint, int isThrough, int shelf,int currentPage,int pageSize);
	public List<AppInfo> findUserJointApp(String cp_id,int joint);//cp所有联运的应用不管是否通过审核或是否上架
	public List<AppInfo> findUserJointAppVisitable(String cp_id,int joint,int visitable);
	public List<AppInfo> findUserJointApp(String cp_id,int joint,int currentPage,int pageSize);
	public int findUserJointAppNum(String cp_id,int joint);
	public List<AppInfo> findUserJointAppByAppName(String cp_id,int joint,String appName);
	public int findUserIsJointAppNum(String cp_id,int joint, int isThrough, int shelf);
	
	//根据appName精确查询联运的应用
	public AppInfo findJointAppByAppName(int joint,String appName);
	public AppInfo findJointAppByAppName(int joint,String appName,int visitable);
	
	public List<AppInfo> findByKeyword(String keyword,int crrentPage,int pageSize);
	public int findByKeywordNum(String keyword);
	/**
	 * @param appInfo
	 */
	public void save(AppInfo appInfo);
	/**
	 * 全部跟新
	 * @param id
	 * @param appInfo
	 */
	public void update(int id,AppInfo appInfo);
	
	/**部分跟新
	 * @param appInfo
	 */
	public void updataPart(AppInfo appInfo);
	/**
	 * @param id
	 */
	public void delete(int id);

}
