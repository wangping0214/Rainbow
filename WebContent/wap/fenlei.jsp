<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>游戏应用－柴米游言－中国第一手游杂志</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body{ background:#000;}
*{ margin:0; padding:0;}
a{text-decoration:none ;}
a:link{ color:#fff ;}
a:visited {text-decoration:none ; color:#fff ;}
a:hover {text-decoration:underline ; color:#fff ;}
a:active {
	text-decoration: none;
	color: #FFFFFF;
}
#c{

    background-color:#f9f9f9;
	height:1350px;
	
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
.fc2177{
		background-color:#F9F9F9;
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
	background-image: url(image/w1.png); height:43px; overflow:hidden;zoom:1;
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
	clear:both;
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
	color: #666;
	font-family: "微软雅黑";
	font-size:14px;
	background-color:#f9f9f9;
	margin-top: 1px;
	line-height:1.5;
	font-weight:bold;
	height: 580px;
	clear:both;
	overflow:hidden; zoom:1;
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
.right{
	color: #FC6838;
	font-family: "宋体";
	font-size: 38px;
	margin-right:45px;
	margin-top:60px;
	height: 460px;
	width: 250px;
	float: right;
	font-weight: bold;
	line-height: 1.5;
}
.left{
	color: #000000;
	font-size: 14px;
	margin-left: 45px;
	margin-top:60px;
	height: 425px;
	width: 250px;
	float: left;
}
.right1{
	color: #FFFFFF;
	font-family: "宋体";
	font-size: 14px;
	margin-top:2px;
	height: 155px;
	width: 25%;
	float: left;
	font-weight: normal;
	line-height: 1.5;
	margin-left:7%;
    background:#fff;color:#333;
	 margin-bottom:20px;
	 overflow:hidden; zoom:1;
/*filter:progid:DXImageTransform.Microsoft.Shadow(color=#909090,direction=120,strength=4);
-moz-box-shadow: 1px 1px 5px #909090;
-webkit-box-shadow: 1px 1px 5px #909090;
box-shadow:1px 1px 5px #909090;*/
}
li{

}

.r2{
	color: #FFFFFF;
	font-family: "微软雅黑";
	font-size: 16px;
	height:42px;
	width: 100%;
	float: left;
	line-height: 2.5;
	font-weight: bold;
	
}
.r2 a{ float:left;background-color: #70C570; height:40px; margin-top:2px; width:92%; font-size:14px;}
.r2-0{
	font-family: "微软雅黑";
	font-size: 12px;
	height: 42px;
	width:8%;
	float: left;
	line-height: 1.5;
	font-weight: bold;
	background-color: #ffa011;
}
.r4{
	font-family: "微软雅黑";
	color: #000000;
	font-size: 14px;
	width: 100%;
	height:110px; 
	clear:both;
	border-bottom: #ececec 3px solid;

}
.r4 ul{ list-style:none; margin-left:8%;}
.r4 a{color:#000}
.r4 li{background:url(newpic/cicle.jpg) no-repeat left center; padding-left:15px;}



.circle {
	height: 16px;
	width: 40px;
	text-align: center;
	background-color:#FFa202;
	border-radius: 15px;
	line-height:1;
	margin-top: 0px;
}
.STYLE1 {color: #FFFFFF; margin-bottom:10px;}

</style>
</head>

<body>
<div id="c">
<div class="fc2177"> <font color="#000"><a href="javascript:if(confirm('http://iread.wo.com.cn/zz/3g/index.aspx  \n\n该文件无法用 Teleport Ultra 下载, 因为 它是一个域或路径外部被设置为它的启始地址的地址。  \n\n你想在服务器上打开它?'))window.location='http://iread.wo.com.cn/zz/3g/index.aspx'"><img src="image/wo-logo.png"  width="110" height="30" border="0" /></a></font> 柴米游戏－中国第一手游杂志</div>

<div class="fc2"><table height="46" align="center" cellspacing="0" background="newpic/ssbg0.gif" class="clearit" style="width:100%; background-color: #70c570;">

  <tr>
    <td><div align="center"><a href="index.jsp"><font color="#FFFFFF" style="font-weight:bold">封面</font></a></div></td>
    <td width="1"><font color="#FFFFFF">│</font></td>
    <td><div align="center"><a href="mulu.jsp"><font color="#FFFFFF" style="font-weight:bold">目录</font></a></div></td>
    <td width="1"><font color="#FFFFFF">│</font></td>
    <td ><div align="center"><a href="wangqi.jsp"><font color="#FFFFFF" style="font-weight:bold">往期</font> </a></div></td>
    <td width="1"><font color="#FFFFFF">│</font></td>
	<td><div style="background:url(newpic/ssbg00.gif) repeat-x top; height:43px; line-height:43px; color:#FFF; margin:0 10%; color:#FFF" align="center"><a href="showByRecomLevel.action?appTmp.showByRecomLevelCurrentPage=1"><font color="#FFFFFF" style="background:url(newpic/ssbg_03.jpg) no-repeat center bottom;font-weight:bold; display:block; height:43px;">游戏&amp;应用</font></a></div>
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
    <td width="45"><div class="circle"><a href="fenlei.jsp"><font color="#fff">分类</font> </a></div></td>
    <td width="45"><a href="showByScoreAndDown.action?appTmp.showByScoreAndDownCurrentPage=1"><font color="#000">排行榜</font></a></td>
	<td width="45"><a href="guanyu.jsp"><font color="#000">关于</font></a></td>
  </tr>
</table>
</div>
<div class="fcc">
  <hr />
  
</div>
<div  class="fc2-11">
 &nbsp; &nbsp;游戏分类：<br />
 <div class="right1" onclick="location= 'showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=1' ">
   <div class="r2">
	       <div align="center"><div class="r2-0"></div>
	       <a href="showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=1">创意休闲</a>
	       <div class="r2-1">
	         <div align="right"></div>
	       </div></div>
      </div>
	     <div class="r4">
	     <ul>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=1">卡通</a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=2">连连看</a>　</li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=3">捕鱼 </a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=4">祖玛</a></li>
	     </ul></div>
</div>
<div class="right1"  onclick="location= 'showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=2' ">
   <div class="r2">
	       <div align="center"><div class="r2-0"></div><a href="showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=2">飞行射击</a> 
	       <div class="r2-1">
	         <div align="right"></div>
	       </div></div>
      </div>
	     <div class="r4">
	     <ul>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=5">射击</a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=6">阻击</a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=7">坦克 </a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=8">飞行</a></li>
	     	
	   </ul></div>
</div>
<div class="right1" onclick="location= 'showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=3' ">
   <div class="r2">
	       <div align="center"><div class="r2-0"></div><a href="showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=3"> 体育竞技</a>
	       <div class="r2-1">
	         <div align="right"></div>
	       </div></div>
      </div>
	     <div class="r4">
	     <ul>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=9">街机</a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=10">足球</a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=11">篮球 </a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=12">台球</a></li>
	     </ul></div>
</div>
<p>
<div class="right1" onclick="location= 'showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=4' ">
   <div class="r2">
	       <div align="center"><div class="r2-0"></div>
	       <a href="showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=4">益智棋牌</a>
	       <div class="r2-1">
	         <div align="right"></div>
	       </div></div>
      </div>
	     <div class="r4">
	     <ul>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=13">斗地主</a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=14">麻将</a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=15">纸牌  </a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=16">拼图</a></li>
	     	
	     </ul></div>
</div>
<div class="right1" onclick="location= 'showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=5' ">
   <div class="r2">
	       <div align="center"><div class="r2-0"></div>
	       <a href="showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=5"> 策略经营</a>
	       <div class="r2-1">
	         <div align="right"></div>
	       </div></div>
      </div>
	     <div class="r4">
	     <ul>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=17">经营</a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=18">卡牌</a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=19">塔防 </a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=20">战争</a></li>
	     </ul></div>
</div>
<div class="right1" onclick="location= 'showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=6' ">
   <div class="r2">
	       <div align="center"><div class="r2-0"></div>
	       <a href="showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=6">竞赛动作</a>
	       <div class="r2-1">
	         <div align="right"></div>
	       </div></div>
      </div>
	     <div class="r4">
	     <ul>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=21">跑酷 </a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=22">横版</a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=23">3D </a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=24">赛车</a></li>
	     </ul></div>
</div><br />
<div class="right1" onclick="location= 'showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=7' ">
   <div class="r2">
	       <div align="center"><div class="r2-0"></div>
	       <a href="showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=7"> 角色游戏</a>
	       <div class="r2-1">
	         <div align="right"></div>
	       </div></div>
      </div>
	     <div class="r4">
	     <ul>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=25">回合制 </a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=26">卡牌</a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=27">玄幻 </a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=28">武侠</a></li>
	     </ul></div>
</div><br />
</div>
<div  class="fc2-11">
 &nbsp; &nbsp;软件分类：<br />
 <div class="right1" onclick="location= 'showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=8' ">
   <div class="r2">
	       <div align="center"><div class="r2-0"></div>
	       <a href="showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=8"> 系统安全</a>
	       <div class="r2-1">
	         <div align="right"></div>
	       </div></div>
      </div>
	     <div class="r4">
	     <ul>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=29">优化 </a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=30">流量</a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=31">安全 </a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=32">杀毒</a></li>
	     </ul></div>
</div>
<div class="right1" onclick="location= 'showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=9' ">
   <div class="r2">
	       <div align="center"><div class="r2-0"></div>
	       <a href="showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=9">常用工具</a>
	       <div class="r2-1">
	         <div align="right"></div>
	       </div></div>
      </div>
	     <div class="r4">
	     <ul>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=33">浏览器 </a> </li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=34">输入法</a></li>   
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=35">文件 </a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=36">办公 </a></li>
	     </ul></div>
</div>
<div class="right1"  onclick="location= 'showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=10' ">
   <div class="r2">
	       <div align="center"><div class="r2-0"></div>
	       <a href="showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=10"> 摄影美化</a>
	       <div class="r2-1">
	         <div align="right"></div>
	       </div></div>
      </div>
	     <div class="r4">
	     <ul>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=37">主题  </a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=38">桌面 </a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=39">壁纸 </a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=40">相机 </a></li>
	     </ul></div>
</div>

<p>
<div class="right1" onclick="location= 'showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=11' ">
   <div class="r2">
	       <div align="center"><div class="r2-0"></div>
	       <a href="showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=11"> 影音图象</a>
	       <div class="r2-1">
	         <div align="right"></div>
	       </div></div>
      </div>
	     <div class="r4">
	     <ul>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=41">音乐  </a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=42">视频 </a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=43">相册</a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=44">播放器</a></li>
	     </ul></div>
</div>
<div class="right1" onclick="location= 'showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=12' ">
   <div class="r2">
	       <div align="center"><div class="r2-0"></div><a href="showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=12"> 便捷生活</a>
	       <div class="r2-1">
	         <div align="right"></div>
	       </div></div>
      </div>
	     <div class="r4">
	     <ul>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=45">健康 </a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=46">购物</a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=47">理财 </a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=48">旅行</a></li>
	     </ul></div>
</div>
<div class="right1" onclick="location= 'showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=13' ">
   <div class="r2">
	       <div align="center"><div class="r2-0"></div><a href="showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=13">社交通信</a>
	       <div class="r2-1">
	         <div align="right"></div>
	       </div></div>
      </div>
	     <div class="r4">
	     <ul>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=49">聊天</a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=50">交友</a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=51">微博 </a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=52">婚恋</a></li>
	     </ul></div>
</div><br />
<div class="right1" onclick="location= 'showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=14' ">
   <div class="r2">
	       <div align="center"><div class="r2-0"></div>
	       <a href="showByCategory.action?appTmp.showByCategoryCurrentPage=1&category=14"> 阅读学习</a>
	       <div class="r2-1">
	         <div align="right"></div>
	       </div></div>
      </div>
	     <div class="r4">
	     <ul>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=53">电子书 </a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=54">漫画</a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=55">新闻</a></li>
	     	<li><a href="showByClassification.action?appTmp.showByClassificationCurrentPage=1&classification=56">杂志</a></li>
	     </ul></div>
</div><br />

</div>
</div>
<div class="fc3q">
<a href="index.jsp"><font color="#FFFFFF">首页</font></a>｜
<a href="fenlei.jsp"><font color="#FFFFFF">分类</font></a>｜
<a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=1"><font color="#FFFFFF">游戏</font></a>｜
<a href="showByType.action?appTmp.showByTypeCurrentPage=1&type=2"><font color="#FFFFFF">应用</font></a>｜
<a href="showByScoreAndDown.action?appTmp.showByScoreAndDownCurrentPage=1"><font color="#FFFFFF">排行</font></a>｜
<a href="guanyu.jsp"><font color="#FFFFFF">关于</font></a>
<img src="newpic/seach.gif" width="117" height="24" /></div>
<div align="center" class="STYLE1">&copy;2010-2014中国联通 版权所有</div>
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
