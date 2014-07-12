// JavaScript Document
$(function(){
	$(".close2").hide()
    $(".lovelist3 dl").mouseover(function(){
	     $(this).addClass("dlbog").siblings("dl").removeClass("dlbog");
	     $(this).find(".close2").show().parents("dl").siblings("dl").find(".close2").hide()
	    }).mouseout(function(){
			$(this).removeClass("dlbog");
	       $(this).find(".close2").hide()
			})
})