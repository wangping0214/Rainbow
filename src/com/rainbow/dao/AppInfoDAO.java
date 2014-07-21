package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.AppInfo;

public interface AppInfoDAO {
	public List<AppInfo> findAll();
	public AppInfo findById(int id);
	/**�û�Ӧ���Ƿ��ϼ�
	 * @param userName
	 * @param isThrough
	 * @param shelf
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppInfo> findByShelfAndIsThrough(String userName,int isThrough,int shelf,int currentPage,int pageSize);
	public int findByShelfAndIsThroughNum(String userName,int isThrough,int shelf);
	
	/**����Ա���������û��Ƿ��ϼ�
	 * @param isThrough
	 * @param shelf
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppInfo> adminFindByShelf(int isThrough,int shelf,int currentPage,int pageSize);
	public int adminFindByShelfNum(int isThrough,int shelf);
	/**�û�Ӧ���Ƿ�ͨ�����
	 * @param userName
	 * @param isThrough
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppInfo> findByIsThrough(String userName,int isThrough,int currentPage,int pageSize);
	public int findByIsThroughNum(String userName,int isThrough);
	/**����Ա���������û���Ӧ���Ƿ�ͨ�����
	 * @param isThrough
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppInfo> adminIsThrough(int isThrough,int currentPage,int pageSize);
	public int adminIsThrough(int isThrough);
	
	
	/**ǰ̨����Ӧ�������ҵ��ϼܵ�Ӧ��
	 * @param shelf
	 * @param type
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppInfo> findByTypeAndShelf(int shelf,String type,int currentPage,int pageSize);
	public int findByTypeAndShelfNum(int shelf,String type);
	
	/**ǰ̨���ݷ�����ʾ��Ϸ��Ӧ��
	 * @param category
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppInfo> findByCategory(int shelf,String category,int currentPage,int pageSize);
	public int findByCategoryNum(int shelf,String category);
	
	/**ǰ̨���ݾ�������ѯ�ϼܵ�Ӧ��
	 * @param shelf
	 * @param classification
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppInfo> findByClassification(int shelf,String classification,int currentPage,int pageSize);
	public int findByClassificationNum(int shelf,String classification);
	
	
	/**
	 * �������˲���Ӧ��
	 * @param shelf
	 * @param joint
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppInfo> findByJoint(String userName,int shelf,int joint,int currentPage,int pageSize);
	public int findJointNum(String userName,int shelf,int joint);
	
	
	/**�ҵ������û������˵�Ӧ��
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
