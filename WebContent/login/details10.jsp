<%@ page language="java" import="com.rainbow.entity.User" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>梦想海贼王</title>
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
   <div class="position"><a href="#">安卓游戏分类</a>><a href="#">角色扮演</a>><a href="#"></a>梦想海贼王</div>
   <div class="xcont">
      <div class="xcontleft">
         <div class="gamecont">
             <dl>
                 <dt>
                     <p class="suolve"><a href="#"><img src="images/b10.png" width="94" height="94" /></a></p>
                     <p class="xia3"><a href="#">下载</a></p>
                 </dt>
                 <dd class="gametit"><span>梦想海贼王</span>
                   <p><img src="images/wd.jpg" /><img src="images/wgg.jpg" /><img src="images/ys.jpg" /><img src="images/gf.jpg" /></p></dd>
                 <dd><span>下　载：35万次</span><span>大　小：60.9M</span></dd>
                 <dd><span>资　费：道具收费</span><span>分　类：角色扮演</span></dd>
                 <dd><span>语　言：中文</span><span>版　本：1.8.0</span></dd>
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
				       <li><img src="images/d37.jpg" width="246" height="409"/></li>
				       <li><img src="images/d38.jpg" width="246" height="409"/></li>
                       <li><img src="images/d39.jpg" width="246" height="409"/></li>
                       <li><img src="images/d40.jpg" width="246" height="409"/></li>
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
美女玩家最多的手机游戏！<br />
游戏以全球超人气动漫《海贼王》为题材，用Q版风格配合新奇多样的玩法，采用新颖的战斗模式，严格遵循《海贼王》的故事发展线路，超高水准的重现了原作中的海贼世界。<br />
游戏中精致的画面和酷炫的战斗技能堪与客户端网游大作媲美，让玩家在丰富多彩的动漫世界中尽情享受征战伟大航路的快感！搜集原著海贼人物与您一起进行惊险刺激的冒险旅程，将带给您意想不到的全新体验！<br />
你想要有属于自己的恶魔果实，聚集不输给其他人的伙伴吗?<br />
你想坐拥女帝，脚踏四皇，号令七武海，堂堂正正的决斗吗?<br />
财富、名声、权势，你们想要的一切都在《梦想海贼王》，有胆量就来拿吧!
                        </p> 
                    </div>
                      <span id="select-hold" class="close">展开<b></b></span>
                  </dd>
                </dl>
                <dl id="select-brand1">
                  <dt><img src="images/rank_12.jpg" />更新内容：</dt>
                  <dd>
                     <div class="content" style="height:88px;">
                       <p>1.8版本中，将开启A卡进化S卡功能.<br />
船员进化——A升级S！（即将开放）.<br />
1.8版本中，玩家可将手中A级船员进化为S级船员！<br />
使用进化药剂、特定的能量精华、一定突破等级，可以进化玩家手中的A级船员。<br />
船员进化后，将获得更加逆天的属性及潜力成长。（进化成功后，现有的属性和经验，以及已洗炼天赋奥义将会百分百继承，同时将会获得更高的属性加成）<br />
新卡预热<br />
1.8版本将有强力新卡现世！敬请期待！<br />
跨服战装备更新<br />
1.8版本后跨服战，将出现霸气S级防具！<br />
3V3争霸赛<br />
活动时间<br />
活动日期：每周周一至每周周日为一轮比赛时间。<br />
备赛阶段：周一至周六0点至18点<br />
比赛阶段：周一至周六18点至18点30。<br />
领奖阶段：每周日0点至24点。<br />
参赛规则<br />
比赛于周一至周六的18点开始。每天打6场，每场比赛战斗时间为5分钟。（前2分钟可进行战队位置调整与队员阵容调整。战斗时间为1分钟，最后两分钟可查看战斗回放）<br />
战队匹配<br />
战斗将根据参与战队的战队积分进行匹配。所有战队的初始积分均为1200分。战队在战斗中的胜负会影响战队积分的增加与减少。<br />
胜负规则<br />
每个战队每轮进行3场比赛。分别为1-1号位、2-2号位、3-3号位。比赛结果为三局两胜，获得两场胜利的队伍为胜方。轮空则直接胜利，但是轮空将不增加个人贡献。<br />
战队积分<br />
战队创建后，队伍将有一个队伍积分，初始队伍积分为1200分。在战斗过程中，将以队伍积分进行战队匹配。战队胜利，队伍积分增加，失败则队伍积分减少。在领奖阶段，队伍积分将作为奖励的领取必要条件存在。<br />
个人贡献<br />
每场战斗中，根据玩家战斗的胜败，将会获得个人贡献，个人贡献，将在领奖阶段，作为积分，兑换奖励物品。<br />
奖励领取<br />
在奖励领取阶段，点击"奖励信息"按钮，可进入领奖页面<br />
装备宝石镶嵌收益提升<br />
1.8版本，装备将迎来新的附加属性。当镶嵌的宝石与孔颜色全部相同时，镶嵌的宝石将额外获得N&的属性加成。（玩家已获得的装备将自动生成新的附加属性）
联盟职位晋升规则改变.<br />
1.8版本中，在联盟职位晋升功能中，将根据玩家的周贡献进行职位的晋升。<br />
1.每周一0点，联盟贡献排行的排名将重置为0。本周内，根据玩家捐献的贡献进行联盟排名，捐献贡献多的人，可申请晋升职位。<br />
注：上榜需要捐献最低值，若未达到最低值，则无法进行职位晋升功能。<br />
称号系统<br />
1.8版本中，梦想海贼王将称号系统进行了扩充。将原有的5个称号扩展到数十个，新增加称号将同样可以对气势进行提升，同时让玩家在势气方面，有了多样化的追求。称号的设定也更符合op原著。<br />
图鉴系统<br />
1.8版本中，图鉴系统可以为船员带来属性加成了。按照图鉴的分类，集齐同种类卡牌图鉴，可以为上阵的船员提供攻、防、血、意四个属性的提升。<br />
聊天系统<br />
 1.8版本，聊天系统大变身。点击主界面上的半圆形按钮，即可打开聊天界面，随时随地畅聊游戏。<br />
留言界面也经历大变身，点击查看按钮，即可查看私聊信息<br />
新的关卡<br />
新的关卡，新的挑战，1.8版本新增	疯狂凯撒、竞技场两个关卡（包含精英关卡）。</p> 
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
             <dt><a href="details6.jsp"><img src="images/a6.png" width="37" height="37" /></a></dt>
             <dd><a href="details6.jsp">艾兰德传说</a><span>1.5万次下载</span></dd>
          </dl>
          <dl>
             <dt><a href="details7.jsp"><img src="images/a7.png" width="37" height="37" /></a></dt>
             <dd><a href="details7.jsp">开心棋牌</a><span>0.9万次下载</span></dd>
          </dl>
          <dl>
             <dt><a href="details8.jsp"><img src="images/a8.png" width="37" height="37" /></a></dt>
             <dd><a href="details8.jsp">赢话费三张牌</a><span>2.2万次下载</span></dd>
          </dl>
          <dl>
             <dt><a href="details9.jsp"><img src="images/a9.png" width="37" height="37" /></a></dt>
             <dd><a href="details9.jsp">开心跳跳兔</a><span>1.4万次下载</span></dd>
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

<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
