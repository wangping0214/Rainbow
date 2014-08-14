<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.lang.*"%>
<%@ page import="com.rainbow.server.UserApps"%>
<%@ page import="com.rainbow.util.PageUtil"%>
<%
	List<UserApps> userAppsList = (List<UserApps>) session.getAttribute("userAppsList");
	if (userAppsList == null) {
		userAppsList = new ArrayList<UserApps>();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<!--<script type="text/javascript"src="js/nav.js"></script>
-->
<script charset="GB2312" type="text/javascript"
	src="js/manhuaDate.1.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
.table5 {
	font-size: 12px;
	font-weight: normal;
}

.table5 td {
	text-align: center;
	height: 30px;
	line-height: 30px;
}
</style>
<script type="text/javascript">
	function adminSearchUserReport(currentPage) {
		window.open("adminSearchUserReport?currentPage=" + currentPage
				+ "&companyOrName=" + $("#companyOrName").val(),
				"business_order_result");
	}
</script>
</head>
<body>

	<table border="0" cellpadding="0" cellspacing="0" width="700"
		class="table5">
		<%
			for (UserApps userApps : userAppsList) {
		%>
		<tr>
			<td class="name" width="25%">
				<%
					if (userApps.getUser().getCorporatename() != null) {
				%><%=userApps.getUser().getCorporatename()%>
				<%
					} else if (userApps.getUser().getRealname() != null) {
				%> <%=userApps.getUser().getRealname()%>
				<%
					}
				%>
			</td>
			<td width="20%"><%=userApps.getApp().size()%></td>
			<td width="18%"><%=userApps.getReceiptTaxList().size()%></td>
			<td width="20%"><%=userApps.getPaySum()%></td>
			<td width="15%"><a
				href="adminInitializeUserReport?userId=<%=userApps.getUser().getId()%>"
				class="mingxi" target="main">查看明细</a></td>
		</tr>
		<%
			}
		%>
	</table>

</body>
</html>