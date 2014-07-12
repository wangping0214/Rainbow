<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>未通过理由</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style>
.xinxicont label{ width:180px; }
.zhushi{ padding:5px 0 0 190px; font-weight:normal; clear:both;}
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
                  <div class="list">
                 <ul class="shenhenav">
                    <li><a href="devIsThrough.action?appTmp.isThrough=0" target="main">等待审核</a></li>
         			<li class="red"><a href="devIsThrough.action?appTmp.isThrough=-1" target="main">未通过审核</a></li>
                 </ul>      
                 <s:set name="app" value="#request.app"/>            
                     <h3 class="tit2">未通过</h3>
                      <div class="xinxicont">
                          <div class="weilist">
                              <dl>
                                 <dt><img src="<%=request.getContextPath() %><s:property value="#app.appSou.logo1"/>" width="80" height="80"></dt>
                                 <dd><s:property value="#app.appInfo.appName"/></dd>
                              </dl>
                              <textarea class="weiliyou"><s:property value="#app.appAut.reasonsNotThrough"/></textarea>
                          </div>
                          
                          <div class="uppage"><a href="javascript:if(confirm('确认删除<s:property value="#app.appInfo.appName" />'))window.location='devDeleteApp.action?appTmp.deleteAppId=<s:property value="#app.appInfo.id"/>'">删除</a>
                          <a href="devEditApp.action?appTmp.editId=<s:property value="#app.appInfo.id"/>" target="main">重新提交</a></div>
                      </div>
                      <!--dailist-->

               </div>
     </div>
 </div>
 </div>
 
</body>
</html>
