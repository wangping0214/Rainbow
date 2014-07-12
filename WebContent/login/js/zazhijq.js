// JavaScript Document
$(function(){
		$('.main').css('left','-155px');
	
	var expanded = true;
	
	$('.bar').click(function(){
		if(expanded){
			$('.main').animate({left:'0'},500);
		}else{
			$('.main').animate({left:'-155px'},500);
		}
		expanded = !expanded;
	});
	
	
	
	/*$(".econtleft2").hide();
	//offset()获取当前元素基于浏览的位置
	var offsettop=$(".wangqi").offset().top;
	var offsetleft=$(".wangqi").offset().left;
	
	//position()获取当前元素基于父容器的位置 
	var positiontop=$(".wangqi").position().top;
	var positionleft=$(".wangqi").position().left;   
	  
	//设置panel2的位置基于unamespan的坐标 
	
	$(".wangqi").mouseover(function(){
		$(this).parent(".econt2").siblings(".econtleft2").show().css({position: "absolute",'top':offsettop,'left':offsetleft-158,'z-index':2});
		
		
		})
 $(".econtleft2").mousemove(function(){
		$(this).show().css({position: "absolute",'top':offsettop,'left':offsetleft-158,'z-index':2});
		})
	$(".econtleft2").mouseout(function(){
		$(this).hide()


		})
	*/




	





	
	})