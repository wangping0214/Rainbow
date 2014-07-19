<%@ page import="com.rainbow.entity.User" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%User reg_group_info = (User)session.getAttribute("reg_group_info"); %>
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
                              <div class="tit7"><b>企业用户:</b><span class="green"><%=reg_group_info.getCorporatename() %></span></div>
                              <div class="xiangxi">
                                  <p class="tits">公司信息</p>
                                  <div class="form2" >
                                      <div><label>公司名称：</label><input type="text"id="info_corporatename"value="<%=reg_group_info.getCorporatename()%>" /></div>
                                      <div><label>企业营业执照：</label><p class="fl"><input type="file" id="info_photo" style="display:none;"  />
                                      <%if(reg_group_info.getPhoto1()==null){%>
                                       <a href="<%=request.getContextPath()%>/SuperAdmin/images/img26.png"><img id="inphoto" name="btn" src="<%=request.getContextPath()%>/SuperAdmin/images/img26.png" width="81" height="71" border="0" /></a>
                                       <a href="<%=request.getContextPath()%>/SuperAdmin/images/img26.png"><input type="button" value="导出营业执照" class="daochu"/></a>
                                      <%}
                                      else{%>
                                       <a href="<%=request.getContextPath()%><%=reg_group_info.getPhoto1()%>"><img id="inphoto" name="btn" src="<%=request.getContextPath()%><%=reg_group_info.getPhoto1()%>" width="81" height="71" border="0" /></a>
                                     <a href="<%=request.getContextPath()%><%=reg_group_info.getPhoto1()%>"><input type="button" value="导出营业执照" class="daochu"/></a>
                                      <%} %>
                                      </p>
                                      </div>
                                      <div><label>企业网站：</label><p class="fl"><input type="text" id="info_website"value="<%=reg_group_info.getWebsite()%>"  /></p></div>
                                      <div><label>所在地区：</label><input type="text" id="info_address"value="<%=reg_group_info.getAddress()%>" /></div>
                                      
                                  </div>
                                  <!--form2-->
                                  <hr />
                                  <p class="tits">联系人方式</p>
                                  <div class="form2 form3">
                                      <div><label>联系人姓名：</label><input type="text"id="info_realname"value="<%=reg_group_info.getRealname()%>"  /></div>
                                      <div><label>职务：</label><input type="text"id="info_duty"value="<%=reg_group_info.getDuty()%>"  /></div>
                                      <div><label>Email：</label><input type="text"id="info_email"value="<%=reg_group_info.getEmail()%>" /></div>
                                      <div><label>手机：</label><input type="text"id="info_telephone"value="<%=reg_group_info.getTelephone()%>" /></div>
                                      <div><label>QQ：</label><input type="text"id="info_qqname"value="<%=reg_group_info.getQqname()%>" /></div>
                                  </div>
                                  <div class="back back2"><a href="<%=request.getContextPath()%>/SuperAdmin/shenpitijiao_group.jsp" target="main">下一步</a></div>
                              </div>
                              <!--xiangxi-->

                          </div>
                          
                      </div>
                      <!--guanggaocont-->

               </div>
     </div>
 </div>
 </div>
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
