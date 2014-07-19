<%@ page language="java" import="com.rainbow.entity.User" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
				String bowser= "";
				//火狐
                if (request.getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0) {
                    bowser = "firefox";
                }
                //IE
                else {
                	 bowser = "IE";
                }%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>软件分类</title>
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
          <li class="active"><a href="software_cat.jsp">软件分类</a><div class="blueLine"></div></li> 
          <li><a href="game_class.jsp">游戏分类</a></li> 
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
   <div class="position"><a href="index.jsp">首页</a>><a href="#">安卓软件分类</a></div>
   <!--position-->
   <div class="softlist">
      <div class="every every1">
         <div class="softmulu">
            <div class="mltit"><a href="webShowByCategory.action?category=8&appTmp.showByCategoryCurrentPage=1">系统安全</a></div>
            <div class="key">
            <a href="webShowByClassification.action?classification=29&appTmp.showByClassificationCurrentPage=1">优化</a>
            <a href="webShowByClassification.action?classification=30&appTmp.showByClassificationCurrentPage=1">流量</a>
            <a href="webShowByClassification.action?classification=31&appTmp.showByClassificationCurrentPage=1">安全</a>
            <a href="webShowByClassification.action?classification=32&appTmp.showByClassificationCurrentPage=1">杀毒</a>
            </div>
            <!--key-->
         </div>
         <!--softmulu-->
         <div class="softicon"><a href=""><img src="images/st_03.jpg" /></a></div>
         <!--softicon-->
      </div>
      <!--every--> 
      <div class="every every2">
         <div class="softmulu">
            <div class="mltit"><a href="webShowByCategory.action?category=9&appTmp.showByCategoryCurrentPage=1">常用工具</a></div>
            <div class="key">
            <a href="webShowByClassification.action?classification=33&appTmp.showByClassificationCurrentPage=1">浏览器</a>
            <a href="webShowByClassification.action?classification=34&appTmp.showByClassificationCurrentPage=1">输入法</a>
            <a href="webShowByClassification.action?classification=35&appTmp.showByClassificationCurrentPage=1">文件</a>
            <a href="webShowByClassification.action?classification=36&appTmp.showByClassificationCurrentPage=1">办公</a>
            </div>
            <!--key-->
         </div>
         <!--softmulu-->
         <div class="softicon"><a href="#"><img src="images/st_05.jpg" /></a></div>
         <!--softicon-->
      </div>
      <!--every--> 
      <div class="every every3">
         <div class="softmulu">
            <div class="mltit"><a href="webShowByCategory.action?category=10&appTmp.showByCategoryCurrentPage=1">摄影美化</a></div>
            <div class="key">
            <a href="webShowByClassification.action?classification=37&appTmp.showByClassificationCurrentPage=1">主题</a>
            <a href="webShowByClassification.action?classification=38&appTmp.showByClassificationCurrentPage=1">桌面</a>
            <a href="webShowByClassification.action?classification=39&appTmp.showByClassificationCurrentPage=1">壁纸</a>
            <a href="webShowByClassification.action?classification=40&appTmp.showByClassificationCurrentPage=1">相机</a></div>
            <!--key-->
         </div>
         <!--softmulu-->
         <div class="softicon"><a href="#"><img src="images/st_08.jpg" /></a></div>
         <!--softicon-->
      </div>
      <!--every--> 
      <div class="every every4">
         <div class="softmulu">
            <div class="mltit"><a href="webShowByCategory.action?category=11&appTmp.showByCategoryCurrentPage=1">影音图像</a></div>
            <div class="key">
            <a href="webShowByClassification.action?classification=41&appTmp.showByClassificationCurrentPage=1">音乐</a>
            <a href="webShowByClassification.action?classification=42&appTmp.showByClassificationCurrentPage=1">视频</a>
            <a href="webShowByClassification.action?classification=43&appTmp.showByClassificationCurrentPage=1">相册</a>
            <a href="webShowByClassification.action?classification=44&appTmp.showByClassificationCurrentPage=1">播放器</a>
            </div>
            <!--key-->
         </div>
         <!--softmulu-->
         <div class="softicon"><a href="#"><img src="images/st_17.jpg" /></a></div>
         <!--softicon-->
      </div>
      <!--every--> 
      <div class="every every5">
         <div class="softmulu">
            <div class="mltit"><a href="webShowByCategory.action?category=12&appTmp.showByCategoryCurrentPage=1">便捷生活</a></div>
            <div class="key">
            <a href="webShowByClassification.action?classification=45&appTmp.showByClassificationCurrentPage=1">健康</a>
            <a href="webShowByClassification.action?classification=46&appTmp.showByClassificationCurrentPage=1">购物</a>
            <a href="webShowByClassification.action?classification=47&appTmp.showByClassificationCurrentPage=1">理财</a>
            <a href="webShowByClassification.action?classification=48&appTmp.showByClassificationCurrentPage=1">旅行</a>
            </div>
            <!--key-->
         </div>
         <!--softmulu-->
         <div class="softicon"><a href="#"><img src="images/st_14.jpg" /></a></div>
         <!--softicon-->
      </div>
      <!--every-->
      <div class="every every6">
         <div class="softmulu">
            <div class="mltit"><a href="webShowByCategory.action?category=13&appTmp.showByCategoryCurrentPage=1">社交通信</a></div>
            <div class="key">
            <a href="webShowByClassification.action?classification=49&appTmp.showByClassificationCurrentPage=1">聊天</a>
            <a href="webShowByClassification.action?classification=50&appTmp.showByClassificationCurrentPage=1">交友</a>
            <a href="webShowByClassification.action?classification=51&appTmp.showByClassificationCurrentPage=1">微博</a>
            <a href="webShowByClassification.action?classification=52&appTmp.showByClassificationCurrentPage=1">婚恋</a>
            </div>
            <!--key-->
         </div>
         <!--softmulu-->
         <div class="softicon"><a href="#"><img src="images/st_19.jpg" /></a></div>
         <!--softicon-->
      </div>
      <!--every--> 
      <div class="every every7">
         <div class="softmulu">
            <div class="mltit"><a href="webShowByCategory.action?category=14&appTmp.showByCategoryCurrentPage=1">学习阅读</a></div>
            <div class="key">
            <a href="webShowByClassification.action?classification=53&appTmp.showByClassificationCurrentPage=1">电子书</a>
            <a href="webShowByClassification.action?classification=54&appTmp.showByClassificationCurrentPage=1">漫画</a>
            <a href="webShowByClassification.action?classification=55&appTmp.showByClassificationCurrentPage=1">新闻</a>
            <a href="webShowByClassification.action?classification=56&appTmp.showByClassificationCurrentPage=1">杂志</a></div>
            <!--key-->
         </div>
         <!--softmulu-->
         <div class="softicon"><a href="#"><img src="images/st_26.jpg" /></a></div>
         <!--softicon-->
      </div>
        
         <!--softicon-->
      </div>
      <!--every-->  
   </div>
   <!--softlist-->
   <div class="icon2"><img src="<%=request.getContextPath()%>/login/images/ic_03.jpg" /></div>
</div>
<!--midddle-->
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
