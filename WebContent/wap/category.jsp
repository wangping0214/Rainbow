<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>游戏&应用－柴米游言－中国第一手游杂志</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<style type="text/css">
#c{

    background-color:#CCC;
	height:1000px;
	
}

.fc{    background-color:#E8E8E8;
    color:#333;
	font-family: "微软雅黑";
	margin-left: 10px;
	font-weight: bold;
	float: left;
	width: 45%;
	height:100px;
	

}
.fc3{
	background-color: #E8E8E8;
	color: #333;
	font-family: "微软雅黑";
	margin-left: 10px;
	font-weight: bold;
	float: left;
	width: 45%;
	height: 100px;
	margin-top: 20px;
}
.fc4{
	background-color: #e8e8e8;
	color: #333;
	font-family: "微软雅黑";
	float: right;
	width: 45%;
	margin-right: 10px;
	font-weight: bold;
	height: 100px;
	margin-top: 20px;
}
.fcr{background-color:#e8e8e8;
	color: #333;
	font-family: "微软雅黑";
	float:right;
	width:45%;
	margin-right: 10px;
	font-weight: bold;
		height:100px;
}

.fcc{
	color: #000;
	font-family: "微软雅黑";
	margin-top: 1px;
 
	line-height: 2;
	margin-left: 10px;
	margin-right: 10px;
	overflow: hidden;
 
}
.fc1{
	color: #fff;
	font-family: "微软雅黑";
	margin-top: 1px;
 
	line-height: 2;
	margin-left: 0px;
	background-color: #CC0000;
}
.fc2{
	color: #fff;
	font-family: "微软雅黑";
	font-size: 14px;
	margin-left: 0px;
	margin-top: 1px;
	line-height: 1.5;
	font-weight: bold;
	background-image: url("image/w1.png")/*tpa=http://www.chaimiyouxi.com/image/w1.png*//*tpa=http://www.chaimiyouxi.com/image/w1.png*/; 
}
.fc3q{
	color: #FFFFFF;
	font-family: "微软雅黑";
	margin-top: 1px;
	background-color: #1F1F1F;
	text-align: center;
	background-image: url("image/w1.png")/*tpa=http://www.chaimiyouxi.com/image/w1.png*//*tpa=http://www.chaimiyouxi.com/image/w1.png*/;
	height: 30px;
	border-width: bold;
	font-size: 16px;
}
.fc2-1{
	color: #000;
	font-family: "微软雅黑";
	font-size:14px;
 
	margin-top: 1px;
	line-height:1.5;
	font-weight:bold;

}
.fc2-11{
	color: #666;
	font-family: "微软雅黑";
	font-size: 14px;
	background-color: #FFF;
	margin-top: 10px;
	line-height: 1.5;
	height: 130px;
	margin-left: 10px;
	margin-right: 10px;
}
.fc211{
	color: #666;
	font-family: "微软雅黑";
	font-size: 14px;
	background-color: #FFF;
	line-height: 1.5;
	height: 50px;
	margin-left: 10px;
	width: 50px;
	padding-top: 10px;
}
.fc212{
	color: #000000;
	font-family: "微软雅黑";
	font-size: 14px;
	background-color: #FFF;
	margin-top: -50px;
	line-height: 1.5;
	height: 50px;
	margin-left: 70px;
	width: 50%;
}
.fc213{
	color: #666;
	font-family: "微软雅黑";
	font-size: 14px;
	background-color: #FFF;
	margin-top: -50px;
	line-height: 1.5;
	height: 50px;
	width: 60px;
	margin-right: 10px;
	padding-right: 10px;
	float: right;
}
.fc214{
	color: #666;
	font-family: "微软雅黑";
	font-size: 14px;
	background-color: #FFF;
	margin-top: 10px;
	line-height: 1.5;
	height: 50px;
	width: 90%;
	margin-left: 10px;
}
.fc21{
	color: #03c;
	font-family: "微软雅黑";
	font-size:large;
	margin-left:10px;
	margin-top: 1px;
	line-height:1.5;
	font-weight:bold;

}
.fc22{
	color: #000;
	font-family: "微软雅黑";
	font-size:large;
	margin-left:10px;
	margin-top: 1px;
	line-height:1.5;
	font-weight:bold;

}
 .fc2177{
	background-image: url("image/t.jpg")/*tpa=http://www.chaimiyouxi.com/image/t.jpg*//*tpa=http://www.chaimiyouxi.com/image/t.jpg*/; 
		background-color:fff;
}
</style>
<style type="text/css">
a:link{text-decoration:none ; color:#000 ;}
a:visited {text-decoration:none ; color:#000 ;}
a:hover {text-decoration:underline ; color:#000 ;}
a:active {
	text-decoration: none;
	color: #000;
}
body {
	background-color: #000000;
}
.STYLE1 {color: #FFFFFF}
</style>
<link href="css.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/scripts/jquery.min.js" type="text/javascript"></script>

</head>

<body>
<div id="c">
<div class="fc2177"> <font color="#000"><a href="javascript:if(confirm('http://iread.wo.com.cn/zz/3g/index.aspx  \n\n该文件无法用 Teleport Ultra 下载, 因为 它是一个域或路径外部被设置为它的启始地址的地址。  \n\n你想在服务器上打开它?'))window.location='http://iread.wo.com.cn/zz/3g/index.aspx'"><img src="image/wo-logo.png"  width="110" height="30" border="0" /></a></font> 柴米游戏－中国第一手游杂志</div>

<div class="fc2">
<table height="43" align="center" cellspacing="0" background="newpic/ssbg0.gif" class="clearit" style="width:100%; background-color: #70c570;">
  <tr>
    <td><div align="center"><a href="index.jsp">柴米游言</a></div></td>
    <td width="1">│</td>
    <td><div align="center"><a href="mulu.jsp">目录</a></div></td>
    <td width="1">│</td>
    <td><div align="center"><a href="wangqi.jsp">往期 </a></div></td>
    <td width="1">│</td>
	<td class="new"><div align="center"><a href="showByRecomLevel?appTmp.showByRecomLevelCurrentPage=1" 
	 style="background:url(newpic/ssbg.png) no-repeat center bottom; margin-top:1px; height:42px; line-height:42px;">首页<img src="newpic/new.gif" /></a></div></td>
    <td width="1" >│</td>
	<td class="price"><div align="center"><a href="active.html"><font color="#FFFFFF" style="font-weight:bold">大抽奖</font><img src="newpic/hot.gif" /></a>　</div></td>
    <td width="1"></td>
  </tr>
</table>
</div>
<!--nav-->
<div class="fc2-1"><a href="showByRecomLevel.action?appTmp.showByRecomLevelCurrentPage=1">　推荐</a>　
<a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=1"><font color="#000"> 游戏</font></a>　
<a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=2"><font color="#000">应用</font></a>　
<a href="fenlei.jsp" TEXT-DECORATION:"underline"; ><font color="#CC0000"  style="TEXT-DECORATION: underline">分类</font></a>　
<a href="showByScoreAndDown.action?appTmp.showByScoreAndDownCurrentPage=1"><font color="#000">排行榜</font></a>　
<a href="guanyu.jsp"><font color="#000">关于</font></a></div>
<div class="fcc">
  <hr />
</div>

<s:iterator value="#request['app']" id="app">
<div  class="fc2-11">
<div class="fc211"><a href="specificInformation.action?apkId=<s:property value="#app.appInfo.id"/>"><img src="<%=request.getContextPath() %><s:property value="#app.appSou.logo1"/>"  width="50px" height="50px" /></a></div>
<div class="fc212"><a href="specificInformation.action?apkId=<s:property value="#app.appInfo.id"/>"><s:property value="#app.appInfo.appName" /></a><br />
  <p class="xinxi"><span>下载：<s:property value="#app.appAut.amountOfDown" />次</span><span>大小:<s:property value="#app.appSou.packgeSize" />MB</span></p> 
</div>
<div class="fc213"><a href="downApk.action?appSouId=<s:property value="#app.appSou.id" />&downPath=<s:property value="#app.appSou.packge" escape='false'/>" ><img src="pic/an.gif"  width="55" height="23" /></a></div>
<div class="fc214"><hr /><a href="specificInformation.action?apkId=<s:property value="#app.appInfo.id"/>">游戏简介：<s:property value="#app.appInfo.appIntrodution" /></a></div>
</div>
</s:iterator>
<div>
<ul class="page">
    <s:set name="page" value="#request.page"/>
       <s:if test="#page.hasPrevious">
       <li><a href="showByCategory.action?appTmp.showByCategoryCurrentPage=<s:property value="#page.currentPage-1"/>&category=<s:property value="#request.category"/>">上一页</a>
		</li>
		</s:if>
       <s:if test="#page.hasNext">
       <li><a href="showByCategory.action?appTmp.showByCategoryCurrentPage=<s:property value="#page.currentPage+1"/>&category=<s:property value="#request.category"/>">下一页</a></li>
       </s:if>
     </ul>
     </div>
 <div class="fc3q">
 <a href="index.jsp"><font color="#fff">首页</font></a>｜
 <a href="fenlei.jsp"><font color="#fff">分类</font></a>｜
 <a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=1"><font color="#fff">游戏</font></a>｜
 <a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=2"><font color="#fff">应用</font></a>｜
 <a href="showByScoreAndDown.action?appTmp.showByScoreAndDownCurrentPage=1"><font color="#fff">排行</font></a>｜
 <a href="guanyu.jsp"><font color="#fff">关于</font></a></div>
<div align="center"><br />
  <span class="STYLE1">&copy;2010-2014中国联通 版权所有</span></div>

<span class="STYLE1">

</span>


<%@ include file="cs.jsp" %>
<%CS cs = new CS(1252900022);cs.setHttpServlet(request,response);
String imgurl = cs.trackPageView();%> 
<img src="<%= imgurl %>" width="0" height="0"  />
</body>
</html>
