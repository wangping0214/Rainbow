<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>会员管理</title>
<link href="<%=request.getContextPath()%>/SuperAdmin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"src="<%=request.getContextPath()%>/SuperAdmin/js/jquery.min.js"></script>
<script type="text/javascript"src="<%=request.getContextPath()%>/SuperAdmin/js/nav.js"></script>
<style type="text/css">
.searchcont2{ background:url(images/searchs.png) no-repeat; width:227px; height:25px; line-height:25px; margin:20px 0 7px 0px;}
.searchcont2 input{outline:none; height:25px; line-height:25px; float:left;}
.socont2{ width:175px; height:25px;background:none; border:none; margin-left:4px; display:inline; color:#FFF; font-size:14px;}
.sobut2{ width:35px; height:25px; background:none; border:none; cursor:pointer}
</style>
<script type="text/javascript">
function developer(){
    
    document.getElementById('all_developer').style.display='none';
    document.getElementById('users_developer').style.display='none';
    document.getElementById('groups_developer').style.display='none';
    var value=document.getElementById('reg_select').value;
    document.getElementById(value).style.display='block';
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
                         <li><a href="<%=request.getContextPath()%>/mem_manager.action?isuserType=individualGroups" target="main">会员管理</a></li>
                         <li style="color: blue">企业注册审批</li>
                      </ul>
                      <!--guanggaocont-->
                     <div class="guanggaocont">
                         <div class="qyzcshenpi">
                             <div class="daishenpi">待审批数量<span class="red"><%=session.getAttribute("regtotal") %></span></div>
                             <div class="all"><select id="reg_select" onchange="developer()">
                             <option value="all_developer">&nbsp;&nbsp;全&nbsp;部&nbsp;&nbsp;</option>
                             <option value="groups_developer">企业用户</option>
                             <option value="users_developer">个人用户</option>
                             </select>
                             </div>
                             <div id="all_developer" style="display:block">
                             <div class="qi">
                             <table border="0" cellpadding="0" cellspacing="0" width="98%" class="table1">
                                   <tr>
                                       <th width="20%">开发者等级</th>
                                       <th width="50%">开发者名称</th>                           
                                       <th width="30%">&nbsp;</th>
                                   </tr>
                                    <s:iterator value="#request['regmember']" id="regmember">
                                 <tr>
                                  <s:if test="#regmember.userType=='individualGroups'">
                             <td>企业</td>
                             <td class="green"><s:property value="#regmember.corporatename"/></td>
                             <td><a href="<%=request.getContextPath()%>/reg_information.action?memusername=<s:property value="#regmember.username"/>&memusertype=<s:property value="#regmember.userType"/>" target="main" class="chuli">处理审批</a></td>
                             </s:if>
                              <s:if test="#regmember.userType=='individualUsers'">
                             <td>个人</td>
                             <td class="green"><s:property value="#regmember.realname"/></td>
                             <td><a href="<%=request.getContextPath()%>/reg_information.action?memusername=<s:property value="#regmember.username"/>&memusertype=<s:property value="#regmember.userType"/>"target="main" class="chuli">处理审批</a></td>
                             </s:if>
                                 </tr>
                                   </s:iterator>
                              </table>
                             
                             </div>
                             </div>
                             <div id="groups_developer" style="display:none">
                             <div class="qi">
                             <table border="0" cellpadding="0" cellspacing="0" width="98%" class="table1">
                                   <tr>
                                       <th width="20%">开发者等级</th>
                                       <th width="50%">开发者名称</th>                           
                                       <th width="30%">&nbsp;</th>
                                   </tr>
                                    <s:iterator value="#request['regmember']" id="regmember">
                                 <tr>
                                  <s:if test="#regmember.userType=='individualGroups'">
                             <td>企业</td>
                             <td class="green"><s:property value="#regmember.corporatename"/></td>
                             <td><a href="<%=request.getContextPath()%>/reg_information.action?memusername=<s:property value="#regmember.username"/>&memusertype=<s:property value="#regmember.userType"/>"target="main" class="chuli">处理审批</a></td>
                             </s:if>
                                 </tr>
                                   </s:iterator>
                              </table>
                             </div>
                             </div>
                             <div id="users_developer" style="display:none">
                             <div class="qi">
                             <table border="0" cellpadding="0" cellspacing="0" width="98%" class="table1">
                                   <tr>
                                       <th width="20%">开发者等级</th>
                                       <th width="50%">开发者名称</th>                           
                                       <th width="30%">&nbsp;</th>
                                   </tr>
                                    <s:iterator value="#request['regmember']" id="regmember">
                                 <tr>
                              <s:if test="#regmember.userType=='individualUsers'">
                             <td>个人</td>
                             <td class="green"><s:property value="#regmember.realname"/></td>
                             <td><a href="<%=request.getContextPath()%>/reg_information.action?memusername=<s:property value="#regmember.username"/>&memusertype=<s:property value="#regmember.userType"/>"target="main" class="chuli">处理审批</a></td>
                             </s:if>
                                 </tr>
                                   </s:iterator>
                              </table>
                             </div>
                             </div>
                             
                         </div>
                         <!--qyzcshenpi-->
                      </div>
                      <!--guanggaocont-->

               </div>
     </div>
 </div>
 </div>
</body>
</html>
