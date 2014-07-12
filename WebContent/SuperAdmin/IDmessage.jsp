<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>会员管理</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"src="js/jquery.min.js"></script>
<script type="text/javascript"src="js/nav.js"></script>
<style type="text/css">
.searchcont2{ background:url(images/searchs.png) no-repeat; width:227px; height:25px; line-height:25px; margin:20px 0 7px 0px;}
.searchcont2 input{outline:none; height:25px; line-height:25px; float:left;}
.socont2{ width:175px; height:25px;background:none; border:none; margin-left:4px; display:inline; color:#FFF; font-size:14px;}
.sobut2{ width:35px; height:25px; background:none; border:none; cursor:pointer}
</style>
<script type="text/javascript" language="javascript">
function showIdMessage(currentPage){

	var type = $("#type_id").val();
	if(type=="全部应用"){
		location.href="showAllIdMessage.action?currentPage="+currentPage;

	}
	else {
		location.href="showApplicationMessage.action?type="+type+"&currentPage="+currentPage;
	}
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
                         <li>ID信息</li>
                      </ul>
                      <div class="guanggaocont">
                          <div class="huiyuancont">
                              <div class="tit6">
                                  <p>公司名称：<s:property value="#request.company" /></p>
                                  <p>ID:<s:property value="#request.cp_id" /></p>
                              </div>
                              <!--tit6-->
                              <%String type = (String)session.getAttribute("type"); %>
                              <div class="sdk2">
                                 <div class="yyselect">
                                     <select id="type_id" onchange="showIdMessage(1)">
                                      <option <%if(type==null){ %> selected="selected"<%} %>>全部应用</option>
                                      <option <%if("应用".equals(type)){ %> selected="selected"<%} %>>应用</option>
                                      <option <%if("游戏".equals(type)){ %> selected="selected"<%} %>>游戏</option>
                                    </select>
                                 </div>
                                 <!--yyselect-->
                                 <div class="searchcont2">
                                    <input type="text" value="输入应用名称" class="socont2 fl"/><input type="submit" value="" class="sobut fr"/>
                                 </div>
                                 <!--searchcont2-->
                                 
                             </div>
                             <!--sedk2-->
                              <div class="yonghu2">
                              <table border="0" cellpadding="0" cellspacing="0" width="78%" class="table1">
                                   <tr>
                                       <th width="60%">应用名称</th>
                                       <th width="40%">应用ID</th>
                                   </tr>
                                  <s:iterator value="#request['app']" id="app">
                                   <tr>
                                       <td class="name"><s:property value="#app.appInfo.appName" /></td>
                                       <td><s:property value="#app.appInfo.app_id"/></td>
                                   </tr>
                                   </s:iterator>
                                   
                              </table>
                              </div>
                              <ul class="page">
    <s:set name="page" value="#request.page"/>
       <s:if test="#page.hasFirst">
       <li><a href="javascript:showIdMessage(1);">首页</a>
		</li>
		</s:if>
       <s:if test="#page.hasPrevious">
       <li><a href="javascript:showIdMessage('<s:property value="#page.currentPage-1"/>')">上一页</a>
		</li>
		</s:if>
		<s:if test="#page.totalPage>1">
       <li><a href="javascript:showIdMessage(1)">1</a></li>
       </s:if>
       <s:if test="#page.totalPage>2">
       <li><a href="javascript:showIdMessage(2)">2</a></li>
        </s:if>
        <s:if test="#page.totalPage>3">
       <li><a href="javascript:showIdMessage(3)">3</a></li>
        </s:if>
        <s:if test="#page.totalPage>4">
       <li><a href="javascript:showIdMessage(4)">4</a></li>
       </s:if>
       <s:if test="#page.totalPage>5">
       <li><a href="javascript:showIdMessage(5)">5</a></li>
       </s:if>
       <s:if test="#page.hasNext">
       <li><a href="javascript:showIdMessage('<s:property value="#page.currentPage+1"/>')">下一页</a></li>
       </s:if>
       <s:if test="#page.hasLast">
		<li><a href="javascript:showIdMessage('<s:property value="#page.totalPage"/>')">尾页</a></li>
		</s:if>
		<li>当前第<s:property value="#page.currentPage"/>页，总共<s:property value="#page.totalPage"/>页
		</li>
     </ul>
                             <!--yonghu-->

                          </div>
                          
                      </div>
                      

               </div>
     </div>
 </div>
 </div>
</div> 
</body>
</html>
