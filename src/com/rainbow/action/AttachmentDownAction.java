package com.rainbow.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;

/**
 * ����
 * @author Administrator
 *
 */
public class AttachmentDownAction {
	private AppAuthority appAut = new AppAuthority();
	private AppInfo appInfo = new AppInfo();
	private AppSource appSou = new AppSource();
	
	private AppAutDAO appAutDAO;
	private AppInfoDAO appInfoDAO;
	private AppSouDAO appSouDAO;
	
	private int appSouId;
	private String downPath;
	
	private static String bowser;//���������
	
	private HttpServletResponse response;
	private HttpServletRequest request;
	private HttpSession session;
	
	/**
	 * @return
	 * @throws IOException 
	 */
//	public InputStream getInputStream() throws IOException{
//		File file = new File(ServletActionContext.getServletContext().getRealPath("")+new String(downPath.getBytes("ISO-8859-1"),"UTF-8"));
//		return new FileInputStream(file);
//	}
	
	/**
	 * �����ļ�
	 * ��sou���е�id ������·��������,����ת����utf-8���룬�Է���������
	 * @throws UnsupportedEncodingException 
	 * 
	 */
	private void downFile() throws UnsupportedEncodingException{
		HttpServletResponse response = ServletActionContext.getResponse();
		File file = new File(ServletActionContext.getServletContext().getRealPath("")+downPath);
		String fileName = encodingFileName(file.getName()); 
		
		try {
			OutputStream out = response.getOutputStream();
			response.reset();
			response.setContentType("application/octet-stream; charset=UTF-8");//�����ļ���ʽ
			response.addHeader("Content-Disposition", "attachment; filename=" + fileName );//�������񣬶��������ߴ򿪣����ҽ��ļ���������������
			FileInputStream fis = new FileInputStream(file);
			int i = -1;
			while((i=fis.read())!=-1){
				out.write(i);
			}
			out.flush();
			out.close();
			fis.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	
	/**���ظ���
	 * ��sou���е�id ������·��������,����ת����utf-8���룬�Է���������
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public void downApk() throws UnsupportedEncodingException{
		appSou = appSouDAO.findById(appSouId);
		appAut = appAutDAO.findById(appSouId); 
		appAut.setAmountOfDown(appAut.getAmountOfDown()+1);
		appAutDAO.update(appSouId, appAut);
		downFile();
		//return Action.SUCCESS;
	}
	
	/**
	 * ����ͼƬ
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public void downPhoto() throws UnsupportedEncodingException{
		downFile();
	
		
	}
	
	
	/**
	 * ����������
	 * �ո�����
	 * @param fileName
	 * @return
	 */
	public static String encodingFileName(String fileName) {
        String returnFileName = "";
        if(ServletActionContext.getRequest().getHeader( "USER-AGENT" ).toLowerCase().indexOf( "firefox" )>0)
        	bowser="firefox";
        else
        	bowser="IE";
        
        try {
        	if("firefox".equals(bowser)){
            	returnFileName = new String(fileName.getBytes("UTF-8"), "ISO8859-1");
            	returnFileName = StringUtils.replace(returnFileName, " ", "");
            }
        	else{
            returnFileName = URLEncoder.encode(fileName, "UTF-8");
            returnFileName = StringUtils.replace(returnFileName, "+", "%20");
            if (returnFileName.length() > 150) {
                returnFileName = new String(fileName.getBytes("GB2312"), "ISO8859-1");
                returnFileName = StringUtils.replace(returnFileName, " ", "%20");
            	}
        	}
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        	
        }
        return returnFileName; 
	}

	
	public String getBowser() {
		return bowser;
	}

	public void setBowser(String bowser) {
		this.bowser = bowser;
	}

	public String getDownPath() {
		return downPath;
	}


	public void setDownPath(String downPath) {
		this.downPath = downPath;
	}


	public AppAuthority getAppAut() {
		return appAut;
	}


	public void setAppAut(AppAuthority appAut) {
		this.appAut = appAut;
	}


	public AppInfo getAppInfo() {
		return appInfo;
	}


	public void setAppInfo(AppInfo appInfo) {
		this.appInfo = appInfo;
	}


	public AppSource getAppSou() {
		return appSou;
	}


	public void setAppSou(AppSource appSou) {
		this.appSou = appSou;
	}


	


	public int getAppSouId() {
		return appSouId;
	}
	public void setAppSouId(int appSouId) {
		this.appSouId = appSouId;
	}
	public AttachmentDownAction(AppAutDAO appAutDAO, AppInfoDAO appInfoDAO,
			AppSouDAO appSouDAO) {
		super();
		this.appAutDAO = appAutDAO;
		this.appInfoDAO = appInfoDAO;
		this.appSouDAO = appSouDAO;
	}
	
}
