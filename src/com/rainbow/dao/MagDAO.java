package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.Magazine;

public interface MagDAO {
	public List<Magazine> findAll();
	public List<Magazine> findShelf(boolean shelf,int currentPage,int pageSize);
	public int findShelfNum(boolean shelf);
	public List<Magazine> findByShelf(boolean shelf);
	public Magazine findById(int id);
	public List<Magazine> find(String nowtime,boolean shelf);
	
	public void delete(int id);
	public void save(Magazine mag);
	public void update(int id,Magazine mag);
}
