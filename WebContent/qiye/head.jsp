<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.rainbow.entity.User"%>
<%@ page import="com.rainbow.constant.*" %>
<%
	User user = (User)session.getAttribute("user");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>企业用户</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />

</head>

<body>
<div class="top">
    <div class="topcont"><!--<img src="images/qy_02.png"  class="fl"/>--><b class="fl titcont">柴米游戏开发者中心</b><p class="fr"><span><img src="images/qy_11.png" />
    你好，管理员，您有<a href="news.jsp" target="main" class="nun">10</a>封未读邮件</span>
    <span class="admin"><a href="company_developer.jsp" target="main"><img src="images/qy_05.png" />admin</a></span>
    <span class="admin"><a href="#"><img src="images/qy_08.jpg" />退出</a></span></p></div>
</div>

</body>
</html>
