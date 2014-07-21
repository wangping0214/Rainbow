<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>统计列表</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.searchcont2{ background:url(images/searchs.png) no-repeat; width:227px; height:25px; line-height:25px; margin:30px 0 7px 60px;}
.searchcont2 input{outline:none; height:25px; line-height:25px; float:left;}
.socont2{ width:175px; height:25px;background:none; border:none; margin-left:4px; display:inline; color:#000; font-size:12px;}
.sobut2{ width:35px; height:25px; background:none; border:none; cursor:pointer}
.guanggaonav .blue a{ color:#06F}
</style>
<script type="text/javascript" language="javascript">
 function showUserStatistics(cp_id,currentPage){
	 jQuery.ajax({
		 type:"post",
		 url:"showUserStatistics.action",
		 data:{
			 "cp_id":cp_id,
			 "currentPage":currentPage
		 },
	 success:function(){
		 	location.href="tongjiliebiao.jsp";
	 	}
	 });
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
     <div class="midcont tongjimidcont">
                  <div class="list">
                      <ul class="guanggaonav">
                         <li><a href="pingtai.jsp">平台访问</a></li>
                         <li class="blue"><a class="tongjiliebiao.jsp">下载量</a></li>
                      </ul>
                        <div class="searchcont2">
                            <input type="text" value="搜索应用名称" class="socont2 fl"/><input type="submit" value="" class="sobut fr"/>
                          </div>
                          <table cellpadding="0" cellspacing="0" class="dnum dnum2">
                            <caption>&nbsp;</caption>
                            <tr>
                                <th>应用名称</th>
                                <th>下载次数</th>
                                <th>评论次数</th>
                            </tr>
                            <s:iterator value="#request['app']" id="app">
                            <tr class="allyingyong">
                               <td><s:property value="#app.appInfo.appName" /></td>
                               <td><s:property value="#app.appAut.amountOfDown" /></td>
                               <td>
                               		<s:property value="#app.review.size()" />
                               </td>
                            </tr>
                            </s:iterator>
                         </table>
                        <ul class="page">
    <s:set name="page" value="#request.page"/>
       <s:if test="#page.hasFirst">
       <li><a href="showUserStatistics.action?currentPage=1">首页</a>
		</li>
		</s:if>
       <s:if test="#page.hasPrevious">
       <li><a href="showUserStatistics.action?currentPage=<s:property value="#page.currentPage-1"/>">上一页</a>
		</li>
		</s:if>
		<s:if test="#page.totalPage>1">
       <li><a href="showUserStatistics.action?currentPage=1">1</a></li>
       </s:if>
       <s:if test="#page.totalPage>2">
       <li><a href="showUserStatistics.action?currentPage=2">2</a></li>
        </s:if>
        <s:if test="#page.totalPage>3">
       <li><a href="showUserStatistics.action?currentPage=3">3</a></li>
        </s:if>
        <s:if test="#page.totalPage>4">
       <li><a href="showUserStatistics.action?currentPage=4">4</a></li>
       </s:if>
       <s:if test="#page.totalPage>5">
       <li><a href="showUserStatistics.action?currentPage=5">5</a></li>
       </s:if>
       <s:if test="#page.hasNext">
       <li><a href="showUserStatistics.action?currentPage=<s:property value="#page.currentPage+1"/>">下一页</a></li>
       </s:if>
       <s:if test="#page.hasLast">
		<li><a href="showUserStatistics.action?currentPage=<s:property value="#page.totalPage"/>">尾页</a></li>
		</s:if>
		<li>当前第<s:property value="#page.currentPage"/>页，总共<s:property value="#page.totalPage"/>页
		</li>
     </ul>                          

               </div>
     </div>
 </div>
 </div>
</div> 
</body>
</html>
