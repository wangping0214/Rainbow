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
import com.rainbow.server.App;
import com.rainbow.util.OpeFunction;

public class UploadADVPhotos
{
	private AppSouDAO sdao;
	private AppAutDAO adao;
	private AppInfoDAO idao;
	private AppADVDAO dao;
	private File   upFile;  
    private String upFileFileName; 
    private String upFileContentType;
    private String savePath;
    private int id;
    private String type;
   public String img;
   private int currentPage=1;
   private int pageSize=4;
   private String[] cartCheckBox;
   
   
	/**
	 * gyn��ҳ��ʾ���ͼƬ
	 * @return
	 * @throws IOException
	 */
    public String Search() throws IOException{	
		ADV v=new ADV();
		
		List l=new ArrayList();
		if(currentPage==0){
			currentPage=1;
		}
		int n=dao.imlogo().size();
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
	 * �ϴ����ͼƬ
	 * @throws IOException
	 */
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
		 img=OpeFunction.fileToServer(savePath, upFile, upFileFileName,upFileContentType,false);
			out.print(img);
			//��ȡ����ip
			String ip = InetAddress.getLocalHost().getHostAddress();
			System.out.println(ip);
			//��ȡϵͳ��ǰʱ��
			Date d = new Date();
			//������ʽ
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd  kk:mm:ss ");
			//d����������ʽ��ʱ��
			String logotime=sdf.format(d);
			ADV adv=new ADV();
			adv.setLogo("http://"+ip+":8080/Rainbow"+img);
			adv.setType(type);
			adv.setLogotime(logotime);
			dao.saveimlogo(adv);
			out.print("\n·��\n"+adv.getLogo());
		
	}
	/**
	 * gynɾ��ͼƬ
	 * @throws IOException 
	 */
	public void DeleteImg() throws IOException
	{	
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println("����DeleteImg");
		System.out.println(id);
		ADV adv=dao.select(id);
		dao.deleteimglogo(adv);
		File file = new File(ServletActionContext.getServletContext()
				.getRealPath(adv.getLogo()));
		file.delete();
		System.out.println(ServletActionContext.getServletContext()
				.getRealPath(adv.getLogo())+"ɾ�����");
		out.print("ɾ���ɹ�");
		
		
	}
	/**
	 * gyn������
	 * @SuppressWarnings("unchecked")
	 * @throws IOException
	 */
	
	public void ADVn() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		//ʵ����
		Gson gson = new Gson();
		//�����͸���ֵ
		String result = "";		
		//��ȡrequest
		HttpServletRequest request=ServletActionContext.getRequest();
		//��ȡ��ѡ���ֵ
		String[]   values   =   request.getParameterValues("cartCheckBox");
		//��ȡ�ύ��ť��ֵ
		String Submit=   request.getParameter("sc");
		System.out.println(Submit);
		List l=new ArrayList();
		ADV v=new ADV(); 
		//ѡ�����ݽ��в���
		switch (Submit)
		{
		case "ɾ��":
			if(values==null){
				out.print("��ѡ��");
				return;
				
			}
			 for(int i=0;i<values.length;i++)
			   {
				   
				    v=dao.select(Integer.parseInt(values[i]) );
				   dao.deleteimglogo(v);
			  
			   }
			out.print("��ɾ����"+values.length+"������");
			
			break;
		case "�Ƽ�":
			if(values==null){
				out.print("��ѡ��");
				return;
				
			}
			 for(int i=0;i<values.length;i++)
			   {
				   
				    v=dao.select(Integer.parseInt(values[i]) );
				    v.setType("�Ƽ�");//�Ƽ�
				    dao.saveimlogo(v);
				    
			  
			   }
			 out.print("�Ƽ����ͼ");
			 out.print("���޸���"+values.length+"������");
			 
			 
			break;
		case "����":
			if(values==null){
				out.print("��ѡ��");
				return;
				
			}
			 for(int i=0;i<values.length;i++)
			   {
				   
				    v=dao.select(Integer.parseInt(values[i]) );
				    v.setType("����");//����
				    dao.saveimlogo(v);
				    
			  
			   }
			 out.print("�������ͼ");
			 out.print("���޸���"+values.length+"������");
			break;
		case "��־":
			if(values==null){
				out.print("��ѡ��");
				return;
				
			}
			 for(int i=0;i<values.length;i++)
			   {
				   
				    v=dao.select(Integer.parseInt(values[i]) );
				    v.setType("��־");//��־
				    dao.saveimlogo(v);
				    
			  
			   }
			 
			 out.print("��־���ͼ");
			 out.print("���޸���"+values.length+"������");
		
			break;

		case "���":
			if(values==null){
				out.print("��ѡ��");
				return;
				
			}
			 for(int i=0;i<values.length;i++) {
				   
				    v=dao.select(Integer.parseInt(values[i]) );
				    v.setType(" ");
				    dao.saveimlogo(v);
				    
			  
			   }
			 
			 out.print("��־���ͼ");
			 out.print("���޸���"+values.length+"������");
		
			break;
		default:
			out.println("�쳣");
			break;
		}
	}
	/**
	 * gyn 
	 * ͨ�� �������ȡ���
	 * @throws IOException
	 */
	public void ADVType() throws IOException{
		System.out.println("����ADVType");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		List<ADV> img=new ArrayList<ADV>();
		
		for(ADV a:dao.type(type)){
			
			img.add(a);
		}
	    
		List<App> appList=new ArrayList<App>();
		int num=3;
		
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
		
		//ʵ����
		Gson gson = new Gson();
		//�����͸���ֵ
		String result = "";
		String app = "";
		List st=new ArrayList();
		st.add(img);
		st.add(appList);
		
		result = gson.toJson(st);
		//app = gson.toJson("���ͼƬ��Ϣ"+appList);
		//out.println(app);
		
		out.println(result);
	}
	
	


	
	public UploadADVPhotos(AppSouDAO sdao, AppAutDAO adao,AppInfoDAO idao,AppADVDAO dao)
	{
		super();
		this.sdao = sdao;
		this.adao = adao;
		this.idao = idao;
		this.dao=dao;
	}

	public String[] getCartCheckBox()
	{
		return cartCheckBox;
	}
	public void setCartCheckBox(String[] cartCheckBox)
	{
		this.cartCheckBox = cartCheckBox;
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
