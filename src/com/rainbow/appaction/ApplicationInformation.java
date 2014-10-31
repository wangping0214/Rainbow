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
	
	private int num;// 要返回app的个数
	private String str;// 字符串
	private int  id;//id
	
	
	
	private int app_id;//appid
	private String content;//评论内容
	private int user_id;//用户id
	private String userName;//用户名
	private String terminal;//终端类型
	
	
	
	
	/**
	 * gyn
	 * 添加评论
	 * @throws IOException 
	 */
	
	public void AddComment() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Review review=new Review();
		//获取系统当前时间
		Date d = new Date();
		//这样格式
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd  kk:mm:ss ");
		//d就是这样格式的时间
		String time=sdf.format(d);
		//appid
		review.setApp_id(app_id);
		//app的评论信息
		review.setContent(content);
		//评论时间
		review.setTime(time);
		//uid
		review.setUser_id(user_id);
		//用户名字
		review.setUserName(userName);
		//终端类型：用户通过哪种终端进行的评论
		review.setTerminal(terminal);
		rdao.sava(review);
		out.print(true);
		
	}
	/**
	 *gyn
	 *根据应用id查询应用 和评论
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
			// 声明和赋空值
			String result = "";
			// 转换成Json
			result = "{\"applist\":"+gson.toJson(appList)+",\"Review\":"+gson.toJson(Reviewlist)+"}";
			out.println(result);
	}
	
	/**
	 *  gyn
	 *  根据下载量查询前num个app信息
	 * num 要返回的个数
	 */
	public void Downloads() throws IOException
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		// 实例化
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
		// 声明和赋空值
		String result = "";
		// 转换成Json
		result = gson.toJson(appList);
		out.println(result);
	}
	

	/**
	 *  gyn
	 *  根据类别查询app信息
	 *  str app类别
	 */
	public void Category() throws IOException
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		// 实例化
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
		// 声明和赋空值
		String result = "";
		// 转换成Json
		result = gson.toJson(appList);
		out.println(result);
	}

	
	/**
	 * gyn
	 *  根据是否收费返回app信息
	 *  str 代表是否收费
	 */
	public void Fee() throws IOException
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		// 实例化
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
		// 声明和赋空值
		String result = "";
		// 转换成Json
		result = gson.toJson(appList);
		out.println(result);
	}
	
	
	/**
	 * gyn 模糊查询根据 app name  按下载量查询
	 *  str  代表name
	 */
	public void Fuzzy() throws IOException
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		// 实例化
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
			// 声明和赋空值
			String result = "";
			// 转换成Json
			result = gson.toJson(appList);
			out.println(result);
	}
	
	
	
		/**
		 * gyn
		 * 按照推荐级别 排行app信息 返回前num行
		 *  
		 */
	public void RecomLevel() throws IOException
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		num=3;
		// 实例化
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
			// 声明和赋空值
			String result = "";
			// 转换成Json
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
