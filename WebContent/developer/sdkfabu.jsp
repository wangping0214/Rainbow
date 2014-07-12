<%@ page language="java" import="com.rainbow.server.App" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%App app=new App();
      if(session.getAttribute("app")!=null){
             app = (App)session.getAttribute("app");
             }
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>应用首页</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
*{padding:0; margin:0;}
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
	color: #0066CC;
	font-family: "微软雅黑";
	font-size: 20px;
	margin-left: 20px;
	margin-top:20px;
	font-weight: bold;
	height: 50px;
	width: 240px;
	background-color: #FFFFFF;
}
.b1{
	color: #99CC00;
	font-family: "微软雅黑";
	font-size: 16px;
	margin-left: 20px;
	margin-top:5px;
	font-weight: bold;
	height: 25px;
	width: 90px;
	text-align:center;
	background-color: #FFFFFF;
}
.b2{
	 clear:both;
	color: #0066CC;
	font-family: "微软雅黑";
	margin-left: 150px;
	margin-top:20px; overflow:hidden; zoom:1;
	width: auto;
	background-color: #FFFFFF;
}
.b3{
	color: #000000;
	font-family: "微软雅黑";
	font-size: 14px;
	margin-left: 5px;
	margin-top:5px;
	font-weight: bold;
	height: 225px;
	width: 140px;
	float: left;
}
.head{ width:160px;}
.b3-1{
	color: #999999;
	font-family: "微软雅黑";
	font-size: 20px;
	margin-left: 5px;
	margin-top:5px;
	height: 205px;
	width: 160px;
	float: left;
	border:1px solid #999;
	text-align:center;
	line-height:205px;
}
.b31{
	font-family: "微软雅黑";
	height: 20px;
	width: 160px;
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
</style>
<script type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
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
                   <div class="list">
                      <h3 class="tit2">选择发布类型</h3>
                        <div class="sdkfabu">
                        <form id="form" name="form" method="post" action="devJointSub.action" enctype="multipart/form-data">
                            <div>
                                <p class="size20"><input type="radio" name="joint"  <%if(app.getAppInfo().getJoint()==0){ %> checked="checked"<%} %>  value="0" />应用推广</p>
                                <p class="sdkcont">如果您的应用已经开发完成，并希望能在柴米游戏平台上展示该作品。您此时只需要按照我们的发布流程填写应用的相关信息。上传APP及相关蔬菜提交就可以了。
</p>
                            </div>
                            <div>
                                <p class="size20"><input type="radio" name="joint"  <%if(app.getAppInfo().getJoint()==1){ %> checked="checked"<%} %>  value="1" />联运发布（已集成柴米游戏SDK）</p>
                                <p class="sdkcont">诺您已的应用已集成柴米游戏提供的SDK服务。您可以通过该入后进行游戏的创建和提交。<span class="red">注：若无集成柴米平台的SDK，请勿使用该功能。</span></p>
                            </div>
                            
                            <div class="goon"><div class="uppage"><input type="submit" value="继续" class="tijiao" id="id_submit"/></div><a href="javascript:window.history.back(-1);"><img src="images/quxiao.jpg" width="70" height="30" /></a></div>
                        </form>
                        </div>
                       
                      <!--sdkfabu-->
                   </div>
                   <!--list-->
               </div>
     </div>
 </div>
</body>
</html>
