package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.MagCon;


public interface MagConDAO {
	public List<MagCon> findAll();
	public void save(MagCon magCon);
}
