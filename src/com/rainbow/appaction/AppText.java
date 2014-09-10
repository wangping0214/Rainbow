package com.rainbow.appaction;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSON;

import org.apache.struts2.ServletActionContext;
import org.json.simple.JSONArray;

import com.google.gson.Gson;
import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.ADV;
import com.rainbow.entity.AppSource;
import com.rainbow.server.App;




public class AppText
{
	private AppInfoDAO dao;
	private AppSouDAO sdao;
	private AppAutDAO adao;
	private int num;
	
	public void Text() throws IOException
	{
		HttpServletResponse response = ServletActionContext.getResponse();  
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		//实例化
		Gson gson = new Gson();
		List<App> appList = new ArrayList<App>();
		//String str="益智";
		//String str="冒险";
		 List<ADV> ar=dao.imlogo(1);
		for(ADV a:ar){
			
		
			System.out.println(a.getId()+a.getLogo()+a.getCp_id());
		}
		
		 for(AppInfo info:dao.Section(3)){
			 AppSource sou = sdao.findById(info.getId());
			 AppAuthority ay=adao.findById(info.getId());
			
			 App app = new App();
			 app.setAppAut(ay);
			 app.setAppInfo(info);
			 app.setAppSou(sou);
			 appList.add(app);
			
			 System.out.println("游戏名:"+info.getAppName()+"\t下载次:"+ay.getAmountOfDown()+"\t游戏类型:"+info.getClassification()+"类");
			 out.println("游戏名:"+info.getAppName()+"\t下载次:"+ay.getAmountOfDown()+"\t游戏类型:"+info.getClassification()+"类");
			
			}
		 //声明和赋空值
		 String result = "";
		 //转换成Json
		 result = gson.toJson(appList);
		 out.println(result);
		
	 
	}
	
	

	public AppText(AppInfoDAO dao,AppSouDAO sdao,AppAutDAO adao)
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


}
