<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.rainbow.entity.User"%>
<%@ page import="com.rainbow.constant.*" %>
<%
	User user = (User)session.getAttribute("user");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>已发布</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="content">
     <div class="search">
               <div class="searchcont">
                   <input type="text" value="搜索关键词" class="socont"/><input type="image" src="images/a1_04.jpg" value="" class="sobut"/>
               </div>
               <!--searchcont-->
      </div>
      <!--serach-->
      <div class="midcont">
             <div class="tit">
                 <p class="headnav">柴米游戏</p>
             </div>
             <!--tit-->
             <div class="cont">
                 <p class="wei"> 
                 <%if(UserType.INDIVIDUAL_COMMON.getContext().equalsIgnoreCase(user.getUserType())){ %>
                 	您还没有注册成为企业/个人开发者，请<a href="register_information.jsp" class="zhuce">立即注册</a>！
                 	<%
                 	}
                 else
                 {
                 	switch(user.getApproved())
                 	{
                 	case -1: %>
                 	升级开发者的请求未通过审核，请完善开发者信息<a></a>!
                 	<%
                 			
                 	case 0: 
                 	%>
                 	升级开发者的请求正在审核中，请耐心等待！
                 	<%
                 			
                 	case 1:
                 	%>
                 	《《《《点击右边菜单进行应用管理
                 	<%
                 		
                 	%>
                 	
                 <%}
                 }
                 %>
                 
                 </p>
             </div>
             <!--cont-->
       </div>
       <!--midcont-->
 </div>
</body>
</html>
