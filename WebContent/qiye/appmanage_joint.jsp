<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>添加新应用</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript"> 
function fn_browse() 
{ 
document.form1.browse.click(); 
document.form1.file.value = document.all.form1.browse.value; 

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
                 <p class="headnav">联运游戏发布</p>
             </div>
             <!--tit-->
             <div class="tit2">创建APP</div>
             <form id="form1" name="form1" method="post" action="">
             <div class="cont">
                 <p class="explain">*请填写应用名称和应用图标</p>
                 <div class="xinxicont">
                      <div><label>应用名称:</labeL><p class="pp"><input name="textfield2" type="text" class="inputs2" /><p class="zhushi">建议您与应用包中的名称一致。</p></p></div>
                      <div><label>应用图标:</label>
                           <p><input type="file"  name="browse" style="display:none;"  /><a href="javascript:fn_browse();" title="截图"> <img name="btn" src="images/icon2.jpg"  border="0" style="vertical-align:middle"/></a></p>                                         
                           <p class="zhushi3"><input type="file"  name="browse2" style="display:none;"  /><a href="javascript:fn_browse();" title="上传"> <img name="btn" src="images/liulan.jpg"  border="0" style="vertical-align:middle"/></a></p>                                     
                           <p class="zhushi3">请上传.png格式透明图标，512x512分辨率，<br />要求与安装包中图标一致。</p>   
                       </div> 
                       <div class="uppage uppage2"><!--<input type="submit" value="保存并继续" class="tijiao" />--><a href="app_perfect.jsp">保存并继续</a><input type="submit" value="取消" class="quxiao" /></div>
                 </div>
                <!--xinxicont-->
             </div>
             <!--cont-->
             </form>
       </div>
       <!--midcont-->
 </div>
</body>
</html>
