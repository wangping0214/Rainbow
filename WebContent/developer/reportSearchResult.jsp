<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.rainbow.server.AppReceipt"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.rainbow.entity.Receipt"%>
<%@ page import="java.util.regex.Pattern"%>
<%@ page import="com.rainbow.server.DetailReceipt"%>
<%@ page import="java.lang.*"%>
<%
	/*
	appReceiptList为cp的全部应用
	reportList为根据cp的查询条件查询到的报表
	初始这两个相同
	*/
		Integer cpTotalNum = (Integer)session.getAttribute("cpTotalNum");
		Integer cpOrderNum = (Integer)session.getAttribute("cpOrderNum");
		String paySun = (String)session.getAttribute("paySun");
		String searchPaySun = (String)session.getAttribute("searchPaySun");
		List<AppReceipt> appReceiptList = (List<AppReceipt>)session.getAttribute("appReceiptList");
		if(appReceiptList==null)
	appReceiptList = new ArrayList<AppReceipt>();
		List<DetailReceipt> detailReceiptList = (List<DetailReceipt>)session.getAttribute("detailReceiptList");
		if(detailReceiptList==null)
	detailReceiptList = new ArrayList<DetailReceipt>();
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String initTime = sdf.format(dt);
%>
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
.table5{font-size:12px;font-weight:normal;}
.table5 td{text-align:center;height:30px; line-height:30px;}
</style>
</head>
<body>
<div id="report_div">
		<table id="report_table" border="0" cellpadding="0"
									cellspacing="0" width="700" class="table5">
			<%if(detailReceiptList.size()==0){ %>
			<tr>
			<td></td>
			<td></td>
			<td>未查询到订单</td>
			<td></td>
			<td></td>
			<td></td>
			</tr>
			<%} %>
			<%
				for (DetailReceipt detailReceipt : detailReceiptList) {
			%>
			<%
					String reg1 = "^[0-9]{12}00[0-9]*$";
						String reg2 = "^[0-9]{12}01[0-9]*$";
						String pay_type = "";
						float channel = 0;
						if (Pattern.matches(reg1, detailReceipt.getReceiptTax().getReceipt()
								.getOrder_id())) {
							pay_type = "短代";
							channel = detailReceipt.getReceiptTax().getTaxRate()
									.getChannel_message();
						} else if (Pattern.matches(reg2, detailReceipt.getReceiptTax().getReceipt()
								.getOrder_id())) {
							pay_type = "支付宝";
							channel = detailReceipt.getReceiptTax().getTaxRate()
									.getChannel_alipay();
						} else {
							pay_type = "银联";
							channel = detailReceipt.getReceiptTax().getTaxRate()
									.getChannel_bank();
						}
				%>
			<tr>
				<td width="15%"><%=detailReceipt.getApp().getAppInfo().getAppName()%></td>
				<td width="20%"><%=detailReceipt.getReceiptTax().getReceipt().getReceipt_time()%></td>
				<td width="20%">
				<%if(detailReceipt.getReceiptTax().getReceipt().getOrder_id().length()<=24){ %>
				<%=detailReceipt.getReceiptTax().getReceipt().getOrder_id()%>
				<%}
				else{%>
				<%=detailReceipt.getReceiptTax().getReceipt().getOrder_id().substring(0, 23)+"..." %>
				<%} %>
				</td>
				<td width="10%"><%=detailReceipt.getReceiptTax().getReceipt().getPrice()%></td>
				<td width="10%"><%=pay_type%></td>
				<td width="10%"><%=detailReceipt.getApp().getAppAut().getDivided()%></td>
				<td width="10%"><%=channel%></td>
			</tr>
			<%
				}
			%>  

		</table>
</div>
</body>
</html>