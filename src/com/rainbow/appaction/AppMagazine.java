package com.rainbow.appaction;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipInputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.apache.struts2.ServletActionContext;
import org.hibernate.mapping.Array;

import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.rainbow.dao.AppMagazineContentDAO;
import com.rainbow.dao.AppMagazineDAO;
import com.rainbow.entity.ADV;
import com.rainbow.entity.Magazine;
import com.rainbow.entity.MagazineContent;
import com.rainbow.util.OpeFunction;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.nio.charset.Charset;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;


public class AppMagazine
{
	private File File;
	private AppMagazineDAO AMD;
	private AppMagazineContentDAO AMCD;
	List<Magazine> mge=new ArrayList<Magazine>();
	List<MagazineContent> mg=new ArrayList<MagazineContent>();
	public String period;//杂志期数
	private File   upFile; //文件 
    private String upFileFileName; //文件名
    private String upFileContentType;//文件类别
    private String savePath;//目录
    private String name;//杂志名称
    private String Introduction;//杂志简介
	public int id;
	private int currentPage;//页数
	private int pageSize=4;//行数
	/**
	 * gyn
	 * 根据期数查询杂志 详情
	 * @throws IOException 
	 */
	public void periodMagazine() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		period="1";
		for(MagazineContent m:AMCD.Pagesperiod(period)){
			mg.add(m);
		}
		
		//实例化
		Gson gson = new Gson();
		//声明和赋空值
		//String result = "{\"mct\":"+gson.toJson(mct)+",\"mct\":"+gson.toJson(mct)+"}";
		String result = "";
		result = gson.toJson(mg);
		out.println(result);
	}
	/**
	 * gyn
	 * 查询全部杂志
	 * @throws IOException 
	 */
	public void AllMagazine() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		for(Magazine m:AMD.All()){
			mge.add(m);
		}
		period="20";
		//实例化
		Gson gson = new Gson();
		//声明和赋空值
		//String result = "{\"mct\":"+gson.toJson(mct)+",\"mct\":"+gson.toJson(mct)+"}";
		String result = "";
		result = gson.toJson(mge);
		out.println(result);
	}
	
	

	
	
	/**
	 * gyn
	 * 杂志上传
	 * 杂志解压
	 * 杂志数据写到数据库
	 */
    public void Uploaddecompression() throws IOException{
    	
    	try
		{
    		
    		HttpServletResponse response = ServletActionContext.getResponse();
    		response.setContentType("application/json");
    		response.setCharacterEncoding("UTF-8");
    		PrintWriter out = response.getWriter();
		
    		//上传zip包存放位置
    		savePath="/AppMagazinezip";
    		//设置文件目录
    		File pe = new File(savePath);
    		//目录不存在时自动创建
    		if(!pe.exists()){  
    			pe.mkdirs();  
    		} 
		
    		if(upFile==null)
    		{
			out.print("NULL");
			return ;
    		}
    		//out.print(this.getUpFileFileName());
    		//out.print(this.getUpFileContentType());
		
    		String str="";
		
    		str=OpeFunction.fileToServer(savePath, upFile, upFileFileName,upFileContentType, false);
		
    		out.println("zip包的相对路径"+str);
    		out.println("zip物理位置上传在"+ServletActionContext.getServletContext().getRealPath(str));
    		out.println("新建"+period+"文件夹");
		
    		//新建文件夹
    		String dPath=period+"\\";
    		//解压文件存放目录
    		String newdPath="C:\\Users\\Administrator\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Rainbow\\AppMagazine\\"+dPath;
    	
    		out.println("zip包解压在"+newdPath);
    		//zip包的物理位置
    		String Path=ServletActionContext.getServletContext().getRealPath(str);
    	
    	
        
    		//需要解压文件目录
    		File pathFile = new File(newdPath);
    		//目录不存在时自动创建
    		if(!pathFile.exists()){  
    			pathFile.mkdirs();  
    		} 
    	
    		//获取系统当前时间
    		Date time = new Date();
    		//这样格式
    		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd  kk:mm:ss ");
    		//d就是这样格式的时间
    		String newtime=sdf.format(time);  	
    		//压缩文件目录	 
    	  	File file = new File(Path);  
    	  	//实例化ZipFile，每一个zip压缩文件都可以表示为一个ZipFile
    	    ZipFile zipFile = new ZipFile(file);
    	    //实例化一个Zip压缩文件的ZipInputStream对象，可以利用该类的getNextEntry()方法依次拿到每一个ZipEntry对象
    	    ZipInputStream zipInputStream = new ZipInputStream(new FileInputStream(file), Charset.forName("GBK")); 
    	    //声明赋值
    	    ZipEntry zipEntry=null;  
    	          
    	    while ((zipEntry = zipInputStream.getNextEntry()) != null) {   	
    	    	
    	        	  String fileName = zipEntry.getName();
    	        	 
    	        	  System.out.println("zip解压在"+newdPath);
    	        	  
    	              File temp = new File(newdPath+fileName); 
    	              
    	              if (! temp.getParentFile().exists())
   	  
    	            	  	temp.getParentFile().mkdirs();    	  
    	              		OutputStream os = new FileOutputStream(temp);    	  
    	              		//通过ZipFile的getInputStream方法拿到具体的ZipEntry的输入流    	  
    	              		InputStream is = zipFile.getInputStream(zipEntry);
    	              		int len = 0;	  
    	              		while ((len = is.read()) !=-1)   	  
    	              			os.write(len);    	  
    	              			os.close();   	  
    	              			is.close();   	  
    	    		}
    	    zipFile.close();
    	          
    	    zipInputStream.close();
    	          	
    	          	
    	          	
    	          	
    	          	/**
    	          	 * 读取zip包中的文件
    	          	 
    	          	java.util.zip.ZipFile zf = new java.util.zip.ZipFile(Path);
    	          
    	          	Enumeration e = zf.entries();
    	          
    	          	while(e.hasMoreElements()){
    	          		ZipEntry ze = (ZipEntry) e.nextElement();
    	          		if(!ze.isDirectory())
    	          			System.out.println(new String(ze.getName().getBytes("ISO-8859-1"), "GB2312"));
    	          			out.println("zip包里文件"+new String(ze.getName().getBytes("ISO-8859-1"), "GB2312"));
    	           
    	          }
    	          */
    	          
    	         
   
    	          //编码
    	          String encoding="GBK";
    	          //获取 txt文件
                  File fle=new File(newdPath+"Configuration.txt");
                  //判断文件是否存在
                  if(fle.isFile()&& fle.exists()){ 
                	  //考虑到编码格式
                      InputStreamReader read = new InputStreamReader(new FileInputStream(fle),encoding);
                      
                      BufferedReader bufferedReader = new BufferedReader(read);
                      
                      String lineTxt = null;
                      
                      //相对路径
                      String xPath="/AppMagazine/"+period+"/";

                      //实例化
              		  Gson gson = new Gson();
              		
              		  //用于标识 第多少页的  -1开始 是因为 第一条数据 会是 0  标识为0的数据  要存入 Magazine 中作为杂志的logo图片             
              		  int g=-1;
              		  
                      while((lineTxt = bufferedReader.readLine()) != null){
                    	  
                    	  g++;
                    	  
                    	  String result = "";
                    	  //用方法截出带","的数据   split方法
                    	  String value[] = lineTxt.split(",");
                    	  String valueb="";
                    	  //表示 数据无","
                    	  
                    	  if(value.length==0){
                    		  valueb=xPath+lineTxt;
                    		 // valueb= "{"+gson.toJson(valueb)+"}";
                    		
                    	  }
                    	  
                    	  else
                    		  
                    	  {
                    	  //循环
                    	  for(int i=0;i<value.length;i++){ 
                    		  //此处为第一个数据前面不用加","
                    		  if(i==0){
                    			  
                    			  valueb=xPath+value[i];
                    			 // valueb= "{"+gson.toJson(valueb)+"}";
                    			  
                    			  }
                    		  //否则加","
                    		  else
                    		  {
                    			  valueb=valueb+","+xPath+value[i];
                    			 // valueb= "{"+gson.toJson(valueb)+"+"+gson.toJson(xPath+value[i])+"}";
                    				  
                    			  }

                    	  }
                    	 
                    	  }
                    	  //把数据转换成json类型
                    	  //result=gson.toJson(valueb);
                    	  //实例化MagazineContent类
                    	  MagazineContent magazineContent=new MagazineContent();
                    	  //写入数据
                    	  magazineContent.setImg(valueb);
                    	  magazineContent.setPeriod(period);
                    	  magazineContent.setPages(g);
                    	  //执行添加方法
                    	  AMCD.save(magazineContent);

                    	  result=gson.toJson(valueb);
                    	  
                    	  out.println("json"+result); 
                    	  
                    	  
                          }
                      
                      read.close();
                      
                      
                      
                      
                      
                      	
                      
                      
		}
                  
           if(AMCD.Pagesperiod(period,0)!=null){
			/**
          	 * 我想在这添加向Magazine添加  全部数据  可是  不好用
          	 * 
          	 * 问题是  这个在这写添加不进去  值都是有的
          	 */
            out.print("添加进去了");
          	//获取到  第 n 的  第一个  数据
          	MagazineContent mt=AMCD.Pagesperiod(period,0);
          	//创建杂志对象
      	  	Magazine m1=new Magazine();
      	  	//杂志主页logo   mt.getImg()是在MagazineContent的图片地址  第一个  就是主页 所以添加在杂志 信息表里的 img列中 作为杂志logo
      	  	m1.setImg(mt.getImg());
      	  	//杂志简介
          	m1.setIntroduction(Introduction);
          	//杂志名字
          	m1.setName(name);
          	//杂志期数
          	m1.setPeriod(period);
          	//杂志zip包物理路径
          	m1.setPhysicalpath(Path);
          	//杂志上传时间
          	m1.setTime(newtime);       
          	AMD.save(m1);   
          	AMCD.delete(mt);
          	 
			
		}
                  
                  
		}
		catch (Exception e)
		{
			System.out.println("异常"+e);
		}          
        finally
        {
          
        	
         }     
	    }  
    
    
    
    
   /**
    * gyn
    * 分页显示杂志信息
    * @return
    */
    
    
    
    public String Earch(){
    	try
		{
			
		
		List l=new ArrayList();
		if(currentPage<=0){
			currentPage=1;
		}
		int n=AMD.All().size();
		//判断 共有几页   
		if(n%4==0){
    		n=n/4;
    	}else{
    		n=(n/4)+1;
    	}
		if(currentPage>=n){
			currentPage=n;		
		}
    	for(int i=0;i<AMD.Fenye(currentPage, pageSize).size();i++){
    		l.add(AMD.Fenye(currentPage, pageSize).get(i));	
    	}   
    	for(int i=0;i<l.size();i++){
    		Magazine m=(Magazine) l.get(i);
    		System.out.println("杂志名字"+m.getName());
    		System.out.println("杂志期数"+m.getPeriod());
    	}
    	
    	Map session = (Map) ActionContext.getContext().get("session");
    	session.put("l", l);
    	session.put("currentPage", currentPage);
    	session.put("n",n);
    	
		}
		catch (Exception e)
		{
			System.out.println("异常"+e);
		}
    	return Action.SUCCESS;
    }
    
    
    
    
    /**
     * gyn
     * 根据id删除杂志
     * @throws IOException 
     */
    
    
    public void delete() throws IOException{
    	try
		{
    	HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
    	
    	//根据id查询出要删除的杂志 Magazine表
    	Magazine magazine=AMD.Accordingid(id);
    	//需要删除的期数
    	String Period=magazine.getPeriod();
    	//需要删除的zip包物理路径
    	String Physicalpath=magazine.getPhysicalpath();
    	//再将杂志主表删除掉
    	AMD.delete(magazine);
    	out.println("1  Magazine删除成功");
    	//删除掉Magazine表中的  zip包
    	File file2 = new File(Physicalpath);
    	if(file2.exists()==true){
    		//删除杂志文件zip
    		file2.delete();
    		out.println("文件名"+file2.getName()+"执行了删除zip的方法"+Physicalpath+"__");
		}
    	//查询需要删除的 期的数据
    	mg=AMCD.Pagesperiod(Period);
    	//将他们 循环删除掉
    	for(int i=0;i<mg.size();i++){
    		AMCD.delete(mg.get(i));
    	}
    	
    	out.println("1  MagazineContent删除成功");
    	
    	if(Period!=null){
    		
		String sPath="C:\\Users\\Administrator\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Rainbow\\AppMagazine\\"+Period;
    	File file1 = new File(sPath);
    	
    	   if(file1.exists()){                    //判断文件是否存在
    		   		if(file1.isFile()){                    //判断是否是文件
    		   			file1.delete();                       //delete()方法 你应该知道 是删除的意思;
    		    		
    		   			}else if(file1.isDirectory()){              //否则如果它是一个目录
    		    			
    		   				File files[] = file1.listFiles();               //声明目录下所有的文件 files[];
    		    			
    		   				for(int i=0;i<files.length;i++){            //遍历目录下所有的文件
    		    				
    		    				files[i].delete();             //把每个文件 用这个方法进行迭代
    		   				} 
    		   		  } 
    		    file1.delete(); 
    		    
    		    out.println("4  文件夹 删除成功");
    		    
    	   }else{ 
    		   			
    		   out.println("所删除的文件夹不存在！"+'\n'); 
    		   			
    	   } 
    	   
    	}else{
    					
    		out.println("Period==null");
    		
    	}
		
		}
    	
		catch (Exception e)
		{
			System.out.println("异常"+e);
		}
    	
    }

	
	 
	public String getPeriod()
	{
		return period;
	}
	public void setPeriod(String period)
	{
		this.period = period;
	}
	
	public AppMagazine(AppMagazineDAO aMD, AppMagazineContentDAO aMCD)
	{
		super();
		AMD = aMD;
		AMCD = aMCD;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public File getFile()
	{
		return File;
	}
	public void setFile(File file)
	{
		File = file;
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
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getIntroduction()
	{
		return Introduction;
	}
	public void setIntroduction(String introduction)
	{
		Introduction = introduction;
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

	
	
	
	
	
}
