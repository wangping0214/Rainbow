<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
        <s:set name="inuser" value="#request.inuser"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改个体开发者信息</title>
<link href="<%=request.getContextPath()%>/developer/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/developer/css/qiye.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"src="<%=request.getContextPath()%>/developer/js/jquery.min.js"></script>
<script type="text/javascript"src="<%=request.getContextPath()%>/developer/js/nav.js"></script>
<script type="text/javascript"src="<%=request.getContextPath()%>/developer/js/update.js"></script>
<script language="javascript" type="text/javascript"> 
function fn_browse1() 
{ 
	document.inuser_form.inuser_photo1.click(); 
	document.inuser_form.file.value = document.all.inuser_form.inuser_photo1.value;  
} 
function fn_browse2() 
{ 
	document.inuser_form.inuser_photo2.click(); 
	document.inuser_form.file.value = document.all.inuser_form.inuser_photo2.value; 
} 
$(document).ready(function(){
	$("#inuser_photo1").uploadPreview({ Img: "inphoto1"});
	$("#inuser_photo2").uploadPreview({ Img: "inphoto2"});
});
$(document).ready
(
		function()
		{
			user_check();
			$("#inuser_form").submit(userSubmit);
			
		}
);
function userSubmit(){
	if(isUserRealname&&isUserDuty&&isUserEmail&&isUserTelephone&&isUserEmailTel){
		alert("修改资料成功!审核中,请耐心等待。。。");
		return true;
	}
	else {
		alert("很遗憾,请完善信息 .除特殊说明外,均为必填信息！");
		return false;
		}
}
var isUserRealname=true;var isUserDuty=true;var isUserPhoto1=false;var isUserPhoto2=false;var isUserEmail=true;
var isUserTelephone=true;var isUserEmailTel=false;
function user_check(){
	$("#inuser_realname").blur(function(){
		var realname=$("#inuser_realname").val();
		if(realname!="") return isUserRealname=true;
		else return isUserRealname=false;
		
	});
	$("#inuser_duty").blur(function(){
		var duty=$("#inuser_duty").val();
		if(duty!="") return isUserDuty=true;
		else return isUserDuty=false;
	});
	$("#inuser_photo1").blur(function(){
		var photo1=$("#inuser_photo1").val();
		if(photo1!=""||photo1!=null) return isUserPhoto1=true;
		else return isUserPhoto1=false;
	});
	$("#inuser_photo2").blur(function(){
		var photo2=$("#inuser_photo2").val();
		if(photo2!=""||photo2!=null) return isUserPhoto2=true;
		else return isUserPhoto2=false;
	});
	$("#inuser_email").blur(function(){
		var inemail = $("#inuser_email").val();
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
	$("#inuser_telephone").blur(function(){
		var intelephone=$("#inuser_telephone").val();
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
	$("#inuser_submit").click(function(){
		var email=$("#inuser_email").val();var telephone=$("#inuser_telephone").val();
		if(telephone==""||email==""){
			alert("很遗憾,请完善信息 .除特殊说明外,均为必填信息！");
			return isUserEmailTel=false;
		}
			
		else isUserEmailTel=true;
	});
}
function js_user_email()
{
	var inemail = $("#inuser_email").val();
	var inid="<s:property value="#inuser.id"/>";
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
	var intelephone = $("#inuser_telephone").val();
	var inid="<s:property value="#inuser.id"/>";
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
                      <h3 class="tit9">重新填写个人信息</h3>
                      <div class="leixing2">
                         <p class="tits2">账户类型</p>
                         <ul class="leixingnav2">
                            <li class="lei1 over"><a>个人开发者</a></li>
                         </ul>
                         <!--guanggaonav-->
                      </div>
                      <!--leixing-->
                            <div class="guanggaocont">
                          <div class="huiyuancont">
                              <div class="xiangxi">
                              <form id="inuser_form" name="inuser_form" method="post" action="<%=request.getContextPath()%>/upDate_user.action"enctype="multipart/form-data" >
                                  <p class="tits">个人信息</p>
                                  <div class="form2" >
                                      <div><label>姓名：</label><input type="text" id="inuser_realname"name="user.realname"value="<s:property value="#inuser.realname"/>" /></div>
                                      <div><label>职务：</label><input type="text" id="inuser_duty"name="user.duty"value="<s:property value="#inuser.duty"/>" /></div>
                                      <div><label>身份证：</label><p class="fl"><input type="file" id="inuser_photo1" name="user.cardphoto1" style="display:none;"  /><a href="javascript:fn_browse1();"> 
                                       <%if(session.getAttribute("photo1")==null){ %>
                                      <img id="inphoto1"name="btn" src="<%=request.getContextPath()%>/developer/images/img26.png" width="81" height="71" border="0" />
                                      <%} else{%>
                                       <img id="inphoto1" name="btn" src="<%=request.getContextPath()+session.getAttribute("photo1")%>" width="81" height="71" border="0" />
                                      <%} %></a>
                                      <input type="file" id="inuser_photo2" name="user.cardphoto2" style="display:none;"  /><a href="javascript:fn_browse2();"> 
                                      <%if(session.getAttribute("photo2")==null){ %>
                                      <img id="inphoto2"name="btn" src="<%=request.getContextPath()%>/developer/images/img26.png" width="81" height="71" border="0" />
                                      <%} else{%>
                                       <img id="inphoto2" name="btn" src="<%=request.getContextPath()+session.getAttribute("photo2")%>" width="81" height="71" border="0" />
                                      <%} %></a></p>
                                      <p class="zz"><span>请上传身份证，正反面清晰照片即可<b>不超过5MB（.jpg 或 .png 格式）</b></span></p></div>
                                      <div><label>Email：</label><input type="text"id="inuser_email"name="user.email"value="<s:property value="#inuser.email"/>" /><p class="zhushi4s">用于发送重要的邮件，包括：应用的审核结果，数据报表，紧急通知等</p></div>
                                      <div><label>手机：</label><input type="text" id="inuser_telephone"name="user.telephone"value="<s:property value="#inuser.telephone"/>" /></div>
                                      <div><label>QQ：</label><input type="text"id="inuser_qqname"name="user.qqname"value="<s:property value="#inuser.qqname"/>" /><p class="zhushi4s">(可选)</p></div>
                                      <div class="agree"><input type="checkbox" checked="checked" />我已经阅读并同意<a href="#" class="green">《开发者协议》</a></div>
                                         
                                     
                                      
                                  </div>
                                  <!--form2-->
                                  <div class="xxtijiao"><input type="submit"id="inuser_submit"value="提交" /></div> 
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
</body>
</html>
