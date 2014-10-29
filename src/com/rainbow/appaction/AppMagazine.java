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
	public String period;//��־����
	private File   upFile; //�ļ� 
    private String upFileFileName; //�ļ���
    private String upFileContentType;//�ļ����
    private String savePath;//Ŀ¼
    private String name;//��־����
    private String Introduction;//��־���
	public int id;
	private int currentPage;//ҳ��
	private int pageSize=4;//����
	/**
	 * gyn
	 * ����������ѯ��־ ����
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
		
		//ʵ����
		Gson gson = new Gson();
		//�����͸���ֵ
		//String result = "{\"mct\":"+gson.toJson(mct)+",\"mct\":"+gson.toJson(mct)+"}";
		String result = "";
		result = gson.toJson(mg);
		out.println(result);
	}
	/**
	 * gyn
	 * ��ѯȫ����־
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
		//ʵ����
		Gson gson = new Gson();
		//�����͸���ֵ
		//String result = "{\"mct\":"+gson.toJson(mct)+",\"mct\":"+gson.toJson(mct)+"}";
		String result = "";
		result = gson.toJson(mge);
		out.println(result);
	}
	
	

	
	
	/**
	 * gyn
	 * ��־�ϴ�
	 * ��־��ѹ
	 * ��־����д�����ݿ�
	 */
    public void Uploaddecompression() throws IOException{
    	
    	try
		{
    		
    		HttpServletResponse response = ServletActionContext.getResponse();
    		response.setContentType("application/json");
    		response.setCharacterEncoding("UTF-8");
    		PrintWriter out = response.getWriter();
		
    		//�ϴ�zip�����λ��
    		savePath="/AppMagazinezip";
    		//�����ļ�Ŀ¼
    		File pe = new File(savePath);
    		//Ŀ¼������ʱ�Զ�����
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
		
    		out.println("zip�������·��"+str);
    		out.println("zip����λ���ϴ���"+ServletActionContext.getServletContext().getRealPath(str));
    		out.println("�½�"+period+"�ļ���");
		
    		//�½��ļ���
    		String dPath=period+"\\";
    		//��ѹ�ļ����Ŀ¼
    		String newdPath="C:\\Users\\Administrator\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Rainbow\\AppMagazine\\"+dPath;
    	
    		out.println("zip����ѹ��"+newdPath);
    		//zip��������λ��
    		String Path=ServletActionContext.getServletContext().getRealPath(str);
    	
    	
        
    		//��Ҫ��ѹ�ļ�Ŀ¼
    		File pathFile = new File(newdPath);
    		//Ŀ¼������ʱ�Զ�����
    		if(!pathFile.exists()){  
    			pathFile.mkdirs();  
    		} 
    	
    		//��ȡϵͳ��ǰʱ��
    		Date time = new Date();
    		//������ʽ
    		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd  kk:mm:ss ");
    		//d����������ʽ��ʱ��
    		String newtime=sdf.format(time);  	
    		//ѹ���ļ�Ŀ¼	 
    	  	File file = new File(Path);  
    	  	//ʵ����ZipFile��ÿһ��zipѹ���ļ������Ա�ʾΪһ��ZipFile
    	    ZipFile zipFile = new ZipFile(file);
    	    //ʵ����һ��Zipѹ���ļ���ZipInputStream���󣬿������ø����getNextEntry()���������õ�ÿһ��ZipEntry����
    	    ZipInputStream zipInputStream = new ZipInputStream(new FileInputStream(file), Charset.forName("GBK")); 
    	    //������ֵ
    	    ZipEntry zipEntry=null;  
    	          
    	    while ((zipEntry = zipInputStream.getNextEntry()) != null) {   	
    	    	
    	        	  String fileName = zipEntry.getName();
    	        	 
    	        	  System.out.println("zip��ѹ��"+newdPath);
    	        	  
    	              File temp = new File(newdPath+fileName); 
    	              
    	              if (! temp.getParentFile().exists())
   	  
    	            	  	temp.getParentFile().mkdirs();    	  
    	              		OutputStream os = new FileOutputStream(temp);    	  
    	              		//ͨ��ZipFile��getInputStream�����õ������ZipEntry��������    	  
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
    	          	 * ��ȡzip���е��ļ�
    	          	 
    	          	java.util.zip.ZipFile zf = new java.util.zip.ZipFile(Path);
    	          
    	          	Enumeration e = zf.entries();
    	          
    	          	while(e.hasMoreElements()){
    	          		ZipEntry ze = (ZipEntry) e.nextElement();
    	          		if(!ze.isDirectory())
    	          			System.out.println(new String(ze.getName().getBytes("ISO-8859-1"), "GB2312"));
    	          			out.println("zip�����ļ�"+new String(ze.getName().getBytes("ISO-8859-1"), "GB2312"));
    	           
    	          }
    	          */
    	          
    	         
   
    	          //����
    	          String encoding="GBK";
    	          //��ȡ txt�ļ�
                  File fle=new File(newdPath+"Configuration.txt");
                  //�ж��ļ��Ƿ����
                  if(fle.isFile()&& fle.exists()){ 
                	  //���ǵ������ʽ
                      InputStreamReader read = new InputStreamReader(new FileInputStream(fle),encoding);
                      
                      BufferedReader bufferedReader = new BufferedReader(read);
                      
                      String lineTxt = null;
                      
                      //���·��
                      String xPath="/AppMagazine/"+period+"/";

                      //ʵ����
              		  Gson gson = new Gson();
              		
              		  //���ڱ�ʶ �ڶ���ҳ��  -1��ʼ ����Ϊ ��һ������ ���� 0  ��ʶΪ0������  Ҫ���� Magazine ����Ϊ��־��logoͼƬ             
              		  int g=-1;
              		  
                      while((lineTxt = bufferedReader.readLine()) != null){
                    	  
                    	  g++;
                    	  
                    	  String result = "";
                    	  //�÷����س���","������   split����
                    	  String value[] = lineTxt.split(",");
                    	  String valueb="";
                    	  //��ʾ ������","
                    	  
                    	  if(value.length==0){
                    		  valueb=xPath+lineTxt;
                    		 // valueb= "{"+gson.toJson(valueb)+"}";
                    		
                    	  }
                    	  
                    	  else
                    		  
                    	  {
                    	  //ѭ��
                    	  for(int i=0;i<value.length;i++){ 
                    		  //�˴�Ϊ��һ������ǰ�治�ü�","
                    		  if(i==0){
                    			  
                    			  valueb=xPath+value[i];
                    			 // valueb= "{"+gson.toJson(valueb)+"}";
                    			  
                    			  }
                    		  //�����","
                    		  else
                    		  {
                    			  valueb=valueb+","+xPath+value[i];
                    			 // valueb= "{"+gson.toJson(valueb)+"+"+gson.toJson(xPath+value[i])+"}";
                    				  
                    			  }

                    	  }
                    	 
                    	  }
                    	  //������ת����json����
                    	  //result=gson.toJson(valueb);
                    	  //ʵ����MagazineContent��
                    	  MagazineContent magazineContent=new MagazineContent();
                    	  //д������
                    	  magazineContent.setImg(valueb);
                    	  magazineContent.setPeriod(period);
                    	  magazineContent.setPages(g);
                    	  //ִ����ӷ���
                    	  AMCD.save(magazineContent);

                    	  result=gson.toJson(valueb);
                    	  
                    	  out.println("json"+result); 
                    	  
                    	  
                          }
                      
                      read.close();
                      
                      
                      
                      
                      
                      	
                      
                      
		}
                  
           if(AMCD.Pagesperiod(period,0)!=null){
			/**
          	 * �������������Magazine���  ȫ������  ����  ������
          	 * 
          	 * ������  �������д��Ӳ���ȥ  ֵ�����е�
          	 */
            out.print("��ӽ�ȥ��");
          	//��ȡ��  �� n ��  ��һ��  ����
          	MagazineContent mt=AMCD.Pagesperiod(period,0);
          	//������־����
      	  	Magazine m1=new Magazine();
      	  	//��־��ҳlogo   mt.getImg()����MagazineContent��ͼƬ��ַ  ��һ��  ������ҳ �����������־ ��Ϣ����� img���� ��Ϊ��־logo
      	  	m1.setImg(mt.getImg());
      	  	//��־���
          	m1.setIntroduction(Introduction);
          	//��־����
          	m1.setName(name);
          	//��־����
          	m1.setPeriod(period);
          	//��־zip������·��
          	m1.setPhysicalpath(Path);
          	//��־�ϴ�ʱ��
          	m1.setTime(newtime);       
          	AMD.save(m1);   
          	AMCD.delete(mt);
          	 
			
		}
                  
                  
		}
		catch (Exception e)
		{
			System.out.println("�쳣"+e);
		}          
        finally
        {
          
        	
         }     
	    }  
    
    
    
    
   /**
    * gyn
    * ��ҳ��ʾ��־��Ϣ
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
		//�ж� ���м�ҳ   
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
    		System.out.println("��־����"+m.getName());
    		System.out.println("��־����"+m.getPeriod());
    	}
    	
    	Map session = (Map) ActionContext.getContext().get("session");
    	session.put("l", l);
    	session.put("currentPage", currentPage);
    	session.put("n",n);
    	
		}
		catch (Exception e)
		{
			System.out.println("�쳣"+e);
		}
    	return Action.SUCCESS;
    }
    
    
    
    
    /**
     * gyn
     * ����idɾ����־
     * @throws IOException 
     */
    
    
    public void delete() throws IOException{
    	try
		{
    	HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
    	
    	//����id��ѯ��Ҫɾ������־ Magazine��
    	Magazine magazine=AMD.Accordingid(id);
    	//��Ҫɾ��������
    	String Period=magazine.getPeriod();
    	//��Ҫɾ����zip������·��
    	String Physicalpath=magazine.getPhysicalpath();
    	//�ٽ���־����ɾ����
    	AMD.delete(magazine);
    	out.println("1  Magazineɾ���ɹ�");
    	//ɾ����Magazine���е�  zip��
    	File file2 = new File(Physicalpath);
    	if(file2.exists()==true){
    		//ɾ����־�ļ�zip
    		file2.delete();
    		out.println("�ļ���"+file2.getName()+"ִ����ɾ��zip�ķ���"+Physicalpath+"__");
		}
    	//��ѯ��Ҫɾ���� �ڵ�����
    	mg=AMCD.Pagesperiod(Period);
    	//������ ѭ��ɾ����
    	for(int i=0;i<mg.size();i++){
    		AMCD.delete(mg.get(i));
    	}
    	
    	out.println("1  MagazineContentɾ���ɹ�");
    	
    	if(Period!=null){
    		
		String sPath="C:\\Users\\Administrator\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Rainbow\\AppMagazine\\"+Period;
    	File file1 = new File(sPath);
    	
    	   if(file1.exists()){                    //�ж��ļ��Ƿ����
    		   		if(file1.isFile()){                    //�ж��Ƿ����ļ�
    		   			file1.delete();                       //delete()���� ��Ӧ��֪�� ��ɾ������˼;
    		    		
    		   			}else if(file1.isDirectory()){              //�����������һ��Ŀ¼
    		    			
    		   				File files[] = file1.listFiles();               //����Ŀ¼�����е��ļ� files[];
    		    			
    		   				for(int i=0;i<files.length;i++){            //����Ŀ¼�����е��ļ�
    		    				
    		    				files[i].delete();             //��ÿ���ļ� ������������е���
    		   				} 
    		   		  } 
    		    file1.delete(); 
    		    
    		    out.println("4  �ļ��� ɾ���ɹ�");
    		    
    	   }else{ 
    		   			
    		   out.println("��ɾ�����ļ��в����ڣ�"+'\n'); 
    		   			
    	   } 
    	   
    	}else{
    					
    		out.println("Period==null");
    		
    	}
		
		}
    	
		catch (Exception e)
		{
			System.out.println("�쳣"+e);
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
