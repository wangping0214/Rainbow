
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
*{ padding:0; margin:0;}
#c{

    background-color:#F9f9f9;
	height:auto;
	padding-bottom:20px;
	height:100%
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
	line-height: 1.5;
	height: 90px;
	padding-top:10px;
	border-bottom:#d7d3c9 solid 1px;
	margin-bottom:1px;
	background:#f5f1e7;color:#333;
	
}
.fc211{
	color: #666;
	font-family: "微软雅黑";
	font-size: 14px;
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
	margin-top: -52px;
	line-height: 1.5;
	height: 50px;
	margin-left: 70px;
	width: 50%;
}
.fc213{
	color: #666;
	font-family: "微软雅黑";
	font-size: 14px;
	margin-top: -40px;
	line-height: 1.5;
	height: 50px;
	width: 60px;

	float: right;
	margin-right:20px; display:inline;
}
.fc214{
	color: #666;
	font-family: "微软雅黑";
	font-size: 14px;
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
a img{ border:0;}
body {
	background-color: #fff;
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
.xinxi b{ padding-right:5px; color:#6c6c6c}
.xinxi i{ font-size:24px; color:#F00;}
</style>
</head>

<body>
<div id="c">
<div class="fcc">
  <img src="image/ts_01.jpg" width="100%" height="" border="0" />
</div>
<s:iterator value="#request['app']" id="app">
<div  class="fc2-11">
<div class="fc211"><a href="downApk.action?appSouId=<s:property value="#app.appSou.id" />&downPath=<s:property value="#app.appSou.packge" escape='false'/>"><img src="<%=request.getContextPath() %><s:property value="#app.appSou.logo1"/>" width="50px" height="50px" /></a></div>
<div class="fc212"><a href="downApk.action?appSouId=<s:property value="#app.appSou.id" />&downPath=<s:property value="#app.appSou.packge" escape='false'/>"><b><s:property value="#app.appInfo.appName" /></b><img src="newpic/up.gif" width="19" height="21" /></a><br />
   <p class="xinxi"><b>中奖几率</b> <i>+50%</i></p>  
</div>
<div class="fc213"><a href="downApk.action?appSouId=<s:property value="#app.appSou.id" />&downPath=<s:property value="#app.appSou.packge" escape='false'/>"><img src="image/ts_05.jpg"  width="50" height="27"/></a></div>
</div>
</s:iterator>


<div><img src="image/ts_08.jpg" width="100%" /></div>
<div><a href="showByRecomLevel?appTmp.showByRecomLevelCurrentPage=1"><img src="image/ts_09.jpg" width="50%"></a><a href="showByRecomLevel?appTmp.showByRecomLevelCurrentPage=1"><img src="image/ts_10.jpg" width="50%"></a></div> 
</div>



</body>
</html>
