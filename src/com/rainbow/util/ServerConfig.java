package com.rainbow.util;

import javax.servlet.ServletContextEvent;



/**
 * @author STerOTto
 * @version 2014-7-18 14:12:04
 *	服务器路径配置
 */
public class ServerConfig {
	
	private static final ServerConfig serverConfig;
	
	static {
		serverConfig = new ServerConfig();
	}
	
	public static ServerConfig getServerConfig(){

		return serverConfig;
	}
	
	private ServerConfig(){
		
	}
	
	private  String realPath;
	private  String contextpath;
	
	/**
	 * 初始化
	 */
	public void initialize(ServletContextEvent event){
		String realpath = event.getServletContext().getRealPath("/");
		String[] strPath = realpath.split("\\\\");
		this.realPath = "";
		for(int i = 0; i<strPath.length-1 ; i++)
			this.realPath += strPath[i]+"/";
		this.contextpath = event.getServletContext().getContextPath();
	}

	public String getRealPath() {
		return realPath;
	}


	public String getContextpath() {
		return contextpath;
	}


	
}
