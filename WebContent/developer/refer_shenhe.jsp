<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>新刊编辑</title>
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
<script language="javascript" type="text/javascript"> 
function fn_browse() 
{ 
document.form1.browse.click(); 
document.form1.file.value = document.all.form1.browse.value; 
} 
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
                      <h3 class="tit2">提交审核</h3>
                      <s:set name="app" value="#request.app"/>
                      <div class="form tjshenhe">
                          <dl class="tubiao">
                             <dt><img src="<%=request.getContextPath() %><s:property value="#app.appSou.logo1"/>" /></dt>
                             <dd><span>APP　ID:</span><s:property value="#app.appInfo.app_id"/></dd>
                             <dd><span>APP 名称:</span><s:property value="#app.appInfo.appName"/></dd>
                          </dl>
                          <div class="appshuoming">
                              <p><span class="xuhao">①</span><input type="button" value="添加商品" class="tian" onclick="location.href='showAppProduct.action?apkId=<s:property value="#app.appInfo.id"/>';" /></p>
                              <p class="ml70">添加商品后，您可以进行SDK测试。</p>
                          </div>
                          <!--appshuoming-->
                          <div class="appshuoming">
                              <p><span class="xuhao">②</span><input type="button" value="完善信息" class="wan" onclick="location.href='dev_consummate_click.action?appId=<s:property value="#app.appInfo.id"/>';" /></p>
                              <p class="ml70">完善信息后，您可以提交您的应用。</p>
                          </div>
                          <!--appshuoming-->
                          <s:if test="#app.appInfo.isThrough==-2">
                          <div class="tjsh"><input type="button" onclick="location.href='dev_audit_submit.action?appId=<s:property value="#app.appInfo.id"/>';" value="提交审核" /></div>
                          </s:if>
                      </div>
                      <!--form-->
 
                   </div>
                   <!--list-->
               </div>
     </div>
 </div>
</body>
</html>
