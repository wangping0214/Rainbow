<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/nav.js" type="text/javascript"></script>
<title>已发消息</title>


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
               <div class="list">
                <ul class="mtit3">
                    <li><a href="message2.jsp">通知消息</a></li>
                    <li><a href="yifaxiaoxi.jsp">已发信息</a></li>
                    <li class="blue"><a href="bianxie.jsp">编写消息</a></li>
                </ul>
                <div class="newscont2">
                    <div class="biaoti"><label>用户名：</label><input type="text" value="输入用户名" class="biao"/><input type="checkbox" class="quanfa" />全部发送</div>
                    <div class="biaoti"><label>标　题：</label><input type="text" value="输入标题" class="biao"/></div>
                    <div class="txneirong"><label>内　容：</label><textarea>填写内容</textarea></div>
                    <div class="fasong"><input type="button" value="发送" /></div>
                </div>
                <!--newscont2-->
            </div>
            <!--list-->
       </div>
       <!--midcont-->
 </div>
</body>
</html>
