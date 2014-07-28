<%@ page import="com.rainbow.server.App" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>柴米游戏</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="js/jquery-1.2.6.pack.js"></script>





<style type="text/css">
*{ margin:0; padding:0;}
body, html {
scrollbar-face-color: #353535;
scrollbar-shadow-color: #565656;
scrollbar-highlight-color: #565656;
scrollbar-3dlight-color: #7F7F7F;
scrollbar-darkshadow-color: #565656;
scrollbar-track-color: #565656;
scrollbar-arrow-color: #DADADA;  } 
.gamepic{white-space:nowrap;}
#c{

    background-color:#fff;
	height:auto;
	
}
.fc{
	color: #000;
	font-family: "微软雅黑";
	margin-top: 20px;
 
	line-height:1.5;
}
.fc2s{ margin-left:5px;

}
.fc3{
	color: #C00;
	font-family: "微软雅黑";
	margin-top: 2px;
	font-size: 16px;
	font-weight: bold;
	margin-left:5px;
}
.fcz{
	color: #C00;
	font-family: "微软雅黑";
	margin-top:-5px;
	font-weight: bold;
	font-size: x-large;
	margin-left: 50px;
	float: left;
}
.fcy{
	color: #C00;
	font-family: "微软雅黑";
	margin-top: -5px;
	font-weight: bold;
	font-size: x-large;
	float: right;
	margin-right: 50px;
}
.fc1{
	color: #fff;
	font-family: "微软雅黑";
	margin-top: 1px;
 
	line-height: 2;
	margin-left: 0px;
	background-color: #CC0000;
}

.fc2-0{
	color: #fff;
	font-family: "微软雅黑";
	font-size: 14px;
	margin-left: 0px;
	margin-top: 1px;
	line-height: 1.5;
	font-weight: bold;
	background-image: url("image/w1.png")/*tpa=http://www.chaimiyouxi.com/image/w1.png*/; 
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
.fc2-1{
	color: #000;
	font-family: "微软雅黑";
	font-size:14px;
	height:30px; background:#ececec;
	margin-top: 1px;
	line-height:1.5;

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
	margin-bottom:5px;
}

.fc2-11{
	color: #666;
	font-family: "微软雅黑";
	font-size: 14px;
	background-color: #FFF;
	margin-top: 10px;
	line-height: 1.5;
	height: 100px;
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
	font-size: 16px;
	background-color: #FFF;
	margin-top: -50px;
	line-height: 1.5;
	height: 50px;
	margin-left: 70px;

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
.fc2177{
	background-image: url("image/t.jpg")/*tpa=http://www.chaimiyouxi.com/image/t.jpg*/; 
		background-color:fff;
}
#form1 textarea{margin-bottom: 5px;}

a {text-decoration: none}
body {
	background-color: #000000;
}
.STYLE1 {color: #FFFFFF}
.fc2177{
		background-color:#F9F9F9;
}
.circle {
height: 16px;
width: 40px;
text-align: center;
background-color:#FFa202;
border-radius: 15px;
	line-height:1;
	margin-top: 0px;
}
.STYLE1 {color: #FFFFFF; padding-bottom:10px;}

</style>
<script src="<%=request.getContextPath()%>/scripts/jquery.min.js" type="text/javascript"></script>
<link href="css.css" rel="stylesheet" type="text/css" />

</head>
<body>
<div id="c">
<div class="fc2177"> <font color="#000"><a href="http://iread.wo.com.cn/zz/3g/index.aspx"><img src="newpic/top.jpg" border="0"  width="100%" /></a></font></div>

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
    <td width="45" height="25"><a href="showByRecomLevel.action?appTmp.showByRecomLevelCurrentPage=1"><font color="#000">推荐</font></a></td>
    <td width="45"><div class="circle"><a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=1"><font color="#fff">游戏</font></a></div></td>
    <td width="45"><a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=2"><font color="#000">应用</font></a></td>
    <td width="45"><a href="fenlei.jsp"><font color="#000">分类</font> </a></td>
    <td width="45"><a href="showByScoreAndDown.action?appTmp.showByScoreAndDownCurrentPage=1"><font color="#000">排行榜</font></a></td>
	<td width="45"><a href="guanyu.jsp"><font color="#000">关于</font></a></td>
  </tr>
</table>
</div>
<div class="fcc">
  <hr />
</div>
<%App app = (App)session.getAttribute("app"); %>
<div  class="fc2-11">
<div class="fc211"><img src="<%=request.getContextPath()+app.getAppSou().getLogo2() %>"  width="50px" height="50px" /></div>
<div class="fc212"><p><span class="fl mingcheng"><%=app.getAppInfo().getAppName() %></span>
<a href="downApk.action?appSouId=<%=app.getAppSou().getId() %>&downPath=<%=app.getAppSou().getPackge() %>" class="fr"><img src="pic/an.gif"  width="55" height="22" /></a></p>
  <p class="xinxi clear"><span>下载：<%=app.getAppAut().getAmountOfDown() %>次</span><span>大小:<%=app.getAppSou().getPackgeSize() %>MB</span></p> 
</div>
<div class="illustrate"><p class="cut">游戏类型</p>
<p class="grade">
<%if(app.getAppInfo().getSecurity().charAt(2)=='0'){ %><img src="image/wd.jpg"/>
<%}
if(app.getAppInfo().getSecurity().charAt(0)=='0'){%><img src="image/wgg.jpg"/>
<%}
if(app.getAppInfo().getSecurity().charAt(4)=='0'){%><img src="image/ys.jpg"/>
<%}
 if(app.getAppInfo().getSecurity().charAt(6)=='0'){%><img src="image/gf.jpg"/>
 <%} %>
 </p>
 </div>


</div>

<div class="gamepic"  style="overflow:scroll; height: 220px; ">
<span class="gamepic" style="overflow:scroll; height: 220px;">
<%if(app.getAppSou().getGamePhoto1()!=null){ %>
<img name="" src="<%=request.getContextPath()+app.getAppSou().getGamePhoto1() %>"  width="" height="200" alt="" />
<%}
if(app.getAppSou().getGamePhoto2()!=null){%>
<img name="" src="<%=request.getContextPath()+app.getAppSou().getGamePhoto2() %>"  width="" height="200" alt="" />
<%}
if(app.getAppSou().getGamePhoto3()!=null){%>
<img name="" src="<%=request.getContextPath()+app.getAppSou().getGamePhoto3() %>"  width="" height="200" alt="" />
<%}
if(app.getAppSou().getGamePhoto4()!=null){%>
<img name="" src="<%=request.getContextPath()+app.getAppSou().getGamePhoto4() %>"  width="" height="200" alt="" />
<%}
if(app.getAppSou().getGamePhoto5()!=null){%>
<img name="" src="<%=request.getContextPath()+app.getAppSou().getGamePhoto5() %>"  width="" height="200" alt="" />
<%} %>
</span></div>


<div id="select" class="m" clstag="thirdtype|keycount|thirdtype|select">
<dl id="select-brand">
<dt>应用简介：</dt>
<dd>
<div class="content" style="height:130px;">
<p><%=app.getAppInfo().getAppIntrodution() %></p>
</div>
<span id="select-hold" class="close"><b></b>展开</span>

</dd>
</dl>
<dl id="select-brand1">
<dt>版本更新：</dt>
<dd>
<div class="content" style="height:130px;">
<p><%=app.getAppInfo().getVersionIntrodution() %></p>
</div>
<span id="select-hold1" class="close"><b></b>展开</span>
</dd>
</dl>
</div>
<!--select-->

<div class="fc3">
 <hr />
  <p>评论</p>
</div>
<div class="fc2s">
  <form id="form1" name="form1" method="post" action="">
    <label>
      <textarea name="textarea" cols="35" rows="8">欢迎光临柴米游戏，暂不接受评论！</textarea>
      </label>
    <p class="fabu"><input type="button" value="发布评论" /></p>
  </form>
</div>
<hr />

<!--other-->

<!--otherapply-->
<map name="Map" id="Map">
  <area shape="rect" coords="290,1181,497,1271" href="#" target="index.jsp" alt="" />
  <area shape="rect" coords="37,259,460,317" href="#" target="1.htm" alt="" />
</map>
</div></div>
<div class="fc3q">
<a href="index.jsp"><font color="#FFFFFF">首页</font></a>｜
<a href="fenlei.jsp"><font color="#FFFFFF">分类</font></a>｜
<a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=1"><font color="#FFFFFF">游戏</font></a>｜
<a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=2"><font color="#FFFFFF">应用</font></a>｜
<a href="showByScoreAndDown.action?appTmp.showByScoreAndDownCurrentPage=1"><font color="#FFFFFF">排行</font></a>｜
<a href="guanyu.jsp"><font color="#FFFFFF">关于</font></a>
</div>
<div align="center">
  <span class="STYLE2 STYLE1">&copy;2010-2014中国联通 版权所有</span></div>
  
<script type="text/javascript">
(function() { var b = $("#select-brand .tab"), f = $("#select-brand .content"), h = $("#select-hold"), c = b.find(".curr").attr("rel"), g = "46px", a; var d = 0, i = 0, e = (screen.width >= 1200) ? 6 : 5; i = Math.ceil(f.children().size() / e); d = (f.children().outerHeight()) ; if (d > parseInt(g)) { f.css("height", g); h.html("<b></b>展开").attr("class", "close") } else { h.html("<b></b>收起").attr("class", "open") } h.bind("click", function() { if ($(this).attr("class") != "open") { f.css("height", "auto"); h.html("<b></b>收起").attr("class", "open") } else { f.css("height", g); h.html("<b></b>展开").attr("class", "close") } }); b.find("li").bind("mouseover", function() { var j = $(this); a = setTimeout(function() { if (j.attr("rel") == c) { return } b.find("li").eq(c).removeClass("curr"); j.addClass("curr"); c = j.attr("rel"); f.css("height", "auto"); h.hide(); f.find("div").each(function() { if (c == 0) { $(this).show() } else { $(this).hide(); if ($(this).attr("rel") == c) { $(this).show() } } }) }, 500) }).bind("mouseout", function() { clearTimeout(a) }) })();
</script>
<script type="text/javascript">
(function() { var b = $("#select-brand1 .tab"), f = $("#select-brand1 .content"), h = $("#select-hold1"), c = b.find(".curr").attr("rel"), g = "46px", a; var d = 0, i = 0, e = (screen.width >= 1200) ? 6 : 5; i = Math.ceil(f.children().size() / e); d = (f.children().outerHeight()) * i; if (d > parseInt(g)) { f.css("height", g); h.html("<b></b>展开").attr("class", "close") } else { h.html("<b></b>收起").attr("class", "open") } h.bind("click", function() { if ($(this).attr("class") != "open") { f.css("height", "auto"); h.html("<b></b>收起").attr("class", "open") } else { f.css("height", g); h.html("<b></b>展开").attr("class", "close") } }); b.find("li").bind("mouseover", function() { var j = $(this); a = setTimeout(function() { if (j.attr("rel") == c) { return } b.find("li").eq(c).removeClass("curr"); j.addClass("curr"); c = j.attr("rel"); f.css("height", "auto"); h.hide(); f.find("div").each(function() { if (c == 0) { $(this).show() } else { $(this).hide(); if ($(this).attr("rel") == c) { $(this).show() } } }) }, 500) }).bind("mouseout", function() { clearTimeout(a) }) })();
</script>
<%@ include file="cs.jsp" %>
<%CS cs = new CS(1252900022);cs.setHttpServlet(request,response);
String imgurl = cs.trackPageView();%> 
<img src="<%= imgurl %>" width="0" height="0"  />
</body>
</html>
