<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript"src="js/jquery.min.js"></script>
<script charset="utf-8" type="text/javascript"src="<%=request.getContextPath()%>/scripts/appUpload.js"></script>
<script type="text/javascript"src="js/nav.js"></script>
<script type="text/javascript" language="javascript">
function fn_browse() 
{ 
	document.group_form.group_photo.click(); 
	document.group_form.file.value = document.all.group_form.group_photo.value;  
} 
$(document).ready(function(){
	alert("kj");
		$("#group_photo").uploadPreview({ Img: "photo"});

});
</script>
</head>
<body>
<form name="group_form" action="">
<input type="file" id="group_photo" name="user.cardphoto1" style="display:none;"  /><a href="javascript:fn_browse();">
<img id="photo" name="btn" src="images/img26.png" width="81" height="71" border="0" /></a>
</form>
</body>
</html>