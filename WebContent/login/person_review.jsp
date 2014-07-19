<%@ page language="java" import="com.rainbow.entity.User" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>我评论过的应用</title>
<link href="style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jq.js"></script>
<script type="text/javascript" src="js/personer.js"></script>
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
   <div class="position"><a href="index.jsp">首页</a>><a href="personal_center.jsp">个人中心</a></div>
   <!--position-->
   <div class="mycont">
      <div class="myleft">
          <div class="person">
              <dl class="touxiang">
                 <dt><a href="change_touxiang.jsp"><img src="images/gr_03.jpg" /></a></dt>
                 <dd>柴米游戏</dd>
              </dl>
              <ul class="alter">
                 <li><a href="change_info.jsp"><img src="images/gr_06.jpg" />修改资料</a></li>
                 <li><a href="change_touxiang.jsp"><img src="images/gr_19.jpg"/>修改头像</a></li>
                 <li class="border0"><a href="change_password.jsp"><img src="images/gr_23.jpg" />修改密码</a></li>
              </ul>
              <div class="mygame">
                  <div class="clear over">
                      <dl class="fl">
                          <dt><a href="#"><img src="images/gr_09.jpg" /></a></dt>
                          <dd><a href="#">游戏应用</a></dd>
                      </dl>
                      <dl class="fr">
                          <dt><a href="#"><img src="images/gr_11.jpg" /></a></dt>
                          <dd><a href="#">电子杂志</a></dd>
                      </dl>
                  </div>
                  <div class="myload">
                     <p><span>33</span><a href="person_download.jsp">下载</a></p>
                     <p><span>56</span><a href="person_review.jsp">评论</a></p>
                     <p><span>19</span><a href="person_collect.jsp">收藏</a></p>
                  </div>
                  <!--myload-->
              </div>
              <!--mygame-->
              
          </div>
          <!--person-->
          <div class="lovegame">
                 <div class="lovetit lovetit3"><p class="fl"><img src="images/pp_03.jpg" />我评论过的应用...</p><div class="search3"><input type="text" value="" class="text3" /><input type="button" value="" class="searbut"/></div></div>
                 <div class="lovelist4">
                      <div class="pinglist">
                         <dl>
                             <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                             <dd><a href="#">冰雪奇缘</a></dd>
                         </dl>
                         <div class="pcont">
                            <div class="pp">画面非常棒，很赞！</div>
                            <div><p class="fl">2014-04-28 10:36 对<a href="#" class="gname2">冰雪奇缘</a>发表评论</p><p class="bianji fr"><a href="#"><img src="images/pp_07.jpg" />编辑</a>|<a href="#"><img src="images/pp_09.jpg" />删除</a></p></div>
                         </div>
                         <!--pcont-->
                      </div>
                      <!--pinglist--> 
                      <div class="pinglist">
                         <dl>
                             <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                             <dd><a href="#">冰雪奇缘</a></dd>
                         </dl>
                         <div class="pcont">
                            <div class="pp">画面非常棒，很赞！</div>
                            <div><p class="fl">2014-04-28 10:36 对<a href="#" class="gname2">冰雪奇缘</a>发表评论</p><p class="bianji fr"><a href="#"><img src="images/pp_07.jpg" />编辑</a>|<a href="#"><img src="images/pp_09.jpg" />删除</a></p></div>
                         </div>
                         <!--pcont-->
                      </div>
                      <!--pinglist--> 
                      <div class="pinglist">
                         <dl>
                             <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                             <dd><a href="#">冰雪奇缘</a></dd>
                         </dl>
                         <div class="pcont">
                            <div class="pp">画面非常棒，很赞！</div>
                            <div><p class="fl">2014-04-28 10:36 对<a href="#" class="gname2">冰雪奇缘</a>发表评论</p><p class="bianji fr"><a href="#"><img src="images/pp_07.jpg" />编辑</a>|<a href="#"><img src="images/pp_09.jpg" />删除</a></p></div>
                         </div>
                         <!--pcont-->
                      </div>
                      <!--pinglist--> 
                      <div class="pinglist">
                         <dl>
                             <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                             <dd><a href="#">冰雪奇缘</a></dd>
                         </dl>
                         <div class="pcont">
                            <div class="pp">画面非常棒，很赞！</div>
                            <div><p class="fl">2014-04-28 10:36 对<a href="#" class="gname2">冰雪奇缘</a>发表评论</p><p class="bianji fr"><a href="#"><img src="images/pp_07.jpg" />编辑</a>|<a href="#"><img src="images/pp_09.jpg" />删除</a></p></div>
                         </div>
                         <!--pcont-->
                      </div>
                      <!--pinglist--> 
                      <div class="pinglist">
                         <dl>
                             <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                             <dd><a href="#">冰雪奇缘</a></dd>
                         </dl>
                         <div class="pcont">
                            <div class="pp">画面非常棒，很赞！</div>
                            <div><p class="fl">2014-04-28 10:36 对<a href="#" class="gname2">冰雪奇缘</a>发表评论</p><p class="bianji fr"><a href="#"><img src="images/pp_07.jpg" />编辑</a>|<a href="#"><img src="images/pp_09.jpg" />删除</a></p></div>
                         </div>
                         <!--pcont-->
                      </div>
                      <!--pinglist--> 
                      <div class="pinglist">
                         <dl>
                             <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                             <dd><a href="#">冰雪奇缘</a></dd>
                         </dl>
                         <div class="pcont">
                            <div class="pp">画面非常棒，很赞！</div>
                            <div><p class="fl">2014-04-28 10:36 对<a href="#" class="gname2">冰雪奇缘</a>发表评论</p><p class="bianji fr"><a href="#"><img src="images/pp_07.jpg" />编辑</a>|<a href="#"><img src="images/pp_09.jpg" />删除</a></p></div>
                         </div>
                         <!--pcont-->
                      </div>
                      <!--pinglist--> 
                      <div class="pinglist">
                         <dl>
                             <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                             <dd><a href="#">冰雪奇缘</a></dd>
                         </dl>
                         <div class="pcont">
                            <div class="pp">画面非常棒，很赞！</div>
                            <div><p class="fl">2014-04-28 10:36 对<a href="#" class="gname2">冰雪奇缘</a>发表评论</p><p class="bianji fr"><a href="#"><img src="images/pp_07.jpg" />编辑</a>|<a href="#"><img src="images/pp_09.jpg" />删除</a></p></div>
                         </div>
                         <!--pcont-->
                      </div>
                      <!--pinglist--> 
                      <div class="pinglist">
                         <dl>
                             <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                             <dd><a href="#">冰雪奇缘</a></dd>
                         </dl>
                         <div class="pcont">
                            <div class="pp">画面非常棒，很赞！</div>
                            <div><p class="fl">2014-04-28 10:36 对<a href="#" class="gname2">冰雪奇缘</a>发表评论</p><p class="bianji fr"><a href="#"><img src="images/pp_07.jpg" />编辑</a>|<a href="#"><img src="images/pp_09.jpg" />删除</a></p></div>
                         </div>
                         <!--pcont-->
                      </div>
                      <!--pinglist--> 
                      <div class="pinglist">
                         <dl>
                             <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                             <dd><a href="#">冰雪奇缘</a></dd>
                         </dl>
                         <div class="pcont">
                            <div class="pp">画面非常棒，很赞！</div>
                            <div><p class="fl">2014-04-28 10:36 对<a href="#" class="gname2">冰雪奇缘</a>发表评论</p><p class="bianji fr"><a href="#"><img src="images/pp_07.jpg" />编辑</a>|<a href="#"><img src="images/pp_09.jpg" />删除</a></p></div>
                         </div>
                         <!--pcont-->
                      </div>
                      <!--pinglist--> 
                      <div class="pinglist">
                         <dl>
                             <dt><a href="#"><img src="images/tj_36.jpg" /></a></dt>
                             <dd><a href="#">冰雪奇缘</a></dd>
                         </dl>
                         <div class="pcont">
                            <div class="pp">画面非常棒，很赞！</div>
                            <div><p class="fl">2014-04-28 10:36 对<a href="#" class="gname2">冰雪奇缘</a>发表评论</p><p class="bianji fr"><a href="#"><img src="images/pp_07.jpg" />编辑</a>|<a href="#"><img src="images/pp_09.jpg" />删除</a></p></div>
                         </div>
                         <!--pcont-->
                      </div>
                      <!--pinglist--> 
                     <div class="page"><a href="#" class="mo">首页</a><a href="#" class="mo">上一页</a><a href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#">6</a><a href="#">7</a><a href="#" class="mo">下一页</a><a href="#" class="mo">末页</a></div>
                    <!--page-->
                 </div>
                 <!--lovelist-->
                 
              </div>
              <!--lovegame-->
      </div>
      <!--myleft-->
      <div class="myright">
         <div class="toptit"><img src="images/rank_12.jpg" />本周排行TOP10</div>
         <ul class="toplist">
            <li>
                <div class="yuan">
                    <p class="gname"><a href="#">卡车飞跃1.0</a></p>
                    <p class="leixing2"><a href="#">益智休闲</a></p>
                </div>
                <dl>
                   <dt><a href="#"><img src="images/52_03.jpg" /></a></dt>
                   <dd class="gname"><a href="#">卡车飞跃1.0</a></dd>
                   <dd class="leixing2"><a href="#">益智休闲</a></dd>
                </dl>
            </li>
            <li>
                <div class="yuan">
                    <p class="gname"><a href="#">卡车飞跃1.0</a></p>
                    <p class="leixing2"><a href="#">益智休闲</a></p>
                </div>
                <dl>
                   <dt><a href="#"><img src="images/52_03.jpg" /></a></dt>
                   <dd class="gname"><a href="#">卡车飞跃1.0</a></dd>
                   <dd class="leixing2"><a href="#">益智休闲</a></dd>
                </dl>
            </li>
            <li>
                <div class="yuan">
                    <p class="gname"><a href="#">卡车飞跃1.0</a></p>
                    <p class="leixing2"><a href="#">益智休闲</a></p>
                </div>
                <dl>
                   <dt><a href="#"><img src="images/52_03.jpg" /></a></dt>
                   <dd class="gname"><a href="#">卡车飞跃1.0</a></dd>
                   <dd class="leixing2"><a href="#">益智休闲</a></dd>
                </dl>
            </li>
            <li>
                <div class="yuan">
                    <p class="gname"><a href="#">卡车飞跃1.0</a></p>
                    <p class="leixing2"><a href="#">益智休闲</a></p>
                </div>
                <dl>
                   <dt><a href="#"><img src="images/52_03.jpg" /></a></dt>
                   <dd class="gname"><a href="#">卡车飞跃1.0</a></dd>
                   <dd class="leixing2"><a href="#">益智休闲</a></dd>
                </dl>
            </li>
            <li>
                <div class="yuan">
                    <p class="gname"><a href="#">卡车飞跃1.0</a></p>
                    <p class="leixing2"><a href="#">益智休闲</a></p>
                </div>
                <dl>
                   <dt><a href="#"><img src="images/52_03.jpg" /></a></dt>
                   <dd class="gname"><a href="#">卡车飞跃1.0</a></dd>
                   <dd class="leixing2"><a href="#">益智休闲</a></dd>
                </dl>
            </li>
            <li>
                <div class="yuan">
                    <p class="gname"><a href="#">卡车飞跃1.0</a></p>
                    <p class="leixing2"><a href="#">益智休闲</a></p>
                </div>
                <dl>
                   <dt><a href="#"><img src="images/52_03.jpg" /></a></dt>
                   <dd class="gname"><a href="#">卡车飞跃1.0</a></dd>
                   <dd class="leixing2"><a href="#">益智休闲</a></dd>
                </dl>
            </li>
            <li>
                <div class="yuan">
                    <p class="gname"><a href="#">卡车飞跃1.0</a></p>
                    <p class="leixing2"><a href="#">益智休闲</a></p>
                </div>
                <dl>
                   <dt><a href="#"><img src="images/52_03.jpg" /></a></dt>
                   <dd class="gname"><a href="#">卡车飞跃1.0</a></dd>
                   <dd class="leixing2"><a href="#">益智休闲</a></dd>
                </dl>
            </li>
            <li>
                <div class="yuan">
                    <p class="gname"><a href="#">卡车飞跃1.0</a></p>
                    <p class="leixing2"><a href="#">益智休闲</a></p>
                </div>
                <dl>
                   <dt><a href="#"><img src="images/52_03.jpg" /></a></dt>
                   <dd class="gname"><a href="#">卡车飞跃1.0</a></dd>
                   <dd class="leixing2"><a href="#">益智休闲</a></dd>
                </dl>
            </li>
            <li>
                <div class="yuan">
                    <p class="gname"><a href="#">卡车飞跃1.0</a></p>
                    <p class="leixing2"><a href="#">益智休闲</a></p>
                </div>
                <dl>
                   <dt><a href="#"><img src="images/52_03.jpg" /></a></dt>
                   <dd class="gname"><a href="#">卡车飞跃1.0</a></dd>
                   <dd class="leixing2"><a href="#">益智休闲</a></dd>
                </dl>
            </li>
            <li>
                <div class="yuan">
                    <p class="gname"><a href="#">卡车飞跃1.0</a></p>
                    <p class="leixing2"><a href="#">益智休闲</a></p>
                </div>
                <dl>
                   <dt><a href="#"><img src="images/52_03.jpg" /></a></dt>
                   <dd class="gname"><a href="#">卡车飞跃1.0</a></dd>
                   <dd class="leixing2"><a href="#">益智休闲</a></dd>
                </dl>
            </li>
         </ul>
         <!--toplist-->
      </div>
      <!--myright-->
   </div>
   <!--mycont-->
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
                   <dd><a href="#">关于我们</a></dd>
                   <dd><a href="#">加入我们</a></dd>
                   <dd><a href="#">商务洽谈</a></dd>
                   <dd><a href="developer_center.jsp">开发者中心</a></dd>
                 </dl>
                 <dl>
                   <dt>意见与服务</dt>
                   <dd><a href="#">关于我们</a></dd>
                   <dd><a href="#">加入我们</a></dd>
                   <dd><a href="#">商务洽谈</a></dd>
                   <dd><a href="developer_center.jsp">开发者中心</a></dd>
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
