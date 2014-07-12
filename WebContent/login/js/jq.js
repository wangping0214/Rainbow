// JavaScript Document
  $(function(){
	  $(".smallList li:not(:first)").addClass("leftBorder");//except the first of li,others add leftborder
	  $("div.big > a:eq(0)").show().siblings().hide();//the first img show,others hide
	  var $imgs=$(".smallList li");
	  $imgs.click(function(){
	    //$(this).css("opacity","0.8").siblings.css("opacity","1");
		$(this).append("<div class='redLine'></div>").siblings().find("div").remove();
	    num=$(this).index();
		$(".big a").eq(num).show().siblings().hide();
	  
	  });	  	
    setInterval(function(){
		    indexnum=$(".smallList").find("li:has('div')").index()+1;	
			imgnum=$(".smallList").find("li").length;
			if(indexnum==imgnum){
				indexnum=0;
				}
				$(".smallList").find("li").eq(indexnum).trigger("click");
		  },7000);
	  
/*search2*/
	$(".type").focus(function(){
		if($(this).val()==this.defaultValue){
			$(this).val("");
			}
	}).blur(function(){
		if($(this).val()==""){
			$(this).val(this.defaultValue);
			}
	});
$(".sou2").focus(function(){
	  if($(this).val()==this.defaultValue){
		  $(this).val("");
		  }
	}).blur(function(){
		$(this).val(this.defaultValue);
		
		})
		
/*=====nav2=======*/
$(".mainnav li").click(function(){
	$(this).append("<div class='blueLine'></div>").siblings().find("div").remove();
	$(this).addClass("active").siblings().removeClass("active")
	})
/*========jujiaolist======*/
$(".xiazai").hide();
$(".jujiaolist dl").mouseover(function(){
	$(this).addClass("greybg").siblings().removeClass("greybg");
    $(this).find(".downnum").hide().siblings(".xiazai").show().parent("dl").siblings("dl").find(".xiazai").hide().siblings(".downnum").show();
  }).mouseout(function(){
	  $(this).find(".xiazai").hide().siblings(".downnum").show();
	  $(this).removeClass("greybg");
	  })

/*==========contright=====================*/
	var $lis=$(".sidelist li");
	$lis.each(function(){
		num4=$(this).index()+1;
		$(this).prepend("<span>"+num4+"</span>");
		if(num4<4)
		{
			$(this).find("span").addClass("redBg");  
		}
		else
		{
			$(this).find("span").addClass("blueBg2");
		}
		
		
		});
		
		
	var $lis2=$(".renqilist li");
	$lis2.each(function(){
		num5=$(this).index()+1;
		$(this).prepend("<span>"+num5+"</span>");
		
		});
/*==========*/
$(".sidelist").each(function(){
	$(this).find("li:last").addClass("border0")
	$(this).find("li:odd").addClass("libg")
	}) 
$(".sidelist:first").show().siblings(".sidelist").hide();
$(".sidenav li:first").addClass("bluebg").siblings("li").removeClass("bluebg");
$(".sidenav li").click(function(){
	$(this).addClass("bluebg").siblings("li").removeClass("bluebg");
	var linum=$(this).index();

	$(this).parent(".sidenav").siblings(".sidecont").find(".sidelist").eq(linum).show().siblings(".sidelist").hide()
	})
$(".sidelist li").mouseover(function(){
	 $(this).addClass("licurrent").siblings("li").removeClass("licurrent");
	$(this).children(".sidetit").hide().siblings(".detial").show().parents("li").siblings("li").children(".sidetit").show().siblings(".detial").hide();
  }).mouseout(function(){
	 $(this).children(".sidetit").show().siblings(".detial").hide();
	 $(this).removeClass("licurrent");
	  })
/*===wangyou======*/
$(".wyimg a:first").addClass("margin0")	  
	  });

$(function(){
/*	$(".classnav li:first").addClass("classbg").siblings("li").removeClass("classbg");
*/	$(".classlist:first").show().siblings(".classlist").hide();
	$(".classnav li").click(function(){
		$(this).addClass("classbg").siblings("li").removeClass("classbg");
		var classnum=$(this).index()
		$(".classlist").eq(classnum).show().siblings(".classlist").hide();
		})
/*-===renqipaihang====*/
$(".renqilist").each(function(){
	$(this).find("li:first").find("p").hide().siblings("dl").show().parent("li").siblings("li").find("p").show().siblings("dl").hide();
	})
$(".renqilist").each(function(){
	$(this).find("li").mouseover(function(){
	$(this).find("p").hide().siblings("dl").show().parent("li").siblings("li").find("p").show().siblings("dl").hide();
	})

	})
/*=====more2=====*/
	$numd=$(".dislist li:gt(1)");
	$numd.hide();
	$(".more2").click(function(){  //鼠标最好写经过大盒子a,因为如果写里面的span不容易准确的点击中
		if($numd.is(':visible')){
		$numd.hide();
		$(".more2").text("查看更多评论");
		
			}
		else{
			$numd.show();
		    $(".more2").text("收起");
			}
			return false;
		})
		
/*==E-zine==*/
$(".subnavcont li:first").addClass("licurrent").siblings("li").removeClass("licurrent");
$(".tuijian:first").show().siblings(".tuijian").hide();
$(".subnavcont li").click(function(){
	$(this).addClass("licurrent").siblings("li").removeClass("licurrent");
	var cnum=$(this).index();
	$(this).parents(".subnav").siblings(".tuijian").eq(cnum).show().siblings(".tuijian").hide();
	})
	
$(".emodel4 dl").eq(1).css({"margin-right": "0px"})

/*E-zinecont*/
$(".ago dl:first dd:gt(4):not(':last')").hide();
$(".ago dl:first dd:gt(4):not(':last')").hide().parent("dl").siblings("dl").find("dd").hide();

$(".ago dt").each(function(){
	$(this).click(function(){
		$enum=$(this).siblings("dd")
	if($enum.is(':visible')){
		$enum.hide()
		}
     else{
	$(this).siblings("dd:lt(4)").show().siblings(".emore").show()}
	return false;
	})
	$(this).siblings(".emore").click(function(){
		$(this).hide().siblings("dd").show();
		})
	})
	
/*个人中心*/
var $tlis=$(".toplist li");
$tlis.each(function(){
	var tlisnum=$(this).index()+1;
	if(tlisnum<10){
		$(this).prepend("<span>"+0+tlisnum+"</span>")
		}
		else{
			$(this).prepend("<span>"+tlisnum+"</span>")
			}
	
	
	})
$(".toplist dl").hide();
$(".toplist li").mouseover(function(){
	$(this).find(".yuan").hide().siblings("dl").show().parent("li").siblings("li").find("dl").hide().siblings(".yuan").show();
	$(this).find("span").addClass("yellowbg").parent("li").siblings("li").find("span").removeClass("yellowbg")
	}).mouseout(function(){
		$(this).find("dl").hide().siblings(".yuan").show();
		$(this).find("span").removeClass("yellowbg")
		})
/*change_info*/
$(".changenav li").click(function(){
	$(this).addClass("xiubg").siblings("li").removeClass("xiubg")
	})


	})
	