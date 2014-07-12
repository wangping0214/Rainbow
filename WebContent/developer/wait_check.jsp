<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
out.print("<script>alert('对不起,开发者身份审核中,请耐心等待！');</script>");
response.setHeader("Refresh","0.1;URl=developer/main2.jsp");
%>
</body>
</html>