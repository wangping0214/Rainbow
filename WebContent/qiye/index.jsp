<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.rainbow.entity.User"%>
<%@ page import="com.rainbow.constant.*" %>
<%
	User user = (User)session.getAttribute("user");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>企业用户</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">  
    function reinitIframe(){var iframe = document.getElementById("main");  
        try{  
            var bHeight = iframe.contentWindow.document.body.scrollHeight;  
            var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;  
            var height = Math.max(bHeight, dHeight);  
            iframe.height =  height;  
        }catch (ex){}  
    }  
  
    window.setInterval("reinitIframe()", 200);  

</script>
<!--<script type="text/javascript">  
    function reinitIframe(){var iframe = document.getElementById("main");  
        try{  
            var bHeight = (iframe.contentWindow.document?iframe.contentWindow.document.body :iframe.ownerDocument.body).scrollHeight;  
            var dHeight = (iframe.contentWindow.document?iframe.contentWindow.document:iframe.ownerDocument).documentElement.scrollHeight; 
            var height = Math.max(bHeight, dHeight);  
            iframe.height =  height;  
        }catch (ex){
			alert(ex)
			}  
    }  
  
    window.setInterval("reinitIframe()", 200);  

</script>-->

</head>

<body>

<iframe src="head.html" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" width="100%" height="80"></iframe>
<div class="middle">
<%if(Auditing.APPROVED.getValue() == user.getApproved()){ %>
   <iframe id="menu" class="left" name="middle2" src="menu.jsp" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" width="100%" onload="this.height=100"></iframe>
<%} %>
   <iframe class="cont2" id="main" name="main" src="main2.jsp" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" width="100%" onload="this.height=100"></iframe>
</div>


</body>
</html>
