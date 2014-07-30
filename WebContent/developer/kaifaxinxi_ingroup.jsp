<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
        <s:set name="ingroup" value="#request.ingroup"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改企业开发者信息</title>
<link href="<%=request.getContextPath()%>/developer/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/developer/css/qiye.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"src="<%=request.getContextPath()%>/developer/js/jquery.min.js"></script>
<script type="text/javascript"src="<%=request.getContextPath()%>/developer/js/nav.js"></script>
<script type="text/javascript"src="<%=request.getContextPath()%>/developer/js/update.js"></script>
<script charset="utf-8" src="<%=request.getContextPath()%>/scripts/appUpload.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript"> 
function fn_browse() 
{ 
	document.ingroup_form.ingroup_photo.click(); 
	document.ingroup_form.file.value = document.all.ingroup_form.ingroup_photo.value;  
} 
$(document).ready(function(){
	$("#ingroup_photo").uploadPreview({ Img: "inphoto"});
});
$(document).ready
(
		function()
		{
			group_check();
			$("#ingroup_form").submit(groupSubmit);
			
		}
);
function groupSubmit(){
	if(isGroupCorporatename&&isGroupWebsite&&isGroupAddress&&isGroupRealname&&isGroupDuty&&isGroupEmail&&isGroupTelephone&&isGroupEmailTel){
		alert("修改资料成功!审核中,请耐心等待。。。 ");
		return true;
	}
	else {
		alert("很遗憾,请完善信息 .除特殊说明外,均为必填信息！ ");
		return false;
		}
}
var isGroupCorporatename=true;var isGroupPhoto=false;var isGroupWebsite=true;var isGroupAddress=true;
var isGroupRealname=true;var isGroupDuty=true;var isGroupEmail=true;var isGroupTelephone=true;var isGroupEmailTel=false;
function group_check(){
	$("#ingroup_corporatename").blur(function(){
		var corporatename=$("#ingroup_corporatename").val();
		if(corporatename!="") return isGroupCorporatename=true;
		else return isGroupCorporatename=false;
	});
	$("#ingroup_website").blur(function(){
		var website=$("#ingroup_website").val();
		if(website!="") return isGroupWebsite=true;
		else return isGroupWebsite=false;	
	});
	$("#ingroup_address").blur(function(){
		var address=$("#ingroup_addresse").val();
		if(address!="") return isGroupAddress=true;
		else return isGroupAddress=false;	
	});
	$("#ingroup_realname").blur(function(){
		var realname=$("#ingroup_realname").val();
		if(realname!="") return isGroupRealname=true;
		else return isGroupRealname=false;	
	});
	$("#ingroup_duty").blur(function(){
		var duty=$("#ingroup_duty").val();
		if(duty!="") return isGroupDuty=true;
		else return isGroupDuty=false;
	});
	$("#ingroup_photo").blur(function(){
		var photo=$("#ingroup_photo").attr(value);
		if(photo!=""||photo!=null) return isGroupPhoto=true;
		else return isGroupPhoto=false;
	});
	$("#ingroup_email").blur(function(){
		var inemail = $("#ingroup_email").val();
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
	$("#ingroup_telephone").blur(function(){
		var intelephone=$("#ingroup_telephone").val();
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
	$("#ingroup_submit").click(function(){
		var email=$("#ingroup_email").val();var telephone=$("#ingroup_telephone").val();
		if(telephone==""||email==""){
			alert("很遗憾,请完善信息 .除特殊说明外,均为必填信息！");
			return isGroupEmailTel=false;
		}
			
		else isGroupEmailTel=true;
	});
}
function js_group_email()
{
	var inemail = $("#ingroup_email").val();
	var inid="<s:property value="#ingroup.id"/>";
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
	var intelephone = $("#ingroup_telephone").val();
	var inid="<s:property value="#ingroup.id"/>";
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
                      <h3 class="tit9">重新填写企业信息</h3>
                      <div class="leixing2">
                         <p class="tits2">账户类型</p>
                         <ul class="leixingnav2">
                            <li class="lei1 over"><a>企业开发者</a></li>
                         </ul>
                         <!--guanggaonav-->
                      </div>
                      <!--leixing-->
                     <div class="guanggaocont">
                          <div class="huiyuancont">
                              <div class="xiangxi">
                              <form id="ingroup_form" name="ingroup_form" method="post" action="<%=request.getContextPath()%>/upDate_group.action"enctype="multipart/form-data" >
                                  <p class="tits">公司信息</p>
                                  <div class="form2" >
                                      <div><label>公司名称：</label><input type="text"id="ingroup_corporatename"name="user.corporatename"value="<s:property value="#ingroup.corporatename"/>" /> <p class="zhushi4">请填写与企业营业执照等级名称一致公司全称</p></div>
                                      <div><label>企业营业执照：</label><p class="fl"><input type="file" id="ingroup_photo" name="user.cardphoto1" style="display:none;"  /><a href="javascript:fn_browse();">
                                      <%if(session.getAttribute("photo1")==null){ %>
                                       <img id="inphoto" name="btn" src="<%=request.getContextPath()%>/developer/images/img26.png" width="81" height="71" border="0" />
                                      <%} else{%>
                                      <img id="inphoto" name="btn" src="<%=request.getContextPath()+session.getAttribute("photo1")%>" width="81" height="71" border="0" />
                                      <%} %></a></p>
                                      <p class="zz"><span>请上传最新年检的营业执照副本扫描件<b>不超过5MB（.jpg 或 .png 格式）</b></span></p></div>
                                      <div><label>企业网站：</label><p class="fl"><input type="text" id="ingroup_website"name="user.website"value="<s:property value="#ingroup.website"/>"  /></p><p class="zhushi4s">公司网站地址</p></div>
                                      <div><label>所在地区：</label><input type="text" id="ingroup_address"name="user.address"value="<s:property value="#ingroup.address"/>" /><p class="zhushi4s">平台联系您，汇集协议等，请填写有效地址</p></div>
                                      
                                  </div>
                                  <!--form2-->
                                  <hr />
                                  <p class="tits">联系人方式</p>
                                  <div class="form2 form3">
                                      <div><label>联系人姓名：</label><input type="text"id="ingroup_realname"name="user.realname"value="<s:property value="#ingroup.realname"/>"  /></div>
                                      <div><label>职务：</label><input type="text"id="ingroup_duty"name="user.duty"value="<s:property value="#ingroup.duty"/>"  /></div>
                                      <div><label>Email：</label><input type="text"id="ingroup_email"name="user.email"value="<s:property value="#ingroup.email"/>" /><p class="zhushi4s">用于发送重要的邮件，包括：应用的审核结果，数据报表，紧急通知等</p></div>
                                      <div><label>手机：</label><input type="text"id="ingroup_telephone"name="user.telephone"value="<s:property value="#ingroup.telephone"/>" /></div>
                                      <div><label>QQ：</label><input type="text"id="ingroup_qqname"name="user.qqname"value="<s:property value="#ingroup.qqname"/>" /><p class="zhushi4s">(可选)</p></div>
                                      <div class="agree"><input type="checkbox" checked="checked" />我已经阅读并同意<a href="#" class="green">《开发者协议》</a></div>
                                  </div>
                                  <div class="xxtijiao"><input type="submit"id="ingroup_submit"value="提交" /></div>
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
