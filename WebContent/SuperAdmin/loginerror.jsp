<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p align="center">登录失败！请重新登录！</p>
<p align="center">温馨提示：5秒钟后自动跳转到登录页面</p>
<% 
       response.setHeader("Refresh","5;URl=SuperAdmin/login.jsp");
       %>
<p align="center"><a href="<%=request.getContextPath()%>/SuperAdmin/login.jsp">&lt;&lt;返回登录页面</a></p>
</body>
</html>
