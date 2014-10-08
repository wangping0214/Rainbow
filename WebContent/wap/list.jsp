<%@page import="java.util.ArrayList"%>
<%@ page language="java" import="com.rainbow.entity.Prize"
	import="java.util.List;" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Prize> fristPrize = (List<Prize>)request.getAttribute("fristPrize");
	if(null==fristPrize)
		fristPrize = new ArrayList<Prize>();
	List<Prize> secondPrize = (List<Prize>)request.getAttribute("secondPrize");
	if(null==secondPrize)
		secondPrize = new ArrayList<Prize>();
	List<Prize> thridPrize = (List<Prize>)request.getAttribute("thridPrize");
	if(null==thridPrize)
		thridPrize = new ArrayList<Prize>();
	List<Prize> fourthPrize = (List<Prize>)request.getAttribute("fourthPrize");
	if(null==fourthPrize)
		fourthPrize = new ArrayList<Prize>();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>柴米游戏-中国第一手游杂志</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link href="css/huodong.css" rel="stylesheet" type="text/css" />
<style type="text/css">
a{ display:block; width:100%;}
</style>
</head>

<body>
<div class="cont">
<a href="showByRecomLevel.action?appTmp.showByRecomLevelCurrentPage=1"><img src="image/list_03_01.jpg" width="100%"/></a>
<img src="image/list_03_02.jpg" width="100%"/>
<div class="listcont">
<img src="image/list_03_03.jpg" width="100%" height="840" class="post"/>
<div id="demo">
    <div  class="scrollDiv" id="demo1">
        <ul>
            <li class="jiangxiang">一等奖（<%=fristPrize.size() %>名）</li>
			<li class="namelist">
			<%
				for(Prize prize:fristPrize)
				{
			%>
                <p><span class="name"><%=prize.getName().substring(0, 1) %>**</span>
                <span class="tel"><%=prize.getPhone().substring(0, 3) %>****<%=prize.getPhone().substring(prize.getPhone().length()-5, prize.getPhone().length()-1) %></span></p>
                <%} %>
            </li>
            <li class="jiangxiang">二等奖（<%=secondPrize.size() %>名）</li>
			<li class="namelist">
                <%
				for(Prize prize:secondPrize)
				{
			%>
                <p><span class="name"><%=prize.getName().substring(0, 1) %>**</span>
                <span class="tel"><%=prize.getPhone().substring(0, 3) %>****<%=prize.getPhone().substring(prize.getPhone().length()-5, prize.getPhone().length()-1) %></span></p>
                <%} %>
            </li>
            <li class="jiangxiang">三等奖（<%=thridPrize.size() %>名）</li>
			<li class="namelist">
                <%
				for(Prize prize:thridPrize)
				{
			%>
                <p><span class="name"><%=prize.getName().substring(0, 1) %>**</span>
                <span class="tel"><%=prize.getPhone().substring(0, 3) %>****<%=prize.getPhone().substring(prize.getPhone().length()-5, prize.getPhone().length()-1) %></span></p>
                <%} %>
            </li>
            <li class="jiangxiang">参与奖（<%=fourthPrize.size() %>名）</li>
			<li class="namelist">
                <%
				for(Prize prize:fourthPrize)
				{
			%>
                <p><span class="name"><%=prize.getName().substring(0, 1) %>**</span>
                <span class="tel"><%=prize.getPhone().substring(0, 3) %>****<%=prize.getPhone().substring(prize.getPhone().length()-5, prize.getPhone().length()-1) %></span></p>
                <%} %>
            </li>
		</ul>
     </div>
 </div>
</div>
<img src="image/list_03_04.jpg" width="100%"/>

</div>
</body>
</html>
