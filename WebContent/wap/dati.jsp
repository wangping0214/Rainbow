<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>柴米游戏-中国第一手游杂志</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>无标题文档</title>
<link href="css/huodong.css" rel="stylesheet" type="text/css" />

<script src="js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript">
$(document).ready(function(){
	
	$("#submit").click(function(){
		var first = $('input[name="firstQuestion"]:checked').val();
		var second = $('input[name="secondQuestion"]:checked').val();
		var third = $('input[name="thridQuestion"]:checked').val();
		var isRight = true;
		if(first!="1")
			isRight = false;
		if(second!="3")
			isRight = false;
		if(third!="4")
			isRight = false;
		if(isRight){
			alert("恭喜你！！回答正确，完成下列信息就可以参加抽奖活动！")
			location.href="information.jsp";
		}
		else{
			alert("对不起，题目回答错误！");
			location.href="index.jsp";
		}
	});
});
</script>
</head>

<body>
<div class="cont">
<img src="image/dtbg_02.jpg" width="100%"/>
<div class="question">
   <h2 class="dttit">暑期活动问答</h2>
   <dl>
       <dt>1、 在《柴米游戏》手机官网中下载应用如何计费？</dt>
       <dd><input type="radio" name="firstQuestion" value="1" />联通3G免流量下载</dd>
       <dd><input type="radio" name="firstQuestion" value="2" />按流量大小计费</dd>
       <dd><input type="radio" name="firstQuestion" value="3" />按客户端大小计费</dd>
       <dd><input type="radio" name="firstQuestion" value="4" />按下载时常计费</dd>
   </dl>
   <dl>
       <dt>2、 "柴米游戏"中的《柴米游言》杂志第十二期中有几款游戏提供下载？</dt>
       <dd><input type="radio" name="secondQuestion" value="1" />10款</dd>
       <dd><input type="radio" name="secondQuestion" value="2" />11款</dd>
       <dd><input type="radio" name="secondQuestion" value="3" />12款</dd>
       <dd><input type="radio" name="secondQuestion" value="4" />13款</dd>
   </dl>
   <dl>
       <dt>3、 "柴米游戏"中的《柴米游言》杂志第十二期中游戏下载位置？</dt>
       <dd><input type="radio" name="thridQuestion" value="1" />左上角</dd>
       <dd><input type="radio" name="thridQuestion" value="2" />右上角</dd>
       <dd><input type="radio" name="thridQuestion" value="3" />左下角</dd>
       <dd><input type="radio" name="thridQuestion" value="4" />右下角</dd>
   </dl>
   <div class="tijiao"><input type="submit" id="submit" value="提交" /></div>
</div>

</div>
</body>
</html>
