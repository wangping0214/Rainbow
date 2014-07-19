<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link href="<%=request.getContextPath()%>/developer/css/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="<%=request.getContextPath()%>/developer/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/developer/js/jq.js"></script>

</head>

<body>
<div class="wrapper">
   <div class="logincont">
       <div class="logleft fl"><img src="<%=request.getContextPath()%>/developer/images/img1.jpg" width="488" height="327" /></div>
       <!--logleft-->
       <div class="logform fl">
           <h3 class="tit1"><img src="<%=request.getContextPath()%>/developer/images/img2.png" width="77" height="73" />后台管理系统</h3>
           <div class="form1">
               <form action="<%=request.getContextPath()%>/login_developer.action" method="post">
                    <div class="user"><input type="text" value="手机号/email" class="type"name="input" /></div>
                    <div class="mima"><input type="password" value="请输入密码" class="password"name="user.password" /></div>
                    <div class="xieyi">登录柴米游戏账号表示您同意<a href="<%=request.getContextPath()%>/login/use_item.jsp" class="blue"> 最终用户协议</a></div>
                    <div class="but1"><input type="submit" value="登录" /></div>
                    <div class="meiyou">没有柴米游戏账户？<a href="<%=request.getContextPath()%>/login/register.jsp">立即注册</a></div>
               </form>
           </div>
           <!--from1-->
       </div>
       <!--logform-->
   </div>
   <!--logincont-->
</div>
<!--wrapper-->
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
