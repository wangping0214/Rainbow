<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>柴米游戏-中国第一手游杂志</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/hdfengmian.js"></script>
<style type="text/css">
*{ margin:0; padding:0;}
.fc{
	color: #000000;
	font-family: "微软雅黑";
	line-height: 2;
	margin-top: 5px;
}
.fc2{
	color: #fff;
	font-family: "微软雅黑";
	font-size: 15px;
	line-height: 1.5;
	font-weight: bold; 
}
.fc3q{
	color: #FFFFFF;
	font-family: "微软雅黑";
	margin-top: 1px;
	background-color: #70c570;
	text-align: center;
	height: 39px;
	border-width: bold;
	font-size: 12px;
	background-image: url(newpic/ssbg000.gif);
	line-height:39px;
	margin-bottom:5px;
}
.fc3{
	color: #C00;
	font-family: "微软雅黑";
	margin-top: 1px;
	background-color: #1F1F1F;
	text-align: center;
}

.fc2177{
		background-color:fff;
}

a:link{text-decoration:none ; color:#fff ;}
a:visited {text-decoration:none ; color:#fff ;}
a:hover {text-decoration:underline ; color:#fff ;}
a:active {text-decoration:none ; color:#fff ;}
.STYLE1 {color: #FFFFFF; padding-bottom:10px;}
img{ vertical-align:middle;}

.PopupLayer{width:100%;position:absolute;left:0; top:60px; margin-top:60px;background-clip:padding-box;border-radius:10px;border-top:10px solid #666;border-bottom:10px solid #666;border-top:20px solid rgba(65, 65, 65, 0.8);border-bottom:20px solid rgba(65, 65, 65, 0.8);}
.PopupLayer a.close{display:block;width:30px;height:30px;float:right;overflow:hidden; color:#000; font-size:28px; position:absolute; right:0px; top:-25px;}
.PopupLayer a.close{display:block;width:30px;height:28px;float:right;overflow:hidden; color:#000; font-size:28px; position:absolute; right:0px; top:-25px;}
.PopupLayer a.close:hover{background-position:-30px;}
.PopupLayer p{font:13px "宋体";line-height:30px;letter-spacing:0.1em;margin-top:35px;}
.PopupLayer p span{color:#7d7d7d;}

.PopupLayer ul li a{display:block;}
.PopupLayer a.btn{display:block;width:100px;height:38px;line-height:38px;text-align:center;color:#fff;font-weight:bold;letter-spacing:0.1em;float:right;background:url(images/btn_bg.jpg) repeat-x;border-radius:8px;margin:40px 30px 0 0;}
</style>
</head>

<body bgcolor="#000">
<div class="fc2177"> <font color="#000"><a href="http://iread.wo.com.cn/zz/3g/index.aspx"><img src="newpic/top.jpg" border="0"  width="100%" /></a></font></div>
<div style="background-color:#FFFFFF">
<div class="fc2"><table height="43" align="center" cellspacing="0" background="newpic/ssbg0.gif" class="clearit" style="width:100%; background-color: #70c570;">
  <tr>
    <td><div align="center" style="background:url(newpic/ssbg.png) no-repeat center bottom; margin-top:2px; height:42px; line-height:43px;"><a href="index.jsp">封面</a></div></td>
    <td width="1">│</td>
    <td><div align="center"><a href="mulu.jsp">目录</a></div></td>
    <td width="1">│</td>
    <td><div align="center"><a href="wangqi.jsp">往期 </a></div></td>
    <td width="1">│</td>
	<td><div style="background:url(newpic/ssbg00.gif) repeat-x top; height:43px; line-height:43px; color:#FFF; margin:0 10%;" align="center"><a href="showByRecomLevel.action?appTmp.showByRecomLevelCurrentPage=1">游戏&amp;应用</a></div>
      </td>
    <td width="1" >│</td>
	<td><div align="center"><a href="active.html"><font color="#FFFFFF" style="font-weight:bold">暑期活动</font></a>　</div></td>
    <td width="1"></td>
  </tr>
</table></div>
<div class="fc"><a href="mulu.jsp"><img src="image/z-14.jpg" alt="" width="100%" usemap="#Map" border="0"/></a>
 
</div>
</div>
<div class="fc3q">
<a href="index.jsp"><font color="#FFFFFF">首页</font></a>｜
<a href="fenlei.jsp"><font color="#FFFFFF">分类</font></a>｜
<a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=1"><font color="#FFFFFF">游戏</font></a>｜
<a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=2"><font color="#FFFFFF">应用</font></a>｜
<a href="showByScoreAndDown.action?appTmp.showByScoreAndDownCurrentPage=1"><font color="#FFFFFF">排行</font></a>｜
<a href="guanyu.jsp"><font color="#FFFFFF">关于</font></a></div>
<div align="center">
  <span class="STYLE1"><script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1000456710'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1000456710' type='text/javascript'%3E%3C/script%3E"));</script>&copy;2010-2014中国联通 版权所有</span></div>
  
<div class="PopupLayer">
	<a class="close" href="javascript:void(0);">×</a>
	<ul>
		<li><a href="active.html" title="我要答题"><img src="image/hd_03s.jpg" width="100%" /></a></li>
	</ul>
</div><!--PopupLayer end-->
  
<%@ include file="cs.jsp" %>
<%CS cs = new CS(1252900022);cs.setHttpServlet(request,response);
String imgurl = cs.trackPageView();%> 
<img src="<%= imgurl %>" width="0" height="0"  />
</body>
</html>
