<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>柴米游戏-中国第一手游杂志</title>
<script type="text/javascript">
//平台、设备和操作系统

//跳转语句，如果电脑访问页面自动跳到login/index.jsp,如果是手机访问就自动跳转到mobile/index.jsp页面
if (navigator.userAgent.match(/Android/i) || navigator.userAgent.match(/webOS/i) || navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i) || navigator.userAgent.match(/iPod/i) || navigator.userAgent.match(/BlackBerry/i) || navigator.userAgent.match(/Windows Phone/i) ) {
	window.location.href = "wap/showByRecomLevel?appTmp.showByRecomLevelCurrentPage=1";
} 
else {

    window.location.href = "login/";
}
</script>
</head>
<body>

</body>
</html>