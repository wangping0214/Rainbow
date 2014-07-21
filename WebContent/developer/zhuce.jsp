<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>普通用户注册</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/qiye.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"src="js/jquery.min.js"></script>
<script type="text/javascript"src="js/nav.js"></script>
</head>

<body>
<div class="zccont">
    <ul class="zcnav">
       <li class="li1">邮箱注册</li>
       <li class="li2">手机注册</li>
    </ul>
    <div class="zhuce">
        <div class="zhuceform">
           <div><label>邮箱：</label><input type="text" /></div>
           <div><label>昵称：</label><input type="text" /></div>
           <div><label>密码：</label><input type="text" /></div>
           <div class="border0"><label>确认密码：</label><input type="text" /></div>
        </div>
        <!--zhuceform-->
        <div class="yanzheng">
            <div class="ma"><div><label>验证码：</label><input type="text" /></div><p><img src="images/ma.jpg" /><a href="#"><img src="images/sx.png" /></a></p></div>
            <div class="gree"><input type="checkbox" checked="checked" />我已经阅读并同意<span class="red">《柴米用户服务条数》</span><a href="#">详情阅读</a></div>
        </div>
        <div class="zcbut"><input type="submit" value="马上注册"/></div>
        <!--yanzheng-->
    </div>
    <!--zhuce-->
    <div class="zhuce">
        <div class="zhuceform">
           <div><label>手机号码：</label><input type="text" /></div>
           <div><label>昵称：</label><input type="text" /></div>
           <div><label>密码：</label><input type="text" /></div>
           <div class="border0"><label>确认密码：</label><input type="text" /></div>
        </div>
        <!--zhuceform-->
        <div class="yanzheng">
            <div class="ma"><div><label>验证码：</label><input type="text" /></div><p><input type="button" value="重新发送" /></p></div>
            <div class="gree"><input type="checkbox" checked="checked" />我已经阅读并同意<span class="red">《柴米用户服务条数》</span><a href="#">详情阅读</a></div>
        </div>
        <div class="zcbut"><input type="submit" value="马上注册"/></div>
        <!--yanzheng-->
    </div>
    <!--zhuce-->
</div>
<!--zhucecont-->
</body>
</html>
