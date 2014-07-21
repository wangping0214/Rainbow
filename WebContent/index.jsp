<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>柴米游戏-中国第一手游杂志</title>
<script type="text/javascript">
//平台、设备和操作系统
var system = {
    win: false,
    mac: false,
    xll: false,
    ipad:false
};
//检测平台
var p = navigator.platform;
system.win = p.indexOf("Win") == 0;
system.mac = p.indexOf("Mac") == 0;
system.x11 = (p == "X11") || (p.indexOf("Linux") == 0);
system.ipad = (navigator.userAgent.match(/iPad/i) != null)?true:false;
//跳转语句，如果电脑访问页面自动跳到login/index.jsp,如果是手机访问就自动跳转到mobile/index.jsp页面
if (system.win || system.mac || system.xll||system.ipad) {
	window.location.href = "login/index.jsp";
} 
else {

    window.location.href = "wap/index.jsp";
}
</script>
</head>
<body>

</body>
</html>