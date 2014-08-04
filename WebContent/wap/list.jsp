<%@ page language="java" import="com.rainbow.entity.Prize" import="java.util.List;" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%List<Prize> prize = (List<Prize>)session.getAttribute("prize"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>柴米游戏-中国第一手游杂志</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link href="css/huodong.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/myclass.js"></script>

<style type="text/css">
body{ background:#a2f5e4; padding-bottom:80px;}
a{ display:block; width:100%;}
</style>
</head>

<body>
<div class="cont">
<img src="image/list_02.jpg" width="100%"/>
<div class="listcont"/>
<p class="ago"><a href="result.jsp">查看往期中奖名单 >></a></p>
<p class="atit">本期开奖结果</p>
<div id="demo">
    <div id="demo1">
    	<%if(prize!=null){ 
    	for(int i=0;i<prize.size();i++){%>
        <div><span class="name"><%=prize.get(i).getName().substring(0, 1) %>**</span>
        <span class="tel"><%=prize.get(i).getPhone().substring(0, 3) %>****<%=prize.get(i).getPhone().substring(prize.get(i).getPhone().length()-5, prize.get(i).getPhone().length()-1) %></span>
        <span class="jiang"><%if(prize.get(i).getPrize()==1) {%>获得了机械游戏键盘一个<%} %>
        				<%if(prize.get(i).getPrize()==2) {%>获得了头戴式蓝牙耳机一个<%} %>
        				<%if(prize.get(i).getPrize()==3) {%>获得了360随身WiFi一个<%} %>
        				<%if(prize.get(i).getPrize()==4) {%>获得了300个阅读点<%} %>
        </span></div>
        <%}
    	} %>
     </div>
	 <script type="text/javascript">
		var Marquee1 = new Marquee("demo1");
	    Marquee1.Direction = "top";
		Marquee1.Step = 1;
/*		Marquee1.Width = 450;
*/		Marquee1.Height =280;
		Marquee1.Timer = 50;
		Marquee1.DelayTime = 0;
		Marquee1.WaitTime = 0;
        Marquee1.ScrollStep = 52;
		Marquee1.Start();
	</script>                                         
 </div>
 <br />
  <br />
   <br />
   <br />
   <br />
   <br />
   <br />
 <p>中奖用户会在当期活动结束后 由客服统一通知，请耐心等待。</p>
</div>



</body>						
</html>
