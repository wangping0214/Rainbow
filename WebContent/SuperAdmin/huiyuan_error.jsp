<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p align="center">审批失败！原因：未选择是否通过审核！</p>
<p align="center">温馨提示：3秒钟后自动跳转到审批页面</p>
<% 
       response.setHeader("Refresh","2;URl=URl=mem_manager.action?isuserType=individualwait");
       %>
<p align="center"><a href="mem_manager.action?isuserType=individualwait">&lt;&lt;返回审批页面</a></p>
</body>
</html>
