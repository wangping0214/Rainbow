<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
        <s:set name="user" value="#request.user"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业用户信息</title>
<link href="<%=request.getContextPath()%>/developer/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/developer/css/qiye.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"src="<%=request.getContextPath()%>/developer/js/jquery.min.js"></script>
<script type="text/javascript"src="<%=request.getContextPath()%>/developer/js/nav.js"></script>
<script type="text/javascript"src="<%=request.getContextPath()%>/developer/js/update.js"></script>
<script language="javascript" type="text/javascript"> 
function fn_browse() 
{ 
	document.group_form.group_photo.click(); 
	document.group_form.file.value = document.all.group_form.group_photo.value;  
} 
function fn_browse1() 
{ 
	document.user_form.user_photo1.click(); 
	document.user_form.file.value = document.all.user_form.user_photo1.value;  
} 
function fn_browse2() 
{ 
	document.user_form.user_photo2.click(); 
	document.user_form.file.value = document.all.user_form.user_photo2.value; 
} 
$(document).ready(function(){
	$("#group_photo").uploadPreview({ Img: "photo"});
	$("#user_photo1").uploadPreview({ Img: "photo1"});
	$("#user_photo2").uploadPreview({ Img: "photo2"});
});
$(document).ready
(
		function()
		{
			user_check();
			$("#user_form").submit(userSubmit);
			group_check();
			$("#group_form").submit(groupSubmit);
			
		}
);
function userSubmit(){
	if(isUserRealname&&isUserDuty&&isUserEmail&&isUserTelephone&&isUserEmailTel){
		alert("升级用户申请成功!审核中,请耐心等待。。。");
		return true;
	}
	else {
		alert("很遗憾,请完善信息 .除特殊说明外,均为必填信息！");
		return false;
		}
}
function groupSubmit(){
	if(isGroupCorporatename&&isGroupWebsite&&isGroupAddress&&isGroupRealname&&isGroupDuty&&isGroupEmail&&isGroupTelephone&&isGroupEmailTel){
		alert("升级用户申请成功!审核中,请耐心等待。。。 ");
		return true;
	}
	else {
		alert("很遗憾,请完善信息 .除特殊说明外,均为必填信息！ ");
		return false;
		}
}
var isGroupCorporatename=false;var isGroupPhoto=false;var isGroupWebsite=false;var isGroupAddress=false;
var isGroupRealname=false;var isGroupDuty=false;var isGroupEmail=true;var isGroupTelephone=true;var isGroupEmailTel=false;
var isUserRealname=false;var isUserDuty=false;var isUserPhoto1=false;var isUserPhoto2=false;var isUserEmail=true;
var isUserTelephone=true;var isUserEmailTel=false;
function user_check(){
	$("#user_realname").blur(function(){
		var realname=$("#user_realname").val();
		if(realname!="") return isUserRealname=true;
		else return isUserRealname=false;
		
	});
	$("#user_duty").blur(function(){
		var duty=$("#user_duty").val();
		alert(photo1);
		if(duty!="") return isUserDuty=true;
		else return isUserDuty=false;
	});
	$("#user_photo1").blur(function(){
		var photo1=$("#user_photo1").val();
		alert(photo1);
		if(photo1!=""||photo1!=null) return isUserPhoto1=true;
		else return isUserPhoto1=false;
	});
	$("#user_photo2").blur(function(){
		var photo2=$("#user_photo2").val();
		if(photo2!=""||photo2!=null) return isUserPhoto2=true;
		else return isUserPhoto2=false;
	});
	$("#user_email").blur(function(){
		var inemail = $("#user_email").val();
		if(inemail!=""){
			 var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
	          if (!reg.test(inemail)) {
	        	alert("邮箱格式不正确，请输入正确的邮箱");
	             return isUserEmail =false;
	             }
	          else js_user_email();
		}
		else{
			return isUserEmail =false;
		}
	});
	$("#user_telephone").blur(function(){
		var intelephone=$("#user_telephone").val();
		if(intelephone!=""){
			var reg=/^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/;
			if(!reg.test(intelephone)){
					alert("请输入正确的手机号");
				return isUserTelephone =false;
			}
			else return js_user_telephone();
		}
		else {
			return isUserTelephone =false;
		}
	});
	$("#user_submit").click(function(){
		var email=$("#user_email").val();var telephone=$("#user_telephone").val();
		if(telephone==""||email==""){
			alert("很遗憾,请完善信息 .除特殊说明外,均为必填信息！");
			return isUserEmailTel=false;
		}
			
		else isUserEmailTel=true;
	});
}
function js_user_email()
{
	var inemail = $("#user_email").val();
	var inid="<s:property value="#user.id"/>";
	jQuery.ajax
	(
		{
			type : "post",
			url : "<%=request.getContextPath()%>/changeemail.action",
			data : "inemail=" + inemail+"&inid="+inid,
			cache : false,
			success : function(response)
			{
				if(response=="0"){
					isUserEmail =true;
				}
				else{
					alert("此邮箱已被注册!");
					isUserEmail =false;
				}
			}
		}
	);
}
function js_user_telephone()
{
	var intelephone = $("#user_telephone").val();
	var inid="<s:property value="#user.id"/>";
	jQuery.ajax
	(
		{
			type : "post",
			url : "<%=request.getContextPath()%>/changetelephone.action",
			data : "intelephone=" + intelephone+"&inid="+inid,
			cache : false,
			success : function(response)
			{
				if(response=="0"){
					isUserTelephone =true;
				}
				else{
					alert("此手机号已被注册");
					isUserTelephone =false;
				}
			}
		}
	);
}

function group_check(){
	$("#group_corporatename").blur(function(){
		var corporatename=$("#group_corporatename").val();
		if(corporatename!="") return isGroupCorporatename=true;
		else return isGroupCorporatename=false;
	});
	$("#group_website").blur(function(){
		var website=$("#group_website").val();
		if(website!="") return isGroupWebsite=true;
		else return isGroupWebsite=false;	
	});
	$("#group_address").blur(function(){
		var address=$("#group_addresse").val();
		if(address!="") return isGroupAddress=true;
		else return isGroupAddress=false;	
	});
	$("#group_realname").blur(function(){
		var realname=$("#group_realname").val();
		if(realname!="") return isGroupRealname=true;
		else return isGroupRealname=false;	
	});
	$("#group_duty").blur(function(){
		var duty=$("#group_duty").val();
		if(duty!="") return isGroupDuty=true;
		else return isGroupDuty=false;
	});
	$("#group_photo").blur(function(){
		var photo=$("#group_photo").val();
		if(photo!=""||photo!=null) return isGroupPhoto=true;
		else return isGroupPhoto=false;
	});
	$("#group_email").blur(function(){
		var inemail = $("#group_email").val();
		if(inemail!=""){
			 var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
	          if (!reg.test(inemail)) {
	        	alert("邮箱格式不正确，请输入正确的邮箱");
	             return isGroupEmail =false;
	             }
	          else js_group_email();
		}
		else{
			return isGroupEmail =false;
		}
	});
	$("#group_telephone").blur(function(){
		var intelephone=$("#group_telephone").val();
		if(intelephone!=""){
			var reg=/^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/;
			if(!reg.test(intelephone)){
					alert("请输入正确的手机号");
				return isGroupTelephone =false;
			}
			else return js_group_telephone();
		}
		else {
			return isGroupTelephone =false;
		}
	});
	$("#group_submit").click(function(){
		var email=$("#group_email").val();var telephone=$("#group_telephone").val();
		if(telephone==""||email==""){
			alert("很遗憾,请完善信息 .除特殊说明外,均为必填信息！");
			return isGroupEmailTel=false;
		}
			
		else isGroupEmailTel=true;
	});
}
function js_group_email()
{
	var inemail = $("#group_email").val();
	var inid="<s:property value="#user.id"/>";
	jQuery.ajax
	(
		{
			type : "post",
			url : "<%=request.getContextPath()%>/changeemail.action",
			data : "inemail=" + inemail+"&inid="+inid,
			cache : false,
			success : function(response)
			{
				if(response=="0"){
					isGroupEmail =true;
				}
				else{
					alert("此邮箱已被注册!");
					isGroupEmail =false;
				}
			}
		}
	);
}
function js_group_telephone()
{
	var intelephone = $("#group_telephone").val();
	var inid="<s:property value="#user.id"/>";
	jQuery.ajax
	(
		{
			type : "post",
			url : "<%=request.getContextPath()%>/changetelephone.action",
			data : "intelephone=" + intelephone+"&inid="+inid,
			cache : false,
			success : function(response)
			{
				if(response=="0"){
					isGroupTelephone =true;
				}
				else{
					alert("此手机号已被注册");
					isGroupTelephone =false;
				}
			}
		}
	);
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
                      <h3 class="tit9">完善企业信息</h3>
                      <div class="yidao"><img src="<%=request.getContextPath()%>/developer/images/nav.png" /></div>
                      <div class="leixing">
                         <p class="tits2">账户类型</p>
                         <ul class="leixingnav">
                            <li class="lei1">企业开发者</li>
                            <li class="lei2">个人开发者</li>
                         </ul>
                         <!--guanggaonav-->
                      </div>
                      <!--leixing-->
                      <div class="guanggaocont">
                          <div class="huiyuancont">
                              <div class="xiangxi">
                              <form id="group_form" name="group_form" method="post" action="<%=request.getContextPath()%>/upDate_group.action"enctype="multipart/form-data" >
                                  <p class="tits">公司信息</p>
                                  <div class="form2" >
                                      <div><label>公司名称：</label><input type="text"id="group_corporatename"name="user.corporatename"value="<s:property value="#user.corporatename"/>" /> <p class="zhushi4">请填写与企业营业执照等级名称一致公司全称</p></div>
                                      <div><label>企业营业执照：</label><p class="fl"><input type="file" id="group_photo" name="user.cardphoto1" style="display:none;"  /><a href="javascript:fn_browse();">
                                      <%if(session.getAttribute("photo1")==null){ %>
                                       <img id="photo" name="btn" src="<%=request.getContextPath()%>/developer/images/img26.png" width="81" height="71" border="0" />
                                      <%} else{%>
                                      <img id="photo" name="btn" src="<%=request.getContextPath()+session.getAttribute("photo1")%>" width="81" height="71" border="0" />
                                      <%} %></a></p>
                                      <p class="zz"><span>请上传最新年检的营业执照副本扫描件<b>不超过5MB（.jpg 或 .png 格式）</b></span></p></div>
                                      <div><label>企业网站：</label><p class="fl"><input type="text" id="group_website"name="user.website"value="<s:property value="#user.website"/>"  /></p><p class="zhushi4s">公司网站地址</p></div>
                                      <div><label>所在地区：</label><input type="text" id="group_address"name="user.address"value="<s:property value="#user.address"/>" /><p class="zhushi4s">平台联系您，汇集协议等，请填写有效地址</p></div>
                                      
                                  </div>
                                  <!--form2-->
                                  <hr />
                                  <p class="tits">联系人方式</p>
                                  <div class="form2 form3">
                                      <div><label>联系人姓名：</label><input type="text"id="group_realname"name="user.realname"value="<s:property value="#user.realname"/>"  /></div>
                                      <div><label>职务：</label><input type="text"id="group_duty"name="user.duty"value="<s:property value="#user.duty"/>"  /></div>
                                      <div><label>Email：</label><input type="text"id="group_email"name="user.email"value="<s:property value="#user.email"/>" /><p class="zhushi4s">用于发送重要的邮件，包括：应用的审核结果，数据报表，紧急通知等</p></div>
                                      <div><label>手机：</label><input type="text"id="group_telephone"name="user.telephone"value="<s:property value="#user.telephone"/>" /></div>
                                      <div><label>QQ：</label><input type="text"id="group_qqname"name="user.qqname"value="<s:property value="#user.qqname"/>" /><p class="zhushi4s">(可选)</p></div>
                                      <div class="agree"><input type="checkbox" checked="checked" />我已经阅读并同意<a href="#" class="green">《开发者协议》</a></div>
                                  </div>
                                  <div class="xxtijiao"><input type="submit"id="group_submit" value="提交" /></div>
                                  </form>
                              </div>
                              <!--xiangxi-->
                    
                          </div>
                          <!--huiyuancont-->
                      </div>
                      <!--guanggaocont-->
                      <div class="guanggaocont">
                          <div class="huiyuancont">
                              <div class="xiangxi">
                              <form id="user_form" name="user_form" method="post" action="<%=request.getContextPath()%>/upDate_user.action"enctype="multipart/form-data" >
                                  <p class="tits">个人信息</p>
                                  <div class="form2" >
                                      <div><label>姓名：</label><input type="text" id="user_realname"name="user.realname"value="<s:property value="#user.realname"/>" /></div>
                                      <div><label>职务：</label><input type="text" id="user_duty"name="user.duty"value="<s:property value="#user.duty"/>" /></div>
                                      <div class="shenfen"><label>身份证：</label><p class="fl"><input type="file" id="user_photo1" name="user.cardphoto1" style="display:none;"  /><a href="javascript:fn_browse1();"> 
                                       <%if(session.getAttribute("photo1")==null||session.getAttribute("photo1")==""){ %>
                                      <img id="photo1"name="btn" src="<%=request.getContextPath()%>/developer/images/img26.png" width="81" height="71" border="0" />
                                      <%} else{%>
                                       <img id="photo1" name="btn" src="<%=request.getContextPath()+session.getAttribute("photo1")%>" width="81" height="71" border="0" />
                                      <%} %></a>
                                      <input type="file" id="user_photo2" name="user.cardphoto2" style="display:none;"  /><a href="javascript:fn_browse2();"> 
                                      <%if(session.getAttribute("photo2")==null||session.getAttribute("photo2")==""){ %>
                                      <img id="photo2"name="btn" src="<%=request.getContextPath()%>/developer/images/img26.png" width="81" height="71" border="0" />
                                      <%} else{%>
                                       <img id="photo2" name="btn" src="<%=request.getContextPath()+session.getAttribute("photo2")%>" width="81" height="71" border="0" />
                                      <%} %></a></p>
                                      <p class="zz"><span>请上传身份证，正反面清晰照片即可<b>不超过5MB（.jpg 或 .png 格式）</b></span></p></div>
                                      <div><label>Email：</label><input type="text"id="user_email"name="user.email"value="<s:property value="#user.email"/>" />
                                      <p class="zhushi4s">用于发送重要的邮件，包括：应用的审核结果，数据报表，紧急通知等</p></div>
                                      <div><label>手机：</label><input type="text" id="user_telephone"name="user.telephone"value="<s:property value="#user.telephone"/>" /></div>
                                      <div><label>QQ：</label><input type="text"id="user_qqname"name="user.qqname"value="<s:property value="#user.qqname"/>" /><p class="zhushi4s">(可选)</p></div>
                                      <div class="agree"><input type="checkbox" checked="checked" />我已经阅读并同意<a href="#" class="green">《开发者协议》</a></div>
                                         
                                     
                                      
                                  </div>
                                  <!--form2-->
                                  <div class="xxtijiao"><input type="submit"id="user_submit" value="提交" /></div> 
                                  </form>
                              </div>
                              <!--xiangxi-->
                    
                          </div>
                          <!--huiyuancont-->
                      </div>
                      <!--guanggaocont-->
               </div>        
                
     </div>
 </div>
 </div> 
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
