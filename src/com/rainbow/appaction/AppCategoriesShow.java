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
	
	private String type;//�ļ����
	 
	 
	/**
	 * gyn
	 * ��ҳ��ʾ������
	 * 4�����ͼ
	 * 7��app��Ϣ
	 * @throws IOException 
	 */
	public void Rmded() throws IOException{
		System.out.println("����Rmded");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		//�Ƽ����ͼƬ��Ϣ
		List<ADV> advList=new ArrayList<ADV>();
		//�Ƽ���������app��Ϣ
		List<App> appList=new ArrayList<App>();
		List<Magazine> me=new ArrayList<Magazine>();
		//���û�ȡapp�ĸ���
		int num=0;
		//����Ĭ��ѡ��A
		//type="A";
		switch(type)
		{
		case "A":
			type="�Ƽ�";
			num=7;
			for(ADV adv:dao.type(type)){
				advList.add(adv);
			}
			//��������	
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
			type="��־";
			
			for(ADV adv:dao.type(type)){
				advList.add(adv);
			}
			
			me=Amo.All();
			
			break;
		case "C":
			type="����";
			num=6;
			for(ADV adv:dao.type(type)){
				advList.add(adv);
			}
			//��������	
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
			out.println("�봫 A B C");
			return;
		}
		//����5�����ͼƬ��  �����Ƽ�app
		AdvAndApp advAndApp = new AdvAndApp(advList, appList);	
		//ʵ����
		Gson gson = new Gson();
		//�����͸���ֵ
		String result = "";
		//ƴ��json��
		//advAndApp�Ƽ�4�����ͼ��7����������app
		if(me.size()>0){
		result ="{\"Magazine\":"+gson.toJson(me)+"\"img\":"+gson.toJson(advList)+"}" ;
		}else{
		result=gson.toJson(advAndApp);
		System.out.println("��"+appList.size()+"������");}
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
