<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/qiye.css" rel="stylesheet" type="text/css" />
<title>登陆</title>
<style type="text/css">
*{ padding:0; margin:0;}
.searchcont{ background:url(images/search.png) no-repeat; width:345px; height:38px; line-height:38px; margin:20px 0 27px 20px;}
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
.head img{ vertical-align:middle;}

.midcont{ background:url(images/bg2.png) no-repeat; width:741px; height:533px;padding:10px 20px 20px 40px; overflow:hidden; zoom:1; margin-left:10px;}

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
                <p>您的账号已被封停！如有疑问，请联系我们......</p>
            </div>
       </div>
 </div>
</body>
</html>
