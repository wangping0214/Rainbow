<%@ page language="java" import="com.rainbow.entity.User" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>黄金圣斗士</title>
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
   <div class="position"><a href="#">安卓游戏分类</a>><a href="#">角色扮演</a>><a href="#"></a>黄金圣斗士</div>
   <div class="xcont">
      <div class="xcontleft">
         <div class="gamecont">
             <dl>
                 <dt>
                     <p class="suolve"><a href="#"><img src="images/b11.png" width="94" height="94" /></a></p>
                     <p class="xia3"><a href="#">下载</a></p>
                 </dt>
                 <dd class="gametit"><span>黄金圣斗士</span>
                   <p><img src="images/wd.jpg" /><img src="images/wgg.jpg" /><img src="images/ys.jpg" /><img src="images/gf.jpg" /></p></dd>
                 <dd><span>下　载：35万次</span><span>大　小：64M</span></dd>
                 <dd><span>资　费：道具收费</span><span>分　类：角色扮演</span></dd>
                 <dd><span>语　言：中文</span><span>版　本：1.4.1</span></dd>
                 <dd><span>时　间：2014-05-28</span></dd>
                 <dd>开发者：北京有爱互娱科技有限公司<br />
                 </dd>
             </dl>
       </div>
         <!--gamecont-->
         <div class="jtutit"><img src="images/rank_12.jpg" />游戏截图</div>
         <div class="gameimg">
             <div class="carousel">
		        <a href="javascript:void(0);" class="prev disabled" id="prev-03">&nbsp </a>
		        <div class="jCarouselLite" id="demo-03">
			        <ul>
				       <li><img src="images/d41.jpg" width="246" height="409"/></li>
				       <li><img src="images/d42.jpg" width="246" height="409"/></li>
                       <li><img src="images/d43.jpg" width="246" height="409"/></li>
                       <li><img src="images/d44.jpg" width="246" height="409"/></li>
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
全球首款圣斗士卡牌策略游戏，由圣斗士狂热爱好者联盟倾情打造，横空出世，奉献给所有的圣斗士迷们！
这里有上百名圣斗士形象，充分还原了原著里不同的人物性格，悲欢离合的神话故事。
这里有最多样、最丰富的系统，最原汁原味的技能，永远都有新鲜的玩法在等着你，彻底告别重复枯燥，成为世界上最炫酷的圣斗士。
这里有最人性的操作方式，解放您的双手，给您带来最优质的操作体验。
这里有最多的女神，等着与你携手，一起驰骋游戏世界。
我们热情邀请小伙伴们一起加入《黄金圣斗士》的世界里，并肩作战，守卫雅典娜，一起体验古老而又传奇的神话世界。


                        </p> 
                    </div>

                      <span id="select-hold" class="close">展开<b></b></span>
                  </dd>
                </dl>
                <dl id="select-brand1">
                  <dt><img src="images/rank_12.jpg" />更新内容：</dt>
                  <dd>
                     <div class="content" style="height:88px;">
                       <p> 	●完美支持IOS7以及Iphone5<br /> 	●忠于原著<br />
精美的圣斗士写实形象画面，原汁原味的技能，以无比虔诚的世界观重现圣斗士的火爆场景，带你领取最炫酷的对决。<br />
	●人性化的操作<br />
最人性化的操作，你只需要使用你的食指一路点点点，轻松上手，完美操作无压力<br />
	●搜集角色卡<br />
你可以搜集不同的角色卡，不同的卡牌有不同的技能，属性，千变万化的精美卡牌组合出变化无穷的战场策略。<br />
	●玩家对战<br />
玩家可以组合不同的角色成为一个队伍，进行对战，只要击败对方就能和对方的排名互换，并且能够获得相应的奖励，奖励越多小队的队伍也就越快。<br />
	●必杀技<br />
角色可以搭配不同的必杀技，分为A、B、C、D 4个等级，可以在战斗过程中展现华丽的特效并重创敌人。必杀技可以通过参悟并进行升级。<br />
	●星戒系统<br />
游戏内可以带领队员闯荡神话世界，星界里分为数十个关卡，每个关卡下十几个任务，每个关卡是一个故事，过关获胜就可以获得各种奖励，甚至出发探险。<br />
	●商店<br />
商店提供游戏世界内各种必需品，以及种类繁多的奇珍异宝，圣斗士们可以多多去看，或许有意外收获。<br />
	●VIP特权<br />
特权分为不同的等级，每一个等级都提供相应的强化、装备等级技能，VIP级别越高，提供的特权就越多。<br />
	●系统探险<br />
游戏中的探险会出发许多奇特有趣的时间，各种活动等你来参加<br />
【月亮井】——每天定点的时间内井水填满，持续1小时，参与后颗恢复体力。<br />
【女神祈祷】——每日向女神祈祷，可以获得各种礼物<br />
【抢夺必杀碎片】——通过挑战BOSS可以获得必杀技碎片，从而合成完整的必杀技<br />
【星界】——古老的神话故事里有众多的圣斗士来等你挑战，星界距离越大奖励就越大。<br />

	●副本<br />
分为个人副本以及全服副本，你可以一个人勇往直前参加个人副本，也可以和小伙伴们一起参加全服副本。
	

                       
                       </p> 
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
(function() { var b = $("#select-brand1 .tab"), f = $("#select-brand1 .content"), h = $("#select-hold1"), c = b.find(".curr").attr("rel"), g = "38px", a; var d = 0, i = 0, e = (screen.width >= 800) ? 1: 1; i = Math.ceil(f.children().size() / e); d = (f.children().outerHeight()) * i; if (d > parseInt(g)) { f.css("height", g); h.html("<b></b>展开").attr("class", "close") } else { h.html("<b></b>收起").attr("class", "open") } h.bind("click", function() { if ($(this).attr("class") != "open") { f.css("height", "auto"); h.html("<b></b>收起").attr("class", "open") } else { f.css("height", g); h.html("<b></b>展开").attr("class", "close") } }); b.find("li").bind("mouseover", function() { var j = $(this); a = setTimeout(function() { if (j.attr("rel") == c) { return } b.find("li").eq(c).removeClass("curr"); j.addClass("curr"); c = j.attr("rel"); f.css("height", "auto"); h.hide(); f.find("div").each(function() { if (c == 0) { $(this).show() } else { $(this).hide(); if ($(this).attr("rel") == c) { $(this).show() } } }) }, 500) }).bind("mouseout", function() { clearTimeout(a) }) })();
</script>

</body>
</html>
