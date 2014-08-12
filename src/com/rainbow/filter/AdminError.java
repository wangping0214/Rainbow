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
import javax.servlet.http.HttpSession;

import com.rainbow.entity.Admin;

public class AdminError implements Filter{

	public FilterConfig config;

	@Override
	public void destroy() {
		this.config = null;
	}

	@SuppressWarnings("static-access")
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
		
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
	
		HttpSession session = httpServletRequest.getSession();
		Admin admin = (Admin) session.getAttribute("admin");
		String logonStrings = config.getInitParameter("logonStrings"); // <!--登录登陆页面-->
		String includeStrings = config.getInitParameter("includeStrings"); // <!--过滤资源后缀参数-->
		String[] logonList = logonStrings.split(";");
		String[] includeList = includeStrings.split(";");

		if (!this.isContains(httpServletRequest.getRequestURI(), includeList)) { // <!--只对指定过滤参数后缀进行过滤-->
			filterChain.doFilter(request, response);
			return;
		}
		if (this.isContains(httpServletRequest.getRequestURI(), logonList)) {// <!--对登录页面不进行过滤-->
			filterChain.doFilter(request, response);
			return;
		}
		if (admin == null) {
			httpServletResponse.sendRedirect("loginTimeOut.jsp");
			return;
		}
		filterChain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		config = filterConfig;
	}

	public static boolean isContains(String container, String[] regx) {
		boolean result = false;

		for (int i = 0; i < regx.length; i++) {
			if (container.indexOf(regx[i]) != -1) {
				return true;
			}
		}
		return result;
	}


}
