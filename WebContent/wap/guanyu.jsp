<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>游戏应用－柴米游言－中国第一手游杂志</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<style type="text/css">
*{ margin:0; padding:0;}
#c{
	background-color: #FFFFFF;
	height: auto;
	padding-bottom:10px;
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
.fc2177{
		background-color:#F9F9F9;
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
	margin-top: 0px;
	line-height: 1.5;
	font-weight: bold;
	height:43px; overflow:hidden; zoom:1; 
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
	margin-top:10px;
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
	color: #000000;
	font-family: "微软雅黑";
	font-size: 16px;
	background-color: #FFF;
	margin-top: 1px;
	line-height: 1.5;
	height: auto;
	margin-left: 10px;
	margin-right: 10px;padding-bottom:20px;
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
	color: #666;
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

a:link{text-decoration:none ; color:#fff ;}
a:visited {text-decoration:none ; color:#fff ;}
a:hover {text-decoration:underline ; color:#fff ;}
a:active {
	text-decoration: none;
	color: #000;
}
body {
	background-color: #000000;
}
.STYLE1 {color: #990000; font-size:14px;}
.STYLE2 {color: #FFFFFF; margin-bottom:10px; font-size:12px; margin-top:5px;}
.circle {
height: 16px;
width: 40px;
text-align: center;
background-color:#FFa202;
border-radius: 15px;
	line-height:1;
	margin-top: 0px;
}
.banquan{ background:#ececec; border-bottom:solid 1px #dcdcdc; border-top:solid 1px #dcdcdc; padding:10px;font-family: "微软雅黑"; line-height:1.5}
.youxiang{ clear:both; overflow:hidden; zoom:1;}
.youxiang p{ float:left;}
.youxiang a{ float:right;}
</style>
</head>

<body>
<div id="c"> 
<div class="fc2177"> <font color="#fff"><img src="newpic/logo.jpg" border="0" /></font> </div>

<div class="fc2"><table height="43" align="center" cellspacing="0" background="newpic/ssbg0.gif" class="clearit" style="width:100%; background-color: #70c570;">

  <tr>
    <td><div align="center"><a href="index.jsp"><font color="#FFFFFF" style="font-weight:bold">封面</font></a></div></td>
    <td width="1"><font color="#FFFFFF">│</font></td>
    <td><div align="center"><a href="mulu.jsp"><font color="#FFFFFF" style="font-weight:bold">目录</font></a></div></td>
    <td width="1"><font color="#FFFFFF">│</font></td>
    <td ><div align="center"><a href="wangqi.jsp"><font color="#FFFFFF" style="font-weight:bold">往期</font> </a></div></td>
    <td width="1"><font color="#FFFFFF">│</font></td>
	<td><div style="background:url(newpic/ssbg00.gif) repeat-x bottom; height:43px; line-height:43px; color:#FFF; margin:0 10%; color:#FFF" align="center"><a href="tuijian.jsp"><font color="#FFFFFF" style="background:url(newpic/ssbg_03.jpg) no-repeat center bottom;font-weight:bold; display:block; height:42px; padding-top:1px;">游戏&amp;应用</font></a></div>
      </td>
    <td width="1" ><font color="#FFFFFF">│</font></td>
	<td><div align="center"><a href="active.html"><font color="#FFFFFF" style="font-weight:bold">暑期活动</font></a>　</div></td>
    <td width="1"></td>
  </tr>
</table></div>
<div class="fc2-1">
<table width="320" height="29" border="0">
  <tr>
    <td width="45" height="25"><a href="showByRecomLevel.action?appTmp.showByRecomLevelCurrentPage=1"><font color="#000">推荐</font></a></td>
    <td width="45"><a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=1"><font color="#000">游戏</font></a></td>
    <td width="45"><a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=2"><font color="#000">应用</font></a></td>
    <td width="45"><a href="fenlei.jsp"><font color="#000">分类</font> </a></div></td>
    <td width="45"><a href="showByScoreAndDown.action?appTmp.showByScoreAndDownCurrentPage=1"><font color="#000">排行榜</font></a></td>
	<td width="45"><div class="circle"><a href="guanyu.jsp"><font color="#000"><font color="#fff">关于</font></a></td>
  </tr>
</table>
</div>

<div  class="fc2-11"><img src="newpic/ban1.jpg" width="100%" /><br /> 
<br /> 
<center><font color="#ec552f" size="+1">"让生活变得容易 让梦想变得简单"</font></center><br />
    
       "柴米游戏"的梦想，是让所有手机用户的生活更为<font color="#33FFCC">鲜活</font>、<font color="#FFCC00">便利</font>、<font color="#99CC33">充实</font>。<br />
 恰如其名，柴米是生活的必需品，而应用、游戏、多媒体则是手机的必需品。"柴米游戏"就是为您提供这些必须品的平台，我们不吝啬给予，你们也不必吝啬索取。<br />
    "立志欲坚不欲锐，成功在久不在速"是我们的核心理念。秉承着坚定而长久的为用户提供服务的信念是我们的宗旨。接受与采纳用户意见是我们成长的源泉。所以，我们会始终保持谦逊、诚恳的服务态度，效率、激情的工作状态。<br />
    "柴米游戏"会成为您生活的顶级执事，我们强大而忠诚、睿智而真诚！<br />
  
 </div>

<div class="banquan"> &nbsp;<span class="STYLE1"><font color="#71c5d3">版权声明：[         柴米游戏平台]          [          柴米游言杂志]所有内容由北京五彩时空科技有限公司制作编辑，请尊重知识产权和我们的劳动成果。如本站中内容无意侵权，请立即通知我们，我们会及时解决。
</font><br /></span>
   <div class="youxiang">
    <p>
       <font color="#FFCC00">反馈邮箱fk@chaimiyouxi.com</font><br />
       <font color="#99CC33">商务合作frank@chaimiyouxi.com</font>
    </p>
    <a href="#"><img src="newpic/slogo.gif" width="40" height="46" /></a>
   </div>

  </div>
</div>
<div class="fc3q"><a href="index.jsp">首页</a>｜<a href="fenlei.jsp">分类</a>｜<a href="youxi.jsp">游戏</a>｜<a href="yingyong.jsp">应用</a>｜<a href="paihang.jsp">排行</a>｜<a href="guanyu.jsp">关于</a><img src="newpic/seach.gif" width="117" height="24" /></div>
<div align="center" class="STYLE2">&copy;2010-2014中国联通 版权所有</div>




</body>
</html>
