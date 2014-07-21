<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/developer/css/qiye.css" rel="stylesheet" type="text/css" />
<title>登陆</title>
<style type="text/css">
*{ padding:0; margin:0;}
.searchcont{ background:url(<%=request.getContextPath()%>/developer/images/search.png) no-repeat; width:345px; height:38px; line-height:38px; margin:20px 0 27px 20px;}
.searchcont input{outline:none; height:38px; line-height:38px; float:left;}
.socont{ width:285px; height:35px;background:none; border:none; margin-left:4px; display:inline; color:#FFF; font-size:14px;}
.sobut{ width:55px; height:35px; background:none; border:none; cursor:pointer}


.head{
	color: #666;
	font-family: "微软雅黑";
	font-size: 18px;
	text-align:left;
	margin-top:20px;
	height: 300px;
	width: auto;
	 font-weight:normal;
}


/*.midcont{ background:url(images/img15s.png) no-repeat; width:741px; height:680px;padding:10px 20px 20px 40px; overflow:hidden; zoom:1; margin-left:10px;}*/
.midcont{ background:url(<%=request.getContextPath()%>/developer/images/bg2.png) no-repeat; width:741px; height:533px;padding:10px 20px 20px 40px; overflow:hidden; zoom:1; margin-left:10px;}
.content{ width:820px;float:left; background:#F2F2F2; height:100%;}

</style>
</head>

<body>
<div class="content">
     <div class="search">
               <div class="searchcont">
                   <input type="text" value="搜索" class="socont fl"/><input type="submit" value="" class="sobut fr"/>
               </div>
               <!--searchcont-->
      </div>
             <div class="midcont">
             <div class="head">
                <p class="hy">欢迎登陆 "柴米游戏平台"后台管理系统</p>
                <p class="yf">柴米游戏开发者中心</p>
                <p>与柴米游戏的亿万安卓用户更靠近！</p>
                <p>和千万优秀的开发者一起，为安卓手机加油！</p>
            </div>
       </div>
 </div>
</body>
</html>
