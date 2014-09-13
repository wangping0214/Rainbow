package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.ADV;

public interface AppADVDAO
{
	/**
	 * Gyn
	 * 广告图片获取
	 * @return
	 */
	public List<ADV> imlogo(int id);
	/**
	 * GYn
	 * 广告图片存储
	 * 
	 */
	public void saveimlogo(ADV adv);

}
