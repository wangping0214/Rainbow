package com.rainbow.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UrlError implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;  
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;  
        String url = httpServletRequest.getRequestURI();  
        System.out.println(url);
//        if(url != null && url.endsWith(".jsp")) {  
//        	//httpServletRequest.getContextPath()
//            httpServletResponse.sendRedirect("index.jsp");  
//            System.out.println("≈–∂œ÷¥––"+new Date());
//            return;  
//        }  
        String reg = "";
//        if(!httpServletRequest.getContextPath().equalsIgnoreCase(url))
        filterChain.doFilter(request, response);  
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		
	}

}
