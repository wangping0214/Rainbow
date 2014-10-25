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
import com.rainbow.dao.AppMagazineDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.entity.ADV;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.entity.Magazine;
import com.rainbow.server.AdvAndApp;
import com.rainbow.server.App;

public class AppCategoriesShow
{
	private AppSouDAO sdao;
	private AppAutDAO adao;
	private AppInfoDAO idao;
	private AppADVDAO dao;
	private AppMagazineDAO Amo;
	
	private String type;//文件类别
	 
	 
	/**
	 * gyn
	 * 主页显示的内容
	 * 4个广告图
	 * 7个app信息
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
		List<Magazine> me=new ArrayList<Magazine>();
		//设置获取app的个数
		int num=0;
		//测试默认选择A
		//type="A";
		switch(type)
		{
		case "A":
			type="推荐";
			num=7;
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
			
			for(ADV adv:dao.type(type)){
				advList.add(adv);
			}
			
			me=Amo.All();
			
			break;
		case "C":
			type="人气";
			num=6;
			for(ADV adv:dao.type(type)){
				advList.add(adv);
			}
			//本周人气	
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
		if(me.size()>0){
		result ="{\"Magazine\":"+gson.toJson(me)+"\"img\":"+gson.toJson(advList)+"}" ;
		}else{
		result=gson.toJson(advAndApp);
		System.out.println("有"+appList.size()+"条数据");}
		out.print(result);
		
	}
	public AppCategoriesShow(AppSouDAO sdao, AppAutDAO adao, AppInfoDAO idao,
			AppADVDAO dao,AppMagazineDAO Amo)
	{
		super();
		this.sdao = sdao;
		this.adao = adao;
		this.idao = idao;
		this.dao = dao;
		this.Amo=Amo;
		
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
