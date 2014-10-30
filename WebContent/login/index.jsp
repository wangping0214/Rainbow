<%@ page language="java" import="com.rainbow.entity.User" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<link href="style/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jq.js"></script>
<script  type="text/javascript"  src="js/DD_belatedPNG.js"></script>

<script  type="text/javascript"  src="js/jquery.easing.1.3.js"></script>
<script  type="text/javascript"  src="js/common.js"></script>
<script  type="text/javascript"  src="js/theme.js"></script>
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
<script  type="text/javascript">
var menu;
var ar = location.href.split("#");
var selectNum = parseInt(ar[1]);
if(!selectNum) selectNum = 1;

$(function()
{
	
	
	$("#footer").load("footer.html");
	$(".bg_arr").click(function ()
	{
		var num = parseInt($(this).attr("idx"));
		if(num == 1)
		{
			$("html, body").stop().animate({scrollTop:$(".card").offset().top-110}, {easing:"easeInOutCubic"});
		}
		else 
		{
			$("html, body").stop().animate({scrollTop:$(".theme").offset().top-110}, {easing:"easeInOutCubic"});
		}
		if(num == 3)
		{
			$("html, body").stop().animate({scrollTop:$(".theme2").offset().top-110}, {easing:"easeInOutCubic"});
		}

	});
	
});


</script>
<!--[if IE 6]>
<script type="text/javascript" src="js/DD_belatedPNG.js" ></script>
<script type="text/javascript">
	DD_belatedPNG.fix('.bg_arr img');//可以写多个用逗号分开即可
</script>
<![endif]-->

</head>

<body>
   <div id="wrap">
        <div id="header">
            <div class="nav">
                <a href="index.jsp" class="fl"><img src="images/im_02.jpg" /></a>
                <div class="fr navright">
                    <%User user = (User)session.getAttribute("user"); 
       	if(user==null){
       %>
       <div class="huiyuan fr"><p><a href="<%=request.getContextPath()%>/login/login.jsp">登录</a>|<a href="<%=request.getContextPath()%>/login/register.jsp">注册</a></p></div>
       <%}
       	else{%>
       	<div class="huiyuan fr"><a href="#" class="tou"><img src="images/tj_11.jpg" /></a><p><a href="" id="id_exit">退出</a></p></div>
       	<%} %>
                    <div class="search2s fl">
                        <input type="text" value="搜索安卓软件和游戏" class="sou2"/>
                        <input type="button" value="" class="soubut" />
                   </div>
                </div>
                <!--navright-->
            </div>
            <!--nav-->
        </div>
        <!--header-->
       <div><img src="images/im_05.jpg" width="100%" height="520" /></div>
       <div class="im1">
           <p>"柴米游戏"的梦想，是让所有手机用户的生活更为鲜活、便利、充实。恰如其名，柴米是生活的必需品，而应用、游戏、多媒体则是手机的必需品。我们就是为您提供这些必须品的平台，柴米游戏会成为您手机的顶级执事，我们强大而忠诚、睿智而真诚！</p>
          
       </div>
       <!--im1-->
     <div class="mm2">  
       <div class="im2"> 
           <div class="cont card bg1">
           <span  idx="1"  class="bg_arr"><img  src="images/im1.png"  alt=""/></span>
            <div class="lunbo1">
                   <div class="picList">
                      <div class="big">
                          <a href="Elist/ml14-22.jsp"><img src="images/zazhi/cover14-22.jpg" width="220" height="297" /></a>
                          <a href="Elist/ml14-21.jsp"><img src="images/zazhi/cover14-21.jpg" width="220" height="297" /></a>
                          <a href="Elist/ml14-20.jsp"><img src="images/zazhi/cover14-20.jpg" width="220" height="297" /></a>
                          <a href="Elist/ml14-19.jsp"><img src="images/zazhi/cover14-19.jpg" width="220" height="297" /></a>
                          <a href="Elist/ml14-18.jsp"><img src="images/zazhi/cover14-18.jpg" width="220" height="297" /></a>
                          <a href="Elist/ml14-17.jsp"><img src="images/zazhi/cover14-17.jpg" width="220" height="297" /></a>
                          <a href="Elist/ml14-16.jsp"><img src="images/zazhi/cover14-16.jpg" width="220" height="297" /></a>
                      </div>
                     <ul class="smallList">
                        <li><img src="images/zazhi/cover14-10.jpg" width="52" height="72" /><div class="redLine"></div></li>
                        <li><img src="images/zazhi/cover14-09.jpg" width="52" height="72" /></li>
                        <li><img src="images/zazhi/cover14-08.jpg" width="52" height="72" /></li>
                        <li><img src="images/zazhi/cover14-07.jpg" width="52" height="72" /></li>
                        <li><img src="images/zazhi/cover14-06.jpg" width="52" height="72" /></li>
                        <li><img src="images/zazhi/cover14-05.jpg" width="52" height="72" /></li>
                        <li><img src="images/zazhi/cover14-04.jpg" width="52" height="72" /></li>
                     </ul> 
                     <div class="clear"></div>
                  </div>
                  <!--picList-->
                  <div class="im2text">
                      <h3 class="tit1">柴米游言</h3>
                      <h4 class="tit2">中国第一本手机游戏及应用的乐享杂志</h4>
                      <p>由专业的游戏迷通过专业的杂志制作传播专业的游戏资讯！快速的资讯，优秀的攻略，精彩的专题，客观的立场，亲切的小编，成为手机达人的首选杂志。</p>
                  </div>
                  <!--im2text-->
            </div>
            <!--lunbo1-->
          </div>
       </div>
       <!--im2-->
   </div>
   <!--mm2-->
       <div class="im3">
          <div class="cont theme bg1">
             <span  idx="2"  class="bg_arr bg_arr2"><img  src="images/im2.png"  alt=""/></span>
             <p class="join"><a href="todayRecommend.action"><img src="images/join_03.jpg" /></a></p>
             <p class="im3text">柴米市场是基于android平台的安卓资源下载平台，为安卓手机玩家提供最全、最新、最棒最快捷的海量国内外免费应用和游戏下载，
这里汇集了大量最新最热应用和游戏，类目齐全,随心下载，自由享受更多玩机乐趣! </p>
          </div>
          <!--theme-->
       </div>
       <!--im3-->
    <div class="mm4">
       <div class="im4">             
             <div  class="cont theme_bg">					
					<div  class="theme theme2">
                       <span  idx="3"  class="bg_arr bg_arr3"><img  src="images/im3.png"  alt=""/></span>
						<div  class="theme_title_box">
                            <div class="im4text">
                                <p><img src="images/m_03.jpg" /></p>
                                <p class="margin10">最新最全的安卓游戏下载排行榜尽在柴米游戏，永久免费，超爽体验，,每日为您推荐海量最好玩最热门的轻度、中度、重度安卓游戏，每个
游戏都经过真机适配测试，让用户玩得放心开心。</p>
                                <p><a href="E-zine.jsp"><img src="images/m_07.jpg" /></a></p>
                            </div>	
							<div  class="theme_tit">
								<strong  class="tit"><img  src="images/theme_tit1.gif"/></strong>
							</div>	
						</div>
						<!--theme_title_box-->
						<div  class="phone_box">			
							<ul  class="phone_theme">
							<li><img  src="images/theme_1.jpg"/></li>
							<li><img  src="images/theme_2.jpg"/></li>
							<li><img  src="images/theme_3.jpg"/></li>
							<li><img  src="images/theme_4.jpg"/></li>
							<li><img  src="images/theme_5.jpg"/></li>
							<li><img  src="images/theme_6.jpg"/></li>
							<li><img  src="images/theme_7.jpg"/></li>
							<li><img  src="images/theme_8.jpg"/></li>
							<li><img  src="images/theme_9.jpg"/></li>
							<li><img  src="images/theme_10.jpg"/></li>
							</ul>
							<span  class="bg_reflect"></span>
						</div>
						<!--phone_box-->				
						<div  class="theme_con">
							<ul  class="theme_lst">
							<li><a href="javascript:changeTheme(0);"><img  src="images/theme_thumb1.jpg"/></a></li>
							<li><a href="javascript:changeTheme(1);"><img  src="images/theme_thumb2.jpg"/></a></li>
							<li><a href="javascript:changeTheme(2);"><img  src="images/theme_thumb3.jpg"/></a></li>
							<li><a href="javascript:changeTheme(3);"><img  src="images/theme_thumb4.jpg"/></a></li>
							<li><a href="javascript:changeTheme(4);"><img  src="images/theme_thumb5.jpg"/></a></li>
							<li><a href="javascript:changeTheme(5);"><img  src="images/theme_thumb6.jpg"/></a></li>
							<li><a href="javascript:changeTheme(6);"><img  src="images/theme_thumb7.jpg"/></a></li>
							<li><a href="javascript:changeTheme(7);"><img  src="images/theme_thumb8.jpg"/></a></li>
							<li><a href="javascript:changeTheme(8);"><img  src="images/theme_thumb9.jpg"/></a></li>
							<li><a href="javascript:changeTheme(9);"><img  src="images/theme_thumb10.jpg"/></a></li>
							
                            
                            </ul>
						</div>
						<!--theme_con-->
					</div>
					<!--theme-->
				</div>
                <!--theme_bg-->
       </div>
       <!--im4-->
       <!--im4-->
   </div>
   <!--mm4-->
    </div>
    <!--wrap-->
     <div class="fotter"> 
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
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
