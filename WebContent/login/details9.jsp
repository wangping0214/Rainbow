<%@ page language="java" import="com.rainbow.entity.User" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>开心跳跳兔</title>
<link href="style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jq.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jcarousellite.js"></script>
<script  type="text/javascript"  src="js/DD_belatedPNG.js"></script>
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
<!--[if IE 6]>
<script type="text/javascript" src="js/DD_belatedPNG.js" ></script>
<script type="text/javascript">
	DD_belatedPNG.fix('.gamecont img');//可以写多个用逗号分开即可
</script>
<![endif]-->
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
          <li><a href="game_class.jsp">游戏分类</a><div class="blueLine"></div></li> 
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
   <div class="position"><a href="#">安卓游戏分类</a>><a href="#">角色扮演</a>><a href="#"></a>开心跳跳兔</div>
   <div class="xcont">
      <div class="xcontleft">
         <div class="gamecont">
             <dl>
                 <dt>
                     <p class="suolve"><a href="#"><img src="images/b9.png" width="94" height="94" /></a></p>
                     <p class="xia3"><a href="#">下载</a></p>
                 </dt>
                 <dd class="gametit"><span>开心跳跳兔</span>
                   <p><img src="images/wd.jpg" /><img src="images/wgg.jpg" /><img src="images/ys.jpg" /><img src="images/gf.jpg" /></p></dd>
                 <dd><span>下　载：35万次</span><span>大　小：8.69M</span></dd>
                 <dd><span>资　费：道具收费</span><span>分　类：休闲消除</span></dd>
                 <dd><span>语　言：中文</span><span>版　本：2.1</span></dd>
                 <dd><span>时　间：2014-05-28</span></dd>
                 <dd>开发者：深圳安欧科技有限公司</dd>
             </dl>
       </div>
         <!--gamecont-->
         <div class="jtutit"><img src="images/rank_12.jpg" />游戏截图</div>
         <div class="gameimg">
             <div class="carousel">
		        <a href="javascript:void(0);" class="prev disabled" id="prev-03">&nbsp </a>
		        <div class="jCarouselLite" id="demo-03">
			        <ul>
				       <li><img src="images/d33.jpg" width="246" height="409"/></li>
				       <li><img src="images/d34.jpg" width="246" height="409"/></li>
                       <li><img src="images/d35.jpg" width="246" height="409"/></li>
                       <li><img src="images/d36.jpg" width="246" height="409"/></li>
			        </ul>
		      </div>
		      <a href="javascript:void(0);" class="next" id="next-03">&nbsp </a>
		      <div class="clear"></div>   
	       </div>
           <!--carousel-->
         </div>
         <!--gameimg-->
         <div class="gametext">
             <div id="select" class="m" clstag="thirdtype|keycount|thirdtype|select">
                <dl id="select-brand">
                  <dt><img src="images/rank_12.jpg" />描述：</dt>
                  <dd>
                     <div class="content" style="height:88px;">
                        <p>
《开心跳跳兔》将经典打泡泡玩法与谐趣创新完美结合。游戏拥有清新亮丽的美术风格，特色有趣的泡泡关卡。
这里有深海、森林、冰雪等不同的主题区域，有不同类型的关卡和不同的新奇玩法。
在这里，你可以进行一场曲折而有趣的大冒险喔！
史上最好玩的打泡泡游戏，令人耳目一新、绚丽的场景、丰富的游戏元素、快点叫上好友，来兔星人的神奇大陆，一起来体验泡泡吧！


                        </p> 
                    </div>
                      <span id="select-hold" class="close">展开<b></b></span>
                  </dd>
                </dl>
                <dl id="select-brand1">
                  <dt><img src="images/rank_12.jpg" />更新内容：</dt>
                  <dd>
                     <div class="content" style="height:88px;">
                       <p>将经典打泡泡玩法与谐趣创新完美结合。</p> 
                    </div>
                    <span id="select-hold1" class="close">展开<b></b></span>
                 </dd>
               </dl>
            </div>
            <!--select-->
            <div class="discuss">
               <div class="tit5"><img src="images/rank_12.jpg" />游戏评论（共65条）</div>
               <div class="discont"><textarea></textarea></div>
               <div class="tijiao"><input type="submit" value="提交" /></div>
               <ul class="dislist">
                  <li>
                      <dl>
                         <dt><a href="#"><img src="images/de_31.jpg" /></a></dt>
                         <dd><a href="#">Terry183</a></dd>
                         <dd>沙发O(∩_∩)O哈哈哈~</dd>
                         <dd><span>2013-08-09</span><span>来自：Samsung Gt-i9300</span></dd>
                      </dl>
                  </li>
                  <li>
                      <dl>
                         <dt><a href="#"><img src="images/de_31.jpg" /></a></dt>
                         <dd><a href="#">Terry183</a></dd>
                         <dd>沙发O(∩_∩)O哈哈哈~</dd>
                         <dd><span>2013-08-09</span><span>来自：Samsung Gt-i9300</span></dd>
                      </dl>
                  </li>
                  <li>
                      <dl>
                         <dt><a href="#"><img src="images/de_31.jpg" /></a></dt>
                         <dd><a href="#">Terry183</a></dd>
                         <dd>沙发O(∩_∩)O哈哈哈~</dd>
                         <dd><span>2013-08-09</span><span>来自：Samsung Gt-i9300</span></dd>
                      </dl>
                  </li>
               </ul>
               <div class="more2">查看更多评论</div>
               <!--more2-->
            </div>
            <!--discuss--> 
         </div>
         <!--gametext-->
      </div>
      <!--xcontleft-->
      <div class="xcontright">
          <div class="othertit">下载此应用的用户还下载了</div>
          <dl>
             <dt><a href="details2.jsp"><img src="images/a2.png" width="37" height="37" /></a></dt>
             <dd><a href="details2.jsp">天尊</a><span>2.1万次下载</span></dd>
          </dl>
          <dl>
             <dt><a href="details3.jsp"><img src="images/a3.png" width="37" height="37" /></a></dt>
             <dd><a href="details3.jsp">贝壳拾趣</a><span>0.4万次下载</span></dd>
          </dl>
          <dl>
             <dt><a href="details4.jsp"><img src="images/a4.png" width="37" height="37" /></a></dt>
             <dd><a href="details4.jsp">欢乐碰碰猫</a><span>1.5万次下载</span></dd>
          </dl>
          <dl>
             <dt><a href="details5.jsp"><img src="images/a5.png" width="37" height="37" /></a></dt>
             <dd><a href="details5.jsp">全民争霸</a><span>6.8万次下载</span></dd>
          </dl>
      </div>
      <!--xcontright-->
   </div>
   <!--xcont-->
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
                 <p class="logo2 fl"><a href="index.jsp"><img src="images/im_14.jpg" /></a></p>
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
			scroll:2,
			visible:2,
			/*auto: 800,*///自动滚动
    		speed: 1000
		});		
	});
	</script>
  
<script type="text/javascript">
(function() { var b = $("#select-brand .tab"), f = $("#select-brand .content"), h = $("#select-hold"), c = b.find(".curr").attr("rel"), g = "38px", a; var d = 0, i = 0, e = (screen.width >= 800) ? 1: 1; i = Math.ceil(f.children().size() / e); d = (f.children().outerHeight()) ; if (d > parseInt(g)) { f.css("height", g); h.html("<b></b>展开").attr("class", "close") } else { h.html("<b></b>收起").attr("class", "open") } h.bind("click", function() { if ($(this).attr("class") != "open") { f.css("height", "auto"); h.html("<b></b>收起").attr("class", "open") } else { f.css("height", g); h.html("<b></b>展开").attr("class", "close") } }); b.find("li").bind("mouseover", function() { var j = $(this); a = setTimeout(function() { if (j.attr("rel") == c) { return } b.find("li").eq(c).removeClass("curr"); j.addClass("curr"); c = j.attr("rel"); f.css("height", "auto"); h.hide(); f.find("div").each(function() { if (c == 0) { $(this).show() } else { $(this).hide(); if ($(this).attr("rel") == c) { $(this).show() } } }) }, 500) }).bind("mouseout", function() { clearTimeout(a) }) })();
</script>
<script type="text/javascript">
(function() { var b = $("#select-brand1 .tab"), f = $("#select-brand1 .content"), h = $("#select-hold1"), c = b.find(".curr").attr("rel"), g = "16px", a; var d = 0, i = 0, e = (screen.width >= 800) ? 1: 1; i = Math.ceil(f.children().size() / e); d = (f.children().outerHeight()) * i; if (d > parseInt(g)) { f.css("height", g); h.html("<b></b>展开").attr("class", "close") } else { h.html("<b></b>收起").attr("class", "open") } h.bind("click", function() { if ($(this).attr("class") != "open") { f.css("height", "auto"); h.html("<b></b>收起").attr("class", "open") } else { f.css("height", g); h.html("<b></b>展开").attr("class", "close") } }); b.find("li").bind("mouseover", function() { var j = $(this); a = setTimeout(function() { if (j.attr("rel") == c) { return } b.find("li").eq(c).removeClass("curr"); j.addClass("curr"); c = j.attr("rel"); f.css("height", "auto"); h.hide(); f.find("div").each(function() { if (c == 0) { $(this).show() } else { $(this).hide(); if ($(this).attr("rel") == c) { $(this).show() } } }) }, 500) }).bind("mouseout", function() { clearTimeout(a) }) })();
</script>

</body>
</html>
