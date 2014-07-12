var oldTheme = null;
var oldIdx = -1;
var selectTheme = 0;
var themeLen;
var motionFlag = false;
var selectTheme = 0;



$(function ()
{
	themeLen = $(".theme_lst").find("li").length;

	
	$(".phone_theme").find("li").hide();

	$(".theme_lst").find("li").each( function ( i )
	{
		$(this).css({left:(84*i)-57});
		$(this).attr("pos", (84*i)-57);
		$(this).attr("idx", i);
	});

	$(".theme_tit").find(".btn").find("a").eq(0).attr("href", getThemePath(1, 0));
	$(".theme_tit").find(".btn").find("a").eq(1).attr("href", getThemePath(2, 0));


	addLeftDummy();
	addRightDummy();

	oldTheme = $(".phone_theme").find("li").eq(0);
	oldTheme.show();
	changeTheme(0, true);
	$(".theme_lst").find("a").css({"border":"none", "outline":"none"});
	$(".theme_lst").bind("mouseover", overArea);
	$(".theme_lst").bind("mouseout", outArea);
	themeTimer = setInterval(startTimer, 3000);

});


function overArea(e)
{
	clearInterval( themeTimer );
	//console.log("over");
}

function outArea(e)
{
	//console.log("out");

	themeTimer = setInterval(startTimer, 3000);
}

function startTimer()
{
	selectTheme++;
	changeTheme( selectTheme );
}



function addLeftDummy()
{
	for(var i = 0; i < 13; i++)
	{
		$(".theme_lst").append("<li class='leftDummy'><a href='javascript:changeTheme("+ -(i + 1) +");'><img src='images/theme_thumb"+(themeLen - i)+".jpg' /></a></li>");
		$(".theme_lst").find(".leftDummy").each( function ( i )
		{
			$(this).css({left:(-84 * (i+1))-57});
			$(this).attr("pos", (-84 * (i+1))-57);
			$(this).attr("idx", -(i + 1) );
		});
		
	}
}

function addRightDummy()
{
	for(var i = 0; i < 13; i++)
	{
		$(".theme_lst").append("<li class='rightDummy'><a href='javascript:changeTheme("+ ( i + themeLen ) +");'><img src='images/theme_thumb"+(i+1)+".jpg' /></a></li>");
		$(".theme_lst").find(".rightDummy").each( function ( i )
		{
			$(this).css({left:(84 * (i+themeLen))-57});
			$(this).attr("pos", (84 * (i+themeLen))-57);
			$(this).attr("idx", (i + themeLen) );
		});
		
	}
}



function changeTheme( idx, motion )
{
	

	if(motionFlag) return;

	var duration = 400;
	var idx2 = idx;

	if(motion)duration = 0;

	

	if(idx < themeLen && idx >= 0)
	{
		$(".theme_lst").stop().animate({left:-84*idx}, {duration:duration, easing:"easeInOutCubic", complete:function ()
		{
			motionFlag = false;
		}});
	}
	else 
	{
		$(".theme_lst").stop().animate({left:-84*idx}, {duration:duration, easing:"easeInOutCubic", complete:function ()
		{
			motionFlag = false;
			if(idx2 > themeLen-1 || idx2 < 0)
			{
				
				changeTheme(idx, true);
			}
			
		}});
	}

	$(".theme_lst").find("li").each( function ( i )
	{
		if(parseInt($(this).attr("idx")) == idx)
		{
			$(this).stop().animate({left:parseInt($(this).attr("pos"))}, {duration:duration, easing:"easeInOutCubic"});
		}
		else if(parseInt($(this).attr("idx")) > idx)
		{
			$(this).stop().animate({left:parseInt($(this).attr("pos"))+20}, {duration:duration, easing:"easeInOutCubic"});
		} 
		else 
		{
			$(this).stop().animate({left:parseInt($(this).attr("pos"))-90}, {duration:duration, easing:"easeInOutCubic"});
		}
	});

	if( motion ) return;


	if(idx > themeLen-1)	idx = idx - themeLen;
	if(idx < 0)				idx = themeLen + idx;
	

	var target = $(".phone_theme").find("li").eq(idx);
	if(idx2 > oldIdx)
	{
		oldTheme.stop().animate({left:-243}, {duration:duration, easing:"easeInOutCubic"});
		target.stop().show().css({left:243}).animate({left:0}, {duration:duration, easing:"easeInOutCubic"});
	}
	else 
	{
		oldTheme.stop().animate({left:243}, {duration:duration, easing:"easeInOutCubic"});
		target.stop().show().css({left:-243}).animate({left:0}, {duration:duration, easing:"easeInOutCubic"});
	}

	$(".theme_tit").find(".tit").find("img").attr("src", "images/theme_tit" + (idx+1) + ".gif");
	$(".theme_tit").find(".ico").find("img").attr("src", "images/ico_theme" + $(".theme_lst").find("li").eq(idx).find("a").attr("thema") + ".gif");
	$(".theme_tit").find(".btn").find("a").eq(0).attr("href", getThemePath(1, idx));
	$(".theme_tit").find(".btn").find("a").eq(1).attr("href", getThemePath(2, idx));

	selectTheme = idx;	
	oldTheme = target;
	oldIdx = idx;
	motionFlag = true;

}
