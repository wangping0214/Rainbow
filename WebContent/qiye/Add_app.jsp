<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>添加应用</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="content">
     <div class="search">
               <div class="searchcont">
                   <input type="text" value="搜索关键词" class="socont"/><input type="image" src="images/a1_04.jpg" value="" class="sobut"/>
               </div>
               <!--searchcont-->
      </div>
      <!--serach-->
      <div class="midcont">
             <div class="tit">
                 <p class="headnav">添加应用</p>
             </div>
             <!--tit-->
             <div class="cont">
                 <h3 class="addtit">请选择发布类型</h3>
                 <div class="mold">
                     <dl class="meifht50">
                         <dt><a href="appmanage_joint.jsp" target="main">联运游戏</a></dt>
                         <dd>需接入柴米游戏平台的SDK</dd>
                     </dl>
                     <dl>
                         <dt><a href="Add_newapp.jsp" target="main">添加新应用</a></dt>
                         <dd>在柴米游戏平台上展示该作品</dd>
                     </dl>
               </div>
               <!--mold-->
              </div>
              <!--cont-->
       </div>
       <!--midcont-->
 </div>
</body>
</html>
