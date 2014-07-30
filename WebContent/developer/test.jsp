<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript"src="<%=request.getContextPath()%>/developer/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" language="javascript">
$(document).ready(function(){
	$("#button").click(function(){
		$("#group_photo").uploadPreview({ Img: "photo"});
	});
});
</script>
</head>
<body>
<input type="button" id="button" value="test">
</body>
</html>