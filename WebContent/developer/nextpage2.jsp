<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传素材</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style>
.xinxicont label{ width:180px; }
.zhushi{ padding:5px 0 0 190px; font-weight:normal; clear:both;}
</style>
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
                      <h3 class="tit2">上传-素材</h3>
                      <div class="xinxicont">
                          <form id="form1" name="form1" method="post" action="">
                               <div><label>应用程序包:</label><p class="pp"><input height="30" name="textfield2" type="text" size="40" /><input type="file"  name="browse" style="display:none;"  /><a href="javascript:fn_browse();" title="上传"> <img name="btn" src="images/img25.png" width="26" height="26" border="0" style="vertical-align:middle"/></a><p class="zhushi">请上传首发时的软件应用包APK文件，大小不超过1GB<br /><a href="#" class="bluea">上传失败常见问题及解决办法！
</a>
</p></p>
                               </div>
                               <div><label>logo图标:</label><p class="pp"><input height="30" name="textfield2" type="text" size="40" /><input type="file"  name="browse1" style="display:none;"  /><a href="javascript:fn_browse();" title="上传"> <img name="btn" src="images/img25.png" width="26" height="26" border="0" style="vertical-align:middle"/></a><p class="zhushi">尺寸72px*72px，png格式，圆角 ，具体请参考<a href="#" class="bluea"> Logo样本</a>
</p></p>
                               </div>
                               <div><label>logo图标(512*512):</label><p class="pp"><input height="30" name="textfield2" type="text" size="40" /><input type="file"  name="browse2" style="display:none;"  /><a href="javascript:fn_browse();" title="上传"> <img name="btn" src="images/img25.png" width="26" height="26" border="0" style="vertical-align:middle"/></a><p class="zhushi">我们建议您提供高清的LOGO图标，这样可以获得更好的视觉展示效果和用户点击。
尺寸512px*512px，png格式，圆角，具体参考Logo样本
我们建议您提供高清的LOGO图标，这样可以获得更好的视觉展示效果和用户点击。<br />
尺寸512px*512px，png格式，圆角，具体参考
<a href="#" class="bluea"> Logo样本</a>
</p></p>
                               </div>
                               <div style=" clear:both; overflow:hidden; zoom:1;"><label>游戏图片素材:</label><div class="sclogo">
                                   <div class="logoimg">
                                      <div>
                                          <input type="file"  name="browse2" style="display:none;"  /><a href="javascript:fn_browse();" title="上传"> <img name="btn" src="images/img26.png"  width="81" height="71" border="0" style="vertical-align:middle"/></a>
                                          <input type="file"  name="browse2" style="display:none;"  /><a href="javascript:fn_browse();" title="上传"> <img name="btn" src="images/img26.png"  width="81" height="71" border="0" style="vertical-align:middle"/></a>
                                          <input type="file"  name="browse2" style="display:none;"  /><a href="javascript:fn_browse();" title="上传"> <img name="btn" src="images/img26.png"  width="81" height="71" border="0" style="vertical-align:middle"/></a>
                                          <input type="file"  name="browse2" style="display:none;"  /><a href="javascript:fn_browse();" title="上传"> <img name="btn" src="images/img26.png"  width="81" height="71" border="0" style="vertical-align:middle"/></a>
                                          <input type="file"  name="browse2" style="display:none;"  /><a href="javascript:fn_browse();" title="上传"> <img name="btn" src="images/img26.png"  width="81" height="71" border="0" style="vertical-align:middle"/></a>
                                      </div>
                                       
                                   </div>
                                   <!--logoimg-->
                                   <p class="zhushi3">尺寸827x180，jpg或png，<a href="#" class="bluea">示例照片</a></p>
                               </div> 
                               </div>
                               <div class="time"><label>发布时间:</label><p class="pp"><input type="radio" name="1"/><b>审核后立即发布</b><br /><br /><input type="radio" name="1"/><b>等待发布</b><br /><span>5天内，可随时发布。若超过5天，由系统自动发布。
</span></p>
                               </div>
                          </form>
                          <div class="uppage"><a href="yxshangchuan2.jsp" target="main">上一页</a><input type="submit" value="提交" class="tijiao" /></div>
                      </div>
                      <!--dailist-->

               </div>
     </div>
 </div>
 </div>
 
</body>
</html>
