package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.AppSource;

public interface AppSouDAO {
	
	public List<AppSource> findAll();
	public List<AppSource> Section(int num);
	public AppSource findById(int id);
	public void save(AppSource appSou);
	public void update(int id,AppSource appSou);
	public void delete(int id);

}
