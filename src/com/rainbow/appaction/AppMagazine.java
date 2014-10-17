package com.rainbow.appaction;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.mapping.Array;

import com.google.gson.Gson;
import com.rainbow.dao.AppMagazineContentDAO;
import com.rainbow.dao.AppMagazineDAO;
import com.rainbow.entity.Magazine;
import com.rainbow.entity.MagazineContent;


public class AppMagazine
{
	private AppMagazineDAO AMD;
	private AppMagazineContentDAO AMCD;
	List<Magazine> mge=new ArrayList<Magazine>();
	List<MagazineContent> mg=new ArrayList<MagazineContent>();
	public String period;

	public int id;
	/**
	 * gyn
	 * ��ѯȫ����־
	 * @throws IOException 
	 */
	public void AllMagazine() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		for(Magazine m:AMD.All()){
			mge.add(m);
		}
		period="20";
		System.out.println("����AllMagazine"+AMCD.All().size());
		for(MagazineContent mc:AMCD.All()){
			mg.add(mc);
		}
		//System.out.println("mct����"+mct.size());
		//ʵ����
		Gson gson = new Gson();
		//�����͸���ֵ
		//String result = "{\"mct\":"+gson.toJson(mct)+",\"mct\":"+gson.toJson(mct)+"}";
		String result = "";
		result = gson.toJson(mg);
		out.println(result);
	}
	/**
	 * gyn
	 * ����id��ѯ��־
	 * @throws IOException 
	 */
	public void Accordingid() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		id=1;
		for(Magazine m:AMD.Accordingid(id)){
			mge.add(m);
		}
		
		//ʵ����
		Gson gson = new Gson();
		//�����͸���ֵ
		String result = "";
		result = gson.toJson(mge);
		out.println(result);
	}

	public String getPeriod()
	{
		return period;
	}
	public void setPeriod(String period)
	{
		this.period = period;
	}
	
	public AppMagazine(AppMagazineDAO aMD, AppMagazineContentDAO aMCD)
	{
		super();
		AMD = aMD;
		AMCD = aMCD;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	
	
	
	
}
