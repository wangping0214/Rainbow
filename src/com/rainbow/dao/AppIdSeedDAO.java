package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.AppIdSeed;

public interface AppIdSeedDAO {
	public List<AppIdSeed> findAll();
	public AppIdSeed findByName(String name);
	public void update(AppIdSeed appIdSeed);
	public void sava(AppIdSeed appIdSeed);
}
