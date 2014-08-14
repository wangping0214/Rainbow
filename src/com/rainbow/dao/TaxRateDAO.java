package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.TaxRate;

public interface TaxRateDAO {
	public TaxRate findById(int id);
	public TaxRate findByYearMonth(String time);
	public List<TaxRate> findByYear(String year);
	public void save(TaxRate taxRate);
	public void update(TaxRate taxRate);
}
