<%@ page language="java" import="java.util.*" import="com.rainbow.entity.User" import="com.rainbow.server.App" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
	<%@ page import="com.rainbow.util.PageUtil"%>
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
                else{
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
   <div class="position"><a href="index.jsp">首页</a>><a href="webRanklist.action">排行榜</a>><a href="#">安卓应用</a></div>
   <!--position-->
   <div class="allclass rankmore">
       <div class="ranksou">
           <div class="resou">热搜关键词：</div>
              <ul class="classnav">
             	 <%if("优化".equals(keyword)){ %>
                <li class="classbg"> <a href="javascript:rankByKeyword('优化');" >优化</a></li>
                <%} 
                else{%>
                <li> <a href="javascript:rankByKeyword('优化');">优化</a></li>
                <%}
             	 if("流量".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('流量');">流量</a></li>
                <%}
             	 else{%>
                <li><a href="javascript:rankByKeyword('流量');">流量</a></li>
                <%}
                if("安全".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('安全');">安全</a></li>
                <%}
                else {%>
                <li><a href="javascript:rankByKeyword('安全');">安全</a></li>
                <%}
                if("杀毒".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('杀毒');">杀毒</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('杀毒');">杀毒</a></li>
                <%}
                if("浏览器".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('浏览器');">浏览器</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('浏览器');">浏览器</a></li>
                <%}
                if("输入法".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('输入法');">输入法</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('输入法');">输入法</a></li>
                <%}
                if("文件".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('文件');">文件</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('文件');">文件</a></li>
                <%}
                if("办公".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('办公');">办公</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('办公');">办公</a></li>
                <%}
                if("主题".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('主题');">主题</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('主题');">主题</a></li>
                <%}
                if("桌面".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('桌面');">桌面</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('桌面');">桌面</a></li>
                <%}
                if("壁纸".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('壁纸');">壁纸</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('壁纸');">壁纸</a></li>
                <%}
                if("相机".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('相机');">相机</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('相机');">相机</a></li>
                <%}
                if("音乐".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('音乐');">音乐</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('音乐');">音乐</a></li>
                <%}
                if("视频".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('视频');">视频</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('视频');">视频</a></li>
                <%}
                if("相册".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('相册');">相册</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('相册');">相册</a></li>
                <%}
                if("播放器".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('播放器');">播放器</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('播放器');">播放器</a></li>
                <%}
                if("健康".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('健康');">健康</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('健康');">健康</a></li>
                <%}
                if("购物".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('购物');">购物</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('购物');">购物</a></li>
                <%}
                if("理财".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('理财');">理财</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('理财');">理财</a></li>
                <%}
                if("旅行".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('旅行');">旅行</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('旅行');">旅行</a></li>
                <%}
                if("聊天".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('聊天');">聊天</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('聊天');">聊天</a></li>
                <%}
                if("交友".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('交友');">交友</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('交友');">交友</a></li>
                <%}
                if("微博".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('微博');">微博</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('微博');">微博</a></li>
                <%}
                if("婚恋".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('婚恋');">婚恋</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('婚恋');">婚恋</a></li>
                <%}
                if("电子书".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('电子书');">电子书</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('电子书');">电子书</a></li>
                <%}
                if("漫画".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('漫画');">漫画</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('漫画');">漫画</a></li>
                <%}
                if("新闻".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('新闻');">新闻</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('新闻');">新闻</a></li>
                <%}
                if("杂志".equals(keyword)){ %>
                <li class="classbg"><a href="javascript:rankByKeyword('杂志');">杂志</a></li>
                <%}
                else{%>
                <li><a href="javascript:rankByKeyword('杂志');">杂志</a></li>
                <%} %>
             </ul>
             <!--classnav-->
        </div>
       <!--ranksou-->
       <div class="classlist">
       <s:iterator value="#request['app']" id="app">
           <div class="one">
               <dl>
                  <dt><a href="details.action?apkId=<s:property value="#app.appInfo.id" />"><img src="<%=request.getContextPath() %><s:property value="#app.appSou.logo1"/>" /></a></dt>
                  <dd><a href="details.action?apkId=<s:property value="#app.appInfo.id" />" class="fl"><s:property value="#app.appInfo.appName" /></a>
                  <a href="downApk.action?bowser=<%=bowser %>&appSouId=<s:property value="#app.appSou.id" />&downPath=<s:property value="#app.appSou.packge" escape='false'/>" class="xia2">下载</a></dd>
                  <dd>
                  下载：<s:if test="#app.appAut.amountOfDown>10000">
  <s:property value="#app.appAut.amountOfDown/10000+'.'+(#app.appAut.amountOfDown-(#app.appAut.amountOfDown/10000)*10000)/1000" />
万次
  </s:if>
  <s:else><s:property value="#app.appAut.amountOfDown" />次</s:else>
                  <s:property value="#app.appSou.packgeSize" />M</dd>
               </dl>
               <p class="intro">
               应用简介：
               <s:property value="#app.appInfo.appIntrodution" />
               </p>
           </div>
           <!--one-->
           </s:iterator>
           <%
					/*
						计算页数，每次显示区间为本页的5页
					 */
					PageUtil pageUtil = (PageUtil) request.getAttribute("page");
					int currentPage = pageUtil.getCurrentPage();
					int totalPage = pageUtil.getTotalPage();
					int startPage = 1;
					int endPage = 1;
					if (currentPage + 3 > totalPage) {
						startPage = totalPage - 4 > 0 ? totalPage - 4 : 1;
						endPage = totalPage + 1;
					} else {
						startPage = currentPage - 2 > 0 ? currentPage - 2 : 1;
						endPage = startPage + 5 < totalPage ? startPage + 5 : totalPage;
					}
				%>
				<div class="page">
					<%
						if (pageUtil.isHasFirst()) {
					%>
					<a href="rankMore.action?rankMoreType=1&rankMoreCurrentPage=1">首页</a>
					<%
						}
					%>
					<%
						if (pageUtil.isHasPrevious()) {
					%>
					<a href="rankMore.action?rankMoreType=1&rankMoreCurrentPage=<%=pageUtil.getCurrentPage() - 1%>">上一页</a>
					<%
						}
					%>
					<%
						for (int iPage = startPage; iPage < endPage; iPage++) {
							if (pageUtil.getTotalPage() >= iPage) {
					%>
					<%
						//if (currentPage == iPage) {
						//}
					%><a href="rankMore.action?rankMoreType=1&rankMoreCurrentPage=<%=iPage%>"><%=iPage%></a>
					<%
						}
						}
						if (pageUtil.isHasNext()) {
					%>
					<a href="rankMore.action?rankMoreType=1&rankMoreCurrentPage=<%=pageUtil.getCurrentPage() + 1%>">下一页</a>
					<%
						}
					%>
					<%
						if (pageUtil.isHasLast()) {
					%>
					<a href="rankMore.action?rankMoreType=1&rankMoreCurrentPage=<%=pageUtil.getTotalPage()%>">尾页</a>
					<%
						}
					%>

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
                 <p class="logo2 fl"><a href="#"><img src="images/im_14.jpg" /></a></p>
               </div>
               <!--footmain-->
           </div>
           <!--footcont-->
       </div>
       <!--fotter-->

<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
