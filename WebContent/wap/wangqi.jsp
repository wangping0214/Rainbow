<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>往期介绍－柴米游言－中国第一手游杂志</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

$(function(){
  $(".qimu:not(':first') .vcon").hide();
  $(".vtitle").click(function(){
	  $content=$(this).siblings(".vcon");
	  if($content.is(":visible")){
		 $content.slideUp("slow").parent(".qimu").siblings(".qimu").find(".vcon").slideDown("slow");
	     $(this).find("img").attr({src:"image/down.jpg"}) /*将一个"名/值"形式的对象设置为所有匹配元素的属性。*/

		  } 
		else{
		 $content.slideDown("slow").parent(".qimu").siblings(".qimu").find(".vcon").hide();
	     $(this).find("img").attr("src","image/up.jpg")/*为所有元素设置一个属性值*/
			} 
	  })	
	});

</script>
<script type="text/javascript">
function disp_alert()
{
alert("新期即将开始，敬请期待！！");
}
</script>
<style type="text/css">
a:link{text-decoration:none ; color:#fff ;}
a:visited {text-decoration:none ; color:#fff ;}
a:hover {text-decoration:underline ; color:#fff ;}
a:active {text-decoration:none ; color:#fff ;}
*{
	margin:0;
	padding:0;
	list-style-type:none;
}
a,img{border:0;}
body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体"; background:#000;}
a,a:hover{text-decoration: none;}
.STYLE1 {color: #FFFFFF; padding-bottom:10px;}

/*收缩菜单*/
*{ margin:0; padding:0;}
.v{float:right;width:14px;height:14px;overflow:hidden;background:url(images/vicon2.png) no-repeat;display:inline-block;margin-top:-5px;margin-bottom:-5px;}
.v01{background-position:0 0;}
.v02{background-position:0 -14px;;}
.vtitle{height:35px;background:#FFF;line-height:35px;border-top:2px solid #e5e6e6;margin-top:-1px;padding-left:20px;font-size:15px;color:#7f8c8c;font-family:"\5FAE\8F6F\96C5\9ED1";cursor:pointer;}
.vtitle em{margin:10px 10px 0 0;}
.vconlist{background:#FFF;border-bottom:3px solid #e5e6e6;}
.vconlist li a{height:30px;line-height:30px;padding-left:30px;display:block;font-size:14px;color:#866f67;font-family:"\5FAE\8F6F\96C5\9ED1";}
.vconlist li.select a,.vconlist li a:hover{color:#ed4948;text-decoration:none;}
#c{
	background-color:#FFFFFF;
	width: 100%;
	min-height:900px;height:auto !important;height:900px;
}

.fc{
	color:#C00;
	font-family: "微软雅黑";
	margin-top: 1px;
 
	line-height: 2;
	margin-left: 10px;
	overflow: hidden;
	width: 13%;
	text-align: center;
	font-size: 14px;
	font-weight: bold;
	float: left;
	width: 13%;
	border-right: #000 2px solid;
}
.fcr{
	color: #000;
	font-family: "微软雅黑";
	width: 100%;
	padding-top:10px;	
}
.cr{
	color: #000;
	font-family: "微软雅黑";
	float: left;
	width: 40%;
	text-align: center;
	height: auto;
}
.cl{
	color: #000;
	font-family: "微软雅黑";
	float: right;
	width: 40%;
	text-align: center;
	
}
.fcc{
	color: #000;
	font-family: "微软雅黑";
	margin-top: 1px;
 
	line-height: 2;
	margin-left: 10px;
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
	background-image: url(image/w1.png); 
}
.fc3q{
	color: #FFFFFF;
	font-family: "微软雅黑";
	margin-top: 1px;
	text-align: center;
	height: 39px;
	border-width: bold;
	font-size: 12px;
	clear:both;
	background:url(newpic/ssbg000.gif) repeat-x;;
	line-height:39px;
}
 img{ vertical-align:middle;}
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
.new a,.price a{ position:relative;}
.new a img{ position:absolute; top:-18px; right:-15px;}
.price a img{ position:absolute; top:-18px;  right:-15px;}
</style>
</head>

<body>
<div id="c">
<div class="fc2177"> <font color="#000"><a href="http://iread.wo.com.cn/zz/3g/index.aspx"><img src="newpic/top.jpg" border="0"  width="100%" /></a></font></div>
<div class="fc2">
<table height="43" align="center" cellspacing="0" background="newpic/ssbg0.gif" class="clearit" style="width:100%; background-color: #70c570;">
  <tr>
    <td><div align="center"><a href="cmyy.jsp">柴米游言</a></div></td>
    <td width="1">│</td>
    <td><div align="center"><a href="mulu.jsp">目录</a></div></td>
    <td width="1">│</td>
    <td><div align="center"style="background:url(newpic/ssbg.png) no-repeat center bottom; margin-top:1px; height:42px; line-height:42px;"><a href="wangqi.jsp"
        >往期 </a></div></td>
    <td width="1">│</td>
	<td class="new"><div align="center"><a href="showByRecomLevel?appTmp.showByRecomLevelCurrentPage=1" >游戏&应用<img src="newpic/new.gif" /></a></div></td>
    <td width="1" >│</td>
	<td class="price"><div align="center"><a href="active.html"><font color="#FFFF00" style="font-weight:bold">大抽奖</font><img src="newpic/hot.gif" /></a>　</div></td>
    <td width="1"></td>
  </tr>
</table>
</div>
<div class="fcr">
<div style="width:100%;margin:0 auto 10px auto;" id="wlist">
   <div class="qimu">
	<div class="vtitle"><em class="v v02"></em>�CHAIMIZINE2014</div>
		<div class="vcon">
		<ul class="vconlist clearfix">
		 
		 
			<table width="100%" height="546" border="0" cellpadding="0" cellspacing="0">
   <!--DWLayoutTable-->
  
  <tr>
    <td width="101" height="30">&nbsp;</td>
    <td width="41">&nbsp;</td>
    <td width="109">&nbsp;</td>
    <td width="41">&nbsp;</td>
    <td width="108">&nbsp;</td>
    </tr>
    <tr>
    	<td height="135" valign="top"><div align="center"><a href="zazhi/1419/mulu.html"><img src="image/z-21.jpg" width="99" height="130" border="0" /></a></div></td>
  		<td>&nbsp;</td>
  		<td valign="top"><div align="center"></div></td>
  		<td>&nbsp;</td>
  		<td valign="top"><div align="center"></div></td>
    </tr>
    <tr>
    	<td height="37" valign="top"><div align="center">第二十一期</div></td>
    	<td></td>
    	<td valign="top"><div align="center"></div></td>
    	<td></td>
    	<td valign="top"><div align="center"></div></td>
    	<td></td>
    </tr>
    <tr>
    	<td height="135" valign="top"><div align="center"><a href="zazhi/1418/mulu.html"><img src="image/z-20.jpg" width="99" height="130" border="0" /></a></div></td>
  		<td>&nbsp;</td>
  		<td valign="top"><div align="center"><a href="zazhi/1417/mulu.html"><img src="image/z-19.jpg" width="99" height="130" border="0" /></a></div></td>
  		<td>&nbsp;</td>
  		<td valign="top"><div align="center"><a href="zazhi/1416/mulu.html"><img src="image/z-18.jpg" width="99" height="130" border="0" /></a></div></td>
    </tr>
    <tr>
    	<td height="37" valign="top"><div align="center">第二十期</div></td>
    	<td></td>
    	<td valign="top"><div align="center">第十九期</div></td>
    	<td></td>
    	<td valign="top"><div align="center">第十八期</div></td>
    	<td></td>
    </tr>
    <tr>
    	<td height="135" valign="top"><div align="center"><a href="zazhi/1415/mulu.html"><img src="image/z-17.jpg" width="99" height="130" border="0" /></a></div></td>
  		<td>&nbsp;</td>
  		<td valign="top"><div align="center"><a href="zazhi/1414/mulu.html"><img src="image/z-16.jpg" width="99" height="130" border="0" /></a></div></td>
  		<td>&nbsp;</td>
  		<td valign="top"><div align="center"><a href="zazhi/1413/mulu.html"><img src="image/z-15.jpg" width="99" height="130" border="0" /></a></div></td>
    </tr>
    <tr>
    	<td height="37" valign="top"><div align="center">第十七期</div></td>
    	<td></td>
    	<td valign="top"><div align="center">第十六期</div></td>
    	<td></td>
    	<td valign="top"><div align="center">第十五期</div></td>
    	<td></td>
    </tr>
    <tr>
    <td height="135" valign="top"><div align="center"><a href="zazhi/1412/mulu.html"><img src="image/z-14.jpg" width="99" height="130" border="0" /></a></div></td>
  		<td>&nbsp;</td>
  	<td valign="top"><div align="center"><a href="zazhi/1411/mulu.html"><img src="image/z-13.jpg" width="99" height="130" border="0" /></a></div></td>
  	<td>&nbsp;</td>
  	<td valign="top"><div align="center"><a href="zazhi/1410/mulu.html"><img src="image/z-12.jpg" width="99" height="130" border="0" /></a></div></td>
    </tr>
    <tr>
    <td height="37" valign="top"><div align="center">第十四期</div></td>
    <td></td>
    <td valign="top"><div align="center">第十三期</div></td>
    <td></td>
    <td valign="top"><div align="center">第十二期</div></td>
    <td></td>
    </tr>
  <tr>
  
    <td height="135" valign="top"><div align="center"><a href="zazhi/1409/mulu.html"><img src="image/z-11.jpg" width="99" height="130" border="0" /></a></div></td>
  <td>&nbsp;</td>
    <td valign="top"><div align="center"><a href="zazhi/1408/mulu.html"><img src="image/z-10.jpg" width="99" height="130" border="0" /></a></div></td>
  <td>&nbsp;</td>
    <td valign="top"><div align="center"><a href="zazhi/1407/mulu.html"><img src="image/c_009.jpg" width="99" height="130" border="0" /></a></div></td>
    </tr>
  
  <tr>
  
    <td height="37" valign="top"><div align="center">第十一期</div></td>
    <td></td>
    <td valign="top"><div align="center">第十期</div></td>
    <td>&nbsp;</td>
    <td valign="top"><div align="center">第九期</div></td>
    </tr>
  
  
  <tr>
    <td height="132" valign="top"><div align="center"><a href="zazhi/1406/mulu.html"><img src="image/88.jpg" width="99" height="130" border="0" /></a></div></td>
    <td></td>
    <td valign="top"><div align="center"><a href="zazhi/1405/mulu.html"><img src="image/007.jpg" width="99" height="130" border="0" /></a></div></td>
    <td>&nbsp;</td>
    <td valign="top"><div align="center"><a href="zazhi/1404/mulu.html"><img src="image/006.jpg" width="99" height="130" border="0" /></a></div></td>
    </tr>
  
  <tr>
    <td height="47" valign="top"><div align="center">第八期</div></td>
    <td></td>
    <td valign="top"><div align="center">第七期</div></td>
    <td>&nbsp;</td>
    <td valign="top"><div align="center">第六期</div></td>
    </tr>
  
  
  
  
  
  <tr>
    <td height="130" valign="top"><div align="center"><a href="zazhi/1403/mulu.html"><img src="image/00055.jpg" width="99" height="130" border="0" /></a></div></td>
    <td>&nbsp;</td>
    <td valign="top"><div align="center"><a href="zazhi/1402/mulu.html"><img src="image/z.jpg" width="99" height="130" border="0" /></a></div></td>
    <td>&nbsp;</td>
    <td valign="top"><div align="center"><a href="zazhi/1401/mulu.html"><img src="image/333.jpg" width="99" height="130" border="0" /></a></div></td>
    </tr>
  <tr>
    <td height="38" valign="top"><div align="center">第五期</div></td>
    <td>&nbsp;</td>
    <td valign="top"><div align="center">第四期</div></td>
    <td>&nbsp;</td>
    <td valign="top"><div align="center">第三期</div></td>
    </tr>
</table>
		</ul>
	</div>
</div>
   <div class="qimu">
	<div class="vtitle">�<em class="v"></em>CHAIMIZINE2013</div>
		<div class="vcon" style="display: none;">
		<ul class="vconlist clearfix">
			<li>
			<table width="100%" height="199" border="0" cellpadding="0" cellspacing="0">
   <!--DWLayoutTable-->
  
  <tr>
    <td width="44" height="27">&nbsp;</td>
    <td width="117">&nbsp;</td>
    <td width="124">&nbsp;</td>
    <td width="120">&nbsp;</td>
    <td width="953">&nbsp;</td>
  </tr>
  <tr>
    <td height="135">&nbsp;</td>
    <td valign="top"><div align="center"><a href="zazhi/1301/mulu.html"><img src="image/cover_240.jpg" width="99" height="130" border="0" /></a></div></td>
  <td>&nbsp;</td>
    <td valign="top"><div align="center"><a href="zazhi/1302/mulu.html"><img src="image/2.jpg" width="99" height="130" border="0" /></a></div></td>
  <td>&nbsp;</td>
  </tr>
  
  <tr>
    <td height="37"></td>
    <td valign="top"><div align="center">第一期</div></td>
    <td></td>
    <td valign="top"><div align="center">第二期</div></td>
    <td></td>
  </tr>
  
  
  
  
  
  
  
</table>

			</li>
 
		</ul>
	</div>
	

</div>

 </div>
 
	 
 
</div>
</div>
<div class="fc3q">
<a href="showByRecomLevel?appTmp.showByRecomLevelCurrentPage=1">首页</a>｜
<a href="fenlei.jsp">分类</a>｜
<a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=1">游戏</a>｜
<a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=2">应用</a>｜
<a href="showByScoreAndDown.action?appTmp.showByScoreAndDownCurrentPage=1">排行</a>｜
<a href="guanyu.jsp">关于</a>
</div>
<div align="center">
  <span class="STYLE1 STYLE2">&copy;2010-2014中国联通 版权所有</span></div>
<%@ include file="cs.jsp" %>
<%CS cs = new CS(1252900022);cs.setHttpServlet(request,response);
String imgurl = cs.trackPageView();%> 
<img src="<%= imgurl %>" width="0" height="0"  />
</body>
</html>
