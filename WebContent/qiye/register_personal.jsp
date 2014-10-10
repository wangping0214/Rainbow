<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.rainbow.entity.User"%>
<%@ page import="com.rainbow.constant.*" %>
<%
	User user = (User)session.getAttribute("user");
	if(null == user) 
		user = new User();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加新应用</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/preview.picture.js"></script>
<script language="javascript" type="text/javascript"> 
function fn_browse1() 
{ 
document.form1.file_id_card1.click(); 
document.form1.file_id_card1.value = document.all.form1.file_id_card1.value; 
} 
function fn_browse2() 
{ 
document.form1.file_id_card2.click(); 
document.form1.file_id_card2.value = document.all.form1.file_id_card2.value; 
} 
$(document).ready
(	
		function()
		{
			$("#file_id_card1").uploadPreview({ Img: "photo_id_card1" });
			$("#file_id_card2").uploadPreview({ Img: "photo_id_card2" });
		}
);
</script>
</head>

<body>
<div class="content">
     <div class="search">
               <div class="searchcont">
                   <input type="text" value="搜索关键词" class="socont"/><input type="image" src="images/a1_04.jpg" value="" class="sobut"/>
               </div>
               <!--searchcont-->
      </div>
      <!--serach-->
      <div class="midcont">
          
             <div class="tit">
                 <p class="headnav">注册</p>
             </div>
             <!--tit-->
             <div class="leixing">
                 <ul class="nav kaifaleixing">
                    <li><a href="register_information.jsp"><span>企业开发者</span></a></li>
                    <li><a href="register_personal.jsp" class="current"><span>个人开发者</span></a></li>
                 </ul>
                 <!--nav-->       
             </div>
              <!--leixing-->
             <div class="contauto">
                  
                  <div class="yidao"><img src="images/nav.png" /></div>
                     
              </div>
              <!--contauto-->
             <form id="form1" name="form1" method="post" action="">
             <div class="tit2">个人信息</div>
             <div class="cont">
                  
                 <div class="xinxicont">
                      <div><label>姓名:</label>
                         <p class="pp"><input name="textfield2" type="text" class="inputs2" <%if(null != user.getRealname()){ %> value="<%=user.getRealname() %>" <%} %> /></p>
                      </div>
                      <div><label>企业营业执照:</label>
                           <p>
                           <input type="file"  name="browse" id="file_id_card1" style="display:none;"  />
                           <a href="javascript:fn_browse1();" title="截图"> 
                           		<img name="btn" width="120" height="86" <%if(null == user.getPhoto1()){ %> src="images/icon2.jpg" <%} else{ %> src="<%=request.getContextPath()+user.getPhoto1() %>"<%} %> id="photo_id_card1" border="0" style="vertical-align:middle"/>
                           	</a>
                           <input type="file"  name="browse2" id="file_id_card2" style="display:none;"  />　
                           <a href="javascript:fn_browse2();" title="截图"> 
                           		<img name="btn" width="120" height="86" <%if(null == user.getPhoto2()){ %> src="images/icon2.jpg" <%} else{ %>src="<%=request.getContextPath()+user.getPhoto2() %>" <%} %> id="photo_id_card2" border="0" style="vertical-align:middle"/>
                           </a></p>                                         
                           <p class="zhushi3">请上传身份证，正反面清晰照片即可不超过5MB（.jpg 或 .png 格式）</p>   
                       </div> 
                       <div><label>Email:</label><p class="pp">
                       						<input name="textfield2" type="text" class="inputs2" <%if(null != user.getEmail()){ %> value="<%=user.getEmail() %>"<%} %> />
                       						<span class="hint right">&nbsp;</span>
                       						<p class="zhushi">用于发送重要的邮件，包括：应用的审核结果，数据报表，紧急通知等。</p></p>
                      </div>
                      <div><label>手机:</label><p class="pp">
                      						<input name="textfield2" type="text" class="inputs"<%if(null != user.getTelephone()){ %> value="<%=user.getTelephone() %>"<%} %> />
                      						<span class="hint wrong">请填写手机号</span></p></div>
                     <div><label>QQ:</label><p class="pp">
                     						<input name="textfield2" type="text" class="inputs" <%if(null !=user.getQqname() ){ %> value="<%=user.getQqname() %>"<%} %> /></p>
                     						<p class="zhushi">(可选)</p></div>
                     <div><label>&nbsp;</label><p class="pp">
                              				<input type="checkbox" checked="checked" />我已经阅读并同意
                              				<a href="#" class="blue">《开发者协议》</a>
                           </p>
                      </div>
                 </div>
                <!--xinxicont-->
                <div class="uppage"><input type="submit" value="提交信息" class="tijiao" /></div>
             </div>
             <!--cont-->

             
             </form>
       </div>
       <!--midcont-->
 </div>
</body>
</html>
