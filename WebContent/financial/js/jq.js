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
		


	})