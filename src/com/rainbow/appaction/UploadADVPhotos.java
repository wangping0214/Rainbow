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
import java.io.Serializable;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.rainbow.dao.AppADVDAO;
import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.entity.ADV;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.entity.TaxRate;
import com.rainbow.server.AdvAndApp;
import com.rainbow.server.App;
import com.rainbow.util.OpeFunction;
import com.rainbow.constant.AdvType;

public class UploadADVPhotos
{
	private AppSouDAO sdao;
	private AppAutDAO adao;
	private AppInfoDAO idao;
	private AppADVDAO dao;
	
	
	
	private File   upFile; //文件 
    private String upFileFileName; //文件名
    private String upFileContentType;//文件类别
    private String savePath;//目录
    private int id;//文件id
    private String type;//文件类别
   public String img;//文件目录
   private int currentPage;//页数
   private int pageSize=4;//行数
  
   
   
	/**
	 * gyn分页显示广告图片
	 * @return
	 * @throws IOException
	 */
    public String Search() throws IOException{	
		ADV v=new ADV();
		
		String ip = InetAddress.getLocalHost().getHostAddress();
		System.out.println(ip);
		
		List l=new ArrayList();
		if(currentPage==0){
			currentPage=1;
		}
		int n=dao.imlogo().size();
		//由于浏览器显示问题只能够一张图显示的空间 所以多加个true 以前是每页4个图 现在是1图
		if(n%4==0){
    		n=n/4;
    	}else{
    		n=(n/4)+1;
    	}
		if(currentPage>=n){
			currentPage=n;		
		}
    	for(int i=0;i<dao.imlogo(currentPage,pageSize).size();i++){
    		v=dao.imlogo(currentPage,pageSize).get(i);
    		l.add(v);	
    	}   	
    	Map session = (Map) ActionContext.getContext().get("session");
    	session.put("l", l);
    	session.put("currentPage", currentPage);
    	session.put("n",n);
    	return Action.SUCCESS;		
    }
    
    
	/**
	 * 上传广告图片
	 * @throws IOException
	 */
	public void UploadPhotos() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		savePath="/adv";
		if(upFile==null)
		{
			out.print("NULL");
			return ;
		}
		out.print(this.getUpFileFileName());
		out.print(this.getUpFileContentType());
		String a=null;	
		img=OpeFunction.fileToServer(savePath, upFile, upFileFileName,upFileContentType,false);
		//获取系统当前时间
		Date d = new Date();
		//这样格式
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd  kk:mm:ss ");
		//d就是这样格式的时间
		String logotime=sdf.format(d);
		ADV adv=new ADV();
		adv.setLogo(img);
		//这个你的等会改一下
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
	
	
	/**
	 * gyn广告管理
	 * @SuppressWarnings("unchecked")
	 * @throws IOException
	 */
	
	public void ADVn() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		//实例化
		Gson gson = new Gson();
		//声明和赋空值
		String result = "";		
		//获取request
		HttpServletRequest request=ServletActionContext.getRequest();
		//获取复选框的值
		String[]   values   =   request.getParameterValues("cartCheckBox");
		//获取提交按钮的值
		String Submit=   request.getParameter("sc");
		System.out.println(Submit);
		List l=new ArrayList();
		ADV v=new ADV(); 
		//选择内容进行操作
		switch (Submit)
		{
		case "删除":
			if(values==null){
				out.print("请选择");
				return;
				
			}
			 for(int i=0;i<values.length;i++)
			   {
				   
				    v=dao.select(Integer.parseInt(values[i]) );
				   dao.deleteimglogo(v);
			  
			   }
			out.print("你删除了"+values.length+"条数据");
			
			break;
		case "推荐":
			if(values==null){
				out.print("请选择");
				return;
				
			}
			 for(int i=0;i<values.length;i++)
			   {
				   
				    v=dao.select(Integer.parseInt(values[i]) );
				    v.setType("推荐");//推荐
				    dao.saveimlogo(v);
				    
			  
			   }
			 out.print("推荐广告图");
			 out.print("你修改了"+values.length+"条数据");
			 
			 
			break;
		case "人气":
			if(values==null){
				out.print("请选择");
				return;
				
			}
			 for(int i=0;i<values.length;i++)
			   {
				   
				    v=dao.select(Integer.parseInt(values[i]) );
				    v.setType("人气");//人气
				    dao.saveimlogo(v);
				    
			  
			   }
			 out.print("人气广告图");
			 out.print("你修改了"+values.length+"条数据");
			break;
		case "杂志":
			if(values==null){
				out.print("请选择");
				return;
				
			}
			 for(int i=0;i<values.length;i++)
			   {
				   
				    v=dao.select(Integer.parseInt(values[i]) );
				    v.setType("杂志");//杂志
				    dao.saveimlogo(v);
				    
			  
			   }
			 
			 out.print("杂志广告图");
			 out.print("你修改了"+values.length+"条数据");
		
			break;

		case "清空":
			if(values==null){
				out.print("请选择");
				return;
				
			}
			 for(int i=0;i<values.length;i++) {
				   
				    v=dao.select(Integer.parseInt(values[i]) );
				    v.setType(" ");
				    dao.saveimlogo(v);
				    
			  
			   }
			 
			 out.print("杂志广告图");
			 out.print("你修改了"+values.length+"条数据");
		
			break;
		default:
			out.println("异常");
			break;
		}
	}
	
	
	/**
	 * gyn 
	 * 通过 广告类别获取广告
	 * 
	 * @throws IOException
	 */
	public void ADVType() throws IOException{
		System.out.println("进入ADVType");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		switch(type)
		{
		case "A":
			type="推荐";
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
		List<ADV> advList=new ArrayList<ADV>();
		if(type==""){
			System.out.println("请传 A B C");
		}
		for(ADV adv:dao.type(type)){
			advList.add(adv);
		}
		System.out.println(advList.size());
		List<App> appList=new ArrayList<App>();
		int num=4;
		
		for (AppInfo info : idao.Section(num))
		{
			AppSource sou = sdao.findById(info.getId());
			AppAuthority ay = adao.findById(info.getId());
			
			App app = new App();
			app.setAppAut(ay);
			app.setAppInfo(info);
			app.setAppSou(sou);
			appList.add(app);

		}
		System.out.println("appList"+appList.size());
		AdvAndApp advAndApp = new AdvAndApp(advList, appList);
		//实例化
		Gson gson = new Gson();
		//声明和赋空值
		String result = "";
		result = gson.toJson(advAndApp);
		out.println(result);
		//System.out.println(result);

	}
	
	


	
	public UploadADVPhotos(AppSouDAO sdao, AppAutDAO adao,AppInfoDAO idao,AppADVDAO dao)
	{
		super();
		this.sdao = sdao;
		this.adao = adao;
		this.idao = idao;
		this.dao=dao;
	}

	
	public int getCurrentPage()
	{
		return currentPage;
	}
	public void setCurrentPage(int currentPage)
	{
		this.currentPage = currentPage;
	}
	public int getPageSize()
	{
		return pageSize;
	}
	public void setPageSize(int pageSize)
	{
		this.pageSize = pageSize;
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
