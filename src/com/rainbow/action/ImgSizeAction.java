package com.rainbow.action;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.rainbow.util.AppTmp;

public class ImgSizeAction {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private AppTmp appTmp;	//用于接收文件或临时信息
	public String getImgSize() throws IOException{
		File file;
		if(appTmp.getLogo1Content()!=null)
			file = appTmp.getLogo1Content();
		else
			file = appTmp.getLogo2Content();
        BufferedImage bi = ImageIO.read(file);
        int height = bi.getHeight();
        int width = bi.getWidth();
        String result = "";  
        result+="{\"height\":"+height+",\"width\":"+width+"}";
        System.out.println(result);
        if(appTmp.getLogo1Content()!=null)
        	if(height!=48||width!=48)
        		return "error";
        	else return "success";
        else
        	if(height!=94||width!=94)
        		return "error";
        	else return "success";
       
  
	}
	public AppTmp getAppTmp() {
		return appTmp;
	}
	public void setAppTmp(AppTmp appTmp) {
		this.appTmp = appTmp;
	}
	

}
