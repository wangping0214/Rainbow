<%@ page language="java" 
	import="com.rainbow.entity.User"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
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
<title>今日推荐</title>
<link href="style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jq.js"></script>
<script type="text/javascript" src="js/scroll.js"></script>

<script language="javascript" type="text/javascript">
$(document).ready(function(){
	//                退出       
	$("#id_exit").click(function(){
		jQuery.ajax({
			type : "post",
			url : "<%=request.getContextPath()%>/webLoginExit.action",
			success : function(){
				location.href="todayRecommend.action";
			}
		});
	});
});


</script>
</head>

<body>
<div class="top">
     <a href="<%=request.getContextPath()%>/login/index.jsp" class="fl"><img src="<%=request.getContextPath()%>/login/images/tj_03.jpg" /></a>
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
          <li class="active"><a href="todayRecommend.action">今日推荐</a><div class="blueLine"></div></li> 
          <li><a href="software_cat.jsp">软件分类</a></li> 
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
   <div class="scroll2">
	<div class="slide_01" id="slide_01">
		<div class="mod_01"><a href="E-zine.jsp"><img src="images/banner1.jpg" width="960" height="220" /></a></div>
        <div class="mod_01"><a href="E-zine.jsp"><img src="images/banner3.jpg" width="960" height="220" /></a></div>
		<div class="mod_01"><a href="E-zine.jsp"><img src="images/banner2.jpg" width="960" height="220" /></a></div>
        <div class="mod_01"><a href="E-zine.jsp"><img src="images/banner5.jpg" width="960" height="220" /></a></div>
		<div class="mod_01"><a href="E-zine.jsp"><img src="images/banner4.jpg" width="960" height="220" /></a></div>
	</div>
	<div class="dotModule_new">
		<div id="slide_01_dot"></div>
	</div>
 </div>
 <!--scroll-->
 <div class="content">
     <div class="contleft">
        <div class="jujiao">
            <h3 class="tjtit1"><p class="fl"><img src="images/icon_03.jpg" />安卓精品</p><a href="rankMore.action?rankMoreType=2&rankMoreCurrentPage=1" class="fr">更多>></a></h3>
            <!-- ********************精品推荐***************************** -->
            <div class="jujiaolist">
            <s:iterator value="#request['appBoutique']" id="appBoutique">
                <dl>
                   <dt><a href="details.action?apkId=<s:property value="#appBoutique.appInfo.id" />"><img src="<%=request.getContextPath() %><s:property value="#appBoutique.appSou.logo1"/>" /></a></dt>
                   <dd><a href="details.action?apkId=<s:property value="#appBoutique.appInfo.id" />">
                   <s:if test="#appBoutique.appInfo.appName.length()>6">
<s:property value="#appBoutique.appInfo.appName.substring(0, 6) + \"...\"" />
</s:if>
<s:else>
<s:property value="#appBoutique.appInfo.appName" />
</s:else></a></dd>
                   <dd class="downnum"><span>
                   <s:if test="#appBoutique.appAut.amountOfDown>10000">
  <s:property value="#appBoutique.appAut.amountOfDown/10000+'.'+(#appBoutique.appAut.amountOfDown-(#appBoutique.appAut.amountOfDown/10000)*10000)/1000" />
万次下载
  </s:if>
  <s:else><s:property value="#appBoutique.appAut.amountOfDown" />次下载</s:else>
                   </span></dd>
                   <dd class="xiazai"><a href="downApk.action?bowser=<%=bowser %>&appSouId=<s:property value="#appBoutique.appSou.id" />&downPath=<s:property value="#appBoutique.appSou.packge" escape='false'/>"><img src="<%=request.getContextPath()%>/login/images/xia_03.jpg"  /></a></dd>
                </dl>
                </s:iterator>
            </div>
            <!--jujiaolist-->
        </div>
        <!--jujiao-->
        <div class="wangyou">
            <div class="wytit"><p>手机网游专区</p><a href="#">更多>></a></div>
            <div class="wyimg">
            <a href="Elist/ml13-01.jsp"><img src="<%=request.getContextPath()%>/login/images/wy_03.jpg" /></a>
            <a href="Elist/ml13-02.jsp"><img src="<%=request.getContextPath()%>/login/images/wy_05.jpg" /></a>
            <a href="Elist/ml14-01.jsp"><img src="<%=request.getContextPath()%>/login/images/wy_07.jpg" /></a></div>
        </div>
        <!--wangyou-->
     </div>
     <!--contleft-->
     <div class="contright">
        <ul class="sidenav">
           <li>柴米推荐</li>
           <li>人气排行榜</li>
        </ul>
        <!--sidenav-->
        <!--***********************柴米推荐****************************-->
        <div class="sidecont">
            <ul class="sidelist">
            <s:iterator value="#request['appRecommend']" id="appRecommend">
                <li>
                   <p class="sidetit"><s:property value="#appRecommend.appInfo.appName" /></p>
                   <div class="detial">
                      <dl>
                         <dt><a href="details.action?apkId=<s:property value="#appRecommend.appInfo.id" />"><img src="<%=request.getContextPath() %><s:property value="#appRecommend.appSou.logo1"/>" /></a></dt>
                         <dd><a href="details.action?apkId=<s:property value="#appRecommend.appInfo.id" />">
                         <s:if test="#appRecommend.appInfo.appName.length()>6">
<s:property value="#appRecommend.appInfo.appName.substring(0, 6) + \"...\"" />
</s:if>
<s:else>
<s:property value="#appRecommend.appInfo.appName" />
</s:else>
</a></dd>
                         <dd><b>
                         <s:if test="#appRecommend.appAut.amountOfDown>10000">
  <s:property value="#appRecommend.appAut.amountOfDown/10000+'.'+(#appRecommend.appAut.amountOfDown-(#appRecommend.appAut.amountOfDown/10000)*10000)/1000" />
万次下载
  </s:if>
  <s:else><s:property value="#appRecommend.appAut.amountOfDown" />次下载</s:else>
                         </b></dd>
                      </dl>
                      <a href="downApk.action?bowser=<%=bowser %>&appSouId=<s:property value="#appRecommend.appSou.id" />&downPath=<s:property value="#appRecommend.appSou.packge" escape='false'/>" class="sidexia"><img src="<%=request.getContextPath()%>/login/images/xia_03.jpg" /></a>
                   </div>
                   <!--detial-->
                </li>
               </s:iterator>
            </ul>
            <!--sidelist-->
            <!--********************人气排行榜************************-->
            <ul class="sidelist">
            <s:iterator value="#request['appRank']" id="appRank">
                <li>
                   <p class="sidetit"><s:property value="#appRank.appInfo.appName" /></p>
                   <div class="detial">
                      <dl>
                         <dt><a href="details.action?apkId=<s:property value="#appRank.appInfo.id" />"><img src="<%=request.getContextPath() %><s:property value="#appRank.appSou.logo1"/>" /></a></dt>
                         <dd><a href="details.action?apkId=<s:property value="#appRank.appInfo.id" />"><s:property value="#appRank.appInfo.appName" /></a></dd>
                         <dd><b>
                         <s:if test="#appRank.appAut.amountOfDown>10000">
  <s:property value="#appRank.appAut.amountOfDown/10000+'.'+(#appRank.appAut.amountOfDown-(#appRank.appAut.amountOfDown/10000)*10000)/1000" />
万次下载
  </s:if>
  <s:else><s:property value="#appRank.appAut.amountOfDown" />次下载</s:else>
                         </b></dd>
                      </dl>
                      <a href="downApk.action?bowser=<%=bowser %>&appSouId=<s:property value="#appRank.appSou.id" />&downPath=<s:property value="#appRank.appSou.packge" escape='false'/>"" class="sidexia"><img src="<%=request.getContextPath()%>/login/images/xia_03.jpg" /></a>
                   </div>
                   <!--detial-->
                </li>
               </s:iterator>
            </ul>
            <!--sidelist-->  
        </div>
        <!--sidecont-->
        <div class="wytit"><p>杂志导读</p><a href="E-zine.jsp">更多>></a></div>
        <ul class="zazhilist">
           <li><a href="Elist/ml13-01.jsp">COC到底还要土豪多久？</a></li>
           <li><a href="Elist/ml13-01.jsp">三月收入榜又拿冠军！</a></li>
           <li><a href="Elist/ml13-01.jsp">小黄人呆萌愣傻四大元素！</a></li>
           <li><a href="Elist/ml13-02.jsp">能否变身百万小小兵？？</a></li>
           <li><a href="Elist/ml13-02.jsp">COC到底还要土豪多久？</a></li>
           <li><a href="Elist/ml13-02.jsp">有个新的江湖......三剑豪恩怨情仇！</a></li>
           <li><a href="Elist/ml14-01.jsp">腥风血雨恩怨情仇在其中</a></li>
           <li><a href="Elist/ml14-01.jsp">COC到底还要土豪多久？</a></li>
           <li><a href="Elist/ml14-01.jsp">雷曼丛林冒险，80后记忆！</a></li>
        </ul>
        <!--zazhilist-->
     </div>
     <!--contright-->
 </div>
 <!--content-->
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
<script type="text/javascript">
if(document.getElementById("slide_01")){
	var slide_01 = new ScrollPic();
	slide_01.scrollContId   = "slide_01"; //内容容器ID
	slide_01.dotListId      = "slide_01_dot";//点列表ID
	slide_01.dotOnClassName = "selected";
	slide_01.arrLeftId      = "sl_left"; //左箭头ID
	slide_01.arrRightId     = "sl_right";//右箭头ID
	slide_01.frameWidth     = 960;
	slide_01.pageWidth      = 960;
	slide_01.upright        = false;
	slide_01.speed          = 10;
	slide_01.space          = 30; 
	slide_01.initialize(); //初始化
}
</script>
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
