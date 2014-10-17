package com.rainbow.appaction;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.rainbow.dao.AppADVDAO;
import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.entity.ADV;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.server.AdvAndApp;
import com.rainbow.server.App;

public class AppCategoriesShow
{
	private AppSouDAO sdao;
	private AppAutDAO adao;
	private AppInfoDAO idao;
	private AppADVDAO dao;
	
	private String type;//文件类别
	 
	 
	/**
	 * gyn
	 * 主页显示的内容
	 * 4个广告图
	 * app信息
	 * @throws IOException 
	 */
	public void Rmded() throws IOException{
		System.out.println("进入Rmded");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		//推荐广告图片信息
		List<ADV> advList=new ArrayList<ADV>();
		//推荐本周热门app信息
		List<App> appList=new ArrayList<App>();
		//设置获取app的个数
		int num=7;
		//测试默认选择A
		type="A";
		switch(type)
		{
		case "A":
			type="推荐";
			for(ADV adv:dao.type(type)){
				advList.add(adv);
			}
			//本周热门	
			for (AppAuthority ay : adao.RecomLevel(num))
			{
				AppSource sou = sdao.findById(ay.getId());
				AppInfo info = idao.findById(ay.getId());			
				App app = new App();
				app.setAppAut(ay);
				app.setAppInfo(info);
				app.setAppSou(sou);
				appList.add(app);
			}	
			break;
		case "B":
			type="杂志";
			break;
		case "C":
			type="人气";
			break;
			default:
				type="";
		}	
		if(type==""){
			out.println("请传 A B C");
			return;
		}
		//包含5个广告图片和  本周推荐app
		AdvAndApp advAndApp = new AdvAndApp(advList, appList);	
		//实例化
		Gson gson = new Gson();
		//声明和赋空值
		String result = "";
		//拼接json串
		//advAndApp推荐4个广告图和7个本周热门app
		//result ="{\"标识名\":"+gson.toJson(advAndApp)+"}" ;
		result=gson.toJson(advAndApp);
		out.print(result);
		System.out.println("有"+appList.size()+"条数据");
	}
	public AppCategoriesShow(AppSouDAO sdao, AppAutDAO adao, AppInfoDAO idao,
			AppADVDAO dao)
	{
		super();
		this.sdao = sdao;
		this.adao = adao;
		this.idao = idao;
		this.dao = dao;
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	

}
