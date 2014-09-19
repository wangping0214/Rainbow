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
	public List<ADV> imlogo();
	/**
	 * GYn
	 * 广告图片存储
	 * 
	 */
	public void saveimlogo(ADV adv);
	/**
	 * gyn
	 * 通过id删除图片
	 */
	public void deleteimglogo(ADV adv);
	/**
	 * gyn通过id查询图片
	 */
	public ADV select(int id);

}
