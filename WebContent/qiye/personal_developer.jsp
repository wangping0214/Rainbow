<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加新应用</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript"> 
function fn_browse() 
{ 
document.form1.browse.click(); 
document.form1.file.value = document.all.form1.browse.value; 
document.form1.browse1.click(); 
document.form1.file.value = document.all.form1.browse1.value; 
document.form1.browse2.click(); 
document.form1.file.value = document.all.form1.browse2.value; 
} 
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
                 <p class="headnav">个人开发者信息</p>
             </div>
             <!--tit-->
             <form id="form1" name="form1" method="post" action="">
             <div class="tit2">个人信息：</div>
             <div class="cont">
                 <div class="xinxicont">
                     <div><label>联系人姓名:</label><p class="pp"><input name="textfield2" type="text" class="inputs" /></p></div>
                     <div><label>职务:</label><p class="pp"><input name="textfield2" type="text" class="inputs" /></p></div>
                      <div><label>企业营业执照:</label>
                           <p><input type="file"  name="browse" style="display:none;"  /><a href="javascript:fn_browse();" title="截图"> <img name="btn" src="images/icon2.jpg"  border="0" style="vertical-align:middle"/></a><input type="file"  name="browse2" style="display:none;"  /><a href="javascript:fn_browse();" title="截图"> <img name="btn" src="images/icon2.jpg"  border="0" style="vertical-align:middle"/></a></p>                                         
                           <p class="zhushi3"><input type="file"  name="browse2" style="display:none;"  /><a href="javascript:fn_browse();" title="上传"> <img name="btn" src="images/liulan.jpg"  border="0" style="vertical-align:middle"/></a></p>                                     
                           <p class="zhushi3">请上传身份证正反面清晰照片即可，大小不超过5MB（.jpg 或 .png 格式）</p>   
                       </div> 
                     <div><label>Email:</label>
                         <p class="pp"><input name="textfield2" type="text" class="inputs2" /><p class="zhushi">用于发送重要的邮件，包括：应用的审核结果，数据报表，紧急通知等。</p></p>
                      </div>
                      <div><label>手机:</label><p class="pp"><input name="textfield2" type="text" class="inputs" /></p></div>
                     <div><label>QQ:</label><p class="pp"><input name="textfield2" type="text" class="inputs" /></p><p class="zhushi">(可选)</p></div>
                     <div><label>&nbsp;</label>
                         <p class="pp">
                              <input type="checkbox" checked="checked" />我已经阅读并同意<a href="#" class="blue">《开发者协议》</a>
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
