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
.fc2{
	color: #009;
	font-family: "微软雅黑";
	font-size: large;
	margin-left: 0px;
	margin-top: 30px;
	line-height:1.5;

}
.fc3{
	color: #C00;
	font-family: "微软雅黑";
	margin-top: 2px;
	font-size: 16px;
	font-weight: bold;
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
.fc2{
	color: #fff;
	    background-color:#FFFFFF;
	font-family: "微软雅黑";
	font-size:18px;
 
	margin-top: 5px;
	line-height:1.5;
	font-weight:bold;
	 margin-left:2%;

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
.fc3q{
	color: #FFFFFF;
	font-family: "微软雅黑";
	margin-top: 1px;
	background-color: #1F1F1F;
	text-align: center;
	background-image: url("image/w1.png")/*tpa=http://www.chaimiyouxi.com/image/w1.png*/;
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
</style>
<style type="text/css">
a {text-decoration: none}
body {
	background-color: #000000;
}
.STYLE1 {color: #FFFFFF}
</style>
<link href="css.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/scripts/jquery.min.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript"> 

</script>
</head>
<body>
<div id="c">
<div class="fc2177"> 
<font color="#000"><a href="javascript:if(confirm('http://iread.wo.com.cn/zz/3g/index.aspx  \n\n该文件无法用 Teleport Ultra 下载, 因为 它是一个域或路径外部被设置为它的启始地址的地址。  \n\n你想在服务器上打开它?'))window.location='http://iread.wo.com.cn/zz/3g/index.aspx'"><img src="image/wo-logo.png"  width="110" height="30" border="0" /></a></font> 柴米游戏－中国第一手游杂志</div>

<div class="fc2"><table height="46" align="center" cellspacing="0" background="newpic/ssbg0.gif" class="clearit" style="width:100%; background-color: #70c570;">
  <tr>
    <td><div align="center"><a href="index.jsp"><font color="#FFFFFF" style="font-weight:bold">封面</font></a></div></td>
    <td width="1"><font color="#FFFFFF">│</font></td>
    <td><div align="center"><a href="mulu.jsp"><font color="#FFFFFF" style="font-weight:bold">目录</font></a></div></td>
    <td width="1"><font color="#FFFFFF">│</font></td>
    <td ><div align="center"><a href="wangqi.jsp"><font color="#FFFFFF" style="font-weight:bold">往期</font> </a></div></td>
    <td width="1"><font color="#FFFFFF">│</font></td>
	<td><div style="background:url(newpic/ssbg00.gif) repeat-x top; height:43px; line-height:43px; color:#FFF; margin:0 10%; color:#FFF" align="center">
	<a href="showByRecomLevel.action?appTmp.showByRecomLevelCurrentPage=1"><font color="#FFFFFF" style="background:url(newpic/ssbg_03.jpg) no-repeat center bottom;font-weight:bold; display:block; height:43px;">游戏&amp;应用</font></a></div>
      </td>
    <td width="1" ><font color="#FFFFFF">│</font></td>
	<td><div align="center"><a href="active.html"><font color="#FFFFFF" style="font-weight:bold">暑期活动</font></a>　</div></td>
    <td width="1"></td>
  </tr>
</table></div>
<!--nav-->
<div class="fc2-1">
<a href="showByRecomLevel.action?appTmp.showByRecomLevelCurrentPage=1">　推荐</a>
<a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=1"><font color="#000"> <font color="#CC0000"  style="TEXT-DECORATION: underline">游戏</font></font></a>　
<a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=2"><font color="#000">应用</font></a>　<a href="fenlei.jsp" TEXT-DECORATION:"underline"; >分类 </a>　
<a href="showByScoreAndDown.action?appTmp.showByScoreAndDownCurrentPage=1"><font color="#000">排行榜</font></a>　
<a href="guanyu.jsp"><font color="#000">关于</font></a></div>
<div class="fcc">
  <hr />
</div>
<%App app = (App)session.getAttribute("app"); %>
<div  class="fc2-11">
<div class="fc211"><img src="<%=request.getContextPath()+app.getAppSou().getLogo1() %>"  width="50px" height="50px" /></div>
<div class="fc212">
<p><span class="fl mingcheng"><%=app.getAppInfo().getAppName() %></span><img src="image/mll.gif" />
<a href="downApk.action?appSouId=<%=app.getAppSou().getId() %>&downPath=<%=app.getAppSou().getPackge() %>"
id="id_downLoad" onclick="downApk.action?appSouId=<%=app.getAppAut().getId()%>" class="fr"><img src="pic/as_06.jpg"  width="55" height="22" />
</a></p>
<p class="xinxi clear"><span>下载：<%=app.getAppAut().getAmountOfDown() %>次</span><span>大小:<%=app.getAppSou().getPackgeSize() %>MB</span></p> 
</div>
<div class="illustrate">
<p class="cut">游戏类型</p>
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

<div class="gamepic"  style="overflow:scroll; height: 220px; overflow-x:hidden">
<span class="gamepic" style="overflow:scroll; height: 220px;">
<img name="" src="<%=request.getContextPath()+app.getAppSou().getGamePhoto1() %>"  width="" height="200" alt="" />
<img name="" src="<%=request.getContextPath()+app.getAppSou().getGamePhoto2() %>"  width="" height="200" alt="" />
<img name="" src="<%=request.getContextPath()+app.getAppSou().getGamePhoto3() %>"  width="" height="200" alt="" />
<img name="" src="<%=request.getContextPath()+app.getAppSou().getGamePhoto4() %>"  width="" height="200" alt="" />
<img name="" src="<%=request.getContextPath()+app.getAppSou().getGamePhoto5() %>"  width="" height="200" alt="" /></span></div>


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
<div class="fc2">
  <form id="form1" name="form1" method="post" action="">
    <label>
      <textarea name="textarea" cols="35" rows="8">欢迎光临柴米游戏，暂不接受评论！</textarea>
      </label>
    <p class="fabu"><input type="button" value="发布评论" /></p>
  </form>
</div>
<hr />

<!--otherapply-->
<map name="Map" id="Map">
  <area shape="rect" coords="290,1181,497,1271" href="#" target="index.jsp" alt="" />
  <area shape="rect" coords="37,259,460,317" href="#" target="1.htm" alt="" />
</map>
</div></div>
<div class="fc3q">
<a href="index.jsp"><font color="#fff">首页</font></a>｜
<a href="fenlei.jsp"><font color="#fff">分类</font></a>｜
<a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=1"><font color="#fff">游戏</font></a>｜
<a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=2"><font color="#fff">应用</font></a>｜
<a href="showByScoreAndDown.action?appTmp.showByScoreAndDownCurrentPage=1"><font color="#fff">排行</font></a>｜
<a href="guanyu.jsp"><font color="#fff">关于</font></a></div>
<div align="center"><br />
  <span class="STYLE2 STYLE1">&copy;2010-2014中国联通 版权所有</span></div>
  
<script type="text/javascript">
(function() { var b = $("#select-brand .tab"), f = $("#select-brand .content"), h = $("#select-hold"), c = b.find(".curr").attr("rel"), g = "46px", a; var d = 0, i = 0, e = (screen.width >= 1200) ? 6 : 5; i = Math.ceil(f.children().size() / e); d = (f.children().outerHeight()) ; if (d > parseInt(g)) { f.css("height", g); h.html("<b></b>展开").attr("class", "close") } else { h.html("<b></b>收起").attr("class", "open") } h.bind("click", function() { if ($(this).attr("class") != "open") { f.css("height", "auto"); h.html("<b></b>收起").attr("class", "open") } else { f.css("height", g); h.html("<b></b>展开").attr("class", "close") } }); b.find("li").bind("mouseover", function() { var j = $(this); a = setTimeout(function() { if (j.attr("rel") == c) { return } b.find("li").eq(c).removeClass("curr"); j.addClass("curr"); c = j.attr("rel"); f.css("height", "auto"); h.hide(); f.find("div").each(function() { if (c == 0) { $(this).show() } else { $(this).hide(); if ($(this).attr("rel") == c) { $(this).show() } } }) }, 500) }).bind("mouseout", function() { clearTimeout(a) }) })();
</script>
<script type="text/javascript">
(function() { var b = $("#select-brand1 .tab"), f = $("#select-brand1 .content"), h = $("#select-hold1"), c = b.find(".curr").attr("rel"), g = "46px", a; var d = 0, i = 0, e = (screen.width >= 1200) ? 6 : 5; i = Math.ceil(f.children().size() / e); d = (f.children().outerHeight()) * i; if (d > parseInt(g)) { f.css("height", g); h.html("<b></b>展开").attr("class", "close") } else { h.html("<b></b>收起").attr("class", "open") } h.bind("click", function() { if ($(this).attr("class") != "open") { f.css("height", "auto"); h.html("<b></b>收起").attr("class", "open") } else { f.css("height", g); h.html("<b></b>展开").attr("class", "close") } }); b.find("li").bind("mouseover", function() { var j = $(this); a = setTimeout(function() { if (j.attr("rel") == c) { return } b.find("li").eq(c).removeClass("curr"); j.addClass("curr"); c = j.attr("rel"); f.css("height", "auto"); h.hide(); f.find("div").each(function() { if (c == 0) { $(this).show() } else { $(this).hide(); if ($(this).attr("rel") == c) { $(this).show() } } }) }, 500) }).bind("mouseout", function() { clearTimeout(a) }) })();
</script>
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>

