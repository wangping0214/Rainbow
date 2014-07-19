<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>修改资料</title>
<link href="style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jq.js"></script>
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
       <div class="huiyuan fr"><a href="#" class="tou"><img src="images/tj_11.jpg" /></a><p><a href="#">退出</a></p></div>
   </div>
   <!--nav2cont-->
</div>
<!--nav2-->
<div class="middle">
   <div class="position"><a href="index.jsp">首页</a>><a href="#">个人中心</a>><span>修改资料</span></div>
   <!--position-->
   <div class="changecont">
   <ul class="changenav">
      <li class="xiubg"><a href="change_info.jsp">修改资料</a></li>
      <li><a href="change_touxiang.jsp">修改头像</a></li>
      <li><a href="change_password.jsp">修改密码</a></li>
      <li><a href="bound_id.jsp">绑定账号</a></li>
      <li><a href="email_order.jsp">邮件订阅</a></li>
   </ul>
   <div class="xiugai2">
       <div class="text4"><label>用户名：</label><input type="text" value="柴米游戏" /><a href="#" class="xiu"><img src="images/gr_06.jpg" />修改</a></div>
       <div><label>性　别：</label><input type="radio" name="sex" checked="checked" />男<input type="radio" name="sex" />女</div>
       <div class="city"><label>城　市：</label><select class="selsct1"><option>不限</option></select><select><option>不限</option></select></div>
       <div  class="text4"><label>邮　箱：</label><input type="text" value="1193334016@qq.com" /><a href="#" class="xiu"><img src="images/gr_06.jpg" />修改</a></div>
       <div class="qianming"><label>个性签名：</label><textarea></textarea></div>
       <div><input type="button" value="保存" class="baocun" /></div>
   </div>
   <!--xiugai-->
</div>
<!--changecont-->
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
