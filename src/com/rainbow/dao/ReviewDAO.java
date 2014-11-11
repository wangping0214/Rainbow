package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.Review;

public interface ReviewDAO {
	
	public List<Review>  findByUserId(int user_id);
	//����id��ѯ����
	public Review findById(int id);
	//����app_id��ѯ����
	public List<Review> findByAppId(int app_id);
	//�������
	public void sava(Review review);
	//ɾ������
	public void delete(Review review);
}
