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
function fn_browse() 
{ 
document.form1.license_file.click(); 
document.form1.license_file.value = document.all.form1.license_file.value; 
} 
$(document).ready
(	
		function()
		{
			$("#license_file").uploadPreview({ Img: "license_photo" });
			$("#submit").click
			(
					function()
					{
						var submitAvailable = true;
						if($("#corporate_name").val() == "")
							{
								submitAvailable = false;
								$("#corporateHint").show();
								$("#corporateHint").removeClass("hint right");
								$("#corporateHint").addClass("hint wrong");
							}
						else
							{
								$("#corporateHint").show();
								$("#corporateHint").removeClass("hint wrong");
								$("#corporateHint").addClass("hint right");
							}
					}
			);
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
                    <li><a href="register_information.jsp" class="current"><span>企业开发者</span></a></li>
                    <li><a href="register_personal.jsp"><span>个人开发者</span></a></li>
                 </ul>
                 <!--nav-->       
             </div>
              <!--leixing-->
             <div class="contauto">
                  
                  <div class="yidao"><img src="images/nav.png" /></div>
                     
              </div>
              <!--contauto-->
             <form id="form1" name="form1" method="post">
             <div class="tit2">公司信息</div>
             <div class="cont">
                  
                 <div class="xinxicont">
                      <div><label>公司名称:</label>
                         <p class="pp">
                         <input name="textfield2" id="corporate_name" type="text" class="inputs2" <%if(null != user.getCorporatename()){ %> value = "<%=user.getCorporatename() %>"<%} %> />
                         <span id="corporateHint" style="display:none;">&nbsp;</span>
                         <p class="zhushi">请填写公司名称。</p></p>
                      </div>
                      <div><label>企业营业执照:</label>
                           <p>
                           		<input type="file"  name="browse" id="license_file" style="display:none;"  />
                           		<a href="javascript:fn_browse()">
                           		<img name="btn" <%if(null == user.getPhoto1()){ %> src="images/icon2.jpg"<%} else { %> vallue="<%=request.getContextPath()+user.getPhoto1() %>"<%} %> id="license_photo" width="120" height="86" border="0" style="vertical-align:middle"/>
                           		<p class="zhushi3"> 
                           		<img name="btn" src="images/liulan.jpg"  border="0" style="vertical-align:middle"/>
                           		</p>
                           		</a>
                           	</p>                                         
                                                                
                           <p class="zhushi3">请上传最新年检的营业执照副本扫描件，大小不超过5MB（.jpg 或 .png 格式）</p>   
                       </div> 
                       <div><label>公司网站:</label>
                         <p class="pp">
                         <input name="textfield2" type="text" class="inputs2" <%if(null != user.getWebsite()){ %> value="<%=user.getWebsite() %>"<%} %> />
                         <span class="hint right">&nbsp;</span><p class="zhushi">公司网站地址。</p></p>
                      </div>
                      <div><label>所在地区:</label>
                         <p class="pp">
                         <input name="textfield2" type="text" class="inputs2" <%if(null != user.getAddress()){ %> value ="<%=user.getAddress() %>"<%} %> />
                         <p class="zhushi">平台联系您，汇集协议等，请填写有效地址。
                         </p></p>
                      </div>
                 </div>
                <!--xinxicont-->
             </div>
             <!--cont-->
             <div class="tit2">联系人方式：</div>
             <div class="cont">
                 <div class="xinxicont">
                     <div><label>联系人姓名:</label><p class="pp">
                     						<input name="textfield2" type="text" class="inputs" <%if(null != user.getRealname()){ %>value="<%=user.getRealname() %>"<%} %> />
                     						</p></div>
                     <div><label>职务:</label><p class="pp">
                     						<input name="textfield2" type="text" class="inputs" <%if(null != user.getDuty()){ %>value="<%=user.getDuty() %>"<%} %> />
                     						</p></div>
                     <div><label>Email:</label><p class="pp">
                     						<input name="textfield2" type="text" class="inputs2" <%if(null != user.getEmail()){ %> value="<%=user.getEmail() %>"<%} %> />
                     						<p class="zhushi">用于发送重要的邮件，包括：应用的审核结果，数据报表，紧急通知等。</p></p>
                      </div>
                      <div><label>手机:</label><p class="pp">
                      						<input name="textfield2" type="text" class="inputs" <%if(null != user.getTelephone()){ %> value="<%=user.getTelephone() %>"<%} %> />
                      						</p></div>
                     <div><label>QQ:</label><p class="pp">
                     						<input name="textfield2" type="text" class="inputs" <%if(null != user.getQqname()){ %> value="<%=user.getQqname() %>"<%} %> /></p>
                     						<p class="zhushi">(可选)</p></div>
                     <div><label>&nbsp;</label>
                         <p class="pp">
                              <input type="checkbox" checked="checked" />我已经阅读并同意<a href="#" class="blue">《开发者协议》</a>
                           </p>
                      </div>
                      
                       
                    </div>
                    <!--xinxicont-->
                    <div class="uppage"><input type="button" id="submit" value="提交信息" class="tijiao" /></div>
             </div>
             <!--cont-->
             
             </form>
       </div>
       <!--midcont-->
 </div>
</body>
</html>
