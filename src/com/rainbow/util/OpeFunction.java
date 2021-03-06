package com.rainbow.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;



/**
 * @author Administrator
 *
 */
public class OpeFunction {
	
	/**
	 *文件上传到服务器
	 *
	 */
	public static String fileToServer(String path,File file,String fileName,String fileType, boolean reName) throws IOException{
		
		String realpath = ServletActionContext.getServletContext().getRealPath(path);//服务器路径
		if(file!=null){
			File savedir=new File(realpath);//建立目录
			if(!savedir.getParentFile().exists())
				savedir.getParentFile().mkdirs();
			File saveFile;
			fileType = fileName.substring(fileName.lastIndexOf(".") + 1);
			if(reName){
				saveFile = new File(savedir, java.util.UUID.randomUUID()+"."+fileType);
			}
			else
				saveFile = new File(savedir, fileName);
			
			FileUtils.copyFile(file, saveFile);
			
			return path+"/"+saveFile.getName();
		}
		
		return null;
		
	}
	/**获取文件的大小   单位为MB,保留两位小数
	 * @param file
	 * @return
	 * @throws IOException
	 */
	public static float fileSize(File file) throws IOException{
		
		FileInputStream fis = new FileInputStream(file);  
		float size = 0;
		size = fis.available()/1024/1024;
		BigDecimal b = new BigDecimal(size);
		float f1 = b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
		return f1;
	}
	public static String getNowTime(){
		 Date dt=new Date();
		 SimpleDateFormat matter1=new SimpleDateFormat("yyyy-MM-dd");
		return matter1.format(dt);
	}

}
