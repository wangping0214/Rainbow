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
    
    document.getElementById('all_developer').style.display='block';
    document.getElementById('users_developer').style.display='block';
    document.getElementById('groups_developer').style.display='block';
    var value=document.getElementById('reg_select').value;
    document.getElementById(value).style.display='block';
   }
$(document).ready
(
		function()
		{
			$("#select").change(function(){
				var seuserType=$("#select").val();
				location.href="mem_manager.action?isCurrentPage=1&isuserType="+seuserType;
		});
			
		}
);
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
                         <li>会员管理</li>
                         <li>企业注册审批</li>
                      </ul>
                      <div class="guanggaocont">
                          <div class="huiyuancont">
                              <div class="tit6">
                                 <select id="select"name="isuserType">
                                      <option value="individualGroups">企业开发者</option>
                                      <option value="individualUsers">个人开发者</option>
                                      <option value="individualCommon" selected="selected">普通用户</option>
                                  </select>
                              
                                  <p>企业开发者  [<a href="mem_manager.action?isCurrentPage=1&isuserType=individualGroups" class="red"><%=session.getAttribute("groupstotal") %></a>]</p>
                                  <p>个人开发者  [<a href="mem_manager.action?isCurrentPage=1&isuserType=individualUsers" class="red"><%=session.getAttribute("userstotal") %></a>]</p>
                                  <p>普通用户  [<a href="mem_manager.action?isCurrentPage=1&isuserType=individualCommon" class="blue2"><%=session.getAttribute("ctotal") %></a>]</p>
                              </div>
                              <!--tit6-->
                              <div class="searchcont2">
                                <input type="text" value="输入名称" class="socont2 fl"/><input type="submit" value="" class="sobut fr"/>
                             </div>
                             <div class="yonghu">
                              <table border="0" cellpadding="0" cellspacing="0" width="98%" class="table1">
                                   <tr>
                                       <th width="25%">用户名称</th>
                                       <th width="15%">注册时间</th>
                                       <th width="25%">常用IP</th>
                                       <th width="15%">用户ID</th>
                                       <th width="18%">&nbsp;</th>
                                   </tr>
                                   <s:iterator value="#request['member']" id="member">
                                   <tr>
                                       <td class="name"><s:property value="#member.username"/></td>
                                       <td><s:property value="#member.nowtime"/></td>
                                       <td>10.10.10.10</td>
                                       <td><s:property value="#member.username"/></td>
                                       <td align="center"><a href="<%=request.getContextPath()%>/information.action?memusername=<s:property value="#member.username"/>&memusertype=<s:property value="#member.userType"/>" target="main" class="xinxi">查看信息</a></td>
                                   </tr>
                                   </s:iterator>
                              </table>
                             <ul class="page">
                              <s:set name="page" value="#request.page"/>
                              <s:if test="#page.hasFirst">
                              <li><a href="mem_manager.action?isCurrentPage=1&isuserType=individualCommon">首页</a>
                              </li>
                              </s:if>
                              <s:if test="#page.hasPrevious">
                              <li><a href="mem_manager.action?isCurrentPage=<s:property 

                              value="#page.currentPage-1"/>&isuserType=individualCommon">上一页</a>
                              </li>
		                      </s:if>
		                      <s:if test="#page.totalPage>1">
                             <li><a href="mem_manager.action?isCurrentPagee=1&isuserType=individualCommon">1</a></li>
                             </s:if>
                             <s:if test="#page.totalPage>2">
                             <li><a href="mem_manager.action?isCurrentPage=2&isuserType=individualCommon">2</a></li>
                              </s:if>
                              <s:if test="#page.totalPage>3">
                             <li><a href="mem_manager.action?isCurrentPage=3&isuserType=individualCommon">3</a></li>
                              </s:if>
                              <s:if test="#page.totalPage>4">
                             <li><a href="mem_manager.action?isCurrentPage=4&isuserType=individualCommon">4</a></li>
                             </s:if>
                             <s:if test="#page.totalPage>5">
                             <li><a href="mem_manager.action?isCurrentPage=5&isuserType=individualCommon">5</a></li>
                             </s:if>
                             <s:if test="#page.hasNext">
                             <li><a href="mem_manager.action?isCurrentPage=<s:property 

                             value="#page.currentPage+1"/>&isuserType=individualCommon">下一页</a></li>
                             </s:if>
                             <s:if test="#page.hasLast">
	                      	<li><a href="mem_manager.action?isCurrentPage=<s:property 

                      value="#page.totalPage"/>&isuserType=individualCommon">尾页</a></li>
		                      </s:if>
		                      <li>当前第<s:property value="#page.currentPage"/>页，总共

                      <s:property value="#page.totalPage"/>页
	                      	</li>
                           </ul>
                             </div>
                             </div>                       
                      </div>
                      <!--guanggaocont-->
                      <div class="guanggaocont">
                         <div class="qyzcshenpi">
                             <div class="daishenpi">待审批数量<span class="red"><%=session.getAttribute("regtotal") %></span></div>
                             <div class="all"><select id="reg_select" >
                             <option value="all_developer">&nbsp;&nbsp;全&nbsp;部&nbsp;&nbsp;</option>
                             <option value="groups_developer">企业用户</option>
                             <option value="users_developer">个人用户</option>
                             </select>
                             </div>
                             <div id="all_developer">
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
                             <td><a href="<%=request.getContextPath()%>/reg_information.action?memusername=<s:property value="#regmember.username"/>&memusertype=<s:property value="#regmember.userType"/>" target="main" class="chuli">处理审批</a></td>
                             </s:if>
                                 </tr>
                                   </s:iterator>
                              </table>
                             
                             </div>
                             </div>
                             <div id="groups_developer">
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
                                 </tr>
                                   </s:iterator>
                              </table>
                             </div>
                             </div>
                             <div id="users_developer">
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
                             <td><a href="<%=request.getContextPath()%>/reg_information.action?memusername=<s:property value="#regmember.username"/>&memusertype=<s:property value="#regmember.userType"/>" target="main" class="chuli">处理审批</a></td>
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
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
