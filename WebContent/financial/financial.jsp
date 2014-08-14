<%@ page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="com.rainbow.server.FinancialSev"%>
<%@ page import="com.rainbow.server.Financial" %>
<%@ page import="com.rainbow.util.PageUtil" %>
<%
	String status = (String)session.getAttribute("status");
	Integer check_out = (Integer)session.getAttribute("check_out");
	String year = (String)session.getAttribute("year");
	String month =  (String)session.getAttribute("month");
	List<FinancialSev> financialSevList = new ArrayList<FinancialSev>();
	financialSevList = (List<FinancialSev>)session.getAttribute("financialSevList");
	PageUtil pageUtil = (PageUtil)session.getAttribute("page");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript"src="js/jquery.min.js"></script>
<title>五彩时空财务</title>
<script type="text/javascript" language="javascript">

function initFinancial(currentPage){
	location.href="initFinancial?currentPage="+currentPage+"&status="+$("#status").val()+"&year="+$("#year").val()+"&month="+$("#month").val();
}
</script>
</head>

<body>
	<div align="center">
		<div align="left">

			<select id="status">
				<option <%if(status == null||"".equals(status)||"全部".equals(status)){ %>
					selected="selected" <%} %>>全部</option>
				<option <%if("已结算".equals(status)){ %> selected="selected" <%} %>>已结算</option>
				<option <%if("未结算".equals(status)){ %> selected="selected" <%} %>>未结算</option>
			</select> 
			<select id="year">
				<option <%if("2014".equals(year)){ %> selected="selected" <%} %>>2014</option>
				<option <%if("2015".equals(year)){%> selected="selected" <%} %>>2015</option>
				<option <%if("2016".equals(year)){ %> selected="selected" <%} %>>2016</option>
				<option <%if("2017".equals(year)){ %> selected="selected" <%} %>>2017</option>
				<option <%if("2018".equals(year)){ %> selected="selected" <%} %>>2018</option>
				<option <%if("2019".equals(year)){ %> selected="selected" <%} %>>2019</option>
				<option <%if("2020".equals(year)){ %> selected="selected" <%} %>>2020</option>
				<option <%if("2021".equals(year)){ %> selected="selected" <%} %>>2021</option>
				<option <%if("2022".equals(year)){ %> selected="selected" <%} %>>2022</option>
				<option <%if("2023".equals(year)){ %> selected="selected" <%} %>>2023</option>
				<option <%if("2024".equals(year)){ %> selected="selected" <%} %>>2024</option>
			</select> 
			<select id="month">
				<option <%if("01".equals(month)){ %> selected="selected" <%} %> value="1">1月</option>
				<option <%if("02".equals(month)){ %> selected="selected" <%} %> value="2">2月</option>
				<option <%if("03".equals(month)){ %> selected="selected" <%} %> value="3">3月</option>
				<option <%if("04".equals(month)){ %> selected="selected" <%} %> value="4">4月</option>
				<option <%if("05".equals(month)){ %> selected="selected" <%} %> value="5">5月</option>
				<option <%if("06".equals(month)){ %> selected="selected" <%} %> value="6">6月</option>
				<option <%if("07".equals(month)){ %> selected="selected" <%} %> value="7">7月</option>
				<option <%if("08".equals(month)){ %> selected="selected" <%} %> value="8">8月</option>
				<option <%if("09".equals(month)){ %> selected="selected" <%} %> value="9">9月</option>
				<option <%if("10".equals(month)){ %> selected="selected" <%} %> value="10">10月</option>
				<option <%if("11".equals(month)){ %> selected="selected" <%} %> value="11">11月</option>
				<option <%if("12".equals(month)){ %> selected="selected" <%} %> value="12">12月</option>
			</select> 
			<input type="button" value="查询" onclick="initFinancial(1)" />
			<%for(FinancialSev financialSev:financialSevList){ %>
			<div>
				<p>企业名称</p>
				<p>
					<%if(financialSev.getUser().getCorporatename()!=null){ %><%=financialSev.getUser().getCorporatename() %>
					<%}else {%><%=financialSev.getUser().getRealname() %>
					<%} %>
				</p>
				<table>
					<tr>
						<td>结算状态</td>
						<td>应用名称</td>
						<td>总计</td>
						<td>短代</td>
						<td>支付宝</td>
						<td>银联</td>
						<td>结算金额</td>
						<td>分成比例</td>
						<td>短代</td>
						<td>支付宝</td>
						<td>银联</td>
						<td>税率</td>
					</tr>
					<%for(Financial financial : financialSev.getFinancialList()){ %>
					<%if(check_out == -1){ %>
					<tr>
						<td><input type="button" <%if(financial.getCheck_out()==0){ %> value="未结算" <%}
						else if(financial.getCheck_out()==1){%>value="已结算"  disabled="disabled" <%} %>/></td>
						<td><%=financial.getApp().getAppInfo().getAppName() %></td>
						<td><%=financial.getSum() %>元</td>
						<td><%=financial.getMassageSum() %>元</td>
						<td><%=financial.getAlipaySum() %>元</td>
						<td><%=financial.getBankSum() %>元</td>
						<td><%=financial.getPaySum() %>元</td>
						<td><%=financial.getApp().getAppAut().getDivided() %>%</td>
						<td><%=financial.getTaxRate().getChannel_message() %>%</td>
						<td><%=financial.getTaxRate().getChannel_alipay() %>%</td>
						<td><%=financial.getTaxRate().getChannel_bank() %>%</td>
						<td><%=financial.getTaxRate().getTax_rate() %>%</td>
					</tr>
					<%
					}else if(check_out == 0 && check_out == financial.getCheck_out()){
					%>
					<tr>
						<td><input type="button" value="未结算" /></td>
						<td><%=financial.getApp().getAppInfo().getAppName() %></td>
						<td><%=financial.getSum() %>元</td>
						<td><%=financial.getMassageSum() %>元</td>
						<td><%=financial.getAlipaySum() %>元</td>
						<td><%=financial.getBankSum() %>元</td>
						<td><%=financial.getPaySum() %>元</td>
						<td><%=financial.getApp().getAppAut().getDivided() %>%</td>
						<td><%=financial.getTaxRate().getChannel_message() %>%</td>
						<td><%=financial.getTaxRate().getChannel_alipay() %>%</td>
						<td><%=financial.getTaxRate().getChannel_bank() %>%</td>
						<td><%=financial.getTaxRate().getTax_rate() %>%</td>
					</tr>
					<%}
					else if(check_out == 1 && check_out == financial.getCheck_out()){%>
					<tr>
						<td><input type="button" value="已结算"  disabled="disabled" /></td>
						<td><%=financial.getApp().getAppInfo().getAppName() %></td>
						<td><%=financial.getSum() %>元</td>
						<td><%=financial.getMassageSum() %>元</td>
						<td><%=financial.getAlipaySum() %>元</td>
						<td><%=financial.getBankSum() %>元</td>
						<td><%=financial.getPaySum() %>元</td>
						<td><%=financial.getApp().getAppAut().getDivided() %>%</td>
						<td><%=financial.getTaxRate().getChannel_message() %>%</td>
						<td><%=financial.getTaxRate().getChannel_alipay() %>%</td>
						<td><%=financial.getTaxRate().getChannel_bank() %>%</td>
						<td><%=financial.getTaxRate().getTax_rate() %>%</td>
					</tr>
					<%} %>
					<%} %>
				</table>
			</div>
			<%} %>

		</div>
		<ul>
		<%if(pageUtil.isHasFirst()){ %>
		<li><a href="javascript:initFinancial(1)">首页</a></li>
		<%} %>
		<%if(pageUtil.isHasPrevious()){ %>
		<li><a href="javascript:initFinancial(<%=pageUtil.getCurrentPage()-1%>)">上一页</a></li>
		<%} %>
		<%if(pageUtil.getTotalPage()>1){ %>
		<li><a href="javascript:initFinancial(1)">1</a></li>
		<%} %>
		<%if(pageUtil.getTotalPage()>2){ %>
		<li><a href="javascript:initFinancial(2)">2</a></li>
		<%} %>
		<%if(pageUtil.getTotalPage()>3){ %>
		<li><a href="javascript:initFinancial(3)">3</a></li>
		<%} %>
		<%if(pageUtil.getTotalPage()>4){ %>
		<li><a href="javascript:initFinancial(4)">4</a></li>
		<%} %>
		<%if(pageUtil.getTotalPage()>5){ %>
		<li><a href="javascript:initFinancial(5)">5</a></li>
		<%} %>
		<%if(pageUtil.isHasNext()){ %>
		<li><a href="javascript:initFinancial(<%=pageUtil.getCurrentPage()+1%>)">下一页</a></li>
		<%} %>
		<%if(pageUtil.isHasLast()){ %>
		<li><a href="javascript:initFinancial(<%=pageUtil.getTotalPage()%>)">尾页</a></li>
		<%} %>
		<li>
		当前第<%=pageUtil.getCurrentPage() %>页，总共<%=pageUtil.getTotalPage() %>页
		</li>
		</ul>
	</div>
</body>
</html>
