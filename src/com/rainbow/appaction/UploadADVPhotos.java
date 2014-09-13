package com.rainbow.appaction;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.rainbow.dao.AppADVDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.entity.ADV;
import com.rainbow.server.App;
import com.rainbow.util.OpeFunction;

public class UploadADVPhotos
{
	private AppADVDAO dao;
	private File   upFile;  
    private String upFileFileName; 
    private String upFileContentType;
    private String savePath;
    private int id;
    private String type;
    //����id��ѯͼƬ·��
    public void Search() throws IOException{
    	HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		//��ȡ����ip��ַ
		String ip = InetAddress.getLocalHost().getHostAddress();
		//��ȡϵͳ��ǰʱ��
		Date d = new Date();
		//������ʽ
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd  kk:mm:ss ");
		//str����������ʽ��ʱ��
		String str=sdf.format(d);
    	for(ADV a:dao.imlogo(id)){
    		
    		//out.print("http://192.168.3.15:8080/Rainbow"+a.getLogo());
    		String result = "";
			// ת����Json
			result = gson.toJson("ʱ����   "+str+ip+":8080/Rainbow"+a.getLogo());
			out.println(result);
    	}
    	// �����͸���ֵ
    			
    }
	//�ϴ����ͼƬ
	public void UploadPhotos() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		savePath="/adv/";
		out.print(this.getUpFileFileName());
		out.print(this.getUpFileContentType());
		String a=OpeFunction.fileToServer(savePath, upFile, upFileFileName,upFileContentType,false);
			out.print(a);
			//��ȡϵͳ��ǰʱ��
			Date d = new Date();
			//������ʽ
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd  kk:mm:ss ");
			//str����������ʽ��ʱ��
			String logotime=sdf.format(d);
			ADV adv=new ADV();
			adv.setLogo(a);
			adv.setType(type);
			adv.setLogotime(logotime);
			dao.saveimlogo(adv);
			out.print("\n·��\n"+adv.getLogo());
	}
	
	

	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public UploadADVPhotos(AppADVDAO dao)
	{
		super();
		this.dao = dao;
	}

	public File getUpFile()
	{
		return upFile;
	}

	public void setUpFile(File upFile)
	{
		this.upFile = upFile;
	}

	public String getUpFileFileName()
	{
		return upFileFileName;
	}

	public void setUpFileFileName(String upFileFileName)
	{
		this.upFileFileName = upFileFileName;
	}

	public String getUpFileContentType()
	{
		return upFileContentType;
	}

	public void setUpFileContentType(String upFileContentType)
	{
		this.upFileContentType = upFileContentType;
	}

	public String getSavePath()
	{
		return savePath;
	}

	public void setSavePath(String savePath)
	{
		this.savePath = savePath;
	}
	
}
