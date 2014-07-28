<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>游戏应用－柴米游言－中国第一手游杂志</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/banner.js"></script>
<style type="text/css">
*{ padding:0; margin:0;}
#c{

    background-color:#F9f9f9;
	height:auto;
	padding-bottom:20px;
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
.fc2177{
		background-color:fff;
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
	background-image: url(image/w1.png); height:43px; overflow:hidden; zoom:1;
}
.fc3q{
	color: #FFFFFF;
	font-family: "微软雅黑";
	margin-top: 1px;
	background-color: #70c570;
	text-align: center;
	height: 30px;
	border-width: bold;
	font-size: 12px;
	background-image: url(newpic/ssbg000.gif);
	line-height:30px;
	margin-bottom:5px; margin-top:10px;
}
img{ vertical-align:middle;}
.fc2-1{
	color: #000;
	font-family: "微软雅黑";
	font-size:14px;
	height:30px; background:#ececec;
	margin-top: 1px;
	line-height:1.5;

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
		border:#fff 1px solid;background:#fff;color:#333;
	filter:progid:DXImageTransform.Microsoft.Shadow(color=#909090,direction=120,strength=4);/*ie*/
-moz-box-shadow: 1px 1px 5px #909090;/*firefox*/
-webkit-box-shadow: 1px 1px 5px #909090;/*safari或chrome*/
box-shadow:1px 1px 5px #909090;/*opera或ie9*/
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
	margin-top: -40px;
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
	margin-top: 15px;
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
		background-color:fff;
			font-family: "微软雅黑";
}

a:link{text-decoration:none ; color:#000 ;}
a:visited {text-decoration:none ; color:#000 ;}
a:hover {text-decoration:underline ; color:#000 ;}
a:active {
	text-decoration: none;
	color: #fff;
}
body {
	background-color: #000000;
}
.STYLE1 {color: #FFFFFF; padding-bottom:10px;}
.circle {
height: 16px;
width: 40px;
text-align: center;
background-color:#FFa202;
border-radius: 15px;
	line-height:1;
	margin-top: 0px;
}
.xinxi span{ padding-right:5px;}
/*清浮动*/
.clearfix:after{content:"";display:block;clear:both;}
.clearfix{zoom:1;}
/* banner */
.banner{width:100%;position:relative;overflow:hidden;margin:0 auto}
.banner-btn{display:none;}
.banner-img{font-size:0;*word-spacing:-1px;/* IE6、7 */ letter-spacing:-3px;position:relative;}
.banner-img li{ width:50%;display:inline-block;*display:inline;*zoom:1;/* IE6、7 */ vertical-align:top;letter-spacing:normal;word-spacing:normal;font-size:12px;}
.banner-img li img{ display:block; width:100%;}
.banner-circle{position:absolute;left:50%;bottom:6px;height:13px;text-align:center;font-size:0;border-radius:10px;background:rgba(255,255,255,0.3);filter:alpha(opacity:30);}
.banner-circle li{border-radius:10px;margin:2px;display:inline-block;display:-moz-inline-stack;vertical-align:middle;zoom:1;}
.banner-circle li a{display:block;padding-top:9px;width:9px;height:0;border-radius:50%;background:#B7B7B7;overflow:hidden;}
.banner-circle .selected a{background:#F40;}
</style>

</head>

<body>
<div id="c">
  <div class="fc2177"> <font color="#fff"><img src="newpic/logo.jpg" border="0" /></font> </div>

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
<div class="fc2-1">
<table width="320" height="29" border="0">
  <tr>
    <td width="45" height="25"><div class="circle">
    <a href="showByRecomLevel.action?appTmp.showByRecomLevelCurrentPage=1"><font color="#fff">推荐</font></a></div></td>
    <td width="45"><a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=1"><font color="#000">游戏</font></a></td>
    <td width="45"><a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=2"><font color="#000">应用</font></a></td>
    <td width="45"><a href="fenlei.jsp"><font color="#000">分类</font> </a></td>
    <td width="45"><a href="showByScoreAndDown.action?appTmp.showByScoreAndDownCurrentPage=1"><font color="#000">排行榜</font></a></td>
	<td width="45"><a href="guanyu.jsp"><font color="#000">关于</font></a></td>
  </tr>
</table>
</div>
<div class="fcc">
  <div class="banner">
	<ul class="banner-img">
		<li><a href="active.html"><img src="image/banner.jpg" width="100%" /></a></li>
		<li><a href="indexAd/DJDouDiZhu_RainBow.apk"><img src="image/banner2.jpg" width="100%" /></a></li>
	</ul>
	<ul class="banner-circle"></ul>
</div>

<s:iterator value="#request['app']" id="app">
<div  class="fc2-11">
<div class="fc211"><a href="specificInformation.action?apkId=<s:property value="#app.appInfo.id"/>"><img src="<%=request.getContextPath() %><s:property value="#app.appSou.logo1"/>"  width="50px" height="50px" /></a></div>
<div class="fc212"><a href="specificInformation.action?apkId=<s:property value="#app.appInfo.id"/>"><s:property value="#app.appInfo.appName" /></a><img src="pic/j.gif"  width="18" height="18" /> <img src="image/mll.gif" width="40" height="18" class="jian" /><br />
  <p class="xinxi"><span>
  下载:<s:if test="#app.appAut.amountOfDown>10000">
  <s:property value="#app.appAut.amountOfDown/10000+'.'+(#app.appAut.amountOfDown-(#app.appAut.amountOfDown/10000)*10000)/1000" />
万次
  </s:if>
  <s:else><s:property value="#app.appAut.amountOfDown" />次</s:else>
  </span><br /><span>大小:<s:property value="#app.appSou.packgeSize" />MB</span></p> 
</div>
<div class="fc213"><a href="downApk.action?appSouId=<s:property value="#app.appSou.id" />&downPath=<s:property value="#app.appSou.packge" escape='false'/>" ><img src="pic/as_06.jpg"  width="55" height="23" /></a></div>
<div class="fc214"><hr /><a href="specificInformation.action?apkId=<s:property value="#app.appInfo.id"/>">
游戏简介：<s:if test="#app.appInfo.appIntrodution.length()>40">
<s:property value="#app.appInfo.appIntrodution.substring(0, 40) + \"...\"" />
</s:if>
<s:else>
<s:property value="#app.appInfo.appIntrodution" />
</s:else>
</a></div>
</div>
</s:iterator>
<div>
<ul class="page">
    <s:set name="page" value="#request.page"/>
       <s:if test="#page.hasPrevious">
       <li><a href="showByRecomLevel.action?appTmp.showByRecomLevelCurrentPage=<s:property value="#page.currentPage-1"/>">上一页</a>
		</li>
		</s:if>
       <s:if test="#page.hasNext">
       <li><a href="showByRecomLevel.action?appTmp.showByRecomLevelCurrentPage=<s:property value="#page.currentPage+1"/>">下一页</a></li>
       </s:if>
     </ul>
     </div>




 
</div>
<div class="fc3q">
<a href="index.jsp">
<font color="#FFFFFF">首页</font></a>｜
<a href="fenlei.jsp"><font color="#FFFFFF">分类</font></a>｜
<a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=1"><font color="#FFFFFF">游戏</font></a>｜
<a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=2"><font color="#FFFFFF">应用</font></a>｜
<a href="showByScoreAndDown.action?appTmp.showByScoreAndDownCurrentPage=1"><font color="#FFFFFF">排行</font></a>｜
<a href="guanyu.jsp"><font color="#FFFFFF">关于</font></a>
<img src="newpic/seach.gif" width="117" height="24" /></div>
<div align="center">
  <span class="STYLE1">&copy;2010-2014中国联通 版权所有</span></div>


<%@ include file="cs.jsp" %>
<%CS cs = new CS(1252900022);cs.setHttpServlet(request,response);
String imgurl = cs.trackPageView();%> 
<img src="<%= imgurl %>" width="0" height="0"  />
</body>
</html>
