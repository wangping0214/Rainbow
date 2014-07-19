<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>未通过理由</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style>
.xinxicont label{ width:180px; }
.zhushi{ padding:5px 0 0 190px; font-weight:normal; clear:both;}
.shenhenav{ margin-top:20px; border-bottom:#999 solid 1px; overflow:hidden; zoom:1; width:180px; padding-bottom:5px; cursor:pointer; color:#666; font-size:16px;}
.shenhenav li{ float:left; margin-left:10px; display:inline; }
.shenhenav li.red a{ color:#F00}
</style>


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
     <%String reasonsNotThrough = request.getParameter("reasonsNotThrough");
     String logo1 = request.getParameter("logo1");
     String name = request.getParameter("name");
     %>
                  <div class="list">
                 <ul class="shenhenav">
                    <li><a href="waitshenhe2.jsp" target="main">等待审核</a></li>
                    <li class="red"><a href="weitongguosh2.jsp" target="main">未通过审核</a></li>
                 </ul>                  
                     <h3 class="tit2">未通过</h3>
                      <div class="xinxicont">
                          <div class="weilist">
                              <dl>
                                 <dt><img src="<%=request.getContextPath()+logo1 %>" width="72" height="72"/></dt>
                                 <dd><%=name %></dd>
                              </dl>
                              <textarea class="weiliyou"><%=reasonsNotThrough %></textarea>
                          </div>
                          
                          <div class="uppage"><a href="#">删除</a><a href="reshangchuan.jsp" target="main">重新提交</a></div>
                      </div>
                      <!--dailist-->

               </div>
     </div>
 </div>
 </div>
 
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
