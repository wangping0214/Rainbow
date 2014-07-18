package com.rainbow.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.rainbow.util.IdGenerator;
import com.rainbow.util.ServerConfig;

/**
 * Application Lifecycle Listener implementation class InitListener
 *
 */
@WebListener
public class InitListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public InitListener() {
        // TODO Auto-generated constructor stub
    	


    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent event) {
    	ApplicationContext ac =  WebApplicationContextUtils.getRequiredWebApplicationContext(event.getServletContext());
    	IdGenerator.getInstance().initialize(ac.getBean("CpIdSeedDAO"), ac.getBean("AppIdSeedDAO"));
    	
    	ServerConfig.getServerConfig().initialize(event);
    	System.out.println(ServerConfig.getServerConfig().getRealPath()+"\n"+ServerConfig.getServerConfig().getContextpath());


    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0) {
        // TODO Auto-generated method stub
    	IdGenerator.getInstance().destroy();
    }
	
}
