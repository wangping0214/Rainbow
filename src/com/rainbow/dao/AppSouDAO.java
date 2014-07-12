package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.AppSource;

public interface AppSouDAO {
	public List<AppSource> findAll();
	public AppSource findById(int id);
	public void save(AppSource appSou);
	public void update(int id,AppSource appSou);
	public void delete(int id);

}
