package com.rainbow.dao;

import com.rainbow.entity.TaxRate;

public interface TaxRateDAO {
	public TaxRate findById(int id);
	public TaxRate findByYearMonth(String time);
	public void save(TaxRate taxRate);
	public void update(TaxRate taxRate);
}
