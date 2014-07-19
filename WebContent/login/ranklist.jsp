<%@ page language="java" import="java.util.*" import="com.rainbow.entity.User" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="houwen" session="true" %>
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
<title>排行榜</title>
<link href="style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jq.js"></script>
<script type="text/javascript" src="js/scroll.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/scripts/UrlEncode.js"></script>
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
function downUrl(url){
	alert();
	var str = EncodeUtf8(url);
	alert(EncodeUtf8(url));
	window.location.href="<%=request.getContextPath() %>"+str;
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
  <div class="rankm1">
     <div class="scroll2 scroll3">
	    <div class="slide_02" id="slide_02">
		   <div class="mod_02"><a href="#"><img src="images/rank_03.jpg" width="716" height="228" /></a></div>
		   <div class="mod_02"><a href="#"><img src="images/rank_03.jpg" width="716" height="228" /></a></div>
           <div class="mod_02"><a href="#"><img src="images/rank_03.jpg" width="716" height="228" /></a></div>
	     </div>
          <!--slide_01-->
	      <div class="dotModule_new2">
		     <div id="slide_01_dot"></div>
	      </div>
          <!--dotModule_new-->
    </div>
    <!--scroll-->
    <div class="ad fr">
        <a href="#" class="mbot5"><img src="images/rank_05.jpg" /></a>
        <a href="#"><img src="images/rank_08.jpg" /></a>
    </div>
    <!--ad-->
 </div>
 <!--rankm1-->
 <div class="keywords">
   <span>热门搜索关键词:</span>
   <a href="javascript:rankByKeyword('安全');">安全</a>
   <a href="javascript:rankByKeyword('浏览器');">浏览器</a>
   <a href="javascript:rankByKeyword('输入法');">输入法</a>
   <a href="javascript:rankByKeyword('主题');">主题</a>
   <a href="javascript:rankByKeyword('相机');">相机</a>
   <a href="javascript:rankByKeyword('视频');">视频</a>
   <a href="javascript:rankByKeyword('卡牌');">卡牌</a>
   <a href="javascript:rankByKeyword('塔防');">塔防</a>
   <a href="javascript:rankByKeyword('射击');">射击</a>
   <a href="javascript:rankByKeyword('横版');">横版</a>
   <a href="javascript:rankByKeyword('跑酷');">跑酷</a>
   <a href="javascript:rankByKeyword('3D');">3D</a>
 </div>
 <!--keywords-->
 <div class="content">
     <div class="contleft">
        <div class="jujiao uselist">
        <!-- **************************安卓应用排行***************************** -->
            <div class="jujiaolist use">
                <p class="usetit"><span class="pai"><img src="images/rank_12.jpg" />安卓应用排行</span><a href="rankMore.action?rankMoreType=1&rankMoreCurrentPage=1" class="more">更多<img src="images/ss_03.jpg" /></a></p>
                <s:iterator value="#request['appApplication']" id="appApplication">
                <dl>
                   <dt><a href="details.action?apkId=<s:property value="#appApplication.appInfo.id" />"><img src="<%=request.getContextPath() %><s:property value="#appApplication.appSou.logo1"/>" /></a></dt>
                   <dd><a href="details.action?apkId=<s:property value="#appApplication.appInfo.id" />"><s:property value="#appApplication.appInfo.appName" /></a></dd>
                   <dd class="downnum"><span><s:property value="#appApplication.appAut.amountOfDown" />次下载</span></dd>
                   <dd class="xiazai"><a href="downApk.action?bowser=<%=bowser %>&appSouId=<s:property value="#appApplication.appSou.id" />&downPath=<s:property value="#appApplication.appSou.packge" escape='false'/>"><img src="images/xia_03.jpg" /></a></dd>
                </dl>
                </s:iterator>
                
            </div>
            <!--jujiaolist-->
        </div>
        <!--jujiao-->

       <div class="jujiao uselist">
       <!-- **************************安卓游戏排行***************************** -->
            <div class="jujiaolist use">
                <p class="usetit"><span class="pai"><img src="images/rank_12.jpg" />安卓游戏排行</span><a href="rankMore.action?rankMoreType=2&rankMoreCurrentPage=1" class="more">更多<img src="images/ss_03.jpg" /></a></p>
                <s:iterator value="#request['appGame']" id="appGame">
                <dl>
                   <dt><a href="details.action?apkId=<s:property value="#appGame.appInfo.id" />"><img src="<%=request.getContextPath() %><s:property value="#appGame.appSou.logo1"/>" /></a></dt>
                   <dd><a href="details.action?apkId=<s:property value="#appGame.appInfo.id" />"><s:property value="#appGame.appInfo.appName" /></a></dd>
                   <dd class="downnum"><span><s:property value="#appGame.appAut.amountOfDown" />次下载</span></dd>
                   <dd class="xiazai"><a href="downApk.action?bowser=<%=bowser %>&appSouId=<s:property value="#appGame.appSou.id" />&downPath=<s:property value="#appGame.appSou.packge" escape='false'/>"><img src="images/xia_03.jpg" /></a></dd>
                </dl>
                </s:iterator>
                
            </div>
            <!--jujiaolist-->
        </div>
        <!--jujiao-->
     </div>
     <!--contleft-->
     <div class="contright">
        <div class="renqi">
           <div class="renqicont">
           <!-- ************************应用人气排行************************** -->
               <p class="usetit2"><img src="images/rank_12.jpg" />应用人气排行</p>
               <ul class="renqilist">
               <s:iterator value="#request['applicationPopularity']" id="applicationPopularity">
                  <li>
                     <p class="tits"><a href="details.action?apkId=<s:property value="#applicationPopularity.appInfo.id" />"><s:property value="#applicationPopularity.appInfo.appName" /></a></p>
                     <dl>
                        <dt><a href="details.action?apkId=<s:property value="#applicationPopularity.appInfo.id" />"><img src="<%=request.getContextPath() %><s:property value="#applicationPopularity.appSou.logo1"/>" /></a></dt>
                        <dd><a href="details.action?apkId=<s:property value="#applicationPopularity.appInfo.id" />"><s:property value="#applicationPopularity.appInfo.appName" /></a></dd>
                        <dd class="xia3"><a href="downApk.action?bowser=<%=bowser %>&appSouId=<s:property value="#applicationPopularity.appSou.id" />&downPath=<s:property value="#applicationPopularity.appSou.packge" escape='false'/>">下载</a></dd>
                     </dl>
                  </li>
                  </s:iterator>
              </ul>
              <!--renqilist-->
           
           </div>
           <!--renqicont-->
        </div>
        <!--renqi-->
        <div class="renqi">
           <div class="renqicont">
               <p class="usetit2"><img src="images/rank_12.jpg" />游戏人气排行</p>
               <ul class="renqilist">
               <s:iterator value="#request['gamePopularity']" id="gamePopularity">
                  <li>
                     <p class="tits"><a href="details.action?apkId=<s:property value="#gamePopularity.appInfo.id" />"><s:property value="#gamePopularity.appInfo.appName" /></a></p>
                     <dl>
                        <dt><a href="details.action?apkId=<s:property value="#gamePopularity.appInfo.id" />"><img src="<%=request.getContextPath() %><s:property value="#gamePopularity.appSou.logo1"/>" /></a></dt>
                        <dd><a href="details.action?apkId=<s:property value="#gamePopularity.appInfo.id" />"><s:property value="#gamePopularity.appInfo.appName" /></a></dd>
                        <dd class="xia3"><a href="downApk.action?bowser=<%=bowser %>&appSouId=<s:property value="#gamePopularity.appSou.id" />&downPath=<s:property value="#gamePopularity.appSou.packge" escape='false'/>">下载</a></dd>
                     </dl>
                  </li>
                 </s:iterator>
              </ul>
              <!--renqilist-->
           
           </div>
           <!--renqicont-->
        </div>
        <!--renqi-->
        
     </div>
     <!--contright-->
 </div>
 <!--content-->
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
<script type="text/javascript">
if(document.getElementById("slide_02")){
	var slide_01 = new ScrollPic();
	slide_01.scrollContId   = "slide_02"; //内容容器ID
	slide_01.dotListId      = "slide_01_dot";//点列表ID
	slide_01.dotOnClassName = "selected";
	slide_01.arrLeftId      = "sl_left"; //左箭头ID
	slide_01.arrRightId     = "sl_right";//右箭头ID
	slide_01.frameWidth     = 716;
	slide_01.pageWidth      = 716;
	slide_01.upright        = false;
	slide_01.speed          = 10;
	slide_01.space          = 30; 
	slide_01.initialize(); //初始化
}
</script>
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
