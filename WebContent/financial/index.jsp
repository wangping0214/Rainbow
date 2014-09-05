<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.rainbow.entity.Admin" %>
	<%
		Admin admin = (Admin)session.getAttribute("financial");
		if(null!=admin)
			response.sendRedirect("initFinancial");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link href="<%=request.getContextPath()%>/developer/css/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jq.js"></script>
<script type="text/javascript" language="javascript">
$(document).ready(function(){
	$("#login").click(function(){
		jQuery.ajax({
			type:"post",
			url:"financialLogin",
			data:{
				"userName":$("#userName").val(),
				"password":$("#password").val()
			},
			success:function(response){
				if("0"==response){
					alert("用户名或密码错误！");
				}
				else if("1"==response){
					location.href="initFinancial";
				}
			}
		});
	});
});
</script>
</head>

<body>
<div class="wrapper">
   <div class="logincont">
       <div class="logleft fl"><img src="images/img1.jpg" width="488" height="327" /></div>
       <!--logleft-->
       <div class="logform fl">
           <h3 class="tit1"><img src="images/img2.png" width="77" height="73" />五彩时空财务系统</h3>
           <div class="form1">

                    <div class="user"><input type="text" value="用户名" class="type"id="userName" /></div>
                    <div class="mima"><input type="password" value="请输入密码" class="password" id="password" /></div>
                    <div class="but1"><input type="button" value="登录" id="login" /></div>

           </div>
           <!--from1-->
       </div>
       <!--logform-->
   </div>
   <!--logincont-->
</div>
<!--wrapper-->
</body>
</html>
