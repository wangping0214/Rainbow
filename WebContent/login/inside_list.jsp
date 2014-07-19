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
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jcarousellite.js"></script>
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
          <li><a href="todayRecommend.action">今日推荐</a></li> 
          <li><a href="software_cat.jsp">软件分类</a></li> 
          <li class="active"><a href="game_class.jsp">游戏分类</a><div class="blueLine"></div></li> 
          <li><a href="webRanklist.action">排行榜</a></li> 
          <li><a href="E-zine.jsp">电子杂志</a></li> 
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
   <div class="position"><a href="index.jsp">首页</a>><a href="#">安卓游戏分类</a>><a href="#">角色扮演</a></div>
   <!--position-->
   <div class="hot">
      <div class="tit4">热门推荐:</div>
      <div class="carousel">
		<a href="javascript:void(0);" class="prev disabled" id="prev-03">&nbsp </a>
		<div class="jCarouselLite" id="demo-03">
			<ul>
				<li><a href="#" target="_blank"><img src="images/tj_32.jpg" /></a><p><a href="#" target="_blank">博雅斗地</a></p></li>
				<li><a href="#" target="_blank"><img src="images/tj_32.jpg" /></a><p><a href="#" target="_blank">博雅斗地</a></p></li>
                <li><a href="#" target="_blank"><img src="images/tj_36.jpg" /></a><p><a href="#" target="_blank">博雅斗地</a></p></li>
                <li><a href="#" target="_blank"><img src="images/tj_32.jpg" /></a><p><a href="#" target="_blank">博雅斗地</a></p></li>
                <li><a href="#" target="_blank"><img src="images/tj_32.jpg" /></a><p><a href="#" target="_blank">博雅斗地</a></p></li>
                <li><a href="#" target="_blank"><img src="images/tj_32.jpg" /></a><p><a href="#" target="_blank">博雅斗地</a></p></li>
                <li><a href="#" target="_blank"><img src="images/tj_34.jpg" /></a><p><a href="#" target="_blank">博雅斗地</a></p></li>
                <li><a href="#" target="_blank"><img src="images/tj_32.jpg" /></a><p><a href="#" target="_blank">博雅斗地</a></p></li>
                <li><a href="#" target="_blank"><img src="images/tj_32.jpg" /></a><p><a href="#" target="_blank">地</a></p></li>
                <li><a href="#" target="_blank"><img src="images/tj_36.jpg" /></a><p><a href="#" target="_blank">超级救火</a></p></li>
                <li><a href="#" target="_blank"><img src="images/tj_32.jpg" /></a><p><a href="#" target="_blank">博雅斗地</a></p></li>
                <li><a href="#" target="_blank"><img src="images/tj_32.jpg" /></a><p><a href="#" target="_blank">博雅斗地</a></p></li>
                <li><a href="#" target="_blank"><img src="images/tj_32.jpg" /></a><p><a href="#" target="_blank">博雅斗地</a></p></li>
                <li><a href="#" target="_blank"><img src="images/tj_34.jpg" /></a><p><a href="#" target="_blank">博雅斗地</a></p></li>
                <li><a href="#" target="_blank"><img src="images/tj_32.jpg" /></a><p><a href="#" target="_blank">博雅斗地</a></p></li>
                <li><a href="#" target="_blank"><img src="images/tj_32.jpg" /></a><p><a href="#" target="_blank">博雅斗地</a></p></li>
                <li><a href="#" target="_blank"><img src="images/tj_36.jpg" /></a><p><a href="#" target="_blank">博雅斗地</a></p></li>
                <li><a href="#" target="_blank"><img src="images/tj_36.jpg" /></a><p><a href="#" target="_blank">博雅斗地</a></p></li>
			</ul>
		</div>
		<a href="javascript:void(0);" class="next" id="next-03">&nbsp </a>
		<div class="clear"></div>   
	</div>
    <!--carousel end-->
   </div>
   <!--hot-->
   <div class="allclass">
       <ul class="classnav">
           <li>全部</li>
           <li>回合制</li>
           <li>卡牌</li>
           <li>魔幻</li>
       </ul>
       <!--classnav-->
       <div class="classlist">
           <div class="one">
               <dl>
                  <dt><a href="details.jsp"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="details.jsp" class="fl">三国来了</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="page"><a href="#" class="mo">首页</a><a href="#" class="mo">上一页</a><a href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#">6</a><a href="#">7</a><a href="#" class="mo">下一页</a><a href="#" class="mo">末页</a></div>
           <!--page-->
       </div>
       <!--classlist-->
       <div class="classlist">
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="one">
               <dl>
                  <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                  <dd><a href="#" class="fl">明珠轩辕</a><a href="#" class="xia2">下载</a></dd>
                  <dd>下载：13万次 66.94M</dd>
               </dl>
               <p class="intro">游戏简介：超级绚丽强力技能，让你掌控千万军队,同时在线突破13万...</p>
           </div>
           <!--one-->
           <div class="page"><a href="#" class="mo">首页</a><a href="#" class="mo">上一页</a><a href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#">6</a><a href="#">7</a><a href="#" class="mo">下一页</a><a href="#" class="mo">末页</a></div>
           <!--page-->
       </div>
       <!--classlist-->
   </div>
   <!--allclass-->
</div>
<!--midddle--> 
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
                   <dd><a href="about_us.jsp">关于我们</a></dd>
                   <dd><a href="teamwork.jsp">商务洽谈</a></dd>
                   <dd><a href="developer_center.jsp">开发者中心</a></dd>
                 </dl>
                 <dl>
                 
                   <dt>帮助与支持</dt>
                   <dd><a href="use_item.jsp">使用条款</a></dd>
                   <dd><a href="users_privacy.jsp">用户隐私</a></dd>
                   <dd><a href="knowledge_equity.jsp">知识产权保护声明</a></dd>
                 </dl>
                 <p class="logo2 fl"><a href="#"><img src="images/im_14.jpg" /></a></p>
               </div>
               <!--footmain-->
           </div>
           <!--footcont-->
       </div>
       <!--fotter-->
  	<script type="text/javascript">
	$(document).ready(function(){
		$('#demo-03').jCarouselLite({
			btnPrev: '#prev-03',
			btnNext: '#next-03',
			circular: false,
			scroll:9,
			/*auto: 800,*///自动滚动
    		speed: 1000
		});		
	});
	</script>
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
