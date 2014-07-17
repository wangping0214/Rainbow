// JavaScript Document
$(function(){
	if($.browser.msie && $.browser.version<=6)
	{
		$(".PopupLayer").css("position","absolute");
	}
	$(".PopupLayer").css({"top":$(".PopupLayer").outerHeight()*-1+"px","opacity":1});//载入页面时将元素置于页面可见区域的顶部达到自上而下显示效果（PS：还有隐藏效果）
	function notice_show()//显示
	{
		var browser_visible_region_height=document.documentElement.clientHeight;//获取浏览器可见区域高度
		var element_height=$(".PopupLayer").outerHeight();//获取元素高度:height+paelement_heighting+margin
		//计算元素显示时的top值
		var element_show_top=(browser_visible_region_height-element_height)/2;
		$(".PopupLayer").stop(true).animate({top:element_show_top,opacity:1},1800);
	}
	
/*	function notice_hidden()//隐藏
	{
		var element_height=$(".PopupLayer").outerHeight();//获取元素高度:height+paelement_heighting+margin
		var ee=-element_height;//元素隐藏时的top值
		$(".PopupLayer").stop(true).animate({top:ee,opacity:0},1000);
	}
	*/
	$("a.close").click(function(){
		var element_height=$(".PopupLayer").outerHeight();//获取元素高度:height+paelement_heighting+margin
		var ee=-element_height;//元素隐藏时的top值
		$(".PopupLayer").animate({opacity:0},1000).animate({top:ee},0);
	})//点击关闭按钮隐藏
	
	$("a.btn").click(function(){
		$(".PopupLayer").animate({top:$(document).height(),opacity:0},1000)
	})
	notice_show();
	/*$("#open").click(function(){
		
	})*///单击按钮触发显示
	
	$("#close").click(function(){
		notice_hidden();
	})//单击按钮触发隐藏
	
	function check()
	{
		var kk=$(".PopupLayer").outerHeight()*-1;//获取元素高度:height+paelement_heighting+margin
		var ww=$(document).height();
		var qq=parseInt($(".PopupLayer").css("top"));//获取元素当前的top值，String类型转换为number类型
		
		if(qq == kk || qq == ww)
		{
			return;
		}
		else//弹出层自适应浏览器窗口大小。
		{
			var browser_visible_region_height=document.documentElement.clientHeight;//获取浏览器可见区域高度
			var element_height=$(".PopupLayer").outerHeight();//获取元素高度:height+paelement_heighting+margin
			//计算元素显示时的top值
			var element_show_top=(browser_visible_region_height-element_height)/2;
			$(".PopupLayer").stop(true).animate({top:element_show_top},1500);
		}
	}
	
	$(window).resize(function(){
		check();
	})//自适应浏览器窗口大小
	
})