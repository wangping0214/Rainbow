<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>分成管理</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
 
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
                      <h3 class="tit2">分成管理</h3>
                      <div class="form">
                           <table border="0" cellpadding="0" cellspacing="0" width="90%" class="editform">
                               <tr>
                                  <th width="40%">企业名称</th>
                                  <th width="30%">应用数量</th>
                                  <th width="20%">&nbsp;</th>
                               </tr>
                               <s:iterator id="userAppsList" value="#request['userAppsList']">
                               	<tr>
                                  	<td><s:property value="#userAppsList.user.corporatename"/></td>
                                  	<td><s:property value="#userAppsList.app.size()" />款</td>
                                  	<td><a href="checkUserJointApps?userId=<s:property value="#userAppsList.user.id"/>" class="edit_details">详情编辑</a></td>
                               	</tr>
                               </s:iterator>
                           </table>
                           <ul class="page">
    <s:set name="page" value="#request.page"/>
       <s:if test="#page.hasFirst">
       <li><a href="findAllUserJoint?currentPage=1">首页</a>
		</li>
		</s:if>
       <s:if test="#page.hasPrevious">
       <li><a href="findAllUserJoint?currentPage=<s:property value="#page.currentPage-1"/>">上一页</a>
		</li>
		</s:if>
		<s:if test="#page.totalPage>1">
       <li><a href="findAllUserJoint?currentPage=1">1</a></li>
       </s:if>
       <s:if test="#page.totalPage>2">
       <li><a href="findAllUserJoint?currentPage=2">2</a></li>
        </s:if>
        <s:if test="#page.totalPage>3">
       <li><a href="findAllUserJoint?currentPage=3">3</a></li>
        </s:if>
        <s:if test="#page.totalPage>4">
       <li><a href="findAllUserJoint?currentPage=4">4</a></li>
       </s:if>
       <s:if test="#page.totalPage>5">
       <li><a href="findAllUserJoint?currentPage=5">5</a></li>
       </s:if>
       <s:if test="#page.hasNext">
       <li><a href="findAllUserJoint?currentPage=<s:property value="#page.currentPage+1"/>">下一页</a></li>
       </s:if>
       <s:if test="#page.hasLast">
		<li><a href="findAllUserJoint?currentPage=<s:property value="#page.totalPage"/>">尾页</a></li>
		</s:if>
		<li>当前第<s:property value="#page.currentPage"/>页，总共<s:property value="#page.totalPage"/>页
		</li>
     </ul>
                      </div>
                      <!--form-->
 
                   </div>
                   <!--list-->
               </div>
     </div>
 </div>
</body>
</html>
