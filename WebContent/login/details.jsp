<%@ page language="java" import="com.rainbow.server.App" import="com.rainbow.entity.User" contentType="text/html; charset=UTF-8"
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
                <%App app = (App)session.getAttribute("app"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>三国来了</title>
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
function addReview(appInfoId){
	if($("#review_id").val()==""){
		alert("请输入评论再提交！");
		return false;
	}
	else{
		appInfoId = parseInt(appInfoId);
		return jQuery.ajax({
			type : "post",
			url : "addReview.action",
			data :{
				"appInfoId": appInfoId,
				"content": $("#review_id").val()
			},
			success : function(){
				$("#review_id").attr("value","");
				location.reload();
				return true;
			},
			error:function(){
				return false;
			}
		
		});
	}
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
   <div class="xcont">
      <div class="xcontleft">
         <div class="gamecont">
             <dl>
                 <dt>
                     <p class="suolve"><a href=""><img src="<%=request.getContextPath()+app.getAppSou().getLogo2() %>" /></a></p>
                     <p class="xia3"><a href="downApk.action?bowser=<%=bowser %>&appSouId=<%=app.getAppSou().getId() %>&downPath=<%=app.getAppSou().getPackge() %>">下载</a></p>
                 </dt>
                 <dd class="gametit"><span><%=app.getAppInfo().getAppName() %></span></dd>
                 <dd><p>
                 <%if(app.getAppInfo().getSecurity().charAt(2)=='0'){ %><img src="images/wd.jpg"/>
				<%}
					if(app.getAppInfo().getSecurity().charAt(0)=='0'){%><img src="images/wgg.jpg"/>
				<%}
					if(app.getAppInfo().getSecurity().charAt(4)=='0'){%><img src="images/ys.jpg"/>
				<%}
 					if(app.getAppInfo().getSecurity().charAt(6)=='0'){%><img src="images/gf.jpg"/>
 				<%} %>
                 </p>
                 </dd>
                 <dd><span>下　载：<%=app.getAppAut().getAmountOfDown() %>次</span><span>大　小：<%=app.getAppSou().getPackgeSize() %>M</span></dd>
                 <%String fee="";
                 switch(Integer.parseInt(app.getAppInfo().getFee())){
                 case 1:fee="没有收费内容";break;
                 case 2:fee="这个应用是试用版，付费后才能使用完整功能";break;
                 case 3:fee="这个应用包含付费内容，如表情，道具，电子书等虚拟物品";break;
                	default:fee="这个应用是试用版，付费后才能使用完整功能，同时应用中包含付费方可购买的虚拟物品";break;
                 }%>
                 <dd><span>资　费：<%=fee %></span><span>分　类：<%=app.getAppInfo().getClassification() %></span></dd>
                 <dd><span>语　言：<%=app.getAppInfo().getLanguage() %></span><span>版　本：1.4.0</span></dd>
                 <dd><span>时　间：<%=app.getAppInfo().getUpTime() %></span></dd>
                 <dd>开发者：中国手游-卓越游戏</dd>
             </dl>
         </div>
         <!--gamecont-->
         <div class="jtutit"><img src="images/rank_12.jpg" />游戏截图</div>
         <div class="gameimg">
             <div class="carousel">
		        <a href="javascript:void(0);" class="prev disabled" id="prev-03">&nbsp; </a>
		        <div class="jCarouselLite" id="demo-03">
			        <ul>
				       <li><img src="<%=request.getContextPath()+app.getAppSou().getGamePhoto1() %>" width="246" height="409"/></li>
				       <li><img src="<%=request.getContextPath()+app.getAppSou().getGamePhoto2() %>" width="246" height="409"/></li>
                       <li><img src="<%=request.getContextPath()+app.getAppSou().getGamePhoto3() %>" width="246" height="409"/></li>
                       <li><img src="<%=request.getContextPath()+app.getAppSou().getGamePhoto4() %>" width="246" height="409"/></li>
                       <li><img src="<%=request.getContextPath()+app.getAppSou().getGamePhoto5() %>" width="246" height="409"/></li>
			        </ul>
		      </div>
		      <a href="javascript:void(0);" class="next" id="next-03">&nbsp; </a>
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
                        <p><%=app.getAppInfo().getElaborate() %></p> 
                      </div>
                      <span id="select-hold" class="close">展开<b></b></span>
                  </dd>
                </dl>
                <dl id="select-brand1">
                  <dt><img src="images/rank_12.jpg" />更新内容：</dt>
                  <dd>
                     <div class="content" style="height:88px;">
                       <p> <%=app.getAppInfo().getVersionIntrodution() %>
</p> 
                    </div>
                    <span id="select-hold1" class="close">展开<b></b></span>
                 </dd>
               </dl>
            </div>
            <!--select-->
            <div class="discuss">
               <div class="tit5"><img src="images/rank_12.jpg" />游戏评论（共<%=app.getReview().size() %>条）</div>
               <div class="discont"><textarea id="review_id"></textarea></div>
               <div class="tijiao"><input type="button" value="提交" id="submit_id" onclick="addReview(<%=app.getAppInfo().getId() %>);" /></div>
               <ul class="dislist">
                  
                  <%for(int i=0;i<app.getReview().size();i++){ %>
                  <li>
                      <dl>
                         <dt><a href="#"><img src="images/de_31.jpg" /></a></dt>
                         <dd><a href="#"><%=app.getReview().get(i).getUserName() %></a></dd>
                         <dd><%=app.getReview().get(i).getContent() %></dd>
                         <dd><span><%=app.getReview().get(i).getTime() %></span></dd>
                      </dl>
                  </li>
                      <%} %>
                 
                  
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
          <s:iterator value="#request['appOthers']" id="appOthers">
          <dl>
             <dt><a href="details.action?apkId=<s:property value="#appOthers.appInfo.id"/>"><img src="<%=request.getContextPath() %><s:property value="#appOthers.appSou.logo1"/>" /></a></dt>
             <dd><a href="details.action?apkId=<s:property value="#appOthers.appInfo.id"/>"><s:property value="#appOthers.appInfo.appName" /></a><span><s:property value="#appOthers.appAut.amountOfDown" />次下载</span></dd>
          </dl>
          </s:iterator>
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
                 <p class="logo2 fl"><a href="#"><img src="images/im_14.jpg" /></a></p>
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
(function() { var b = $("#select-brand .tab"), f = $("#select-brand .content"), h = $("#select-hold"), c = b.find(".curr").attr("rel"), g = "54px", a; var d = 0, i = 0, e = (screen.width >= 800) ? 1: 1; i = Math.ceil(f.children().size() / e); d = (f.children().outerHeight()) ; if (d > parseInt(g)) { f.css("height", g); h.html("<b></b>展开").attr("class", "close") } else { h.html("<b></b>收起").attr("class", "open") } h.bind("click", function() { if ($(this).attr("class") != "open") { f.css("height", "auto"); h.html("<b></b>收起").attr("class", "open") } else { f.css("height", g); h.html("<b></b>展开").attr("class", "close") } }); b.find("li").bind("mouseover", function() { var j = $(this); a = setTimeout(function() { if (j.attr("rel") == c) { return } b.find("li").eq(c).removeClass("curr"); j.addClass("curr"); c = j.attr("rel"); f.css("height", "auto"); h.hide(); f.find("div").each(function() { if (c == 0) { $(this).show() } else { $(this).hide(); if ($(this).attr("rel") == c) { $(this).show() } } }) }, 500) }).bind("mouseout", function() { clearTimeout(a) }) })();
</script>
<script type="text/javascript">
(function() { var b = $("#select-brand1 .tab"), f = $("#select-brand1 .content"), h = $("#select-hold1"), c = b.find(".curr").attr("rel"), g = "54px", a; var d = 0, i = 0, e = (screen.width >= 800) ? 1: 1; i = Math.ceil(f.children().size() / e); d = (f.children().outerHeight()) * i; if (d > parseInt(g)) { f.css("height", g); h.html("<b></b>展开").attr("class", "close") } else { h.html("<b></b>收起").attr("class", "open") } h.bind("click", function() { if ($(this).attr("class") != "open") { f.css("height", "auto"); h.html("<b></b>收起").attr("class", "open") } else { f.css("height", g); h.html("<b></b>展开").attr("class", "close") } }); b.find("li").bind("mouseover", function() { var j = $(this); a = setTimeout(function() { if (j.attr("rel") == c) { return } b.find("li").eq(c).removeClass("curr"); j.addClass("curr"); c = j.attr("rel"); f.css("height", "auto"); h.hide(); f.find("div").each(function() { if (c == 0) { $(this).show() } else { $(this).hide(); if ($(this).attr("rel") == c) { $(this).show() } } }) }, 500) }).bind("mouseout", function() { clearTimeout(a) }) })();</script>

</body>
</html>
