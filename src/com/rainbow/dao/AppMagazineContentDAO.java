package com.rainbow.dao;

import java.util.List;


import com.rainbow.entity.MagazineContent;

public interface AppMagazineContentDAO 
{
	//����������ҳ����ѯ��־
	public MagazineContent Pagesperiod(String period,int Pages);
	//����������ѯ��־
	public List<MagazineContent> Pagesperiod(String period);
	//��ѯȫ��
	public List<MagazineContent> All();
}
