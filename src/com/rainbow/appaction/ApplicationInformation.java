package com.rainbow.appaction;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.server.App;

public class ApplicationInformation
{
	private AppInfoDAO dao;
	private AppSouDAO sdao;
	private AppAutDAO adao;
	// Ҫ����app�ĸ���
	private int num;
	// Ҫ����app�����
	private String str;

	// ������������ѯǰnum��app��Ϣ
	public void Downloads() throws IOException
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		// ʵ����
		Gson gson = new Gson();
		List<App> appList = new ArrayList<App>();
		for (AppInfo info : dao.Section(num))
		{
			AppSource sou = sdao.findById(info.getId());
			AppAuthority ay = adao.findById(info.getId());

			App app = new App();
			app.setAppAut(ay);
			app.setAppInfo(info);
			app.setAppSou(sou);
			appList.add(app);

			System.out.println("��Ϸ��:" + info.getAppName() + "\t���ش�:"
					+ ay.getAmountOfDown() + "\t��Ϸ����:"
					+ info.getClassification() + "��");
			out.println("��Ϸ��:" + info.getAppName() + "\t���ش�:"
					+ ay.getAmountOfDown() + "\t��Ϸ����:"
					+ info.getClassification() + "��");

		}
		// �����͸���ֵ
		String result = "";
		// ת����Json
		result = gson.toJson(appList);
		out.println(result);
	}

	// ��������ѯapp��Ϣ
	public void Category() throws IOException
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		// ʵ����
		Gson gson = new Gson();
		List<App> appList = new ArrayList<App>();
		for (AppInfo info : dao.classification(str))
		{
			AppSource sou = sdao.findById(info.getId());
			AppAuthority ay = adao.findById(info.getId());

			App app = new App();
			app.setAppAut(ay);
			app.setAppInfo(info);
			app.setAppSou(sou);
			appList.add(app);

			System.out.println("��Ϸ��:" + info.getAppName() + "\t���ش�:"
					+ ay.getAmountOfDown() + "\t��Ϸ����:"
					+ info.getClassification() + "��");
			out.println("��Ϸ��:" + info.getAppName() + "\t���ش�:"
					+ ay.getAmountOfDown() + "\t��Ϸ����:"
					+ info.getClassification() + "��");

		}
		// �����͸���ֵ
		String result = "";
		// ת����Json
		result = gson.toJson(appList);
		out.println(result);
	}

	// �����Ƿ��շѷ���app��Ϣ
	public void Fee() throws IOException
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		// ʵ����
		Gson gson = new Gson();
		List<App> appList = new ArrayList<App>();
		for (AppInfo info : dao.fee(str))
		{
			AppSource sou = sdao.findById(info.getId());
			AppAuthority ay = adao.findById(info.getId());

			App app = new App();
			app.setAppAut(ay);
			app.setAppInfo(info);
			app.setAppSou(sou);
			appList.add(app);

			System.out.println("��Ϸ��:" + info.getAppName() + "\t���ش�:"
					+ ay.getAmountOfDown() + "\t��Ϸ����:"
					+ info.getClassification() + "��");
			out.println("��Ϸ��:" + info.getAppName() + "\t���ش�:"
					+ ay.getAmountOfDown() + "\t��Ϸ����:"
					+ info.getClassification() + "��");

		}
		// �����͸���ֵ
		String result = "";
		// ת����Json
		result = gson.toJson(appList);
		out.println(result);
	}

	public ApplicationInformation(AppInfoDAO dao, AppSouDAO sdao, AppAutDAO adao)
	{
		super();
		this.dao = dao;
		this.sdao = sdao;
		this.adao = adao;
	}

	public int getNum()
	{
		return num;
	}

	public void setNum(int num)
	{
		this.num = num;
	}

	public String getStr()
	{
		return str;
	}

	public void setStr(String str)
	{
		this.str = str;
	}

}
