// JavaScript Document
  $(function(){


/*E-zinecont*/


$(".ago").find("dl").each(function(){
	$(".ago dl:first dd:gt(1):not(':last')").hide().parent("dl").siblings("dl").find("dd").hide();
	var ddnums=$(this).find("dd").length;
	if(ddnums>2){
		$(this).append("<dd class='emore'><a href='#'><img src='../images/ec_14.jpg' /></a></dd>")
		}
	$(this).find("dt").each(function(){
	$(this).click(function(){
		$enum=$(this).siblings("dd")
	   if($enum.is(':visible')){
		$enum.hide()
		}
     else{
	$(this).siblings("dd:lt(2)").show().siblings(".emore").show()}
	return false;
	})
	$(this).siblings(".emore").click(function(){
		$(this).hide().siblings("dd").show();
		})
	})
	
	})

	

	})
	