<%@ page language="java" import="com.rainbow.entity.User" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>登录</title>
<link href="<%=request.getContextPath()%>/login/style/style.css" rel="stylesheet" type="text/css" /><!--为尾部-->
<link href="<%=request.getContextPath()%>/login/style/login.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/scripts/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/login/js/jq.js"></script>
<script type="text/javascript" language="javascript">
$(document).ready(function(){
	
	$("#submit").click(function(){
		var inputname = $("#id_inputname").val();
		var password = $("#id_password").val();
		var code = $("#id_text_code").val();

		jQuery.ajax({
			type : "post",
			url : "checkVerificationCode.action",
			data :{"code" : code},
			success : function(response){
				if(response=="0"){
					alert("验证码输入错误！");
				}
				else{
					jQuery.ajax({
						type : "post",
						url : "login_form.action",
						data : {"inputname" : inputname,
								"user.password" : password	
								},
						success : function(response){
							if(response=="1")
								location.href="todayRecommend.action";
							else{
								alert("登陆失败！ ");
								}
							}
						});
				}
			}
		});

		
	});
});

function getVerificationCode(){
	jQuery.ajax({
		type : "post",
		url :	"<%=request.getContextPath()%>/getVerificationCode.action",
		
	});
}

function refreshVerificationCode(){
	$("#id_code").attr("src",getVerificationCode());
}
</script>
</head>

<body>
<div  class="mainCon">
	<div  id="wrap">
        <div id="header">
            <div class="nav">
                <a href="<%=request.getContextPath()%>/login/index.jsp" class="fl"><img src="<%=request.getContextPath()%>/login/images/im_02.jpg" /></a>
                <div class="fr navright">
                    <%User user = (User)session.getAttribute("user"); 
       	if(user==null){
       %>
       <div class="huiyuan fr"><p><a href="<%=request.getContextPath()%>/login/login.jsp">登录</a>|<a href="<%=request.getContextPath()%>/login/register.jsp">注册</a></p></div>
       <%}
       	else{%>
       	<div class="huiyuan fr"><a href="#" class="tou"><img src="images/tj_11.jpg" /></a><p><a href="" id="id_exit">退出</a></p></div>
       	<%} %>
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
       <div class="zccont">
       <div class="zhuce">
        <div class="zhuceform">
             <div><label>&nbsp;账&nbsp;&nbsp;&nbsp;号&nbsp;：</label><input id="id_inputname"type="text"name="inputname"value="邮箱/手机号"onfocus="javascript:if(this.value=='邮箱/手机号')this.value='';"onblur="javascript:if(this.value=='')this.value='邮箱/手机号';"/></div>
           <div><label>&nbsp;密&nbsp;&nbsp;&nbsp;码&nbsp;：</label><input id="id_password" type="password"name="user.password" /></div>
        </div>
        <!--zhuceform-->
        <div class="yanzheng">
            <div class="ma"><div><label>验证码：</label><input type="text" id="id_text_code"/></div><p><img src="getVerificationCode()" id="id_code" /><a href="javascript:location.reload();"><img src="<%=request.getContextPath()%>/login/images/sx.png" /></a></p></div>
        </div>
        <div class="zidong"><p class="fl"><input type="checkbox" checked="checked" />自动登录</p><a href="password_find1.jsp" class="fr">找回密码？</a></div>

        <div class="zcbut"><input type="submit" id="submit" onclick="loginSubmit()" value="马上登录"/></div>
        <!--yanzheng-->
    </div>
    <!--zhuce-->
</div>
 </div>
    <!--wrap-->
</div>
<div class="fixed">
<!--mainCon-->
   <div class="icon2"><img src="<%=request.getContextPath()%>/login/images/ic_03.jpg" /></div>
     <div class="fotter fotter2"> 
          <div class="footcont">
             <div class="footmain">
                <div class="copyright">
                   <p class="tit3"><a href="<%=request.getContextPath()%>/login/index.jsp">柴米游戏丨中国第一手游杂志</a></p>
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
                 <p class="logo2 fl"><a href="#"><img src="<%=request.getContextPath()%>/login/images/im_14.jpg" /></a></p>
               </div>
               <!--footmain-->
           </div>
           <!--footcont-->
       </div>
       <!--fotter-->
</div>
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
