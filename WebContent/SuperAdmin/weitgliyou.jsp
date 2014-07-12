<%@ page language="java" contentType="text/html; charset=UTF-8"
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
                      <h3 class="tit2">未通过</h3>
                      <div class="xinxicont">
                          <div class="gongsi">五彩时空科技有限公司</div>
                          <div class="weilist">
                              <dl>
                                 <dt><img src="<%=request.getContextPath()+logo1 %>" width="72" height="72"/></dt>
                                 <dd><%=name %></dd>
                              </dl>
                              <textarea class="weiliyou"><%=reasonsNotThrough %></textarea>
                          </div>
                          
                          <div class="uppage"><a href="weitongguosh.jsp" target="main">返回</a></div>
                      </div>
                      <!--dailist-->

               </div>
     </div>
 </div>
 </div>
 
</body>
</html>
