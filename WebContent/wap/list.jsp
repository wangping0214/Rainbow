<%@ page language="java" import="com.rainbow.entity.Prize"
	import="java.util.List;" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Prize> prize = (List<Prize>)session.getAttribute("prize");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>柴米游戏-中国第一手游杂志</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="css/huodong.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-4.2.js"></script>
<style type="text/css">
body{ background:#a2f5e4; padding-bottom:80px;}
a{ display:block; width:100%;}
</style>
</head>

<body>
	<div class="cont">
		<img src="image/list_02.jpg" width="100%" />
		<div class="listcont" />
		<p class="ago">
			<a href="result.jsp">查看往期中奖名单 >></a>
		</p>
		<p class="atit">本期开奖结果</p>
		<div id="demo">
			<div id="demo1">
			<ul>
				<%
					if(prize!=null){ 
						    	for(int i=0;i<prize.size();i++){
				%>
				
					<li><span class="name"><%=prize.get(i).getName().substring(0, 1)%>**</span>
						<span class="tel"><%=prize.get(i).getPhone().substring(0, 3)%>****<%=prize.get(i).getPhone().substring(prize.get(i).getPhone().length()-5, prize.get(i).getPhone().length()-1)%></span>
						<span class="jiang"> <%
 	if(prize.get(i).getPrize()==1) {
 %>获得了机械游戏键盘<%
 	}
 %> <%
 	if(prize.get(i).getPrize()==2) {
 %>获得了头戴式蓝牙耳机<%
 	}
 %> <%
 	if(prize.get(i).getPrize()==3) {
 %>获得了360随身WiFi<%
 	}
 %> <%
 	if(prize.get(i).getPrize()==4) {
 %>获得了300个阅读点<%
 	}
 %>
					</span></li>
				
				<%
					}
						    	}
				%>
				</ul>
			</div>
			<script type="text/javascript">
				(function($) {
					$.fn.extend({
						Scroll : function(opt, callback) {
							//参数初始化
							if (!opt)
								var opt = {};
							var _btnUp = $("#" + opt.up);//Shawphy:向上按钮
							var _btnDown = $("#" + opt.down);//Shawphy:向下按钮
							var timerID;
							var _this = this.eq(0).find("ul:first");
							var lineH = _this.find("li:first").height(), //获取行高
							line = opt.line ? parseInt(opt.line, 10)
									: parseInt(this.height() / lineH, 10), //每次滚动的行数，默认为一屏，即父容器高度
							speed = opt.speed ? parseInt(opt.speed, 10) : 900; //卷动速度，数值越大，速度越慢（毫秒）
							timer = opt.timer //?parseInt(opt.timer,10):3000; //滚动的时间间隔（毫秒）
							if (line == 0)
								line = 1;
							var upHeight = 0 - line * lineH;
							//滚动函数
							var scrollUp = function() {
								_btnUp.unbind("click", scrollUp); //Shawphy:取消向上按钮的函数绑定
								_this.animate({
									marginTop : upHeight
								}, speed, function() {
									for (i = 1; i <= line; i++) {
										_this.find("li:first").appendTo(_this);
									}
									_this.css({
										marginTop : 0
									});
									_btnUp.bind("click", scrollUp); //Shawphy:绑定向上按钮的点击事件
								});

							}
							//Shawphy:向下翻页函数
							var scrollDown = function() {
								_btnDown.unbind("click", scrollDown);
								for (i = 1; i <= line; i++) {
									_this.find("li:last").show().prependTo(
											_this);
								}
								_this.css({
									marginTop : upHeight
								});
								_this.animate({
									marginTop : 0
								}, speed, function() {
									_btnDown.bind("click", scrollDown);
								});
							}
							//Shawphy:自动播放
							var autoPlay = function() {
								if (timer)
									timerID = window.setInterval(scrollUp,
											timer);
							};
							var autoStop = function() {
								if (timer)
									window.clearInterval(timerID);
							};
							//鼠标事件绑定
							_this.hover(autoStop, autoPlay).mouseout();
							_btnUp.css("cursor", "pointer").click(scrollUp)
									.hover(autoStop, autoPlay);//Shawphy:向上向下鼠标事件绑定
							_btnDown.css("cursor", "pointer").click(scrollDown)
									.hover(autoStop, autoPlay);

						}
					})
				})(jQuery);

				$(document).ready(function() {
					$("#demo1").Scroll({
						line : 4,
						speed : 1000,
						timer : 4000,
						up : "btn1",
						down : "btn2"
					});
				});
			</script>

		</div>
		<br /> <br /> <br /> <br /> <br /> <br /> <br />
		<p>中奖用户会在当期活动结束后 由客服统一通知，请耐心等待。</p>
	</div>



</body>
</html>
