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
<script type="text/javascript" src="js/scroll.js"></script>
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
	margin-top: 10px;
	line-height: 1.5;
	height: 140px;
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom:10px;
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
	line-height: 1.5;
	height: 50px;
	margin-left: 10px;
	width: 50px;
	padding-top: 10px;
}
.fc212{
	color: #000000;
	font-family: "微软雅黑";
	font-size: 12px;
	margin-top: -45px;
	line-height: 1.5;
	height: 50px;
	margin-left: 70px;
	width: 80%;
}
.fc213{
	color: #666;
	font-family: "微软雅黑";
	font-size: 14px;
	margin-top: -55px;
	line-height: 1.5;
	height: 40px;
	width: 60px;
	margin-right: 10px;
	padding-right: 10px;
	float: right; padding-bottom:20px;
	
}
.fc214{
	color: #666;
	font-family: "微软雅黑";
	font-size: 14px;
	background-color: #FFF;
	line-height: 1.5;
	height: 50px;
	padding-top:5px;
	width: 90%;border-top:#CCC solid 1px;
	margin:5px auto 0 auto;
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
.page{ clear:both; overflow:hiddem; zoom:1;padding:20px 0; text-align:center;}

.scroll{width:320px;height:133px;margin:10px auto 10px auto; position:relative;overflow:hidden;}
.mod_01{float:left;width:320px;}
.mod_01 img{display:block;width:320px;height:133px;}
.dotModule_new{padding:0 5px;height:11px;line-height:6px;-webkit-border-radius:11px;background:rgba(45,45,45,0.5);position:absolute;bottom:5px;right:20px;z-index:11;}
#slide_01_dot{text-align:center;margin:3px 0 0 0;}
#slide_01_dot span{display:inline-block;margin:0 3px;width:5px;height:5px;vertical-align:middle;background:#f7f7f7;-webkit-border-radius:5px;}
#slide_01_dot .selected{background:#66ff33;}
.fc2{ padding-top:4px; background:#F9f9f9;}
.fc2 a{ color:#FFF;}
.new a,.price a{ position:relative;}
.new a img{ position:absolute; top:-18px; right:-15px;}
.price a img{ position:absolute; top:-18px;  right:-15px;}

/*lunbo*/

    #slides {
      display: none; position:relative;
    }

    #slides .slidesjs-navigation {
      margin-top:3px;
    }

    #slides .slidesjs-previous {
      margin-right: 5px;
      float: left;
    }

    #slides .slidesjs-next {
      margin-right: 5px;
      float: left;
    }

    .slidesjs-pagination {
      margin: 6px 0 0;
      float: right;
      list-style: none;
	  position:absolute; bottom:10px; right:30px; z-index:11
    }

    .slidesjs-pagination li {
      float: left;
      margin: 0 1px;
    }

    .slidesjs-pagination li a {
      display: block;
      width: 13px;
      height: 0;
      padding-top: 13px;
      background-image: url(image/pagination.png);
      background-position: 0 0;
      float: left;
      overflow: hidden;
    }

    .slidesjs-pagination li a.active,
    .slidesjs-pagination li a:hover.active {
      background-position: 0 -13px
    }

    .slidesjs-pagination li a:hover {
      background-position: 0 -26px
    }

    #slides a:link,
    #slides a:visited {
      color: #333
    }

    #slides a:hover,
    #slides a:active {
      color: #9e2020
    }

    .navbar {
      overflow: hidden
    }
  </style>
  <!-- End SlidesJS Optional-->
 <!-- CSS for slidesjs.com example -->
  <link rel="stylesheet" href="css/example.css">
  <link rel="stylesheet" href="css/font-awesome.min.css"> 
  <!-- End CSS for slidesjs.com example -->
  <!-- SlidesJS Required: These styles are required if you'd like a responsive slideshow -->
  <style>
    #slides {
      display: none
    }

    .container {
		width:100%;
      margin: 0 auto
    }

    /* For tablets & smart phones */
    @media (max-width: 767px) {
      .container {
        width: 100%
      }
    }

    /* For smartphones */
    @media (max-width: 480px) {
      .container {
        width: 100%;
      }
    }

    /* For smaller displays like laptops */
    @media (min-width: 768px) and (max-width: 979px) {
      .container {
        width: 100%;
      }
    }

    /* For larger displays */
    @media (min-width: 1200px) {
      .container {
        width: 100%;
      }
    }



</style>

</head>

<body>
<div id="c">
  <div class="fc2177"> <font color="#fff"><img src="newpic/logo.jpg" border="0" /></font> </div>

  <div class="fc2">
<table height="43" align="center" cellspacing="0" background="newpic/ssbg0.gif" class="clearit" style="width:100%; background-color: #70c570;">
  <tr>
    <td><div align="center"><a href="cmyy.jsp">柴米游言</a></div></td>
    <td width="1">│</td>
    <td><div align="center"><a href="mulu.jsp">目录</a></div></td>
    <td width="1">│</td>
    <td><div align="center"><a href="wangqi.jsp">往期 </a></div></td>
    <td width="1">│</td>
	<td class="new">
    <div align="center" style="background:url(newpic/ssbg.png) no-repeat center bottom; margin-top:1px; height:42px; line-height:42px;"><a href="showByRecomLevel?appTmp.showByRecomLevelCurrentPage=1">游戏&应用<img src="newpic/new.gif" /></a></div>
    </td>
    <td width="1" >│</td>
	<td class="price"><div align="center"><a href="active.html"><font color="#FFFF00" style="font-weight:bold">大抽奖</font><img src="newpic/hot.gif" /></a>　</div></td>
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
<!-- <div class="fcc">
<div class="scroll">
	<div class="slide_01" id="slide_01">
		<div class="mod_01"><a href="active.html"><img src="image/banner.jpg"  /></a></div>
        <div class="mod_01"><a href="indexAd/DJDouDiZhu_RainBow.apk"><img src="image/banner2.jpg"  /></a></div>
	</div>
	<div class="dotModule_new">
		<div id="slide_01_dot"></div>
	</div>
</div>
 -->
 
 
 
 <!-- SlidesJS Required: Start Slides -->
  <!-- The container is used to define the width of the slideshow -->
  <div class="container">
    <div id="slides">
      <a href="active.html"><img src="image/banner.jpg" width="100%" /></a>
      <a href="indexAd/bxxy_caimi_CN.apk"><img src="indexAd/bxxy_caimi_CN.jpg" width="100%" /></a>
      <a href="indexAd/JungleRunner.apk"><img src="indexAd/JungleRunner.jpg" width="100%" /></a>
      <a href="indexAd/mof_android_wucaishikong.apk"><img src="indexAd/mof_android_wucaishikong.jpg" width="100%" /></a>
      <a href="#" class="slidesjs-previous slidesjs-navigation"></a>
      <a href="#" class="slidesjs-next slidesjs-navigation"></a>
    </div>
  </div>
  <!-- End SlidesJS Required: Start Slides -->


  <script src="js/jquery-1.9.1.min.js"></script>
  <!-- End SlidesJS Required -->

  <!-- SlidesJS Required: Link to jquery.slides.js -->
  <script src="js/jquery.slides.min.js"></script>
  <!-- End SlidesJS Required -->

  <!-- SlidesJS Required: Initialize SlidesJS with a jQuery doc ready -->
  <script>
    $(function() {
      $('#slides').slidesjs({
        width: 940,
        height: 390,
        navigation: false,
        play: {
            active: false,
            auto: true,
            interval: 4000,
            swap: true
        }
      });
    });
  </script>
  <!-- End SlidesJS Required -->
 
 


<s:iterator value="#request['app']" id="app">
<div class="fc2-11">
<div class="fc211"><a href="specificInformation.action?apkId=<s:property value="#app.appInfo.id"/>"><img src="<%=request.getContextPath() %><s:property value="#app.appSou.logo1"/>"  width="50px" height="50px" /></a></div>
<div class="fc212"><a href="specificInformation.action?apkId=<s:property value="#app.appInfo.id"/>">
<s:if test="#app.appInfo.appName.length()>6">
<s:property value="#app.appInfo.appName.substring(0, 6) + \"...\"" />
</s:if>
<s:else>
<s:property value="#app.appInfo.appName" />
</s:else>
</a>
<img src="pic/j.gif"  width="18" height="18" /> <img src="image/mll.gif" width="40" height="18" class="jian" /><br />
  <p class="xinxi"><span>
  下载:<s:if test="#app.appAut.amountOfDown>10000">
  <s:property value="#app.appAut.amountOfDown/10000+'.'+(#app.appAut.amountOfDown-(#app.appAut.amountOfDown/10000)*10000)/1000" />
万次
  </s:if>
  <s:else><s:property value="#app.appAut.amountOfDown" />次</s:else>
  </span><span>大小:<s:property value="#app.appSou.packgeSize" />MB</span></p> 
</div>
<div class="fc213"><a href="downApk.action?appSouId=<s:property value="#app.appSou.id" />&downPath=<s:property value="#app.appSou.packge" escape='false'/>" ><img src="pic/as_06.jpg"  width="55" height="23" /></a></div>
<div class="fc214"><a href="specificInformation.action?apkId=<s:property value="#app.appInfo.id"/>">
游戏简介：<s:if test="#app.appInfo.appIntrodution.length()>30">
<s:property value="#app.appInfo.appIntrodution.substring(0, 30) + \"...\"" />
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
<a href="showByRecomLevel?appTmp.showByRecomLevelCurrentPage=1"><font color="#FFFFFF">首页</font></a>｜
<a href="fenlei.jsp"><font color="#FFFFFF">分类</font></a>｜
<a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=1"><font color="#FFFFFF">游戏</font></a>｜
<a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=2"><font color="#FFFFFF">应用</font></a>｜
<a href="showByScoreAndDown.action?appTmp.showByScoreAndDownCurrentPage=1"><font color="#FFFFFF">排行</font></a>｜
<a href="guanyu.jsp"><font color="#FFFFFF">关于</font></a>
</div>
<div align="center">
  <span class="STYLE1">&copy;2010-2014中国联通 版权所有</span></div>


<%@ include file="cs.jsp" %>
<%CS cs = new CS(1252900022);cs.setHttpServlet(request,response);
String imgurl = cs.trackPageView();%> 
<img src="<%= imgurl %>" width="0" height="0"  />
<script type="text/javascript">
if(document.getElementById("slide_01")){
	var slide_01 = new ScrollPic();
	slide_01.scrollContId   = "slide_01"; //内容容器ID
	slide_01.dotListId      = "slide_01_dot";//点列表ID
	slide_01.dotOnClassName = "selected";
	slide_01.arrLeftId      = "sl_left"; //左箭头ID
	slide_01.arrRightId     = "sl_right";//右箭头ID
	slide_01.frameWidth     = 320;
	slide_01.pageWidth      = 320;
	slide_01.upright        = false;
	slide_01.speed          = 10;
	slide_01.space          = 30; 
	slide_01.initialize(); //初始化
}
</script>
</body>
</html>
