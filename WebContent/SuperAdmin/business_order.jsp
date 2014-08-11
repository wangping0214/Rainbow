<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.lang.*"%>
<%@ page import="com.rainbow.server.UserApps"%>
<%@ page import="com.rainbow.util.PageUtil"%>
<%
	Integer jointAppCount = (Integer) session
			.getAttribute("jointAppCount");
	Integer receiptCount = (Integer) session
			.getAttribute("receiptCount");
	String cmyxPaySum = (String) session.getAttribute("cmyxPaySum");
	Date dt = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String initTime = sdf.format(dt);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>会员管理</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<!--<script type="text/javascript"src="js/nav.js"></script>
-->
<script charset="GB2312" type="text/javascript"
	src="js/manhuaDate.1.0.js"></script>
<script type="text/javascript">
	$(function() {

		$("input.mh_date").manhuaDate({
			Event : "click",//可选				       
			Left : 0,//弹出时间停靠的左边位置
			Top : -16,//弹出时间停靠的顶部边位置
			fuhao : "-",//日期连接符默认为-
			isTime : false,//是否开启时间值默认为false
			beginY : 1949,//年份的开始默认为1949
			endY : 2100
		//年份的结束默认为2049
		});

	});
</script>
<script type="text/javascript" language="javascript">
	$(document).ready(function() {
		$("#companyOrName").focus(function() {
			if ($("#companyOrName").val() == "搜索企业名称") {
				$("#companyOrName").val("");
			}
		});
		$("#companyOrName").blur(function() {
			if ($("#companyOrName").val() == "") {
				$("#companyOrName").val("搜索企业名称");
			}
		});

	});
	function adminEarnings() {
		jQuery.ajax({
			type : "post",
			dataType : "json",
			url : "adminEarnings.action",
			data : {
				"payType" : $("#payType").val(),
				"startTime" : $("#startTime").val(),
				"endTime" : $("#endTime").val()
			},
			success : function(response) {
				$("#earningsSum").html(response);
			},
			error : function(XMLResponse) {
				alert(XMLResponse.responseText)
			}
		});
	}
	function adminSearchUserReport(currentPage) {
		window.open("adminSearchUserReport?currentPage=" + currentPage
				+ "&companyOrName=" + $("#companyOrName").val(),
				"business_order_result");
	}
</script>
<style type="text/css">
.searchcont2 {
	background: url(images/searchs.png) no-repeat;
	width: 227px;
	height: 25px;
	line-height: 25px;
	margin: 20px 0 7px 0px;
}

.searchcont2 input {
	outline: none;
	height: 25px;
	line-height: 25px;
	float: left;
}

.socont2 {
	width: 175px;
	height: 25px;
	background: none;
	border: none;
	margin-left: 4px;
	display: inline;
	color: #FFF;
	font-size: 14px;
}

.sobut2 {
	width: 35px;
	height: 25px;
	background: none;
	border: none;
	cursor: pointer
}
</style>
</head>

<body>
	<div class="body">
		<div class="content">
			<div class="search">
				<div class="searchcont">
					<input type="text" value="搜索" class="socont fl" /><input
						type="submit" value="" class="sobut fr" />
				</div>
				<!--searchcont-->
			</div>
			<div class="midcont">
				<div class="list">
					<ul class="guanggaonav">
						<li>企业订单</li>
					</ul>
					<div class="guanggaocont">
						<div class="huiyuancont">
							<div class="tit6 tit6s">
								<p>
									联运应用： [<a href="#" class="red"><%=jointAppCount%></a>]
								</p>
								<p>
									订单总数： [<a href="#" class="red"><%=receiptCount%></a>]
								</p>
								<p>
									总支付额： [<a href="#" class="red"><%=cmyxPaySum%></a>]
								</p>
							</div>
							<!--tit6-->
							<div class="allorder">
								<p class="fl jine">
									金额：<span class="red" id="earningsSum"></span>
								</p>
							</div>
							<!--allorder-->
							<div class="allcha">
								<select id="payType">
									<option>全部支付</option>
									<option>短代</option>
									<option>支付宝</option>
									<option>银联</option>
								</select>
								<p>
									从 <input type="text" class="mh_date" id="startTime"
										readonly="true" value="<%=initTime%>" /> 到 <input type="text"
										class="mh_date" id="endTime" value="<%=initTime%>"
										readonly="true" />&nbsp; <input type="button" value="金额查询"
										id="adminEarnings_id" onclick="adminEarnings()"
										class="chaxun chaxun2" />
								</p>
							</div>
							<!--allcha-->
							<div class="allcha">
								<p>
									<input type="text" id="companyOrName" class="chatext chatext2"
										value="搜索企业名称" /> <input type="button" value="查询"
										class="chaxun" onclick="adminSearchUserReport(1)" />
								</p>
							</div>
							<!--allcha-->
							<a name="dddd"></a>
							<table border="0" cellpadding="0" cellspacing="0" width="700"
								class="table1">
								<tr>
									<th width="25%">企业名称</th>
									<th width="20%">联运应用总数</th>
									<th width="18%">订单总数</th>
									<th width="20%">总支付金额</th>
									<th width="15%">&nbsp;</th>
								</tr>
							</table>
							<iframe src="business_order_result.jsp"
								name="business_order_result" frameborder="0" width="850">
							</iframe>

						</div>

						<ul class="page">
							<s:set name="page" value="#request.page" />
							<s:if test="#page.hasFirst">
								<li><a href="javascript:adminSearchUserReport(1)">首页</a></li>
							</s:if>
							<s:if test="#page.hasPrevious">
								<li><a
									href="javascript:adminSearchUserReport(<s:property value="#page.currentPage-1"/>)">上一页</a>
								</li>
							</s:if>
							<s:if test="#page.totalPage>1">
								<li><a href="javascript:adminSearchUserReport(1)">1</a></li>
							</s:if>
							<s:if test="#page.totalPage>2">
								<li><a href="javascript:adminSearchUserReport(2)">2</a></li>
							</s:if>
							<s:if test="#page.totalPage>3">
								<li><a href="javascript:adminSearchUserReport(3)">3</a></li>
							</s:if>
							<s:if test="#page.totalPage>4">
								<li><a href="javascript:adminSearchUserReport(4)">4</a></li>
							</s:if>
							<s:if test="#page.totalPage>5">
								<li><a href="javascript:adminSearchUserReport(5)">5</a></li>
							</s:if>
							<s:if test="#page.hasNext">
								<li><a
									href="javascript:adminSearchUserReport(<s:property value="#page.currentPage+1"/>)">下一页</a></li>
							</s:if>
							<s:if test="#page.hasLast">
								<li><a
									href="javascript:adminSearchUserReport(<s:property value="#page.totalPage"/>)">尾页</a></li>
							</s:if>
							<li>当前第<s:property value="#page.currentPage" />页，总共<s:property
									value="#page.totalPage" />页
							</li>
						</ul>

					</div>
					<!--guanggaocont-->

				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
