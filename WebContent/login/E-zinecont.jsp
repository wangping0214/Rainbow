<%@ page language="java" import="com.rainbow.entity.User" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>游戏分类-角色扮演</title>
<link href="style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jq.js"></script>
<script type="text/javascript" language="javascript">
$(document).ready(function(){
	//                退出       
	$("#id_exit").click(function(){
		jQuery.ajax({
			type : "post",
			url : "<%=request.getContextPath()%>/webLoginExit.action",
			success : function(){
				location.reload();
			}
		});
	});
});
</script>
</head>

<body>
<div class="top">
     <a href="index.jsp" class="fl"><img src="images/tj_03.jpg" /></a>
     <div class="search2 fr">
         <input type="text" value="搜索安卓软件和游戏" class="sou2"/>
         <input type="button" value="" class="soubut" />
     </div>
     <!--search2-->
</div>
<!--top-->
<div class="nav2">
   <div class="nav2cont">
       <ul class="mainnav">
          <li><a href="today_recommend.jsp">今日推荐</a></li> 
          <li><a href="software_cat.jsp">软件分类</a></li> 
         <li><a href="game_class.jsp">游戏分类</a></li> 
          <li><a href="ranklist.jsp">排行榜</a></li> 
         <li class="active"><a href="E-zine.jsp">电子杂志</a><div class="blueLine"></div></li> 
       </ul>
       <!--mainnav-->
       <%User user = (User)session.getAttribute("user"); 
       	if(user==null){
       %>
       <div class="huiyuan fr"><p><a href="<%=request.getContextPath()%>/login/login.jsp">登录</a>|<a href="<%=request.getContextPath()%>/login/register.jsp">注册</a></p></div>
       <%}
       	else{%>
       	<div class="huiyuan fr"><a href="#" class="tou"><img src="images/tj_11.jpg" /></a><p><a href="" id="id_exit">退出</a></p></div>
       	<%} %>
   </div>
   <!--nav2cont-->
</div>
<!--nav2-->
<div class="middle">
  <div class="econt">
      <div class="econtleft">
          <div class="etit">
              <p class="enum"><span>60</span></p>
          </div>
          <!--etit-->
          <div class="ago">
             <p class="agotit"><img src="images/ec_10.jpg" /></p>
             <dl>
                 <dt>2014年</dt>
                 <dd><a href="#">vol.105</a></dd>
                 <dd><a href="#">vol.104</a></dd>
                 <dd><a href="#">vol.103</a></dd>
                 <dd><a href="#">vol.102</a></dd>
                 <dd><a href="#">vol.101</a></dd>
                 <dd><a href="#">vol.100</a></dd>
                 <dd class="emore"><a href="#"><img src="images/ec_14.jpg" /></a></dd>
             </dl>
             <dl>
                 <dt>2013年</dt>
                 <dd><a href="#">vol.99</a></dd>
                 <dd><a href="#">vol.104</a></dd>
                 <dd><a href="#">vol.103</a></dd>
                 <dd><a href="#">vol.102</a></dd>
                 <dd><a href="#">vol.101</a></dd>
                 <dd><a href="#">vol.100</a></dd>
                 <dd class="emore"><a href="#"><img src="images/ec_14.jpg" /></a></dd>
             </dl>
          </div>
          <!--ago-->
      </div>
      <!--econtleft-->
      <div class="econtright"> 
         <p><img src="images/c_03.jpg" /></p>
         <ul class="page2">
            <li><a href="#"><img src="images/p_03.jpg" /></a></li>
            <li><a href="#"><img src="images/p_06.jpg" /></a></li>
            <li><a href="#"><img src="images/p_08.jpg" /></a></li>
            <li><a href="#"><img src="images/p_10.jpg" /></a></li>
         </ul>
         <!--page2-->
      </div>
      <!--econtright-->
     
   </div>
   <!--econt-->
</div>
<!--middle-->
   <div class="icon2"><img src="images/ic_03.jpg" /></div>

     <div class="fotter fotter2"> 
          <div class="footcont">
             <div class="footmain">
                <div class="copyright">
                   <p class="tit3"><a href="index.jsp">柴米游戏丨中国第一手游杂志</a></p>
                   <p>&copy;2014 - 2020 柴米游戏 丨京ICP备11000000号-2</p>
                   <p>除非特别注明，应用程序由第三方市场提供，柴米游戏仅根据您的指令提供搜索结果链接，与出处无关，详情请参阅 知识产权保护声明</p>
                </div>
                <!--copyright-->
                <dl>
                   <dt>意见与服务</dt>
                   <dd><a href="#">关于我们</a></dd>
                   <dd><a href="#">加入我们</a></dd>
                   <dd><a href="#">商务洽谈</a></dd>
                   <dd><a href="developer_center.jsp">开发者中心</a></dd>
                 </dl>
                 <dl>
                   <dt>意见与服务</dt>
                   <dd><a href="#">关于我们</a></dd>
                   <dd><a href="#">加入我们</a></dd>
                   <dd><a href="#">商务洽谈</a></dd>
                   <dd><a href="developer_center.jsp">开发者中心</a></dd>
                 </dl>
                 <p class="logo2 fl"><a href="#"><img src="images/im_14.jpg" /></a></p>
               </div>
               <!--footmain-->
           </div>
           <!--footcont-->
       </div>
       <!--fotter-->
</body>
</html>
