<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广告位申请</title>
<link href="<%=request.getContextPath()%>/developer/css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.guanggaocont .ad span{ width:70px; text-align:center; margin-top:25px;}
.ad2{ overflow:hidden; zoom:1; margin-bottom:10px;}
.guanggaonav{ width:300px;}
</style>
<script type="text/javascript"src="<%=request.getContextPath()%>/developer/js/jquery.min.js"></script>
<script type="text/javascript"src="<%=request.getContextPath()%>/developer/js/nav.js"></script>
<script type="text/javascript"src="<%=request.getContextPath()%>/developer/js/update.js"></script>
<script charset="utf-8" src="<%=request.getContextPath()%>/developer/kindeditor-4.1.7/kindeditor.js"></script><!--调用-->
<script>          var editor;          KindEditor.ready(function(K) {                  editor = K.create('#editor_id');         }); </script> 
<script language="javascript" type="text/javascript"> 
function fn_browse() 
{ 
document.ad_form.ad_photo.click(); 
document.ad_form.file.value = document.all.ad_form.ad_photo.value; 

} 
$(document).ready(function(){
	$("#ad_photo").uploadPreview({ Img: "photo"});
});
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
                      <ul class="guanggaonav">
                         <li>广告图</li>
                         <li>推荐</li>
                         <li>游戏</li>
                         <li>应用</li>
                         <li>分类</li>
                         <li>排行榜</li>
                      </ul>
                      <div class="guanggaocont">
                          <form id="ad_form" name="ad_form" method="post" action="<%=request.getContextPath()%>/new_ad.action"enctype="multipart/form-data" >
                          <div class="shoutui">
                              <p class="shoutit">推荐首页广告：</p>
                              <div class="suoimg">
                               <%if(session.getAttribute("adphoto")==null||session.getAttribute("adphoto")==""){ %>
                                 <p><img id="photo"name="btn" src="<%=request.getContextPath()%>/developer/images/solv.png" width="252" height="105" border="0" style="vertical-align:middle"/> </p>
                                 <%} else{%>
                                 <img id="photo" name="btn" src="<%=request.getContextPath()+session.getAttribute("adphoto")%>" width="252" height="105" border="0" style="vertical-align:middle" />
                                      <%} %>
                                 <p class="adimg"> <input type="file" id="ad_photo" name="user.newad" style="display:none;"  /><a href="javascript:fn_browse();" id="uploadad"title="上传" class="shang">上传广告图</a></p>
                              </div>
                              <!--suoimg-->
                              <div class="zhu">
                                 <p>我们建议您提供高清的游戏广告图，这样可以获得更好的视觉展示效果和用户点击。</p>
                                 <p>尺寸<span class="red">XXXX</span>px*<span class="red">XXXX</span>px，png格式，具体参考 <a href="#">Logo样本</a></p>
                              </div>
                          </div>
                           <!--shoutui-->
                          <div class="bjtijiao"><input type="submit" id="ad_submit"value="" /></div>
                          </form>
                      </div>
                      <!--guanggaocont-->
                      <div class="guanggaocont">
                         广告位审核
                      </div>
                      <!--guanggaocont-->

               </div>
     </div>
 </div>
 </div>
</div> 
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
