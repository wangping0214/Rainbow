package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.Review;

public interface ReviewDAO {
	//根据id查询评论
	public Review findById(int id);
	//根据app_id查询评论
	public List<Review> findByAppId(int app_id);
	//添加评论
	public void sava(Review review);
	//删除评论
	public void delete(Review review);
}
