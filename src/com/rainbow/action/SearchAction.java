package com.rainbow.action;

import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;

public class SearchAction {
	private AppInfoDAO appInfoDAo;
	private AppSouDAO appSouDAO;
	private AppAutDAO appAutDAO;
	
	private String keyword;
	
	public void SearchByKeyword(){
		
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public SearchAction(AppInfoDAO appInfoDAo, AppSouDAO appSouDAO,
			AppAutDAO appAutDAO) {
		super();
		this.appInfoDAo = appInfoDAo;
		this.appSouDAO = appSouDAO;
		this.appAutDAO = appAutDAO;
	}
	
}
