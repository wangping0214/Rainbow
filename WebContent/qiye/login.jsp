<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		$.ajax({
			type:"post",
			url:"devLogin.action",
			data:$("#form").serialize(),
			success:function(response)
				{
					if("0" == response)
						alert("用户名或密码错误！");
					else
						{
							location.href="index.jsp";
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
           <h3 class="tit1"><img src="images/img2.png" width="77" height="73" />后台管理系统</h3>
           <div class="form1">
               <form id="form" action="devLogin.action" method="post">
                    <div class="user"><input type="text" value="手机号/email" class="type"name="loginName" /></div>
                    <div class="mima"><input type="password" value="请输入密码" class="password"name="password" /></div>
               </form>
                    <div class="xieyi">登录柴米游戏账号表示您同意<a href="../login/use_item.jsp" class="blue"> 最终用户协议</a></div>
                    <div class="but1"><input type="button" id="login" value="登录" /></div>
                    <div class="meiyou">没有柴米游戏账户？<a href="../login/register.jsp">立即注册</a></div>
               
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
