// JavaScript Document
$(function(){
	$(".type").focus(function(){
		if($(this).val()==this.defaultValue){
			$(this).val("");
			}
		}).blur(function(){
			if($(this).val()==""){
				$(this).val(this.defaultValue)
				
				}
			
		})
		$(".password").focus(function(){
		if($(this).val()==this.defaultValue){
			$(this).val("");
			}
		}).blur(function(){
			if($(this).val()==""){
				$(this).val(this.defaultValue)
				
				}
				
/*guanlishenhe*/

			
		})
		


  $(".amend").click(function(){
	  var $cont=$(this).parents("tr").next("tr").find(".jjcont")
	  if($cont.is(":visible")){
		 $cont.hide();

		  } 
		else{
		 $cont.show().parent("tr").siblings("tr").find(".jjcont").hide();
			} 
	  })
	 
	 $(".addcont").hide();
	 $(".newaddbut").click(function(){
		 $(this).siblings(".addcont").show();
		 
		 })
	$(".close").click(function(){
		$(this).parent(".addcont").hide();
		})
	/*=====self_test=====*/ 
	$(".buton2").hide();
	$(".tishi").hide();
$(".buton1").click(function(){
	$inval=$(this).siblings(".inputs");
	if($inval.val()==""){
		$(".tishi").show();
		}
		else{
	   $(this).siblings(".inputs").attr("disabled","disabled");
	   $(this).hide().siblings(".buton2").show();
	   $(".tishi").hide();
	   $(".buton2").click(function(){
		   $(this).siblings(".inputs").removeAttr("disabled");
		   $(this).hide().siblings(".buton1").show();
		   })
	    }

})
	})