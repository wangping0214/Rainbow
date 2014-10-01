package com.rainbow.appaction;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import sun.security.action.OpenFileInputStreamAction;

import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.entity.ADV;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.server.App;
import com.rainbow.util.OpeFunction;




public class AppText
{
	private AppInfoDAO dao;
	private AppSouDAO sdao;
	private AppAutDAO adao;
	private int num;
	private File   upFile;  
    private String upFileFileName; 
    private String upFileContentType;
    private String savePath;  
	/**
	 * gyn
	 * 测试用的action 中的方法
	 * @throws IOException
	 */
	public void Text() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		savePath="/adv/";
		out.print(this.getUpFileFileName());
		out.print(this.getUpFileContentType());
		String a=OpeFunction.fileToServer(savePath, upFile, upFileFileName,upFileContentType,false);
			out.print(a);
		
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
