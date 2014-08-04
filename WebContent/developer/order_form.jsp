<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.rainbow.server.AppReceipt"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.rainbow.entity.Receipt" %>
<%@ page import="java.util.regex.Pattern" %>
<%
	/*
	appReceiptList为cp的全部应用
	reportList为根据cp的查询条件查询到的报表
	初始这两个相同
	*/
		Integer cpTotalNum = (Integer)session.getAttribute("cpTotalNum");
		Integer cpOrderNum = (Integer)session.getAttribute("cpOrderNum");
		Integer paySun = (Integer)session.getAttribute("paySun");
		Integer searchPaySun = (Integer)session.getAttribute("searchPaySun");
		List<AppReceipt> appReceiptList = (List<AppReceipt>)session.getAttribute("appReceiptList");
		if(appReceiptList==null)
			appReceiptList = new ArrayList<AppReceipt>();
		List<AppReceipt> reportList = (List<AppReceipt>)session.getAttribute("reportList");
		if(reportList==null)
			reportList = new ArrayList<AppReceipt>();
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
<script charset="utf-8" type="text/javascript" src="js/jquery.min.js"></script>
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

.mbotm10 {
	margin-bottom: 10px;
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
						<li>全部应用</li>
					</ul>
					<div class="guanggaocont">
						<div class="huiyuancont">
							<div class="tit6">
								<p>
									全部应用 [<a href="#" class="red"><%=cpTotalNum%></a>]
								</p>
								<p>
									总订单数：<%=cpOrderNum%></p>
								<p>总支付金额：<%=paySun%></p>
							</div>
							<!--tit6-->
							<div class="searchcont2">
								<input type="text" value="输入应用名称" class="socont2 fl" /><input
									type="submit" value="" class="sobut fr" />
							</div>
							<div class="yonghu2">
								<div class="orderlist">
									<ul class="ornav">
										<li>应用名称</li>
										<li>订单总数</li>
										<li>总支付金额</li>
										<li>&nbsp;</li>
									</ul>
									<div class="ordercont">
									<%for(AppReceipt appReceipt:appReceiptList){  %>
										<div>
											<p><%=appReceipt.getApp().getAppInfo().getAppName() %></p>
											<p><%=appReceipt.getOrderSun() %></p>
											<p><%=appReceipt.getPayment() %>></p>
											<p>
												<a href="#dddd" class="xinxi">查看明细</a>
											</p>
										</div>
										<%} %>
									</div>
									<!--orderconts-->
								</div>
								<!--orderlist-->
							</div>
							<!--yonghu-->
							<div class="allcha">
								<select>
									<option>全部应用</option>
									<%for(AppReceipt appReceipt:appReceiptList){  %>
									<option><%=appReceipt.getApp().getAppInfo().getAppName() %></option>
									<%} %>
								</select>

							</div>
							<!--allcha-->
							<div class="allcha">
								<select>
									<option>支付类型</option>
									<option>短代</option>
									<option>支付宝</option>
									<option>银联</option>
								</select>
								<p>
									从 <input type="text" class="mh_date" readonly="true" value="<%=initTime %>" /> 到 <input
										type="text" class="mh_date" readonly="true" value="<%=initTime %>" />&nbsp;<input
										type="submit" value="查询" class="chaxun" />
								</p>
							</div>
							<!--allcha-->
							<p class="mbotm10">
								订单号/应用名称查询<input type="text" class="chatext" /><input
									type="submit" value="查询" class="chaxun" />
							</p>
							<div class="allorder">
								<p class="fl">
									订单总支付额：<span class="red"> <%=searchPaySun %></span>
								</p>
								<input type="submit" value="导出" class="odaochu fr" />
							</div>
							<!--allorder-->

							<a name="dddd"></a>
							<table border="0" cellpadding="0" cellspacing="0" width="98%"
								class="table1">
								<tr>
									<th width="15%">企业名称</th>
									<th width="15%">应用名称</th>
									<th width="10%">下单时间</th>
									<th width="10%">订单号</th>
									<th width="10%">支付金额</th>
									<th width="10%">支付类型</th>
									<th width="10%">分成比例%</th>
									<th width="10%">通道费率%</th>
								</tr>
								<%for(AppReceipt appReceipt : reportList) 
									for(Receipt receipt:appReceipt.getReceiptList()){
								%>
								<tr>
									<td class="name"><%=appReceipt.getUser().getCorporatename() %></td>
									<td><%=appReceipt.getApp().getAppInfo().getAppName() %></td>
									<td><%=receipt.getReceipt_time() %></td>
									<td><%=receipt.getOrder_id() %></td>
									<td><%=receipt.getPrice() %></td>
									<%
									String reg1 = "^[0-9]{12}00[0-9]*$";
									String reg2 = "^[0-9]{12}01[0-9]*$";
									String pay_type = "";
									float channel = 0;
									if (Pattern.matches(reg1, receipt.getOrder_id())){
										pay_type = "短代";
										channel = appReceipt.getApp().getAppAut().getChannel_message();
									}
									else if (Pattern.matches(reg2, receipt.getOrder_id())){
										pay_type = "支付宝";
										channel = appReceipt.getApp().getAppAut().getChannel_alipay();
									}
									else{
										pay_type = "银联";
										channel = appReceipt.getApp().getAppAut().getChannel_bank();
									}
									%>
									<td><%=pay_type %></td>
									<td><%=appReceipt.getApp().getAppAut().getDivided() %></td>
									<td><%=channel %></td>
								</tr>
								<%}%>
							</table>
						</div>

					</div>
					<!--guanggaocont-->
				</div>
				<!--guanggaocont-->

			</div>
		</div>
	</div>
	</div>
	</div>
</body>
</html>
