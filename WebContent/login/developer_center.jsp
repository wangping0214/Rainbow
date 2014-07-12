<%@ page language="java" import="com.rainbow.entity.User" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>开发者中心</title>
<link href="style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/login/js/jquery-1.7.2.min.js"></script>
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
DD_belatedPNG.fix('.pngf');
</script>
<![endif]-->
</head>

<body>
<div class="kfhelp">
   <div class="kfhelpcont">
       <div class="fr">您好，欢迎来到柴米游戏！
       <%User user = (User)session.getAttribute("user"); 
       	if(user==null){
       %>
       <div class="huiyuan fr"><p><a href="<%=request.getContextPath()%>/login/login.jsp">登录</a>|<a href="<%=request.getContextPath()%>/login/register.jsp">注册</a></p></div>
       <%}
       	else{%>
       	<div class="huiyuan fr"><a href="#" class="tou"><img src="images/tj_11.jpg" /></a><p><a href="" id="id_exit">退出</a></p></div>
       	<%} %>
       |<a href="#">帮助</a>|<a href="index.jsp">返回首页 <img src="images/ic.jpg" /></a></div>       
   </div>
   <!--kfhelpcont-->
</div>
<!--kfhelp-->
<div class="kftop">
   <div class="kftopcont">
      <img src="images/kf_03.jpg" border="0" usemap="#Map"  class="fl kflogo"/>
      <map name="Map" id="Map">
        <area shape="rect" coords="78,4,236,32" href="index.jsp" />
        <area shape="poly" coords="67,68" href="#" />
      </map>
      <ul class="kfnav">
         <li class="kfcurrent"><a href="#">首页</a></li>
         <li><a href="#">APP</a></li>
         <li><a href="#">推广</a></li>
         <li><a href="#">用户帮助中心</a></li>
      </ul>
      
   </div>
   <!--kftopcont-->
</div>
<!--kftop-->
<div class="kfbanner">
   <p><a href="#"><img src="images/kf_06.jpg" /></a></p>
   <div class="kfliucheng">
      <dl class="kfdl">
         <dt><a href="#"><img src="images/dl.png" class="pngf" /></a></dt>
         <dd><a href="<%=request.getContextPath()%>/developer/login.jsp">登录注册</a></dd>
         <dd>注册柴米游戏账户<br />并升级为开发者</dd>
      </dl>
      <p class="jian"><img src="images/next.png" class="pngf" /></p>
      <dl class="kfsc">
         <dt><a href="#"><img src="images/sc.png"  class="pngf"/></a></dt>
         <dd><a href="#">上传应用</a></dd>
         <dd>畅通的发布渠道<br />支持渠道包上传与发布</dd>
      </dl>
      <p class="jian"><img src="images/next.png" class="pngf" /></p>
      <dl class="kfcs">
         <dt><a href="#"><img src="images/cs.png" class="pngf" /></a></dt>
         <dd><a href="#">测试审核</a></dd>
         <dd>审核应用信息并测试<br />提供应用优化建议</dd>
      </dl>
      <p class="jian"><img src="images/next.png" class="pngf"/></p>
      <dl class="kfcg">
         <dt><a href="#"><img src="images/cg.png" class="pngf"/></a></dt>
         <dd><a href="#">上架成功</a></dd>
         <dd>审核通过极速上架<br />马上供用户下载</dd>
      </dl>

   </div>
</div>
<!--kfbanner-->
<div class="kfcont">
   <div class="kfdetails">
      <p><img src="images/kf_09.jpg" /></p>
      <dl>
         <dt>加入开发者团队</dt>
         <dd>想在柴米游戏发布您的产品？赶紧"注册"吧。按照页面提示完成注册并激活账户后，您就可以上传、更新、并实时管理软件啦！加入我们，成为柴米游戏的合作伙伴！</dd>
      </dl>
   </div>
   <div class="kfdetails">
      <p><img src="images/kf_12.jpg" /></p>
      <dl>
         <dt>简单上传完成发布</dt>
         <dd>填写软件名称和描述，上传截图和软件包，几分钟内即可快速完成软件上传。如果您已有产品而需要更新，请邮件联系柴米游戏(service@chaimiyouxi.com)，先做产品绑定，然后就可以直接更新。</dd>
      </dl>
   </div>
   <div class="kfdetails">
      <p><img src="images/kf_15.jpg" /></p>
      <dl>
         <dt>测试审核并优化</dt>
         <dd>基于真实的终端设备对APP应用进行多批次的兼容测试、功能测试、性能测试，通过智能移动设备，并且高度保密。开发者可随时查看应用包审核状态追踪，并为您提供应用测试报告，提供应用优化建议，有助于快速成功上架。</dd>
      </dl>
   </div>
   <div class="kfdetails">
      <p><img src="images/kf_19.jpg" /></p>
      <dl>
         <dt>成功上架数据追踪</dt>
         <dd>在应用提交通过之后即可获得全方位的展示，实现用户快速增长。细致分类，精心策划专题，新品推荐，保证您的应用精确到达用户，更有精确统计，提供按天应用下载数据统计服务，产品推广效果一目了然。
         </dd>
      </dl>
   </div>
</div>
<!--kfcont-->
<div class="kfad"><a href="#"><img src="images/kf_23.jpg" width="226" /></a><a href="#"><img src="images/kf_24.jpg" /></a><a href="#"><img src="images/kf_25.jpg" /></a></div>
   <div class="icon2"><img src="images/ic_03.jpg" /></div>

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
                 <p class="logo2 fl"><a href="#"><img src="images/im_14.jpg" /></a></p>
               </div>
               <!--footmain-->
           </div>
           <!--footcont-->
       </div>
       <!--fotter-->

</body>
</html>
