<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="com.rainbow.server.FinancialSev"%>
<%@ page import="com.rainbow.server.Financial"%>
<%@ page import="com.rainbow.util.PageUtil"%>
<%@ page import="com.rainbow.entity.Admin" %>
<%
	String status = (String)session.getAttribute("status");
	Integer check_out = (Integer)session.getAttribute("check_out");
	Integer no_check_out = (Integer)session.getAttribute("no_check_out");
	String year = (String)session.getAttribute("year");
	String month =  (String)session.getAttribute("month");
	List<FinancialSev> financialSevList = new ArrayList<FinancialSev>();
	financialSevList = (List<FinancialSev>)session.getAttribute("financialSevList");
	PageUtil pageUtil = (PageUtil)session.getAttribute("page");
	String userOrAppName = (String)session.getAttribute("userOrAppName");
	Admin admin = (Admin)session.getAttribute("financial");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>五彩时空财务</title>
<link href="style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript" language="javascript">


window.onload=function(){
	var oinput=document.getElementById("year");
	var but1=document.getElementById("add");
	var but2=document.getElementById("cut");
	var odate=new Date();
	var yearval=odate.getFullYear();
	
	but1.onclick=function(){
	  oinput.value=parseInt(oinput.value)+1;	
	}
	but2.onclick=function(){
	  oinput.value=parseInt(oinput.value)-1;	
	}
	
	
   var oinput2=document.getElementById("month");
	var but3=document.getElementById("add2");
	var but4=document.getElementById("cut2");
    var mounthval=odate.getMonth()+1+"月";
	oinput2.value=parseInt(oinput2.value)+"月";
    
	but3.onclick=function(){
	if(parseInt(oinput2.value)<12){
	  oinput2.value=parseInt(oinput2.value)+1+"月";	
	}
	}
	but4.onclick=function(){
	if(parseInt(oinput2.value)>1){
	  oinput2.value=parseInt(oinput2.value)-1+"月";	
	}
	}
	
};


	function initFinancial(currentPage) {
		location.href = "initFinancial?currentPage=" + currentPage + "&status="
				+ $("#status").val() + "&year=" + $("#year").val() + "&month="
				+ $("#month").val()+"&userOrAppName="+$("#userOrAppName").val();
	}
	function checkOutAppFinancial(i,appId, appName, paySum) {
		var year = $("#year").val();
		var month = $("#month").val();
		if (window.confirm("确认结算账单\n应用名称：" + appName + "\n结算月份：" + year + "-"
				+ month + "\n结算金额：" + paySum+"元")) {
			jQuery.ajax({
				type : "post",
				url : "checkOutAppFinancial",
				data : {
					"appId" : appId,
					"year" : year,
					"month" : month
				},
				success : function(response) {
					alert(appName + "结算成功！");
					$("#check"+i).attr("disabled","disabled");
					$("#check"+i).attr("value","已结算");
					$("#no_check_out").html(response);
					$("#state"+i).addClass('state2');
				}
			});
		}
	}
	
	$(document).ready(function(){
		$("#userOrAppName").focus(function(){
			if($("#userOrAppName").val()=="输入企业/应用名称")
				$("#userOrAppName").val("");
		});
		$("#userOrAppName").blur(function(){
			if($("#userOrAppName").val()=="")
				$("#userOrAppName").val("输入企业/应用名称");
		});
	});
</script>

</head>

<body>
	<div class="wap">
		<div class="top">
			<p class="fl">
				<a href="#"><img src="images/cu_02.jpg" /></a><img
					src="images/cu_03.jpg" />
			</p>
			<p class="fr jiesuan">
				<a><img src="images/cu_06.jpg" /><br /><%=admin.getUsername() %></a>
				<a class="nojiesuan"><img src="images/cu_09.jpg" /><br />未结算<span
					class="num" id="no_check_out"><%=no_check_out%></span></a>
			</p>
		</div>
		<!--top-->
		<div class="cont">
			<div class="search">
				<div id="uboxstyle">
					<select id="status">
						<option
							<%if (status == null || "".equals(status) || "全部".equals(status)) {%>
							selected="selected" <%}%>>全部</option>
						<option <%if ("已结算".equals(status)) {%> selected="selected" <%}%>>已结算</option>
						<option <%if ("未结算".equals(status)) {%> selected="selected" <%}%>>未结算</option>
					</select>
				</div>
				<div class="chaxun">
					<div class="year">
						<input type="text" <%if (year != null || "".equals(year)) {%>
							value="<%=year%>" <%}%> id="year" />
						<p class="twobut">
							<input type="image" src="images/but_03.jpg" id="add" /> <input
								type="image" src="images/but_07.jpg" id="cut" />
						</p>
					</div>
					<div class="year">
						<input type="text" <%if (month != null || "".equals(month)) {%>
							value="<%=Integer.valueOf(month)%>" <%}%> id="month" />
						<p class="twobut">
							<input type="image" src="images/but_03.jpg" id="add2" /> <input
								type="image" src="images/but_07.jpg" id="cut2" />
						</p>
					</div>
					<div class="fl">
						<input type="image" onclick="initFinancial(1)"
							src="images/cha_03.jpg" />
					</div>
				</div>
				<!--chaxun-->
				<div class="sousuo">
					<input type="text" class="shu"
						<%if (userOrAppName == null || "".equals(userOrAppName)) {%>
						value="输入企业/应用名称" <%} else {%> value="<%=userOrAppName%>" <%}%>
						id="userOrAppName" /><input type="image" src="images/cu_15.jpg"
						class="soubut" id="search" onclick="initFinancial(1)" />
				</div>
				<!--sousuo-->
			</div>
			<!--search-->
			<div class="math">
				<span>结算公式：结算金额</span>=｛[短代当月收入*（1-短代比率））+支付宝当月收入*（1-支付宝比率）+银联当月总收入*（1-支付宝比率）]*（1-税率）｝*分成
			</div>
			<%
				int i = 0;
				for (FinancialSev financialSev : financialSevList) {
			%>
			<ul class="header">
				<li class="name">企业名称</li>
				<li class="open">开户行</li>
				<li class="zhihang">支行</li>
				<li class="card">银行卡号</li>
				<li class="cname">开户名称</li>
			</ul>
			<!--header-->
			<ul class="header2">
				<li class="name">
					<%
						if (financialSev.getUser().getCorporatename() != null) {
					%><%=financialSev.getUser().getCorporatename()%> <%
 	} else {
 %><%=financialSev.getUser().getRealname()%> <%
 	}
 %>
				</li>
				<li class="open">暂无信息</li>
				<li class="zhihang">暂无信息</li>
				<li class="card">暂无信息</li>
				<li class="cname">暂无信息</li>
			</ul>
			<!--header-->
			<table width="100%" cellpadding="0" cellspacing="0" bgcolor="#e7e9e9"
				class="message">
				<%
					int j = 0;
						for (Financial financial : financialSev.getFinancialList()) {
							i++;
							j++;
				%>
				<%
					if (check_out == -1) {
				%>
				<tr>
					<td width="8%"><p>结算状态</p>
						<p id="state<%=i %>" <%if (financial.getCheck_out() == 0) {%> class="state"
							<%} else if (financial.getCheck_out() == 1) {%> class="state2"
							<%}%>>
							<input type="button" id="check<%=i %>"
								onclick="checkOutAppFinancial('<%=i%>','<%=financial.getApp().getAppInfo().getId()%>','<%=financial.getApp().getAppInfo().getAppName()%>','<%=financial.getPaySum()%>')"
								<%if (financial.getCheck_out() == 0) {%> value="确认结算"
								<%} else if (financial.getCheck_out() == 1) {%> value="已结算"
								disabled="disabled" <%}%> />
						</p></td>
					<td width="4%"><p class="num2"><%=j%></p></td>
					<td width="8%"><p>应用名称</p>
						<p class="green"><%=financial.getApp().getAppInfo().getAppName()%></p></td>
					<td width="8%"><p>总计</p>
						<p class="green"><%=financial.getSum()%>元
						</p></td>
					<td width="8%"><p>短代</p>
						<p class="green"><%=financial.getMassageSum()%>元
						</p></td>
					<td width="8%"><p>支付宝</p>
						<p class="green"><%=financial.getAlipaySum()%>元
						</p></td>
					<td width="8%"><p>银联</p>
						<p class="green"><%=financial.getBankSum()%>元
						</p></td>
					<td width="8%" class="orange"><p>结算金额</p>
						<p><%=financial.getPaySum()%>元
						</p></td>
					<td width="8%" class="orange"><p>分成比率</p>
						<p><%=financial.getApp().getAppAut().getDivided()%>%
						</p></td>
					<td width="8%" class="orange"><p>短代</p>
						<p><%=financial.getTaxRate().getChannel_message()%>%
						</p></td>
					<td width="8%" class="orange"><p>支付宝</p>
						<p><%=financial.getTaxRate().getChannel_alipay()%>%
						</p></td>
					<td width="8%" class="orange"><p>银联</p>
						<p><%=financial.getTaxRate().getChannel_bank()%>%
						</p></td>
					<td width="8%" class="orange"><p>税率</p>
						<p><%=financial.getTaxRate().getTax_rate()%>%
						</p></td>
				</tr>
				<%
					} else if (check_out == 0
									&& check_out == financial.getCheck_out()) {
				%>
				<tr>
					<td width="8%"><p>结算状态</p>
						<p class="state" id="state<%=i %>">
							<input type="button" value="确认结算" id="check<%=i%>"
								onclick="checkOutAppFinancial('<%=i%>','<%=financial.getApp().getAppInfo().getId()%>','<%=financial.getApp().getAppInfo().getAppName()%>','<%=financial.getPaySum()%>')"
								 />
						</p></td>
					<td width="4%"><p class="num2"><%=j%></p></td>
					<td width="8%"><p>应用名称</p>
						<p class="green"><%=financial.getApp().getAppInfo().getAppName()%></p></td>
					<td width="8%"><p>总计</p>
						<p class="green"><%=financial.getSum()%>元
						</p></td>
					<td width="8%"><p>短代</p>
						<p class="green"><%=financial.getMassageSum()%>元
						</p></td>
					<td width="8%"><p>支付宝</p>
						<p class="green"><%=financial.getAlipaySum()%>元
						</p></td>
					<td width="8%"><p>银联</p>
						<p class="green"><%=financial.getBankSum()%>元
						</p></td>
					<td width="8%" class="orange"><p>结算金额</p>
						<p><%=financial.getPaySum()%>元
						</p></td>
					<td width="8%" class="orange"><p>分成比率</p>
						<p><%=financial.getApp().getAppAut().getDivided()%>%
						</p></td>
					<td width="8%" class="orange"><p>短代</p>
						<p><%=financial.getTaxRate().getChannel_message()%>%
						</p></td>
					<td width="8%" class="orange"><p>支付宝</p>
						<p><%=financial.getTaxRate().getChannel_alipay()%>%
						</p></td>
					<td width="8%" class="orange"><p>银联</p>
						<p><%=financial.getTaxRate().getChannel_bank()%>%
						</p></td>
					<td width="8%" class="orange"><p>税率</p>
						<p><%=financial.getTaxRate().getTax_rate()%>%
						</p></td>
				</tr>
				<%
					} else if (check_out == 1
									&& check_out == financial.getCheck_out()) {
				%>
				<tr>
					<td width="8%"><p>结算状态</p>
						<p class="state2" id="state<%=i %>">
							<input type="button" value="已结算" id="check<%=i%>"
								disabled="disabled" />
						</p></td>
					<td width="4%"><p class="num2"><%=j%></p></td>
					<td width="8%"><p>应用名称</p>
						<p class="green"><%=financial.getApp().getAppInfo().getAppName()%></p></td>
					<td width="8%"><p>总计</p>
						<p class="green"><%=financial.getSum()%>元
						</p></td>
					<td width="8%"><p>短代</p>
						<p class="green"><%=financial.getMassageSum()%>元
						</p></td>
					<td width="8%"><p>支付宝</p>
						<p class="green"><%=financial.getAlipaySum()%>元
						</p></td>
					<td width="8%"><p>银联</p>
						<p class="green"><%=financial.getBankSum()%>元
						</p></td>
					<td width="8%" class="orange"><p>结算金额</p>
						<p><%=financial.getPaySum()%>元
						</p></td>
					<td width="8%" class="orange"><p>分成比率</p>
						<p><%=financial.getApp().getAppAut().getDivided()%>%
						</p></td>
					<td width="8%" class="orange"><p>短代</p>
						<p><%=financial.getTaxRate().getChannel_message()%>%
						</p></td>
					<td width="8%" class="orange"><p>支付宝</p>
						<p><%=financial.getTaxRate().getChannel_alipay()%>%
						</p></td>
					<td width="8%" class="orange"><p>银联</p>
						<p><%=financial.getTaxRate().getChannel_bank()%>%
						</p></td>
					<td width="8%" class="orange"><p>税率</p>
						<p><%=financial.getTaxRate().getTax_rate()%>%
						</p></td>
				</tr>
				<%
					}
				%>
				<%
					}
				%>
			</table>
			<%
				}
			%>

			<ul class="page">
				<%
					if (pageUtil.isHasFirst()) {
				%>
				<li><a href="javascript:initFinancial(1)">首页</a></li>
				<%
					}
				%>
				<%
					if (pageUtil.isHasPrevious()) {
				%>
				<li><a
					href="javascript:initFinancial('<%=pageUtil.getCurrentPage() - 1%>')">上一页</a></li>
				<%
					}
				%>
				<%
					if (pageUtil.getTotalPage() > 1) {
				%>
				<li><a href="javascript:initFinancial(1)">1</a></li>
				<%
					}
				%>
				<%
					if (pageUtil.getTotalPage() > 2) {
				%>
				<li><a href="javascript:initFinancial(2)">2</a></li>
				<%
					}
				%>
				<%
					if (pageUtil.getTotalPage() > 3) {
				%>
				<li><a href="javascript:initFinancial(3)">3</a></li>
				<%
					}
				%>
				<%
					if (pageUtil.getTotalPage() > 4) {
				%>
				<li><a href="javascript:initFinancial(4)">4</a></li>
				<%
					}
				%>
				<%
					if (pageUtil.getTotalPage() > 5) {
				%>
				<li><a href="javascript:initFinancial(5)">5</a></li>
				<%
					}
				%>
				<%
					if (pageUtil.isHasNext()) {
				%>
				<li><a
					href="javascript:initFinancial('<%=pageUtil.getCurrentPage() + 1%>')">下一页</a></li>
				<%
					}
				%>
				<%
					if (pageUtil.isHasLast()) {
				%>
				<li><a
					href="javascript:initFinancial('<%=pageUtil.getTotalPage()%>')">尾页</a></li>
				<%
					}
				%>
				<li>当前第<%=pageUtil.getCurrentPage()%>页，总共<%=pageUtil.getTotalPage()%>页
				</li>
			</ul>
			<!--page-->
		</div>
		<!--cont-->
	</div>
	<!--wap-->
</body>
</html>
