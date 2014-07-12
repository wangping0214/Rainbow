package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.CpIdSeed;

public interface CpIdSeedDAO {
	public List<CpIdSeed> findAll();
	public CpIdSeed findById(int id);
	public void save(CpIdSeed cpIdSeed);
	public void update(CpIdSeed cpIdSeed);
}
