<%@ page language="java" import="com.rainbow.entity.User" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>游戏分类-角色扮演</title>
<link href="style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jq.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jcarousellite.js"></script><!--滚动-->
<script type="text/javascript" src="js/easing.js"></script><!--弹一弹-->
<script  type="text/javascript"  src="js/DD_belatedPNG.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="js/DD_belatedPNG.js" ></script>
<script type="text/javascript">
	DD_belatedPNG.fix('.pnew img');//可以写多个用逗号分开即可
</script>
<![endif]-->
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
          <li><a href="game_class.jsp">游戏分类</a></li> 
          <li><a href="webRanklist.action">排行榜</a></li> 
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
    <div class="emodel3">
        <div class="carousel">
		<a href="javascript:void(0);" class="prev" id="prev-04">&nbsp </a>
		<div class="jCarouselLite" id="demo-04">
			<ul>
				<li><a href="Elist/ml15-01.jsp" ><img src="images/zazhi/cover15-01.jpg" width="189" height="250" /></a></li>
				<li><a href="Elist/ml14-32.jsp" ><img src="images/zazhi/cover14-32.jpg" width="189" height="250" /></a></li>
				<li><a href="Elist/ml14-31.jsp" ><img src="images/zazhi/cover14-31.jpg" width="189" height="250" /></a></li>
				<li><a href="Elist/ml14-30.jsp" ><img src="images/zazhi/cover14-30.jpg" width="189" height="250" /></a></li>
				<li><a href="Elist/ml14-29.jsp" ><img src="images/zazhi/cover14-29.jpg" width="189" height="250" /></a></li>
				<li><a href="Elist/ml14-28.jsp" ><img src="images/zazhi/cover14-28.jpg" width="189" height="250" /></a></li>
				<li><a href="Elist/ml14-27.jsp" ><img src="images/zazhi/cover14-27.jpg" width="189" height="250" /></a></li>
				<li><a href="Elist/ml14-26.jsp" ><img src="images/zazhi/cover14-26.jpg" width="189" height="250" /></a></li>
				<li><a href="Elist/ml14-25.jsp" ><img src="images/zazhi/cover14-25.jpg" width="189" height="250" /></a></li>
                <li><a href="Elist/ml14-24.jsp" ><img src="images/zazhi/cover14-24.jpg" width="189" height="250" /></a></li>
                <li><a href="Elist/ml14-23.jsp" ><img src="images/zazhi/cover14-23.jpg" width="189" height="250" /></a></li>
			</ul>
		</div>
		<a href="javascript:void(0);" class="next" id="next-04">&nbsp; </a>
		<div class="clear"></div>   
	</div>
    <!--carousel end-->
     <div class="emodel5">
        <div class="emodelleft">
            <div><a href="Econt/1408/Econt14-08-11.jsp"><img src="images/e2_03.jpg" width="395" height="127" /></a><p><a href="Econt/1408/Econt14-08-11.jsp">3D卡牌大作《暴走武侠》，一起闯荡"江湖"</a></p></div>
            <div><a href="Econt/1408/Econt14-08-03.jsp"><img src="images/e2_06.jpg" width="395" height="334" /></a><p><a href="Econt/1408/Econt14-08-03.jsp">《开心消消乐》5月流水收入已突破2000万元</a></p></div>
        </div>
        <!--emodelleft-->
        <div class="emodelright">
           <span class="pnew"><img src="images/new.png" width="49" height="49" /></span>
           <div class="newtit">
              <h4><a href="Econt/1408/Econt14-08-01.jsp">足球卡牌手游《胜利足球》</a></h4>
              <p>腾讯这款足球卡牌手游《胜利足球》究竟能不能取得一个令人满意的成绩，相信时间会揭晓一切。</p>
              <h4><a href="Econt/1408/Econt14-08-09.jsp">《变态贱男历险记》再坑我一次吧!</a></h4>
              <p>500万的妹子现在卡在里面过不去了，等你来解救！</p>
           </div>
           <!--newtit-->
           <dl class="enewlist">
              <dt><a href="Econt/1408/Econt14-08-05.jsp"><img src="images/e2_08.jpg" width="160" height="105" /></a></dt>
              <dd class="e2tit"><span>优游新得</span><a href="Econt/1408/Econt14-08-05.jsp">崩坏学园2</a></dd>
              <dd class="edetail">《崩坏学园2》是一款由天朝ACG开发商miHoYo开发运营的无节操ACG横版动作手游。作为近未来学园都市背景的横版动作游戏，有着数百关卡，数百装备，数百服</dd>
           </dl>
           <!--enewlist-->
           <dl class="enewlist">
              <dt><a href="Econt/1408/Econt14-08-13.jsp"><img src="images/e2_09.jpg" width="160" height="105" /></a></dt>
              <dd class="e2tit"><span>身经百战</span><a href="Econt/1408/Econt14-08-13.jsp">怪兽合唱团</a></dd>
              <dd class="edetail">天籁之音另类演绎，《怪兽合唱团》正式开演!不管你是音乐发烧友还是纯粹的门外汉，爆萌小怪兽用身体演绎的"奇葩大合唱"绝对算得上是一道另类的听觉饕餮，</dd>
           </dl>
           <!--enewlist-->
           <dl class="enewlist">
              <dt><a href="Econt/1408/Econt14-08-15.jsp"><img src="images/e2_10.jpg" width="160" height="105" /></a></dt>
              <dd class="e2tit"><span>别有用心</span><a href="Econt/1408/Econt14-08-15.jsp">开迅视频</a></dd>
              <dd class="edetail">《开迅视频》狂扫手机界的超人气看片神器。邀微博、QQ好友一起看，边截屏边语音聊天，或在看吧与妹子，男神独处私聊，小伙伴们都笑cry了。全新推出美女直</dd>
           </dl>
           <!--enewlist-->
        </div>
        <!--emodelright-->
     </div>
     <!--emodel5-->
    </div>
    <!--emodel3-->
    <div class="emodel2">
       <div class="subnav">
          <img src="images/rank_12.jpg" />
          <ul class="subnavcont">
             <li>本期游戏推荐</li>
             <li>装机必备</li>
             <li>热门下载</li>
          </ul>
          <a href="game_class.jsp" class="fr tuimore">更多<img src="images/ss_03.jpg" /></a>
       </div>
       <!--subnav-->
       
       <div class="tuijian">
          <dl>
             <dt><a href="Econt/1408/Econt14-08-05.jsp"><img src="images/zazhi/bhxy2.jpg" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-05.jsp">崩坏学园2</a></dd>
          </dl>
          <dl>
             <dt><a href="Econt/1408/Econt14-08-06.jsp"><img src="images/zazhi/js2014.jpg" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-06.jsp">绝杀2014</a></dd>
          </dl>
          <dl>
             <dt><a href="Econt/1408/Econt14-08-07.jsp"><img src="images/zazhi/GoL.png" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-07.jsp">God of Light</a></dd>
          </dl>
          <dl>
             <dt><a href="Econt/1408/Econt14-08-08.jsp"><img src="images/zazhi/gdtg.png" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-08.jsp">干掉糖果</a></dd>
          </dl>
          <dl>
             <dt><a href="Econt/1408/Econt14-08-09.jsp"><img src="images/zazhi/btjnlxj.png" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-09.jsp">变态贱男历险记</a></dd>
          </dl>
          <dl>
             <dt><a href="Econt/1408/Econt14-08-10.jsp"><img src="images/zazhi/xdzz.png" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-10.jsp">现代战争3</a></dd>
          </dl>
          <dl>
             <dt><a href="Econt/1408/Econt14-08-11.jsp"><img src="images/zazhi/bzwx.png" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-11.jsp">暴走武侠</a></dd>
          </dl>
          <dl>
             <dt><a href="Econt/1408/Econt14-08-12.jsp"><img src="images/zazhi/kd2.png" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-12.jsp">史上最坑爹游戏2</a></dd>
          </dl>
          <dl>
             <dt><a href="Econt/1408/Econt14-08-13.jsp"><img src="images/zazhi/gshct.png" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-13.jsp">怪兽合唱团</a></dd>
          </dl>
          <dl>
             <dt><a href="Econt/1408/Econt14-08-14.jsp"><img src="images/zazhi/jxmt.png" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-14.jsp">极限摩托2</a></dd>
          </dl>
       </div>
       <!--tuijian-->
       <div class="tuijian">
          <dl>
             <dt><a href="Econt/1408/Econt14-08-15.jsp"><img src="images/zazhi/kxsp.png" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-15.jsp">开迅视频</a></dd>
          </dl>
          <dl>
             <dt><a href="Econt/1408/Econt14-08-11.jsp"><img src="images/zazhi/bzwx.png" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-11.jsp">暴走武侠</a></dd>
          </dl>
          <dl>
             <dt><a href="Econt/1408/Econt14-08-05.jsp"><img src="images/zazhi/bhxy2.jpg" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-05.jsp">崩坏学园2</a></dd>
          </dl>
          <dl>
             <dt><a href="Econt/1408/Econt14-08-08.jsp"><img src="images/zazhi/gdtg.png" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-08.jsp">干掉糖果</a></dd>
          </dl>
          <dl>
             <dt><a href="Econt/1408/Econt14-08-12.jsp"><img src="images/zazhi/kd2.png" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-12.jsp">史上最坑爹游戏2</a></dd>
          </dl>
          <dl>
             <dt><a href="Econt/1408/Econt14-08-13.jsp"><img src="images/zazhi/gshct.png" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-13.jsp">怪兽合唱团</a></dd>
          </dl>
          <dl>
             <dt><a href="Econt/1408/Econt14-08-14.jsp"><img src="images/zazhi/jxmt.png" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-14.jsp">极限摩托2</a></dd>
          </dl>
       </div>
       <!--tuijian-->
       <div class="tuijian">
          <dl>
             <dt><a href="Econt/1408/Econt14-08-06.jsp"><img src="images/zazhi/js2014.jpg" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-06.jsp">绝杀2014</a></dd>
          </dl>
          <dl>
             <dt><a href="Econt/1408/Econt14-08-07.jsp"><img src="images/zazhi/GoL.png" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-07.jsp">God of Light</a></dd>
          </dl>
          <dl>
             <dt><a href="Econt/1408/Econt14-08-12.jsp"><img src="images/zazhi/kd2.png" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-12.jsp">史上最坑爹游戏2</a></dd>
          </dl>
          <dl>
             <dt><a href="Econt/1408/Econt14-08-13.jsp"><img src="images/zazhi/gshct.png" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-13.jsp">怪兽合唱团</a></dd>
          </dl>
          <dl>
             <dt><a href="Econt/1408/Econt14-08-09.jsp"><img src="images/zazhi/btjnlxj.png" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-09.jsp">变态贱男历险记</a></dd>
          </dl>
          <dl>
             <dt><a href="Econt/1408/Econt14-08-08.jsp"><img src="images/zazhi/gdtg.png" /></a></dt>
             <dd><a href="Econt/1408/Econt14-08-08.jsp">干掉糖果</a></dd>
          </dl>
       </div>
       <!--tuijian-->
    </div>
    <!--emodel2-->
    <!--emodel2-->
    
    <p><a href="#"><img src="images/e_35.jpg" /></a></p>
    <div class="emodel4">
       <dl>
          <dt><a href="#"><img src="images/e_38.jpg" /></a></dt>
          <dd><a href="#">独家首发，卡牌当道，游戏任你玩！</a></dd>
       </dl>
       <dl>
          <dt><a href="#"><img src="images/e_39.jpg" /></a></dt>
          <dd><a href="#">独家首发，卡牌当道，游戏任你玩！</a></dd>
       </dl>
    </div>
    <!--emodel4-->
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
		$('#demo-04').jCarouselLite({
			btnPrev: '#prev-04',
			btnNext: '#next-04',
			easing: "bounceout",
			visible:4,//控制显示个数
    		speed: 1000
		});		
	});
	</script>
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
