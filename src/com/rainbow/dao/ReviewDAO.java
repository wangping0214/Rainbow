package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.Review;

public interface ReviewDAO {
	public Review findById(int id);
	public List<Review> findByAppId(int app_id);
	public void sava(Review review);
	public void delete(Review review);
}
