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
                 <p class="headnav">完善APP信息</p>
             </div>
             <!--tit-->
             <p></p>
             <form id="form1" name="form1" method="post" action="">
             <div class="cont">
                 <p class="explain">*恭喜您已经成功创建了『应用名称』</p>
                 <p class="explain2">获取SDK接入信息，并完成SDK集成</p>
                 <div class="appcont">
                    <dl>
                        <dt><img src="images/img22.png" /></dt>
                        <dd>
                           <p>应用名称 ： xxxxxxxxxx</p>
                           <p>APP ID   ： xxxxxxxxx</p>
                           <p>MD5 Key： xxxxxxxxx</p>
                           <p>下载SDK包及集成文档 ：<a href="#"> xxxxxx</a></p>
                           <p>SDK 测试用例地址：<a href="#"> xxxxxxxxxxxx</a></p>
                           <p>SDK 集成技术顾问：xxxxxxxxxxxx</p>
                        </dd>
                    </dl>
                    <div class="xinxi">
                        <span class="xuhao xuhao2">①</span><a href="sign_point.jsp" class="current3">注册计费点</a>
                    </div>
                    <!--xinxi-->
                    <div class="jiantou"><img src="images/jiantou2.jpg" /></div>
                    <div class="xinxi">
                        <span class="xuhao">②</span><a href="self_test.jsp">自测</a>
                    </div>
                    <!--xinxi-->
                    <div class="jiantou"><img src="images/jiantou.jpg" /></div>
                    <div class="xinxi">
                        <span class="xuhao">③</span><a href="perfect_infoimation.jsp">完善应用信息</a>
                    </div>
                    <!--xinxi-->
                 </div>
                 <!--appcont-->
                 <div class="uppage uppage3"><input type="submit" value="提交审核" class="tijiao" /></div>
             </div>
             <!--cont-->
             </form>
       </div>
       <!--midcont-->
 </div>
</body>
</html>
