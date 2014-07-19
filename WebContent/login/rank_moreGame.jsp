<%@ page language="java" import="java.util.*" import="com.rainbow.entity.User" import="com.rainbow.server.App" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
	<%
	String keyword = new String();
	if(request.getParameter("keyword")!=null)
		keyword = new String(request.getParameter("keyword").getBytes("ISO-8859-1"),"UTF-8");
	
	%>
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
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
function rankByKeyword(keyword){
	location.href="rankByKeyword.action?keyword="+keyword+"&rankMoreCurrentPage=1";	
}
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
          <li class="active"><a href="webRanklist.action">排行榜</a><div class="blueLine"></div></li> 
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
   <div class="position"><a href="index.jsp">首页</a>><a href="webRanklist.action">排行榜</a>><a href="#">安卓游戏</a></div>
   <!--position-->
   <div class="allclass rankmore">
       <div class="ranksou">
           <div class="resou">热搜关键词：</div>
              <ul class="classnav">
                <li <%if("卡通".equals(keyword)){ %> class="classbg" <%} %>><a href="javascript:rankByKeyword('卡通');" >卡通</a></li>
                <li <%if("连连看".equals(keyword)){ %> class="classbg" <%} %>><a href="javascript:rankByKeyword('连连看');">连连看</a></li>
                <li <%if("捕鱼".equals(keyword)){ %> class="classbg" <%} %>><a href="javascript:rankByKeyword('捕鱼');">捕鱼</a></li>
                <li <%if("祖玛".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('祖玛');">祖玛</a></li>             
                <li <%if("射击".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('射击');">射击</a></li>
                <li <%if("阻击".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('阻击');">阻击</a></li>
                <li <%if("坦克".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('坦克');">坦克</a></li>
                <li <%if("飞行".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('飞行');">飞行</a></li>
                <li <%if("街机".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('街机');">街机</a></li>
                <li <%if("足球".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('足球');">足球</a></li>
                <li <%if("篮球".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('篮球');">篮球</a></li>
                <li <%if("台球".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('台球');">台球</a></li>
                <li <%if("斗地主".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('斗地主');">斗地主</a></li>
                <li <%if("麻将".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('麻将');">麻将</a></li>
                <li <%if("纸牌".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('纸牌');">纸牌</a></li>
                <li <%if("拼图".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('拼图');">拼图</a></li>
                <li <%if("经营".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('经营');">经营</a></li>
                <li <%if("卡牌".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('卡牌');">卡牌</a></li>               
                <li <%if("塔防".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('塔防');">塔防</a></li>
                <li <%if("战争".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('战争');">战争</a></li>
                <li <%if("跑酷".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('跑酷');">跑酷</a></li>
                <li <%if("横版".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('横版');">横版</a></li>
                <li <%if("3D".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('3D');">3D</a></li>
                <li <%if("赛车".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('赛车');">赛车</a></li>
                <li <%if("回合制".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('回合制');">回合制</a></li>
                <li <%if("玄幻".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('玄幻');">玄幻</a></li>
                <li <%if("武侠".equals(keyword)){ %>class="classbg"<%} %>><a href="javascript:rankByKeyword('武侠');">武侠</a></li>
             </ul>
             <!--classnav-->
        </div>
       <!--ranksou-->
       <div class="classlist">
            <!--classlist-->
       <div class="classlist">
          <s:iterator value="#request['app']" id="app">
           <div class="one">
               <dl>
                  <dt><a href="details.action?apkId=<s:property value="#app.appInfo.id" />"><img src="<%=request.getContextPath() %><s:property value="#app.appSou.logo1"/>" /></a></dt>
                  <dd><a href="details.action?apkId=<s:property value="#app.appInfo.id" />" class="fl"><s:property value="#app.appInfo.appName" /></a>
                  <a href="downApk.action?bowser=<%=bowser %>&appSouId=<s:property value="#app.appSou.id" />&downPath=<s:property value="#app.appSou.packge" escape='false'/>" class="xia2">下载</a></dd>
                  <dd>下载：<s:property value="#app.appAut.amountOfDown" />次 <s:property value="#app.appSou.packgeSize" />M</dd>
               </dl>
               <p class="intro">游戏简介：<s:property value="#app.appInfo.appIntrodution" /></p>
           </div>
           <!--one-->
           </s:iterator>
           
           
           <div class="page">
           <s:set name="page" value="#request.page"/>
           <s:if test="#page.hasFirst">
           <a href="rankMore.action?rankMoreType=2&rankMoreCurrentPage=1" class="mo">首页</a>
           </s:if>
           <s:if test="#page.hasPrevious">
           <a href="rankMore.action?rankMoreType=2&rankMoreCurrentPage=<s:property value="#page.currentPage-1"/>" class="mo">上一页</a>
           </s:if>
           <s:if test="#page.totalPage>1">
           <a href="rankMore.action?rankMoreType=2&rankMoreCurrentPage=1">1</a>
           </s:if>
           <s:if test="#page.totalPage>2">
           <a href="rankMore.action?rankMoreType=2&rankMoreCurrentPage=2">2</a>
           </s:if>
           <s:if test="#page.totalPage>3">
           <a href="rankMore.action?rankMoreType=2&rankMoreCurrentPage=3">3</a>
           </s:if>
           <s:if test="#page.totalPage>4">
           <a href="rankMore.action?rankMoreType=2&rankMoreCurrentPage=4">4</a>
           </s:if>
           <s:if test="#page.totalPage>5">
           <a href="rankMore.action?rankMoreType=2&rankMoreCurrentPage=5">5</a>
           </s:if>
           <s:if test="#page.totalPage>6">
           <a href="rankMore.action?rankMoreType=2&rankMoreCurrentPage=6">6</a>
           </s:if>
           <s:if test="#page.totalPage>7">
           <a href="rankMore.action?rankMoreType=2&rankMoreCurrentPage=7">7</a>
           </s:if>
           <s:if test="#page.hasNext">
           <a href="rankMore.action?rankMoreType=2&rankMoreCurrentPage=<s:property value="#page.currentPage+1"/>" class="mo">下一页</a>
           </s:if>
           <s:if test="#page.hasLast">
           <a href="rankMore.action?rankMoreType=2&rankMoreCurrentPage=<s:property value="#page.totalPage"/>" class="mo">末页</a>
           </s:if>
           </div>
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
