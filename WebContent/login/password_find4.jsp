<%@ page language="java" import="com.rainbow.entity.User" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>找回密码</title>
<link href="style/style.css" rel="stylesheet" type="text/css" /><!--为尾部-->
<link href="style/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jq.js"></script>
<script type="text/javascript" language="javascript">
var reg=/^(?!_)(?!.*?_$)[a-zA-Z0-9_]+$/;
$(document).ready(function(){
	$("#newPassword").focus(function(){
		if($("#newPassword").val()=="新密码应为6~20个字符，区分大小写"){
			$("#newPassword").attr("value","");
		}
	});
	
	$("#newPassword").blur(function(){
		if($("#newPassword").val()==""){
			$("#newPassword").attr("value","新密码应为6~20个字符，区分大小写");
		}
	});
	
	$("#save").click(function(){
		var newPassword = $("#newPassword").val();
		if(!reg.test(newPassword)){
			alert("密码只能输入英文数字下划线,区分大小写");
			return false;
		}
		if(newPassword.length<6||newPassword.length>20){
			alert("密码应为6~20个字符，区分大小写");
			return false;
		}
		jQuery.ajax({
			type:"post",
			url:"changeUserPassword.action",
			data:{"newPassword":newPassword,
				"userId":<%=request.getParameter("userId")%>},
			success:function(){
				location.href="password_find5.jsp";
			}
		});
	});
});

</script>
</head>

<body>
<div  class="mainCon">
	<div  id="wrap">
        <div id="header">
            <div class="nav">
                <a href="index.jsp" class="fl"><img src="images/im_02.jpg" /></a>
                <div class="fr navright">
                    <p class="fl"><a href="login.jsp">登录</a>|<a href="register.jsp">注册</a></p>
                    <div class="search2s fl">
                        <input type="text" value="搜索安卓软件和游戏" class="sou2"/>
                        <input type="button" value="" class="soubut" />
                   </div>
                </div>
                <!--navright-->
            </div>
            <!--nav-->
        </div>
        <!--header-->
        <div class="password">
           <dl>
              <dt><img src="images/m2_03.jpg" width="64" height="69" /></dt>
              <dd><b>设置新密码</b></dd>
           </dl>
           <div class="passcont passcont2">
              <p>Email：<%=request.getParameter("email") %></p>
              <p><input type="text" id="newPassword" value="新密码应为6~20个字符，区分大小写" class="shouji" /></p>
              <p><input type="button" id="save" value="保存" class="pbaocun" /></p>
           </div>
           <!--passcont-->
        </div>
        <!--password-->
 </div>
    <!--wrap-->
</div>
<!--mainCon-->
<div class="fixed">
   <div class="icon2"><img src="images/ic_03.jpg" /></div>
     <div class="fotter fotter2"> 
          <div class="footcont">
             <div class="footmain">
                <div class="copyright">
                   <p class="tit3"><a href="index.jsp">柴米游戏丨中国第一手游杂志</a></p>
                   <p>&copy;2014 - 2020 柴米游戏 丨京ICP备11000000号-2</p>
                   <p>除非特别注明，应用程序由第三方市场提供，柴米游戏仅根据您的指令提供搜索结果链接，与出处无关，详情请参阅 知识产权保护声明</p>
                </div>
                <!--copyright-->
                <dl>
                   <dt>意见与服务</dt>
                   <dd><a href="about_us.jsp">关于我们</a></dd>
                   <dd><a href="teamwork.jsp">商务洽谈</a></dd>
                   <dd><a href="developer_center.jsp">开发者中心</a></dd>
                 </dl>
                 <dl>
                   <dt>帮助与支持</dt>
                   <dd><a href="use_item.jsp">使用条款</a></dd>
                   <dd><a href="users_privacy.jsp">用户隐私</a></dd>
                   <dd><a href="knowledge_equity.jsp">知识产权保护声明</a></dd>
                 </dl>
                 <p class="logo2 fl"><a href="index.jsp"><img src="images/im_14.jpg" /></a></p>
               </div>
               <!--footmain-->
           </div>
           <!--footcont-->
       </div>
       <!--fotter-->
</div>
<!--fixed-->
</body>
</html>
