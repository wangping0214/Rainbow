package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.Magazine;

public interface AppMagazineDAO
{
	
	//��ѯȫ����־
	public List<Magazine> All();
	//����id��ѯ��־
	public Magazine Accordingid(int id);
	//���
	public void save(Magazine magazine);
	//��ҳ��ѯ
	public List<Magazine> Fenye(int currentPage,int pageSize);
	//���ݶ���ɾ����־
	public void delete(Magazine magazine);
}
