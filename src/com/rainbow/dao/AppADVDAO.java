package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.ADV;

public interface AppADVDAO
{
	/**
	 * Gyn
	 * ���ͼƬ��ȡ
	 * @return
	 */
	public List<ADV> imlogo(int id);
	/**
	 * GYn
	 * ���ͼƬ�洢
	 * 
	 */
	public void saveimlogo(ADV adv);

}
