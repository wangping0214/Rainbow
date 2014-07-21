<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>管理游戏& 应用</title>

<script type="text/javascript"src="js/jquery.min.js"></script>
<script type="text/javascript"src="js/nav.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
*{ margin:0; padding:0;}
ul{ list-style:none;}
a{ text-decoration:none; color:#666;}
.body{
	color: #0066CC;
	font-family: "微软雅黑";
	font-size: 14px;
	margin-left: 0px;
	font-weight: bold;
	height:100%;
	width: 100%;
	background-color: f2f2f2;
}
.head{
	color:#666;
	font-family: "微软雅黑";
	font-size: 20px;
	margin-left: 10px;
	margin-top:20px;
	margin-bottom:30px;
	font-weight: bold;
	width: 180px; text-align:center;
	background-color: #FFFFFF; border-bottom:#CCC solid 1px; padding-bottom:5px;
}
.b1{
	color: #0066CC;
	font-family: "微软雅黑";
	font-size: 16px;
	margin-left: 20px;
	margin-top:5px;
	margin-bottom:20px;
	font-weight: bold;
	height: 25px;
	width: 180px;
	background-color: #FFFFFF;
}
.b1 select{ width:150px; font-size:14px; font-weight:bold; text-align:center; height:30px;}
.b2{
	color: #0066CC;
	font-family: "微软雅黑";
	font-size: 20px;
	margin-left: 40px;
	margin-top:5px;
	font-weight: bold;
	height: 400px;
	overflow:hidden;
	width: auto;
}
.b3{
	color: #000000;
	font-family: "微软雅黑";
	font-size: 14px;
	margin-left: 15px;
	margin-top:15px;
	font-weight: bold;
	height: 135px;
	width: 100px;
	float: left;
	text-align:center;
	display:inline;
}
.b31{
	font-family: "微软雅黑";
	height: 20px;
	width: 160px;
}
.b4{
	color: #000000;
	font-size: 16px;
	margin-left: 150px;
	margin-top:5px;
	font-weight: bold;
	height: 20px;
	width: auto;
	background-color: #FFFFFF;
}
#left{
	color: #0066CC;
	font-family: "微软雅黑";
	font-size: 14px;
	margin-left: 30px;
	height: 300px;
	width: 500px;
	float: left;
}
#right{
	color: #000000;
	font-family: "微软雅黑";
	font-size: 14px;
	height: 300px;
	float: right;
	width: 500px;
	margin-right: 100px;
}
.twobut{ background:url(images/yi.png) no-repeat; width:100px; height:30px; margin-top:5px;}
.twobut a,.twobut input{ float:left; width:33px; height:30px; background:none; border:0; cursor:pointer; outline:none;}
.page{ clear:both; overflow:hidden; zoom:1; padding-top:30px; width:260px; font-size:14px; margin:0 auto;}
.page li{ float:left; padding:0 5px;}
.page a:hover{ text-decoration:underline}
.shenhenav{ margin-top:20px; border-bottom:#999 solid 1px; overflow:hidden; zoom:1; width:180px; padding-bottom:5px; cursor:pointer; color:#666; font-size:16px;}
.shenhenav li{ float:left; margin-left:10px; display:inline; }
.shenhenav li.red a{ color:#F00}
</style>


</head>

<body>
<div class="body">
<div class="content">
   <div class="search">
       <div class="searchcont">
           <input type="text" value="搜索" class="socont fl"/><input type="submit" value="" class="sobut fr"/>
       </div>
       <!--searchcont-->
    </div>
   <div class="midcont">
      <ul class="shenhenav">
         <li class="red"><a href="yyindex2.jsp" target="main">已上架</a></li>
         <li><a href="wait_publish.jsp" target="main">待发布</a></li>
         <li><a href="drops.jsp" target="main">已下架</a></li>
      </ul>
   <div class="b2">
	<div class="b3">
	     <p><img src="images/img21.png" width="80" height="80" /></p>
		 <p> 捕鱼达人</p>
		 <div class="twobut">
             <a href="reshangchuan.jsp" target="main"></a><a href="tongjiliebiao2.jsp"></a><input type="submit" value="" />
		  </div>
	</div>
    <div class="b3">
	     <p><img src="images/img21.png" width="80" height="80" /></p>
		 <p> 捕鱼达人</p>
		 <div class="twobut">
             <a href="reshangchuan.jsp" target="main"></a><a href="tongjiliebiao2.jsp"></a><input type="submit" value="" />
		  </div>
	</div>
    <div class="b3">
	     <p><img src="images/img21.png" width="80" height="80" /></p>
		 <p> 捕鱼达人</p>
		 <div class="twobut">
             <a href="reshangchuan.jsp" target="main"></a><a href="tongjiliebiao2.jsp"></a><input type="submit" value="" />
		  </div>
	</div>
    <div class="b3">
	     <p><img src="images/img21.png" width="80" height="80" /></p>
		 <p> 捕鱼达人</p>
		 <div class="twobut">
             <a href="reshangchuan.jsp" target="main"></a><a href="tongjiliebiao2.jsp"></a><input type="submit" value="" />
		  </div>
	</div>
    <div class="b3">
	     <p><img src="images/img21.png" width="80" height="80" /></p>
		 <p> 捕鱼达人</p>
		 <div class="twobut">
             <a href="reshangchuan.jsp" target="main"></a><a href="tongjiliebiao2.jsp"></a><input type="submit" value="" />
		  </div>
	</div>
    <div class="b3">
	     <p><img src="images/img21.png" width="80" height="80" /></p>
		 <p> 捕鱼达人</p>
		 <div class="twobut">
             <a href="reshangchuan.jsp" target="main"></a><a href="tongjiliebiao2.jsp"></a><input type="submit" value="" />
		  </div>
	</div>
    <div class="b3">
	     <p><img src="images/img21.png" width="80" height="80" /></p>
		 <p> 捕鱼达人</p>
		 <div class="twobut">
             <a href="reshangchuan.jsp" target="main"></a><a href="tongjiliebiao2.jsp"></a><input type="submit" value="" />
		  </div>
	</div>
    <ul class="page">
       <li><a href="#">首页</a></li>
       <li><a href="#">上一页</a></li>
       <li><a href="#">1</a></li>
       <li><a href="#">2</a></li>
       <li><a href="#">3</a></li>
       <li><a href="#">4</a></li>
       <li><a href="#">5</a></li>
       <li><a href="#">下一页</a></li>
     </ul>
 </div>
 <!--b2-->

                       
                   </div>
     </div>
 </div>
</body>
</html>
