<%@ page language="java" import="com.rainbow.entity.User" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>游戏分类</title>
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
   <div class="position"><a href="index.jsp">首页</a>><a href="#">安卓游戏分类</a></div>
   <!--position-->
   <div class="softlist">
      <div class="every every9">
         <div class="softmulu">
            <div class="mltit"><a href="webShowByCategory.action?category=1&appTmp.showByCategoryCurrentPage=1">创意休闲</a></div>
            <div class="key">
            <a href="webShowByClassification.action?classification=1&appTmp.showByClassificationCurrentPage=1">卡通</a>
            <a href="webShowByClassification.action?classification=2&appTmp.showByClassificationCurrentPage=1">连连看</a>
            <a href="webShowByClassification.action?classification=3&appTmp.showByClassificationCurrentPage=1">捕鱼</a>
            <a href="webShowByClassification.action?classification=4&appTmp.showByClassificationCurrentPage=1">祖玛</a>
            </div>
            <!--key-->
         </div>
         <!--softmulu-->
         <div class="softicon"><a href="#"><img src="images/ic2_06.jpg" /></a></div>
         <!--softicon-->
      </div>
      <!--every--> 
      <div class="every every2">
         <div class="softmulu">
            <div class="mltit"><a href="webShowByCategory.action?category=2&appTmp.showByCategoryCurrentPage=1">飞行射击</a></div>
            <div class="key">
            <a href="webShowByClassification.action?classification=5&appTmp.showByClassificationCurrentPage=1">射击</a>
            <a href="webShowByClassification.action?classification=6&appTmp.showByClassificationCurrentPage=1">阻击</a>
            <a href="webShowByClassification.action?classification=7&appTmp.showByClassificationCurrentPage=1">坦克</a>
            <a href="webShowByClassification.action?classification=8&appTmp.showByClassificationCurrentPage=1">飞行</a></div>
            <!--key-->
         </div>
         <!--softmulu-->
         <div class="softicon"><a href="#"><img src="images/ic2_08.jpg" /></a></div>
         <!--softicon-->
      </div>
      <!--every--> 
      <div class="every every3">
         <div class="softmulu">
            <div class="mltit"><a href="webShowByCategory.action?category=3&appTmp.showByCategoryCurrentPage=1">体育竞技</a></div>
            <div class="key">
            <a href="webShowByClassification.action?classification=9&appTmp.showByClassificationCurrentPage=1">街机</a>
            <a href="webShowByClassification.action?classification=10&appTmp.showByClassificationCurrentPage=1">足球</a>
            <a href="webShowByClassification.action?classification=11&appTmp.showByClassificationCurrentPage=1">篮球</a>
            <a href="webShowByClassification.action?classification=12&appTmp.showByClassificationCurrentPage=1">台球</a>
            </div>
            <!--key-->
         </div>
         <!--softmulu-->
         <div class="softicon"><a href="#"><img src="images/ic2_03.jpg" /></a></div>
         <!--softicon-->
      </div>
      <!--every--> 
      <div class="every every4">
         <div class="softmulu">
            <div class="mltit"><a href="webShowByCategory.action?category=4&appTmp.showByCategoryCurrentPage=1">益智棋牌</a></div>
            <div class="key">
            <a href="webShowByClassification.action?classification=13&appTmp.showByClassificationCurrentPage=1">斗地主</a>
            <a href="webShowByClassification.action?classification=14&appTmp.showByClassificationCurrentPage=1">麻将</a>
            <a href="webShowByClassification.action?classification=15&appTmp.showByClassificationCurrentPage=1">纸牌</a>
            <a href="webShowByClassification.action?classification=16&appTmp.showByClassificationCurrentPage=1">拼图</a>
            </div>
            <!--key-->
         </div>
         <!--softmulu-->
         <div class="softicon"><a href="#"><img src="images/ic2_17.jpg"/></a></div>
         <!--softicon-->
      </div>
      <!--every--> 
      <div class="every every10">
         <div class="softmulu">
            <div class="mltit"><a href="webShowByCategory.action?category=5&appTmp.showByCategoryCurrentPage=1">策略经营</a></div>
            <div class="key">
            <a href="webShowByClassification.action?classification=17&appTmp.showByClassificationCurrentPage=1">经营</a>
            <a href="webShowByClassification.action?classification=18&appTmp.showByClassificationCurrentPage=1">卡牌</a>
            <a href="webShowByClassification.action?classification=19&appTmp.showByClassificationCurrentPage=1">塔防</a>
            <a href="webShowByClassification.action?classification=20&appTmp.showByClassificationCurrentPage=1">战争</a></div>
            <!--key-->
         </div>
         <!--softmulu-->
         <div class="softicon"><a href="#"><img src="images/ic2_19.jpg" /></a></div>
         <!--softicon-->
      </div>
      <!--every-->
      <div class="every every6">
         <div class="softmulu">
            <div class="mltit"><a href="webShowByCategory.action?category=6&appTmp.showByCategoryCurrentPage=1">竞速动作</a></div>
            <div class="key">
            <a href="webShowByClassification.action?classification=21&appTmp.showByClassificationCurrentPage=1">跑酷</a>
            <a href="webShowByClassification.action?classification=22&appTmp.showByClassificationCurrentPage=1">横版</a>
            <a href="webShowByClassification.action?classification=23&appTmp.showByClassificationCurrentPage=1">3D</a>
            <a href="webShowByClassification.action?classification=24&appTmp.showByClassificationCurrentPage=1">赛车</a>
            </div>
            <!--key-->
         </div>
         <!--softmulu-->
         <div class="softicon"><a href="#"><img src="images/ic2_14.jpg" /></a></div>
         <!--softicon-->
      </div>
      <!--every--> 
      <div class="every every11">
         <div class="softmulu">
            <div class="mltit"><a href="webShowByCategory.action?category=7&appTmp.showByCategoryCurrentPage=1">角色扮演</a></div>
            <div class="key">
            <a href="webShowByClassification.action?classification=25&appTmp.showByClassificationCurrentPage=1">回合制</a>
            <a href="webShowByClassification.action?classification=26&appTmp.showByClassificationCurrentPage=1">卡牌</a>
            <a href="webShowByClassification.action?classification=27&appTmp.showByClassificationCurrentPage=1">玄幻</a>
            <a href="webShowByClassification.action?classification=28&appTmp.showByClassificationCurrentPage=1">武侠</a>
            </div>
            <!--key-->
         </div>
         <!--softmulu-->
         <div class="softicon"><a href="#"><img src="images/ic2_27.jpg" /></a></div>
         <!--softicon-->
      </div>
      <!--every--> 
      <!--every-->  
   </div>
   <!--softlist-->
</div>
<!--midddle-->
 <div class="icon2"><img src="<%=request.getContextPath()%>/login/images/ic_03.jpg" /></div>
    <div class="fotter fotter2"> 
          <div class="footcont">
             <div class="footmain">
                <div class="copyright">
                   <p class="tit3"><a href="<%=request.getContextPath()%>/login/index.jsp">柴米游戏丨中国第一手游杂志</a></p>
                   <p>&copy;2014 - 2020 柴米游戏 丨京ICP备11000000号-2</p>
                   <p>除非特别注明，应用程序由第三方市场提供，柴米游戏仅根据您的指令提供搜索结果链接，与出处无关，详情请参阅 知识产权保护声明</p>
                </div>
                <!--copyright-->
                <dl>
                   <dt>意见与服务</dt>
                   <dd><a href="#">关于我们</a></dd>
                   <dd><a href="#">加入我们</a></dd>
                   <dd><a href="#">商务洽谈</a></dd>
                   <dd><a href="<%=request.getContextPath()%>/login/developer_center.jsp">开发者中心</a></dd>
                 </dl>
                 <dl>
                   <dt>意见与服务</dt>
                   <dd><a href="#">关于我们</a></dd>
                   <dd><a href="#">加入我们</a></dd>
                   <dd><a href="#">商务洽谈</a></dd>
                   <dd><a href="<%=request.getContextPath()%>/login/developer_center.jsp">开发者中心</a></dd>
                 </dl>
                 <p class="logo2 fl"><a href="#"><img src="<%=request.getContextPath()%>/login/images/im_14.jpg" /></a></p>
               </div>
               <!--footmain-->
           </div>
           <!--footcont-->
       </div>
       <!--fotter-->
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
