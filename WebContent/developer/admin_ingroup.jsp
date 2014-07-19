<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>柴米游言</title>
<style>
*{ margin:0; padding:0;}
a img{ border:0;}
#frame_main{ height:690px;}
</style>
</head>
<frameset cols="*,990,*" border="0" id="frame_main" framespacing="0" scrolling="no" frameborder="0"  >  
   <frame src="<%=request.getContextPath()%>/developer/blank.jsp"  noresize="noresize" border="0"  framespacing="0" frameborder="0"   />
   <frameset cols="170,*"  framespacing="0" border="0" frameborder="0"  > 
      <frame src="<%=request.getContextPath()%>/developer/menu_ingroup.jsp" name="menu" noresize="noresize" scrolling="no"  border="0"  framespacing="0" frameborder="0"   />
      <frame src="<%=request.getContextPath()%>/developer/main.jsp" name="main" noresize="noresize" scrolling="no"  border="0"  framespacing="0" frameborder="0"   />
   </frameset>
  <frame src="<%=request.getContextPath()%>/developer/blank.jsp"  noresize="noresize" scrolling="no" border="0"  framespacing="0" frameborder="0"   />
</frameset><noframes></noframes>






<body>

<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>

</html>
