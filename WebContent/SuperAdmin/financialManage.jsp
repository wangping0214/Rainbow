<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.rainbow.util.PageUtil"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*"%>
<%@ page import="com.rainbow.server.FinancialSev" %>
<%@ page import="com.rainbow.server.App" %>
<%@ page import="com.rainbow.entity.User" %>
<%@ page import="com.rainbow.server.Financial" %>
<%@ page import="java.text.DecimalFormat" %>
<%
	//获取request数据
	List<FinancialSev> financialSevList = (List<FinancialSev>)request.getAttribute("financialSevList");
	if(null == financialSevList)
		financialSevList = new ArrayList<FinancialSev>();
	PageUtil pageUtil = (PageUtil)request.getAttribute("page");
	DecimalFormat df = new DecimalFormat(".##");//数据格式
%>
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
.header li{ float:left; height:40px; line-height:40px; border-right:solid 1px #FFF; text-align:center; background:#1FD1C9; color:#FFF; font-size:14px; font-family:"微软雅黑"; margin-top:20px;}
.name{ width:50%;}
.open{ width:30%;}
.zhihang{ width:17.4%;}
.cname{ width:17.4%;}
.header2{ clear:both;}
.header2 li{ float:left; height:50px; line-height:50px; border-right:solid 1px #1FD1C9; border-bottom:dashed 1px #CCC; text-align:center; background:#fff; color:#555b5c; font-size:14px; font-family:"微软雅黑";}
.header2 .cname{ border-right:none;}
.message{ clear:both;}
.message th{ text-align:center; line-height:180%; padding:10px 0; border-bottom:solid 1px #ccc; font-size:14px; font-family:微软雅黑;}

.message td{ text-align:center; line-height:180%; padding:10px 0; border-bottom:solid 1px #ccc; font-size:12px; font-family:微软雅黑;}
.message td img{ vertical-align:middle; margin-right:10px;}
.message td p{ width:80px; height:25px; text-align:left; color:#FFF; margin:0 auto; line-height:25px;}
.message td .state1{ color:#0C0}
.message td .state2{ color:#F00}
.message td .state3{ color:#F90}
.message td .state4{ color:#6CF}
.message td .state5{ color:#68D}
.message td .state6{ color:#D2D}
.message td span{display:inline-block;width:13px;height:13px;vertical-align:middle;-webkit-border-radius:9px; margin-bottom:2px; margin-right:2px;}
.state1 span{ background:#0C0;}
.state2 span{ background:#F00;}
.state3 span{ background:#F90;}
.state4 span{ background:#6CF;}
.state5 span{ background:#68D;}
.state6 span{ background:#D2D;}
.current a{ color:#2CE1EB}
</style>
<script type="text/javascript" language="javascript">
	/*
	$(document).ready(function(){
		
		$("#visitable0").click(function(){
			alert("jkasdfh");
			if($("#visitable0").attr("checked")=="checked"){
				$("input[name='visitable0']").attr("checked","checked");
			}
		});
	});
	*/
function initAdminSetFinancial(currentPage){
	location.href="initAdminSetFinancial?currentPage="+currentPage;
}
function setAppVisitable(i,appId){
	var visitable = 1;
	if($("#visitable"+i).attr("checked")=="checked")
		visitable = 1;
	else
		visitable = 0;
	$.post(
			"setAppVisitable",
			{
			appId:appId,
			visitable:visitable
			}
		);
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
                         <li>结算管理</li>
                      </ul>
                      <div class="guanggaocont">
                          <div class="huiyuancont">
                              <div class="sdk2">
                                 <div class="searchcont2">
                                    <input type="text" value="输入应用名称" class="socont2 fl"/><input type="submit" value="" class="sobut fr"/>
                                 </div>
                                 <!--searchcont2-->
                                 
                             </div>
                             <!--sedk2-->
                              <div class="yonghu2">
                              <% 
                              	for(int i =0 ; i < financialSevList.size(); i++){
                              		User user = financialSevList.get(i).getUser();
                              		List<Financial> financialList = financialSevList.get(i).getFinancialList();
                              %>
                               <ul class="header">
                                 <li class="name">公司名称</li>
                                 <li class="open">联系人</li>
                                 <li class="zhihang">操作</li>
                              </ul>
                              
                              <!--header-->
                              <ul class="header2">
                                   <li class="name"><%if(null != user.getCorporatename()){ %><%=user.getCorporatename() %>
                                   <%}
                                   else{ %>
                                   <%=user.getUsername() %>
                                   <%} %>
                                   </li>
                                   <li class="open">
                                   <%if(null !=user.getRealname()) {%>
                                   <%=user.getRealname() %>
                                   <%} %>
                                   </li>
                                 <!--   <li class="cname"><input type="checkbox" name="allCheckbox<%=i %>" id="allVisitable<%=i %>" /> 全选</li> -->
                              </ul>
                              <!--header-->
                              
                               <table width="98%" cellpadding="0" cellspacing="0" bgcolor="#e7e9e9" class="message">
                                    <tr>
                                    	<th width="10%"></th>
                                        <th width="20%">应用名称</th>
                                        <th width="30%">金额</th>
                                        <th width="20%">状态</th>
                                        <th width="20%">&nbsp;</th>
                                    </tr>
                                    <%for(int j = 0 ; j<financialList.size() ; j++){
                                    	Financial financial = financialList.get(j);
                                    %>
                                    <tr>
                                        <td width="10%">
                                        	<img src="<%=request.getContextPath()+financial.getApp().getAppSou().getLogo1() %>" width="48" height="48"/>
                                        	</td>
                                        <td width="20%">
                                        <%=financial.getApp().getAppInfo().getAppName() %>
                                        </td>
                                        <td width="30%"><%=financial.getSum() %> 元</td>
                                        <td>
                                        <%if(-3==financial.getApp().getAppInfo().getIsThrough()||-2==financial.getApp().getAppInfo().getIsThrough()){ %>
                                        	<p class="state4"><span></span>正在测试</p>	
                                        <%} 
                                        else if(-1==financial.getApp().getAppInfo().getIsThrough()){%>
                                        	<p class="state5"><span></span>未通过审核</p>
                                        <%} 
                                        else if(0==financial.getApp().getAppInfo().getIsThrough()){%>
                                        	<p class="state3"><span></span>等待审核</p>
                                        <%}
                                        else if(1==financial.getApp().getAppInfo().getShelf()) {%>
                                        	<p class="state1"><span></span>上线</p>
                                        <%}
                                        else {%>
                                        	<p class="state2"><span></span>下线</p>
                                        <%} %>
                                       	</td>
                                        <td width="20%"><input type="checkbox" name="checkbox<%=j %>" id="visitable<%=j %>" onclick="setAppVisitable('<%=j %>','<%=financial.getApp().getAppAut().getId() %>')" <%if(1 == financial.getApp().getAppAut().getVisitable()){ %> checked="checked"<%} %>/></td>
                                    </tr>
                                    <%} %>
                                </table>
                                <%} %>
            <%
			/*
				计算页数，每次显示区间为本页的5页
			*/
				int currentPage = pageUtil.getCurrentPage();
				int totalPage = pageUtil.getTotalPage();
				int startPage = 1;
				int endPage = 1;
				if(currentPage+3>totalPage)
				{
					startPage = totalPage-4>0?totalPage-4:1;
					endPage = totalPage+1;
				}
				else 
				{
					startPage = currentPage-2>0?currentPage-2:1;
					endPage = startPage+5<totalPage?startPage+5:totalPage;
				}

			%>
                              <ul class="page">
				<%
					if (pageUtil.isHasFirst()) {
				%>
				<li><a href="javascript:initAdminSetFinancial(1)">首页</a></li>
				<%
					}
				%>
				<%
					if (pageUtil.isHasPrevious()) {
				%>
				<li><a
					href="javascript:initAdminSetFinancial('<%=pageUtil.getCurrentPage() - 1%>')">上一页</a></li>
				<%
					}
				%>
				<%
				for(int iPage = startPage;iPage<endPage;iPage++){
					if (pageUtil.getTotalPage() >= iPage) {
				%>
				<li <%if(currentPage == iPage){ %>class="current" <%} %>><a href="javascript:initAdminSetFinancial('<%=iPage%>')"><%=iPage%></a></li>
				<%
					}
				}
				%>
				<%
					if (pageUtil.isHasNext()) {
				%>
				<li><a
					href="javascript:initAdminSetFinancial('<%=pageUtil.getCurrentPage() + 1%>')">下一页</a></li>
				<%
					}
				%>
				<%
					if (pageUtil.isHasLast()) {
				%>
				<li><a
					href="javascript:initAdminSetFinancial('<%=pageUtil.getTotalPage()%>')">尾页</a></li>
				<%
					}
				%>
				<li>共<%=pageUtil.getTotalPage()%>页
				</li>
			</ul>
                             </div>
                             <!--yonghu-->

                          </div>
                          
                      </div>
                      <!--guanggaocont-->
                      <div class="guanggaocont">
                         <div class="qyzcshenpi">
                             <div class="daishenpi">待审批数量<span class="red">10</span></div>
                             <div class="all"><select><option>全部</option><option>企业用户</option><option>个人用户</option></select></div>
                             <div class="qi"><span>企业</span><span class="green">五彩时空科技有限公司</span><a href="chulishenpi.html" target="main" class="chuli">处理审批</a></div>
                         </div>
                         <!--qyzcshenpi-->
                      </div>
                      <!--guanggaocont-->

               </div>
     </div>
 </div>
 </div>
</div> 
</body>
</html>
