<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
	        <s:set name="group_info" value="#request.group_info"/>
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
                              <div class="tit7"><b>企业用户:</b><span class="green"><s:property value="#group_info.corporatename"/></span></div>
                              <div class="xiangxi">
                                  <p class="tits">公司信息</p>
                                  <div class="form2" >
                                      <div><label>公司名称：</label><input type="text"id="info_corporatename"value="<s:property value="#group_info.corporatename"/>" /></div>
                                      <div><label>企业营业执照：</label><p class="fl"><input type="file" id="info_photo" style="display:none;"  />
                                      <s:if test="#group_info.photo1==null">
                                       <a href="<%=request.getContextPath()%>/SuperAdmin/images/img26.png"><img id="inphoto" name="btn" src="<%=request.getContextPath()%>/SuperAdmin/images/img26.png" width="81" height="71" border="0" /></a>
                                       <a href="<%=request.getContextPath()%>/SuperAdmin/images/img26.png"><input type="button" value="导出营业执照" class="daochu"/></a>
                                      </s:if>
                                      <s:if test="#group_info.photo1!=null">
                                       <a href="<%=request.getContextPath()%><s:property value="#group_info.photo1"/>"><img id="inphoto" name="btn" src="<%=request.getContextPath()%><s:property value="#group_info.photo1"/>" width="81" height="71" border="0" /></a>
                                     <a href="<%=request.getContextPath()%><s:property value="#group_info.photo1"/>"><input type="button" value="导出营业执照" class="daochu"/></a>
                                      </s:if>
                                      </p>
                                      </div>
                                      <div><label>企业网站：</label><p class="fl"><input type="text" id="info_website"value="<s:property value="#group_info.website"/>"  /></p></div>
                                      <div><label>所在地区：</label><input type="text" id="info_address"value="<s:property value="#group_info.address"/>" /></div>
                                      
                                  </div>
                                  <!--form2-->
                                  <hr />
                                  <p class="tits">联系人方式</p>
                                  <div class="form2 form3">
                                      <div><label>联系人姓名：</label><input type="text"id="info_realname"value="<s:property value="#group_info.realname"/>"  /></div>
                                      <div><label>职务：</label><input type="text"id="info_duty"value="<s:property value="#group_info.duty"/>"  /></div>
                                      <div><label>Email：</label><input type="text"id="info_email"value="<s:property value="#group_info.email"/>" /></div>
                                      <div><label>手机：</label><input type="text"id="info_telephone"value="<s:property value="#group_info.telephone"/>" /></div>
                                      <div><label>QQ：</label><input type="text"id="info_qqname"value="<s:property value="#group_info.qqname"/>" /></div>
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
