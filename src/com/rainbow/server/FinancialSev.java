package com.rainbow.server;

import java.io.Serializable;
import java.util.List;

import com.rainbow.entity.User;

/**
 * �����߲�����Ϣ
 * ��������������Ϣ����������ߵ�����app�Ĳ�����Ϣ
 * @author STerOTto
 *
 */
public class FinancialSev implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user;
	private List<Financial> financialList;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<Financial> getFinancialList() {
		return financialList;
	}
	public void setFinancialList(List<Financial> financialList) {
		this.financialList = financialList;
	}
	

}
