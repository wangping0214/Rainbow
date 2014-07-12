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
   
   /*zhuce*/
   $(".zcnav li:first").addClass("bg").siblings("li").removeClass("bg");
   $(".zhuce:first").show().siblings(".zhuce").hide()
   $(".zcnav li").click(function(){
	   $(this).addClass("bg").siblings("li").removeClass("bg");
	   var zhucenum=$(this).index();
	   $(".zhuce").eq(zhucenum).show().siblings(".zhuce").hide()
	   })
/*yonghuleixing*/
   $(".leixingnav li:first").addClass("over").siblings("li").removeClass("over");

   $(".guanggaocont:first").show().siblings(".guanggaocont").hide()
   $(".leixingnav li").click(function(){
	   $(this).addClass("over").siblings("li").removeClass("over");
	   var zhucenum=$(this).index();
	   $(this).parents(".leixing").siblings(".guanggaocont").eq(zhucenum).show().siblings(".guanggaocont").hide()
	   })
	   
	  $(".leixingnav2 li").click(function(){
	   $(this).addClass("over").siblings("li").removeClass("over");
	   }) 
	   
$(".touxiang").mouseover(function(){
	$(this).siblings(".yonghu").show();
	}).mouseout(function(){
		$(this).siblings(".yonghu").hide();
		})
$(".yonghu").mousemove(function(){
	$(this).show();
	}).mouseout(function(){
		$(this).hide();
		
		})
		
/*消息通知*/
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

	})