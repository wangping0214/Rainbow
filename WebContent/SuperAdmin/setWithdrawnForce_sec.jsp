 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>柴米游戏</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style>
.xinxicont label{ width:180px; }
.zhushi{ padding:5px 0 0 190px; font-weight:normal; clear:both;}
</style>
<script type="text/javascript"src="js/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {    
    function jump(count) {    
        window.setTimeout(function(){    
            count--;    
            if(count > 0) {    
                $('#num').attr('innerHTML', count);    
                jump(count);    
            } else {    
                location.href="adminIsShelf.action?appTmp.isShelfCurrentPage=1&appTmp.isShelf=-2";    
            }    
        }, 1000);    
    }    
    jump(3);    
}); 
</script>     
  </head>        
  <body>      
    >>>>>><span style="color:red"><%=session.getAttribute("appName") %>强制下架</span>>>>>>页面将在<span id="num">3</span>秒  跳转不成功<a href="adminIsShelf.action?appTmp.isShelfCurrentPage=1&appTmp.isShelf=-2">点击这里</a>>>>>>>>>>
  </body>    
</html>  
  </body>    
</html>  