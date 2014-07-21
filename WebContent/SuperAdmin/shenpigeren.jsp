<%@ page import="com.rainbow.entity.User" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%User reg_user_info = (User)session.getAttribute("reg_user_info"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>企业用户信息</title>
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
                          <div class="tit7"><b>个人用户:</b><span class="green"><%=reg_user_info.getRealname() %></span></div>
                              <div class="xiangxi">
                              <div class="xiangxi gerenxinxi">
                                  <p class="tits">个人信息</p>
                                  <div class="form2" >
                                      <div><label>姓名：</label><input type="text" id="inuser_realname"name="user.realname"value="<%=reg_user_info.getRealname()%>" /></div>
                                      <div><label>职务：</label><input type="text" id="inuser_duty"name="user.duty"value="<%=reg_user_info.getDuty()%>" /></div>
                                      <div><label>身份证：</label><p class="fl"><input type="file" id="inuser_photo1" name="user.cardphoto1" style="display:none;"  /> 
                                      <%if(reg_user_info.getPhoto1()==null){%>
                                       <a href="<%=request.getContextPath()%>/SuperAdmin/images/img26.png"><img id="inphoto1" name="btn" src="<%=request.getContextPath()%>/SuperAdmin/images/img26.png" width="81" height="71" border="0" /></a>
                                      <%}
                                      else{%>
                                       <a href="<%=request.getContextPath()%><%=reg_user_info.getPhoto1()%>"><img id="inphoto1" name="btn" src="<%=request.getContextPath()%><%=reg_user_info.getPhoto1()%>" width="81" height="71" border="0" /></a>
										 <%} %>
                                      <input type="file" id="inuser_photo2" name="user.cardphoto2" style="display:none;"  />
										<%if(reg_user_info.getPhoto2()==null){%>
                                       <a href="<%=request.getContextPath()%>/SuperAdmin/images/img26.png"><img id="inphoto2" name="btn" src="<%=request.getContextPath()%>/SuperAdmin/images/img26.png" width="81" height="71" border="0" /></a>
                                     <%}
                                      else{%>
                                       <a href="<%=request.getContextPath()%><%=reg_user_info.getPhoto2()%>"><img id="inphoto2" name="btn" src="<%=request.getContextPath()%><%=reg_user_info.getPhoto2()%>" width="81" height="71" border="0" /></a>
                                      <%} %>
                                      <a href="<%=request.getContextPath()%><%=reg_user_info.getPhoto1()%>"><input type="button" value="导出身份证件" class="dao"/></a>
                                      </p>
                                      </div>
                                      <div><label>Email：</label><input type="text"id="inuser_email"value="<%=reg_user_info.getEmail()%>" /></div>
                                      <div><label>手机：</label><input type="text" id="inuser_telephone"value="<%=reg_user_info.getTelephone()%>" /></div>
                                      <div><label>QQ：</label><input type="text"id="inuser_qqname"value="<%=reg_user_info.getQqname()%>" /></div>
                                  </div>
                                  <!--form2-->
                                  <div class="back back2"><a href="<%=request.getContextPath()%>/SuperAdmin/shenpitijiao_user.jsp" target="main">下一步</a></div>
                              </div>
                              <!--xiangxi-->

                          </div>
                          
                      </div>
                      <!--guanggaocont-->

               </div>
     </div>
 </div>
 </div>
</div> 
</body>
</html>
