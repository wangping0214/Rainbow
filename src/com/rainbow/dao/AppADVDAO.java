package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.ADV;

public interface AppADVDAO
{	
	/**
	 * Gyn
	 * ���ͼƬ��ȡ����
	 * @return
	 */
	public List<ADV> imlogo();
	/**
	 * Gyn
	 * ��ҳ��ȡ
	 * ���ͼƬ��ȡ
	 * @return
	 */
	public List<ADV> imlogo(int currentPage,int pageSize);
	/**
	 * GYn
	 * ���ͼƬ�洢
	 * 
	 */
	public void saveimlogo(ADV adv);
	/**
	 * gyn
	 * ͨ��idɾ��ͼƬ
	 */
	public void deleteimglogo(ADV adv);
	/**
	 * gynͨ��id��ѯͼƬ
	 */
	public ADV select(int id);
	/**
	 * gynͨ��ͼƬ����  ��ѯͼƬ
	 */
	public List<ADV> type(String type);

}
