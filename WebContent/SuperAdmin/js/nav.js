// JavaScript Document
$(function(){
	

$(".optiton li").click(function(){
	$(this).addClass("bg").siblings("li").removeClass("bg");
	
	})
	
/*$(".shenhenav li:first").addClass("red").siblings("li").removeClass("red");*/
$(".b2:first").show().siblings(".b2").hide()
$(".shenhenav li").click(function(){
	var shlinum=$(this).index();
	$(this).addClass("red").siblings("li").removeClass("red");
	$(this).parent(".shenhenav").siblings(".b2").eq(shlinum).show().siblings(".b2").hide()
   })

$(".paimingnav li:first").addClass("blue").siblings("li").removeClass("blue");
$(".b2:first").show().siblings(".b2").hide()
$(".paimingnav li").click(function(){
	var shlinum=$(this).index();
	$(this).addClass("blue").siblings("li").removeClass("blue");
	$(this).parent(".paimingnav").siblings(".b2").eq(shlinum).show().siblings(".b2").hide()
   })

$(".guanggaonav li:first").addClass("blue").siblings("li").removeClass("blue");
$(".guanggaocont:first").show().siblings(".guanggaocont").hide()
$(".guanggaonav li").click(function(){
	var shlinum=$(this).index();
	$(this).addClass("blue").siblings("li").removeClass("blue");
	$(this).parent(".guanggaonav").siblings(".guanggaocont").eq(shlinum).show().siblings(".guanggaocont").hide()
   })
   $(".fengting").each(function(){
	   $(this).find("input").eq(1).addClass("bgs").siblings("input").removeClass("bgs");
	   })
  $(".fengting input").click(function(){
	   $(this).addClass("bgs").siblings("input").removeClass("bgs"); 
	 })

		
/*Ê∂àÊÅØÈÄöÁü•*/
$(".messcont").hide();
$(".newlist .mtit2").click(function(){
	$content=$(this).siblings(".messcont");
	  if($content.is(":visible")){
		   $content.hide();
	   }
	   else{
		    $content.show();
			$(this).parent("li").siblings("li").find(".messcont").hide();
		   }


	})
/*========sdk=========*/	
	$(".lianlist li").each(function(){
		var lian=$(this).index()+1;
		$(this).prepend("<span class='liannum'>"+lian+"</span>")
		})
	
$(".newadd").click(function(){
	$(this).siblings(".xinzeng").show();
	$(".sdkcolse").click(function(){
	  $(this).parent(".xinzeng").hide()	
	})
	})	
	/*ÕÀ≥ˆµ«¬º*/
	   
	    var tou=document.getElementById("touxiang");
		var tuichu=	document.getElementById("tuichu");
		var timer=null;
		 tou.onmouseover=function(){
			 clearInterval(timer);
		   	tuichu.style.display="block"; 
		 }
		 tou.onmouseout=function(){
			 timer=setTimeout(function(){
				tuichu.style.display="none"; 
				 
			},1000) 
		 }
		 tuichu.onmouseover=function(){
		   clearTimeout(timer);	 
	     }
		 tuichu.onmouseout=function(){
		   	timer=setTimeout(function(){
			tuichu.style.display="none";  	
		 },500)
		}
	
	/*ÕÀ≥ˆend*/
	})