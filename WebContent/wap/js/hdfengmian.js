// JavaScript Document
$(function(){
	if($.browser.msie && $.browser.version<=6)
	{
		$(".PopupLayer").css("position","absolute");
	}
	$(".PopupLayer").css({"top":$(".PopupLayer").outerHeight()*-1+"px","opacity":1});//杞藉叆椤甸潰鏃跺皢鍏冪礌缃簬椤甸潰鍙鍖哄煙鐨勯《閮ㄨ揪鍒拌嚜涓婅�涓嬫樉绀烘晥鏋滐紙PS锛氳繕鏈夐殣钘忔晥鏋滐級
	function notice_show()//鏄剧ず
	{
		var browser_visible_region_height=document.documentElement.clientHeight;//鑾峰彇娴忚鍣ㄥ彲瑙佸尯鍩熼珮搴�
		var element_height=$(".PopupLayer").outerHeight();//鑾峰彇鍏冪礌楂樺害:height+paelement_heighting+margin
		//璁＄畻鍏冪礌鏄剧ず鏃剁殑top鍊�
		var element_show_top=45;
		$(".PopupLayer").stop(true).animate({top:element_show_top,opacity:1},1800);
	}
	
/*	function notice_hidden()//闅愯棌
	{
		var element_height=$(".PopupLayer").outerHeight();//鑾峰彇鍏冪礌楂樺害:height+paelement_heighting+margin
		var ee=-element_height;//鍏冪礌闅愯棌鏃剁殑top鍊�
		$(".PopupLayer").stop(true).animate({top:ee,opacity:0},1000);
	}
	*/
	$("a.close").click(function(){
		var element_height=$(".PopupLayer").outerHeight();//鑾峰彇鍏冪礌楂樺害:height+paelement_heighting+margin
		var ee=-element_height;//鍏冪礌闅愯棌鏃剁殑top鍊�
		$(".PopupLayer").animate({opacity:0},1000).animate({top:ee},0);
	})//鐐瑰嚮鍏抽棴鎸夐挳闅愯棌
	
	$("a.btn").click(function(){
		$(".PopupLayer").animate({top:$(document).height(),opacity:0},1000)
	})
	notice_show();
	/*$("#open").click(function(){
		
	})*///鍗曞嚮鎸夐挳瑙﹀彂鏄剧ず
	
	$("#close").click(function(){
		notice_hidden();
	})//鍗曞嚮鎸夐挳瑙﹀彂闅愯棌
	
	function check()
	{
		var kk=$(".PopupLayer").outerHeight()*-1;//鑾峰彇鍏冪礌楂樺害:height+paelement_heighting+margin
		var ww=$(document).height();
		var qq=parseInt($(".PopupLayer").css("top"));//鑾峰彇鍏冪礌褰撳墠鐨則op鍊硷紝String绫诲瀷杞崲涓簄umber绫诲瀷
		
		if(qq == kk || qq == ww)
		{
			return;
		}
		else//寮瑰嚭灞傝嚜閫傚簲娴忚鍣ㄧ獥鍙ｅぇ灏忋�
		{
			var browser_visible_region_height=document.documentElement.clientHeight;//鑾峰彇娴忚鍣ㄥ彲瑙佸尯鍩熼珮搴�
			var element_height=$(".PopupLayer").outerHeight();//鑾峰彇鍏冪礌楂樺害:height+paelement_heighting+margin
			//璁＄畻鍏冪礌鏄剧ず鏃剁殑top鍊�
			var element_show_top=(browser_visible_region_height-element_height)/2;
			$(".PopupLayer").stop(true).animate({top:element_show_top},1500);
		}
	}
	
	$(window).resize(function(){
		check();
	})//鑷�搴旀祻瑙堝櫒绐楀彛澶у皬
	
})