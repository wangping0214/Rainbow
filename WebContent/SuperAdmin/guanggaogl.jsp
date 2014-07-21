<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>管理审核– 基本信息</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.guanggaocont .ad span{ width:70px; text-align:center; margin-top:25px;}
.ad2{ overflow:hidden; zoom:1; margin-bottom:10px;}
</style>
<script type="text/javascript"src="js/jquery.min.js"></script>
<script type="text/javascript"src="js/nav.js"></script>
<script charset="utf-8" src="kindeditor-4.1.7/kindeditor.js"></script><!--调用-->
<script>          var editor;          KindEditor.ready(function(K) {                  editor = K.create('#editor_id');         }); </script> 
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
                      <ul class="guanggaonav">
                         <li>广告位</li>
                         <li>广告位审核</li>
                      </ul>
                      <div class="guanggaocont">
                         <form id="form1" name="form1" method="post" action="">
                          <div class="ad">
                              <span>首页封面</span>
                              <p><input type="file"  name="browse" style="display:none;"  /><a href="javascript:fn_browse();" title="上传"> <img name="btn" src="images/img26.png" border="0" style="vertical-align:middle"/></a></p>
                              <div class="link"><input type="text" value="超链接地址   http://" /></div>
                          </div>
                          <!--ad-->
                          <div class="ad">
                              <span>广告一</span>
                              <p><input type="file"  name="browse1" style="display:none;"  /><a href="javascript:fn_browse();" title="上传"> <img name="btn" src="images/img26.png" border="0" style="vertical-align:middle"/></a></p>
                              <div class="link"><input type="text" value="超链接地址   http://" /></div>
                          </div>
                          <!--ad-->
                          <div class="ad">
                              <span>广告二</span>
                              <p><input type="file"  name="browse2" style="display:none;"  /><a href="javascript:fn_browse();" title="上传"> <img name="btn" src="images/img26.png" border="0" style="vertical-align:middle"/></a></p>
                              <div class="link"><input type="text" value="超链接地址   http://" /></div>
                          </div>
                          <!--ad-->
                          
                          <div class="ad2">
                              <span class="gy">编辑关于:</span>
                              <div class="about">
                                  <div class="bianji">
                                      <h4 class="bianjitit">关于我们</h4>
                                      <div><textarea id="editor_id" name="content" style="width:100px;height:220px;"> &lt;strong&gt;HTML内容&lt;/strong&gt; </textarea> </div>
                           <div class="w64 margin15" align="center"><input type="submit"  value="保存"  class="scbtnShow"/></div>
                                  </div>
                              </div>
                          </div>
                          <!--ad-->
                          <div class="bjtijiao"><input type="submit" value="" /></div>
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
</body>
</html>
