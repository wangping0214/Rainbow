package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.Magazine;

public interface AppMagazineDAO
{
	//��ѯȫ����־
	public List<Magazine> All();
	//����id��ѯ��־
	public List<Magazine> Accordingid(int id);
}
