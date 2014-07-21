<%@ page language="java" import="com.rainbow.entity.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
	<% User user = (User)session.getAttribute("user"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="keywords" content="" />
<meta name="description" content="" />
 <title>柴米游言</title>

 <style type="text/css">
 *{ margin:0; padding:0;}
 body{margin:0;text-align:center;font:normal 12px Arial,Verdana,Tahoma;text-align:center;line-height:150%;}
 a img{ border:0;}
 a:link,a:visited {color:#ffffff;text-decoration:none}
 a:hover {text-decoration:underline}
.touxiang{ background-color:#51D2B7; height:85px; width:170px; overflow:hidden; zoom:1;}
.touxiang p{line-height:52px; padding:20px 0 0 20px;}
.touxiang img{ float:left; margin-right:10px;}
.touxiang span{ height:52px; line-height:52px; float:left; font-family:"微软雅黑"; font-weight:normal; font-size:15px; color:#768593;}
 #menu {width:170px;padding:0px; text-align:left;list-style:none; background:#39404A; height:610px; overflow:hidden; zoom:1;}
 #menu .item {padding:10px 0;list-style:none; text-align:center; border-bottom:solid 2px #757070;}
 #menu .title{ width:138px; margin:0 auto; font-size:16px; font-weight:bold;}

 #menu .item ul {
	list-style:none;
	display:none;
}
.optiton li {
	display:block;
	height: 31px;
	width: 112px;
	 margin:5px auto 0 auto;
	line-height:28px;
	text-align: left; padding-left:5px;
}
.optiton li a{ display:block; width:117px; height:31px;}
.optiton li.bg {
	display:block;
	background:url(images/bg.png) no-repeat;_background:url(images/bg.gif) no-repeat;
	height:31px;
	width:112px;
	line-height:28px; padding-left:5px;
	text-align: left; margin:5px auto 0 auto;
}

.nav1{ background:url(images/img5.png) no-repeat;_background:url(images/img5.gif) no-repeat;display:block; width:138px; height:39px; line-height:39px; text-align:center;}
.nav2{ background:url(images/img6.png) no-repeat;_background:url(images/img6.gif) no-repeat;display:block; width:138px; height:39px; line-height:39px; text-align:center;}
.nav3{ background:url(images/img7.png) no-repeat;_background:url(images/img7.gif) no-repeat;display:block; width:138px; height:39px; line-height:39px; text-align:center;}
.optiton li a img{ vertical-align:middle; margin-right:7px;}
.gl{ position:relative;}
.dainum{ background:#F00; padding:0px 8px; position:absolute; right:-10px; top:-10px; color:#FFF;}
.yonghu{ list-style:none;width:148px; padding:10px 10px 20px 10px; background:#fff; border:#2f7600 solid 1px; position:absolute; top:72px; left:0px; text-align:left; font-weight:bold; display:none; z-index:10;background:rgba(255, 255, 255, 0.9) none repeat scroll 0 0 !important;filter:Alpha(opacity=90); background:#fff;}
.yonghu li{ height:30px; line-height:30px; border-bottom:#CCC dotted 1px; text-align:center;}
.yonghu a{ color:#70AD47}
.message{ position:absolute; top:10px; left:110px;}
.message img{ vertical-align:middle; margin-right:3px;}
.message a{ color:#F00;}
 </style>
 <script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/nav.js"></script>
<script type="text/javascript"src="js/jquery.min.js"></script>
 <script language="javascript" type="text/javascript">
 // --- 获取ClassName
 document.getElementsByClassName = function(cl) {
  var retnode = [];
  var myclass = new RegExp('\\b'+cl+'\\b');
  var elem = this.getElementsByTagName('*');
  for (var j = 0; j < elem.length; j++) {
   var classes = elem[j].className;
   if (myclass.test(classes)) retnode.push(elem[j]);
  }
  return retnode;
 }
 
 // --- 隐藏所有
 function HideAll() {
  var items = document.getElementsByClassName("optiton");
  for (var j=0; j<items.length; j++) {
   items[j].style.display = "none";
  }
 }
 // --- 设置cookie
 function setCookie(sName,sValue,expireHours) {
  var cookieString = sName + "=" + escape(sValue);
  //;判断是否设置过期时间
  if (expireHours>0) {
    var date = new Date();
    date.setTime(date.getTime + expireHours * 3600 * 1000);
    cookieString = cookieString + "; expire=" + date.toGMTString();
  }
  document.cookie = cookieString;
 }
 //--- 获取cookie
 function getCookie(sName) {
   var aCookie = document.cookie.split("; ");
   for (var j=0; j < aCookie.length; j++){
  var aCrumb = aCookie[j].split("=");
  if (escape(sName) == aCrumb[0])
    return unescape(aCrumb[1]);
   }
   return null;
 }
 
 window.onload = function() {
  var show_item = "opt_1";
  if (getCookie("show_item") != null) {
    show_item= "opt_" + getCookie("show_item");
  }
  document.getElementById(show_item).style.display = "block";
  var items = document.getElementsByClassName("title");
  for (var j=0; j<items.length; j++) {
   items[j].onclick = function() {
    var o = document.getElementById("opt_" + this.name);
    if (o.style.display != "block") {
     HideAll();
     o.style.display = "block";
     setCookie("show_item",this.name);
    }
    else {
     o.style.display = "none";
    }
   }
  }
 } 
 </script>

</head>
<body>
<div style="float:left; background:#F00;">
<div class="touxiang">
    <p><img src="images/img4.gif" class="pngf" /><span><%=session.getAttribute("username")%></span></p>
    
</div>

<ul id="menu">
 <li class="item"><a href="menuDevAppAndGame.action?userName=<%=session.getAttribute("username")%>&userType=0" class="title nav2" name="1" target="menu">应用&amp;游戏</a>
   <ul id="opt_1" class="optiton">
   <li><a href="showAllIdMessage.action?currentPage=1" target="main"><img src="images/ID.gif" />ID 信息</a></li>
    <li><a href="devShowJoint.action?currentPage=1&shelf=1&joint=1" target="main"><img src="images/lianyun.gif" />联运应用管理</a></li>
    <li><a href="devIsShelf.action?appTmp.isShelfCurrentPage=1" target="main"><img src="images/img16.gif" />管理游戏&amp;应用</a></li>
    <li><a href="devUploadAppOfMenu.action" target="main"><img src="images/img17.gif"/>添加新应用</a></li>
    <li class="gl"><a href="devIsThrough.action?appTmp.isThrough=0" target="main"><img src="images/img18.gif"/>审核管理</a><p class="dainum"><%=session.getAttribute("userTotal") %></p></li>
    <li><a href="showUserStatistics.action?currentPage=1" target="main"><img src="images/img29.gif" />统计列表</a></li>

   </ul>
 </li>
 <li class="item"><a href="javascript:void(0);" target="main" class="title nav3" name="2">开发者信息</a>
   <ul id="opt_2" class="optiton">
	<li><a href="<%=request.getContextPath()%>/modify_ad.action" target="main"><img src="images/img28.gif" />广告位申请</a></li>
    <li><a href="<%=request.getContextPath()%>/modify.action" target="main"><img src="images/img30.gif" />开发者信息</a></li>
    <li><a href="xiugaimima.jsp" target="main"><img src="images/mm.gif" />修改密码</a></li>
    <li><a href="message2.jsp" target="main"><img src="images/xiao.gif" />消息管理</a></li>
   </ul>
 </li>
</ul> 
<ul class="yonghu">
        <li><a href="<%=request.getContextPath()%>/modify.action" target="main">修改注册信息</a></li>
        <li><a href="xiugaimima.jsp" target="main">修改密码</a></li>
        <li><a href="<%=request.getContextPath()%>/developer_logout.action" target="_parent">退出登录</a></li>
 </ul>
 <div class="message">
     <a href="message2.jsp" target="main"><img src="images/email.png" />(1)</a>
 </div>
 <!--message-->
</div>
   
</body>
</html>