<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>已上架/待上架</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
*{padding:0; margin:0;}
.body{
	color: #0066CC;
	font-family: "微软雅黑";
	font-size: 14px;
	margin-left: 0px;
	font-weight: bold;
	height:100%;
	width: 100%;
	background-color: f2f2f2;
}
.head{
	color: #0066CC;
	font-family: "微软雅黑";
	font-size: 20px;
	margin-left: 20px;
	margin-top:20px;
	font-weight: bold;
	height: 50px;
	width: 240px;
	background-color: #FFFFFF;
}
.b1{
	color: #99CC00;
	font-family: "微软雅黑";
	font-size: 16px;
	margin-left: 20px;
	margin-top:5px;
	font-weight: bold;
	height: 25px;
	width: 90px;
	text-align:center;
	background-color: #FFFFFF;
}
.b2{
	 clear:both;
	color: #0066CC;
	font-family: "微软雅黑";
	margin-left: 150px;
	margin-top:20px; overflow:hidden; zoom:1;
	width: auto;
	background-color: #FFFFFF;
}
.b3{
	color: #000000;
	font-family: "微软雅黑";
	font-size: 14px;
	margin-left: 5px;
	margin-top:5px;
	font-weight: bold;
	height: 225px;
	width: 140px;
	float: left;
}
.head{ width:160px;}
.b3-1{
	color: #999999;
	font-family: "微软雅黑";
	font-size: 20px;
	margin-left: 5px;
	margin-top:5px;
	height: 205px;
	width: 160px;
	float: left;
	border:1px solid #999;
	text-align:center;
	line-height:205px;
}
.b31{
	font-family: "微软雅黑";
	height: 20px;
	width: 160px;
}
#left{
	color: #0066CC;
	font-family: "微软雅黑";
	font-size: 14px;
	margin-left: 30px;
	height: 300px;
	width: 500px;
	float: left;
}
#right{
	color: #000000;
	font-family: "微软雅黑";
	font-size: 14px;
	height: 300px;
	float: right;
	width: 500px;
	margin-right: 100px;
}
</style>
<script type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>

<body>
<div class="body">
<div class="content">
     <div class="search">
               <div class="searchcont">
                   <input type="text" value="搜索" class="socont fl"/><input type="submit" value="" class="sobut fr"/>
               </div>
               <!--searchcont-->
      </div>
     <div class="midcont">
                   <div class="list">
                      <h3 class="tit2">待上架</h3>
                      <div class="dailist">
                         <dl>
                            <dt><a href="#">第六期</a></dt>
                            <dd><a href="#"><img src="images/img10.png" /></a></dd>
                            <dd class="but2"><a href="#"></a><a href="xinqi.jsp"></a><input type="submit" value="" /><input type="submit" value="" /></dd>
                         </dl>
                         <dl>
                            <dt><a href="#">第六期</a></dt>
                            <dd><a href="#"><img src="images/img10.png" /></a></dd>
                            <dd class="but2"><a href="#"></a><a href="xinqi.jsp"></a><input type="submit" value="" /><input type="submit" value="" /></dd>
                         </dl>
                         <dl>
                            <dt><a href="#">第六期</a></dt>
                            <dd><a href="#"><img src="images/img10.png" /></a></dd>
                            <dd class="but2"><a href="#"></a><a href="xinqi.jsp"></a><input type="submit" value="" /><input type="submit" value="" /></dd>
                         </dl>
                         <dl>
                            <dt><a href="#">第六期</a></dt>
                            <dd><a href="#"><img src="images/img10.png" /></a></dd>
                            <dd class="but2"><a href="#"></a><a href="xinqi.jsp"></a><input type="submit" value="" /><input type="submit" value="" /></dd>
                         </dl>
                         <div class="more1"><a href="waitmore.jsp" target="main">查看更多</a></div>
                      </div>
                      <!--dailist-->
                      <h3 class="tit2 tit3">已上架</h3>
                      <div class="yilist">
                         <dl>
                            <dt><a href="#">第六期</a></dt>
                            <dd><a href="#"><img src="images/img10.png" /></a></dd>
                            <dd class="but2"><a href="#"></a><input type="submit" value="" /></dd>
                         </dl>
                         <dl>
                            <dt><a href="#">第六期</a></dt>
                            <dd><a href="#"><img src="images/img10.png" /></a></dd>
                            <dd class="but2"><a href="#"></a><input type="submit" value="" /></dd>
                         </dl>
                         <dl>
                            <dt><a href="#">第六期</a></dt>
                            <dd><a href="#"><img src="images/img10.png" /></a></dd>
                            <dd class="but2"><a href="#"></a><input type="submit" value="" /></dd>
                         </dl>
                         <dl>
                            <dt><a href="#">第六期</a></dt>
                            <dd><a href="#"><img src="images/img10.png" /></a></dd>
                            <dd class="but2"><a href="#"></a><input type="submit" value="" /></dd>
                         </dl>
                         <div class="more1"><a href="wangqihuigu.jsp" target="main">往期>></a></div>
                         <!--more-->
                      </div>
                      <!--dailist-->
                   </div>
                   <!--list-->
               </div>
     </div>
 </div>
</body>
</html>
