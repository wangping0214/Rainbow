package com.rainbow.appaction;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
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
   public String img;
    //根据id查询图片路径
    public String Search() throws IOException{
    	HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		//获取本地ip地址
		String ip = InetAddress.getLocalHost().getHostAddress();
		//获取系统当前时间
		Date d = new Date();
		//这样格式
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd  kk:mm:ss ");
		//str就是这样格式的时间
		String str=sdf.format(d);
		// 声明和赋空值
		String result = "";
		
		List l=new ArrayList();
	
		System.out.println("进入action");
		
    	for(ADV a:dao.imlogo()){
    		
    		//out.print("http://192.168.3.15:8080/Rainbow"+a.getLogo());
    		// 转换成Json
    		//result = gson.toJson(a.getLogo());
    		//l.add(a.getId());
    		//l.add(result);
    		//out.println(result);]
    		l.add(a.getId());
    		l.add("http://"+ip+":8080/Rainbow"+a.getLogo());
    		
    		
        	
    	}
    	
    	Map request = (Map) ActionContext.getContext().get("request");
    	request.put("l", l);
    	request.put("c",l.size() );
    	
    	System.out.println("list长度"+l.size());
    	/**
    	request.put("img1", "http://localhost:8080/Rainbow"+l.get(1));
    	request.put("img2", "http://localhost:8080/Rainbow"+l.get(2));
    	request.put("img3", "http://localhost:8080/Rainbow"+l.get(3));
    	File file = new File(ServletActionContext.getServletContext()
				.getRealPath("l.get(1)"));
			file.delete();
    							System.out.println(l.get(1));
    							System.out.println(ServletActionContext.getServletContext().getRealPath("123"));
    	**/
    	return Action.SUCCESS;
    
    	
    	
		
    			
    }
	//上传广告图片
	public void UploadPhotos() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		savePath="/adv/";
		if(upFile==null)
		{
			out.print(Action.NONE);
			return;
		}
		out.print(this.getUpFileFileName());
		out.print(this.getUpFileContentType());
		String a=null;
		
		 a=OpeFunction.fileToServer(savePath, upFile, upFileFileName,upFileContentType,false);
		 
		 
		
			out.print(a);
			//获取系统当前时间
			Date d = new Date();
			//这样格式
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd  kk:mm:ss ");
			//d就是这样格式的时间
			String logotime=sdf.format(d);
			ADV adv=new ADV();
			adv.setLogo(a);
			adv.setType(type);
			adv.setLogotime(logotime);
			dao.saveimlogo(adv);

			out.print("\n路径\n"+adv.getLogo());
		
	}
	/**
	 * gyn删除图片
	 * @throws IOException 
	 */
	public void DeleteImg() throws IOException
	{	
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println("进入DeleteImg");
		System.out.println(id);
		ADV adv=dao.select(id);
		dao.deleteimglogo(adv);
		
		
		
		File file = new File(ServletActionContext.getServletContext()
				.getRealPath(adv.getLogo()));
		file.delete();
		System.out.println(ServletActionContext.getServletContext()
				.getRealPath(adv.getLogo())+"删除完毕");
		out.print("删除成功");
		
		
	}
	
	


	public String getImg()
	{
		return img;
	}
	public void setImg(String img)
	{
		this.img = img;
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
