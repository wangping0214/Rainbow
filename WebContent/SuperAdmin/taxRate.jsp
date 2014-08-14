<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.rainbow.server.TaxRateSev"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%
	String year = (String)session.getAttribute("year");
	List<TaxRateSev> taxRateSevList = (List<TaxRateSev>)session.getAttribute("taxRateSevList");
	if(taxRateSevList==null)
		taxRateSevList = new ArrayList<TaxRateSev>();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>统计列表</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script charset="utf-8" type="text/javascript" src="js/jquery.min.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.searchcont2 {
	background: url(images/searchs.png) no-repeat;
	width: 227px;
	height: 25px;
	line-height: 25px;
	margin: 30px 0 7px 60px;
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
	color: #000;
	font-size: 12px;
}

.sobut2 {
	width: 35px;
	height: 25px;
	background: none;
	border: none;
	cursor: pointer
}

.guanggaonav .blue a {
	color: #06F
}
</style>
<script type="text/javascript" language="javascript">
	$(document).ready(function() {
		$("#year").change(function() {
			location.href = "initTaxRate?year=" + $("#year").val();
		});
	});
	function updateTaxRate(taxRateId, i, tax_rate, channel_message,
			channel_alipay, channel_bank) {
		if (window.confirm("确认修改？")) {
			jQuery.ajax({
				type : "post",
				url : "updateTaxRate",
				data : {
					"taxRateId":taxRateId,
					"tax_rate" : $("#tax_rate" + i).val(),
					"channel_message" : $("#channel_message" + i).val(),
					"channel_alipay" : $("#channel_alipay" + i).val(),
					"channel_bank" : $("#channel_bank" + i).val()
				},
				success:function(){
					alert("修改成功！");
				}
			
			});
		} else {
			$("#tax_rate" + i).val(tax_rate);
			$("#channel_message" + i).val(channel_message);
			$("#channel_alipay" + i).val(channel_alipay);
			$("#channel_bank" + i).val(channel_bank);
		}
	}
</script>
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
			<div class="midcont tongjimidcont">
				<select id="year">
					<option <%if(year==null||"".equals(year)||"年份".equals(year)) {%>
						selected="selected" <%}%>>年份</option>
					<option <%if("2014".equals(year)) {%> selected="selected" <%}%>>2014</option>
					<option <%if("2015".equals(year)) {%> selected="selected" <%}%>>2015</option>
					<option <%if("2016".equals(year)) {%> selected="selected" <%}%>>2016</option>
					<option <%if("2017".equals(year)) {%> selected="selected" <%}%>>2017</option>
					<option <%if("2018".equals(year)) {%> selected="selected" <%}%>>2018</option>
					<option <%if("2019".equals(year)) {%> selected="selected" <%}%>>2019</option>
					<option <%if("2020".equals(year)) {%> selected="selected" <%}%>>2020</option>
					<option <%if("2021".equals(year)) {%> selected="selected" <%}%>>2021</option>
					<option <%if("2022".equals(year)) {%> selected="selected" <%}%>>2022</option>
				</select>
				<table>
					<%
						for(int i = 0; i<taxRateSevList.size(); i++){ 
							TaxRateSev taxRateSev = taxRateSevList.get(i);
					%>
					<tr>
						<td><%=taxRateSev.getMonth()%>月份</td>
					</tr>
					<tr>
						<td>税率</td>
						<td>短代（包含坏账）</td>
						<td>银联</td>
						<td>支付宝</td>
						<td></td>
					</tr>
					<tr>
						<td><input type="text" id="tax_rate<%=i%>"
							value="<%=taxRateSev.getTaxRate().getTax_rate()%>">%</td>
						<td><input type="text" id="channel_message<%=i%>"
							value="<%=taxRateSev.getTaxRate().getChannel_message()%>">%</td>
						<td><input type="text" id="channel_bank<%=i%>"
							value="<%=taxRateSev.getTaxRate().getChannel_bank()%>">%</td>
						<td><input type="text" id="channel_alipay<%=i%>"
							value="<%=taxRateSev.getTaxRate().getChannel_alipay()%>">%</td>
						<td><input type="button" value="确认修改"
							onclick="updateTaxRate('<%=taxRateSev.getTaxRate().getId()%>','<%=i%>','<%=taxRateSev.getTaxRate().getTax_rate()%>','<%=taxRateSev.getTaxRate().getChannel_message()%>','<%=taxRateSev.getTaxRate().getChannel_alipay()%>','<%=taxRateSev.getTaxRate().getChannel_bank()%>')" /></td>
					</tr>
					<%}%>
				</table>
			</div>
		</div>
	</div>
	</div>
	</div>
</body>
</html>
