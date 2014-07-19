<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改个人开发者信息</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/qiye.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"src="js/jquery.min.js"></script>
<script type="text/javascript"src="js/nav.js"></script>
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
                      <form id="form1" name="form1" method="post" action=""  ENCTYPE="multipart/form-data"  onsubmit="alert(document.test_form.browse.value);">
                      <h3 class="tit9">重新填写个人信息</h3>
                      <div class="leixing2">
                         <p class="tits2">账户类型</p>
                         <ul class="leixingnav2">
                            <li class="lei1"><a href="kaifaxinxi.jsp" target="main">企业开发者</a></li>
                            <li class="lei2 over"><a href="gerenkaifazhe.jsp" target="main">个人开发者</a></li>
                         </ul>
                         <!--guanggaonav-->
                      </div>
                      <!--leixing-->
                      <div class="guanggaocont">
                          <div class="huiyuancont">
                              <div class="xiangxi gerenxinxi">
                                  <p class="tits">个人信息</p>
                                  <div class="form2" >
                                      <div><label>姓名：</label><input type="text" /></div>
                                      <div><label>身份证：</label><p class="fl"><img name="btn" src="images/img26.png" width="81" height="71" border="0" /><img name="btn" src="images/img26.png" width="81" height="71" border="0" /></p><p class="zz"><span>请上传身份证，正反面清晰照片即可<b>不超过5MB（.jpg 或 .png 格式）</b></span> <input type="file"  name="browse" style="display:none;"  /><a href="javascript:fn_browse();" title="上传" class="shang shang2">上传身份证件</a></p></div>
                                      <div><label>Email：</label><input type="text" /><p class="zhushi4s">用于发送重要的邮件，包括：应用的审核结果，数据报表，紧急通知等</p></div>
                                      <div><label>手机：</label><input type="text" /></div>
                                      <div><label>QQ：</label><input type="text" /><p class="zhushi4s">(可选)</p></div>  
                                  </div>
                                  <!--form2-->
                                  <div class="xxtijiao"><input type="button" value="保存" /></div> 
                              </div>
                              <!--xiangxi-->
                    
                          </div>
                          <!--huiyuancont-->
                      </div>
                      <!--guanggaocont-->
                </form>
               </div>        
                
     </div>
 </div>
 </div>
</div> 
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
