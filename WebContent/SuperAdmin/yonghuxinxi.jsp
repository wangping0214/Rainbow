<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
	 <s:set name="info" value="#request.info"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>个人用户信息</title>
<link href="<%=request.getContextPath()%>/SuperAdmin/css/style.css" rel="stylesheet" type="text/css" />
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
                      <ul class="guanggaonav">
                         <li><a href="<%=request.getContextPath()%>/mem_manager.action?isuserType=individualGroups" target="main">会员管理审批</a></li>
                      </ul>
                      <div class="guanggaocont">
                          <div class="huiyuancont">
                              <div class="tit7"><b>普通用户:</b><span class="green"><s:property value="#info.username"/></span></div>
                              <div class="xiangxi">
                                  <p class="tits">联系人方式</p>
                                  <div class="form2 form3">
                                      <div><label>邮箱：</label><input type="text" value="<s:property value="#info.email"/>"/></div>
                                      <div><label>手机：</label><input type="text" value="<s:property value="#info.telephone"/>"/></div>
                                      <div><label>昵称：</label><input type="text" value="<s:property value="#info.username"/>"/></div>
                                      
                                  </div>
                              </div>
                              <!--xiangxi-->

                          </div>
                          
                      </div>
                      <!--guanggaocont-->

               </div>
     </div>
 </div>
 </div>
</body>
</html>
