<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="UTF-8" lang="utf-8">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
 <title>柴米游言</title>
 <script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/nav.js"></script>
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
<div class="sidenav">
<div class="touxiang">
    <p class="photo"><img src="images/a1_07.jpg" width="85" height="86" /></p>
    <p>Newtorl manen</p>
</div>
<!--touxiang-->
<ul id="menu">
 <li class="item"><a href="appmanage.html" class="title nav2" name="1" target="main">我的应用</a>
   <ul id="opt_1" class="optiton">
    <li><a href="appmanage.html" target="main"><img src="images/img16s.png" /><img src="images/img16.png" />应用管理</a></li>
    <li><a href="Add_app.html" target="main"><img src="images/ad2.png"/><img src="images/ad.png"/>发布应用</a></li>
   </ul>
 </li>
 <li class="item"><a href="javascript:void(0);" class="title nav4" name="4" target="main">数据统计</a>
   <ul id="opt_4" class="optiton">
    <li><a href="data_analysis.html" target="main"><img src="images/data2.png" /><img src="images/data.png" />数据分析</a></li>
    <li><a href="order_date.html" target="main"><img src="images/jl2.png" /><img src="images/jl.png" />支付订单记录</a></li>
   </ul>
 </li>
 <li class="item"><a href="javascript:void(0);" target="main" class="title nav3" name="2">账户管理</a>
   <ul id="opt_2" class="optiton">
    <li><a href="company_developer.html" target="main"><img src="images/kf.png" /><img src="images/kf2.png" />开发者资料</a></li>
    <li><a href="finance_company.html"target="main"><img src="images/xx2.png" /><img src="images/xx.png" />财务信息</a></li>
    <li><a href="password_change.html" target="main"><img src="images/mm2.png" /><img src="images/mm.png" />账号密码</a></li>
   </ul>
 </li>
  <li class="item"><a href="javascript:void(0);" target="main" class="title nav5" name="5">推广</a>
   <ul id="opt_5" class="optiton">
    <li><a href="kaifaxinxi.html" target="main"><img src="images/kf.png" /><img src="images/kf2.png" />暂无推广</a></li>
   </ul>
 </li>
 <li class="item"><a href="javascript:void(0);" target="main" class="title nav6" name="6">帮助文档</a>

 </li>
</ul> 

</div>
   
</body>
</html>