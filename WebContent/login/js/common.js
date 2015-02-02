// 모달팝업 띄우기 
$(function()
{
	/*************** mobile check - 2013.10.25 ***************/
	if( navigator.userAgent.match(/Android/i) || navigator.userAgent.match(/webOS/i) || navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i) || navigator.userAgent.match(/iPod/i) || navigator.userAgent.match(/BlackBerry/i) || navigator.userAgent.match(/Windows Phone/i) ){
		location.replace("http://m.launcherplanet.com/mobile/index.jsp");
	}
	/*************** mobile check - 2013.10.25 ***************/
	
	$(window).resize ( function()
	{
		var top = ($.browser.safari ) ? $("body").scrollTop() : $("html,body").scrollTop();
		var ww = $(".popupFrame").contents().find(".mainCon").width();
		try
		{
			var w = $("#wrap").position().left + $("#wrap").width()/2;
		}
		catch ( e )
		{
			var w = 0 + $("#wrap").width()/2;
		}
		
		var h = $(window).height();
		

		var modalWidth = $("#wrap").width();

		if( h < 650 )
		{
			h = 650;
			$(".modalPopupContainer").stop().css ( { left:w , top:h/2 + top } );
		}
		$(".modalPopupContainer").stop().css ( { left:w , top:h/2 + top } );
		

	} ).resize();	

	$(window).scroll ( function()
	{
		var top = ($.browser.safari ) ? $("body").scrollTop() : $("html,body").scrollTop();
		var ww = $(".popupFrame").contents().find(".mainCon").width();
		try
		{
			var w = $("#wrap").position().left + $("#wrap").width()/2 + $("html,body").scrollLeft();
		}
		catch ( e )
		{
			var w = $("html,body").scrollLeft() + $("#wrap").width()/2;
		}
		var h = $(window).height();

		if( h < 650 )
		{
			h = 650;
			$(".modalPopupContainer").stop().animate ( { left:w , top:h/2 + top } );	
		}
		$(".modalPopupContainer").stop().animate ( { left:w , top:h/2 + top } );

	} ).scroll();
	
} );

function openModalPopup ( url , ww , hh , isScroll ,func )
{
	modalFunc = func;
	var top = ($.browser.safari ) ? $("body").scrollTop() : $("html,body").scrollTop();
	var w = $("#wrap").position().left + $("#wrap").width()/2;
	var h = $(window).height();

	$(".modalPopupContainer").stop().css ( { left:w , top:h/2 + top } );
	var modalHeight = $(".mainContainer").height();
	

	if ( modalHeight < $(window).height() ) modalHeight = $(window).height()

	$(".modalBg").css ( { width:"100%" , height:"100%" , position:"fixed" , display:"block" , opacity:0.5 } );

	
	var iframeStr = '<iframe id="popupFrame" class="popupFrame" allowTransparency="true" width="1px" height="1px" src="' + url +'" scrolling="no" frameborder="0">';
	if ( isScroll ) var iframeStr = '<iframe id="popupFrame" class="popupFrame" background="#ff0000" width="0px" height="0px" src="' + url +'" scrolling="yes" frameborder="0">';
	$(".popupCon").empty().append ( iframeStr );
	$(".popupFrame").one ( "load" , popupLoadOk );

	function popupLoadOk ( e )
	{
		if ( ww || hh )
		{
			var w = ww;
			var h = hh;
		}
		else
		{
			var w = $(".popupFrame").contents().find(".mainCon").width();
			var h = $(".popupFrame").contents().find(".mainCon").height();
		}

		$(".popupFrame").css ( { width:w , height:1 } ).animate ( { width:w , height:h } , { duration:500 , easing:"easeInOutQuad" } );
		$(".popupCon").css ( { left:-w/2, top:0 } ).animate ( { left:-w/2 , top:-h/2 } , { duration:500 , easing:"easeInOutQuad" } );
	}
}

// 닫는법 : parent.closeModalPopup();
function closeModalPopup()
{
	$(".popupFrame").animate ( {  height:1  } , { duration:400 , easing:"easeInOutQuad" } );
	$(".popupCon").animate ( { top:0  } ,  { duration:400 , easing:"easeInOutQuad" , complete:closeModalPopupComplete } );

	function closeModalPopupComplete()
	{
		$(".popupCon").empty();
		$(".modalBg").css ( { display:"none" } );
		moveBanner();
	}
}


function getThemePath( type, idx )
{
	if(type == 1)
	{
		if(idx == 0)		return "http://www.tstore.co.kr/userpoc/game/viewProduct.omp?t_top=DP000503&dpCatNo=DP03007&insDpCatNo=DP03007&insProdId=0000643757&prodGrdCd=PD004401&stPrePageNm=DP03020&stActionPositionNm=06&stDisplayOrder=1";
		else if(idx == 1)	return "http://www.tstore.co.kr/userpoc/game/viewProduct.omp?t_top=DP000503&dpCatNo=DP03020&insDpCatNo=DP03020&insProdId=0000408104&prodGrdCd=PD004401&stPrePageNm=DP25002&stActionPositionNm=06&stDisplayOrder=1";
		else if(idx == 2)	return "http://www.tstore.co.kr/userpoc/game/viewProduct.omp?t_top=DP000503&dpCatNo=DP03020&insDpCatNo=DP03020&insProdId=0000411855&prodGrdCd=PD004401&stPrePageNm=DP25002&stActionPositionNm=06&stDisplayOrder=1";
		else if(idx == 3)	return "http://www.tstore.co.kr/userpoc/game/viewProduct.omp?t_top=DP000503&dpCatNo=DP03020&insDpCatNo=DP03020&insProdId=0000405519&prodGrdCd=PD004401&stPrePageNm=DP25002&stActionPositionNm=06&stDisplayOrder=1";
		else if(idx == 4)	return "http://www.tstore.co.kr/userpoc/game/viewProduct.omp?t_top=DP000503&dpCatNo=DP03020&insDpCatNo=DP03020&insProdId=0000411029&prodGrdCd=PD004401&stPrePageNm=DP25002&stActionPositionNm=06&stDisplayOrder=1";
		else if(idx == 5)	return "http://www.tstore.co.kr/userpoc/game/viewProduct.omp?t_top=DP000503&dpCatNo=DP03020&insDpCatNo=DP03020&insProdId=0000409354&prodGrdCd=PD004401&stPrePageNm=DP25002&stActionPositionNm=06&stDisplayOrder=2";
		else if(idx == 6)	return "http://www.tstore.co.kr/userpoc/game/viewProduct.omp?t_top=DP000503&dpCatNo=DP03020&insDpCatNo=DP03020&insProdId=0000405530&prodGrdCd=PD004401&stPrePageNm=DP25002&stActionPositionNm=06&stDisplayOrder=2";
		else if(idx == 7)	return "http://www.tstore.co.kr/userpoc/game/viewProduct.omp?t_top=DP000503&dpCatNo=DP03020&insDpCatNo=DP03020&insProdId=0000405582&prodGrdCd=PD004401&stPrePageNm=DP25002&stActionPositionNm=06&stDisplayOrder=1";
		else if(idx == 8)	return "http://www.tstore.co.kr/userpoc/game/viewProduct.omp?t_top=DP000503&dpCatNo=DP03020&insDpCatNo=DP03020&insProdId=0000411902&prodGrdCd=PD004401&stPrePageNm=DP25002&stActionPositionNm=06&stDisplayOrder=1";
		else if(idx == 9)	return "http://www.tstore.co.kr/userpoc/game/viewProduct.omp?t_top=DP000503&dpCatNo=DP03020&insDpCatNo=DP03020&insProdId=0000405537&prodGrdCd=PD004401&stPrePageNm=DP25002&stActionPositionNm=06&stDisplayOrder=1";
		else if(idx == 10)	return "http://www.tstore.co.kr/userpoc/game/viewProduct.omp?t_top=DP000503&dpCatNo=DP03020&insDpCatNo=DP03020&insProdId=0000411853&prodGrdCd=PD004401&stPrePageNm=DP25002&stActionPositionNm=06&stDisplayOrder=1";
		else if(idx == 11)	return "http://www.tstore.co.kr/userpoc/game/viewProduct.omp?t_top=DP000503&dpCatNo=DP03020&insDpCatNo=DP03020&insProdId=0000412717&prodGrdCd=PD004401&stPrePageNm=DP25002&stActionPositionNm=06&stDisplayOrder=1";
		else if(idx == 12)	return "http://www.tstore.co.kr/userpoc/game/viewProduct.omp?t_top=DP000503&dpCatNo=DP03020&insDpCatNo=DP03020&insProdId=0000411035&prodGrdCd=PD004401&stPrePageNm=DP25002&stActionPositionNm=06&stDisplayOrder=1";
		else if(idx == 13)	return "http://www.tstore.co.kr/userpoc/game/viewProduct.omp?t_top=DP000503&dpCatNo=DP03020&insDpCatNo=DP03020&insProdId=0000411850&prodGrdCd=PD004401&stPrePageNm=DP25002&stActionPositionNm=06&stDisplayOrder=1";
		else if(idx == 14)	return "http://www.tstore.co.kr/userpoc/game/viewProduct.omp?t_top=DP000503&dpCatNo=DP03020&insDpCatNo=DP03020&insProdId=0000411852&prodGrdCd=PD004401&stPrePageNm=DP25002&stActionPositionNm=06&stDisplayOrder=1";
	}
	else 
	{
		if(idx == 0)		return "https://play.google.com/store/apps/details?id=com.dlto.atom.sentimentalcity2";
		else if(idx == 1)   return "https://play.google.com/store/apps/details?id=com.dlto.atom.metallicblack";
		else if(idx == 2)   return "https://play.google.com/store/apps/details?id=com.dlto.atom.greathopes";
		else if(idx == 3)   return "https://play.google.com/store/apps/details?id=com.dlto.atom.molangballoontripinthesky";
		else if(idx == 4)   return "https://play.google.com/store/apps/details?id=com.dlto.atom.backpackingy";
		else if(idx == 5)   return "https://play.google.com/store/apps/details?id=com.dlto.atom.molanggreengreenasktheearth";
		else if(idx == 6)   return "https://play.google.com/store/apps/details?id=com.dlto.atom.shinzikatohgirlandredbird";
		else if(idx == 7)   return "https://play.google.com/store/apps/details?id=com.dlto.atom.whitesoftbear";
		else if(idx == 8)   return "https://play.google.com/store/apps/details?id=com.dlto.atom.shiningstar";
		else if(idx == 9)   return "https://play.google.com/store/apps/details?id=com.dlto.atom.pinkpongpongisasleepyhead";
		else if(idx == 10)  return "https://play.google.com/store/apps/details?id=com.dlto.atom.theme.cb.skygarden";
		else if(idx == 11)  return "https://play.google.com/store/apps/details?id=com.dlto.atom.moderninterior2";
		else if(idx == 12)  return "https://play.google.com/store/apps/details?id=com.dlto.atom.budapest";
		else if(idx == 13)  return "https://play.google.com/store/apps/details?id=com.dlto.atom.betterthingsarecoming";
		else if(idx == 14)  return "https://play.google.com/store/apps/details?id=com.dlto.atom.vincentvangogh";
	}
}


