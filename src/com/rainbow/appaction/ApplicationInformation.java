package com.rainbow.appaction;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.dao.ReviewDAO;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.entity.Review;
import com.rainbow.server.App;

public class ApplicationInformation
{
	private ReviewDAO rdao;
	private AppInfoDAO dao;
	private AppSouDAO sdao;
	private AppAutDAO adao;
	
	private int num;// Ҫ����app�ĸ���
	private String str;// �ַ���
	private int  id;//id
	
	
	
	private int app_id;//appid
	private String content;//��������
	private int user_id;//�û�id
	private String userName;//�û���
	private String terminal;//�ն�����
	
	
	
	
	/**
	 * gyn
	 * �������
	 * @throws IOException 
	 */
	
	public void AddComment() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Review review=new Review();
		//��ȡϵͳ��ǰʱ��
		Date d = new Date();
		//������ʽ
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd  kk:mm:ss ");
		//d����������ʽ��ʱ��
		String time=sdf.format(d);
		//appid
		review.setApp_id(app_id);
		//app��������Ϣ
		review.setContent(content);
		//����ʱ��
		review.setTime(time);
		//uid
		review.setUser_id(user_id);
		//�û�����
		review.setUserName(userName);
		//�ն����ͣ��û�ͨ�������ն˽��е�����
		review.setTerminal(terminal);
		rdao.sava(review);
		out.print(true);
		
	}
	/**
	 *gyn
	 *����Ӧ��id��ѯӦ�� ������
	 *id
	 * @throws IOException 
	 */
	public void ApplicationDetails() throws IOException{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			Gson gson = new Gson();	
			List<App> appList = new ArrayList<App>();
			AppInfo info=dao.findById(id);
			AppSource sou = sdao.findById(info.getId());
			AppAuthority ay = adao.findById(info.getId());
			App app = new App();
			app.setAppAut(ay);
			app.setAppInfo(info);
			app.setAppSou(sou);
			appList.add(app);
			int app_id=id;
			List<Review> Reviewlist=rdao.findByAppId(app_id);
			// �����͸���ֵ
			String result = "";
			// ת����Json
			result = "{\"applist\":"+gson.toJson(appList)+",\"Review\":"+gson.toJson(Reviewlist)+"}";
			out.println(result);
	}
	
	/**
	 *  gyn
	 *  ������������ѯǰnum��app��Ϣ
	 * num Ҫ���صĸ���
	 */
	public void Downloads() throws IOException
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		// ʵ����
		num=3;
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
		}
		// �����͸���ֵ
		String result = "";
		// ת����Json
		result = gson.toJson(appList);
		out.println(result);
	}
	

	/**
	 *  gyn
	 *  ��������ѯapp��Ϣ
	 *  str app���
	 */
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
		}
		// �����͸���ֵ
		String result = "";
		// ת����Json
		result = gson.toJson(appList);
		out.println(result);
	}

	
	/**
	 * gyn
	 *  �����Ƿ��շѷ���app��Ϣ
	 *  str �����Ƿ��շ�
	 */
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
		}
		// �����͸���ֵ
		String result = "";
		// ת����Json
		result = gson.toJson(appList);
		out.println(result);
	}
	
	
	/**
	 * gyn ģ����ѯ���� app name  ����������ѯ
	 *  str  ����name
	 */
	public void Fuzzy() throws IOException
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		// ʵ����
		Gson gson = new Gson();
		List<App> appList = new ArrayList<App>();
		if(dao.Fuzzy(str)==null){
			out.print("NULL");
		}
		for (AppInfo a : dao.Fuzzy(str))
		{
			AppAuthority af=adao.findById(a.getId());
			AppSource sou = sdao.findById(a.getId());
			App app = new App();	
			app.setAppInfo(a);
			app.setAppSou(sou);
			app.setAppAut(af);
			appList.add(app);
		}
			// �����͸���ֵ
			String result = "";
			// ת����Json
			result = gson.toJson(appList);
			out.println(result);
	}
	
	
	
		/**
		 * gyn
		 * �����Ƽ����� ����app��Ϣ ����ǰnum��
		 *  
		 */
	public void RecomLevel() throws IOException
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		num=3;
		// ʵ����
		Gson gson = new Gson();
		List<App> appList = new ArrayList<App>();
		if(adao.RecomLevel(num)==null){
			out.print("NULL");
		}
		for (AppAuthority a : adao.RecomLevel(num))
		{	
			AppInfo af=dao.findById(a.getId());
			AppSource sou = sdao.findById(a.getId());
			App app = new App();
			app.setAppInfo(af);
			app.setAppSou(sou);
			app.setAppAut(a);
			appList.add(app);
		}
			// �����͸���ֵ
			String result = "";
			// ת����Json
			result = gson.toJson(appList);
			out.println(result);
		
	}
	
	
	
	
	
	public ApplicationInformation(AppInfoDAO dao, AppSouDAO sdao, AppAutDAO adao,ReviewDAO rdao)
	{
		super();
		this.dao = dao;
		this.sdao = sdao;
		this.adao = adao;
		this.rdao = rdao;
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

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}
	public int getApp_id()
	{
		return app_id;
	}
	public void setApp_id(int app_id)
	{
		this.app_id = app_id;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public int getUser_id()
	{
		return user_id;
	}
	public void setUser_id(int user_id)
	{
		this.user_id = user_id;
	}
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public String getTerminal()
	{
		return terminal;
	}
	public void setTerminal(String terminal)
	{
		this.terminal = terminal;
	}

}
