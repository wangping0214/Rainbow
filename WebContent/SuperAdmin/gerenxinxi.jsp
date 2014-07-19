<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
	 <s:set name="user_info" value="#request.user_info"/>
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
                          <div class="tit7"><b>个人用户:</b><span class="green"><s:property value="#user_info.realname"/></span></div>
                              <div class="xiangxi">
                              <div class="xiangxi gerenxinxi">
                                  <p class="tits">个人信息</p>
                                  <div class="form2" >
                                      <div><label>姓名：</label><input type="text" id="inuser_realname"name="user.realname"value="<s:property value="#user_info.realname"/>" /></div>
                                      <div><label>职务：</label><input type="text" id="inuser_duty"name="user.duty"value="<s:property value="#user_info.duty"/>" /></div>
                                      <div><label>身份证：</label><p class="fl"><input type="file" id="inuser_photo1" name="user.cardphoto1" style="display:none;"  /> 
                                      <s:if test="#user_info.photo1==null">
                                       <a href="<%=request.getContextPath()%>/SuperAdmin/images/img26.png"><img id="inphoto1" name="btn" src="<%=request.getContextPath()%>/SuperAdmin/images/img26.png" width="81" height="71" border="0" /></a>
                                      </s:if>
                                       <s:if test="#user_info.photo1!=null">
                                       <a href="<%=request.getContextPath()%><s:property value="#user_info.photo1"/>"><img id="inphoto1" name="btn" src="<%=request.getContextPath()%><s:property value="#user_info.photo1"/>" width="81" height="71" border="0" /></a>
										</s:if>
                                      <input type="file" id="inuser_photo2" name="user.cardphoto2" style="display:none;"  />
										<s:if test="#user_info.photo2==null">
                                       <a href="<%=request.getContextPath()%>/SuperAdmin/images/img26.png"><img id="inphoto2" name="btn" src="<%=request.getContextPath()%>/SuperAdmin/images/img26.png" width="81" height="71" border="0" /></a>
                                      </s:if>
										<s:if test="#user_info.photo2!=null">
                                       <a href="<%=request.getContextPath()%><s:property value="#user_info.photo2"/>"><img id="inphoto2" name="btn" src="<%=request.getContextPath()%><s:property value="#user_info.photo2"/>" width="81" height="71" border="0" /></a>
                                      </s:if>
                                      <a href="<%=request.getContextPath()%><s:property value="#user_info.photo1"/>"><input type="button" value="导出身份证件" class="dao"/></a>
                                      </p>
                                      </div>
                                      <div><label>Email：</label><input type="text"id="inuser_email"value="<s:property value="#user_info.email"/>" /></div>
                                      <div><label>手机：</label><input type="text" id="inuser_telephone"value="<s:property value="#user_info.telephone"/>" /></div>
                                      <div><label>QQ：</label><input type="text"id="inuser_qqname"value="<s:property value="#user_info.qqname"/>" /></div>
                                  </div>
                                  <!--form2-->
                              </div>
                              <!--xiangxi-->
                    
                          </div>
                          <!--huiyuancont-->
                      </div>

               </div>
     </div>
 </div>
 </div>
</div> 
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
