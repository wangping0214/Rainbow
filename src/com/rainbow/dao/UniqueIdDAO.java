package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.UniqueId;

public interface UniqueIdDAO {
	public List<UniqueId> findAll();
	public UniqueId findByName(String name);
	public void save(UniqueId uniqueId);
	public void update(UniqueId uniqueId);
}
