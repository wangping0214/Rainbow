<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改个人开发者信息</title>
<link href="<%=request.getContextPath()%>/developer/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/developer/css/qiye.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"src="<%=request.getContextPath()%>/developer/js/jquery.min.js"></script>
<script type="text/javascript"src="<%=request.getContextPath()%>/developer/js/nav.js"></script>
<script language="javascript" type="text/javascript">  
</script> 
<script type="text/javascript">
$(document).ready
(
		function()
		{
			check();
			$("#password_form").submit(checkSubmit);
		}
);
function checkSubmit(){
	if(isOldpasswordExists&&isPasswordExists&&isrePasswordExists&&isAllExists){
		alert("恭喜您,修改密码成功! ");
		return true;
	}
	else {
		alert("很遗憾,请确认填写信息是否符合要求! ");
		return false;
		}
}
var isPasswordExists=false;var isrePasswordExists=false;var isAllExists=false;var isOldpasswordExists=false;
function check(){
	$("#oldpassword").blur(function(){
		var inoldpassword = $("#oldpassword").val();
		if(inoldpassword!=<%=session.getAttribute("password")%>){
			alert("原密码输入错误，请重新输入！");
			return isOldpasswordExists =false;
		}
		else{
			return isOldpasswordExists =true;
		}
	});
	$("#newpassword").blur(function(){
		var inpassword = $("#newpassword").val();
		
		if(inpassword!=""){
			var reg=/^(?!_)(?!.*?_$)[a-zA-Z0-9_]+$/;
			if(!reg.test(inpassword)){
				alert("密码格式提醒：6~20位的字母、数字和下划线组成且首尾不能为下划线");
				return isPasswordExists =false;
			}
			else if(inpassword.length<6||inpassword.length>20){
				alert("密码格式提醒：6~20位的字母、数字和下划线组成且首尾不能为下划线");
				return isPasswordExists =false;
			}
			else{
				return isPasswordExists=true;
			}
		}
		else {
			return isPasswordExists =false;
		}
		});
	$("#renewpassword").blur(function(){
		var inpassword=$("#newpassword").val();
		var inrepassword=$("#renewpassword").val();
		ispass(inpassword,inrepassword);
	});

	$("#password_submit").click(function(){
		var oldpassword=$("#oldpassword").val();var password=$("#newpassword").val();
		var repassword=$("#renewpassword").val();
		if(password==""||repassword==""||oldpassword==""){
			alert("友情提示： * 为必填信息 ！");
			return isAllExists=false;
		}
		else if(oldpassword=newpassword){
			alert("新密码和原密码相同，无需修改！");
			return isAllExists=false;
		}
		else isAllExists=true;
	});
}
function ispass(inpassword,inrepassword){
	if(inpassword!=inrepassword){
		alert("两次输入密码不一致！");
		return isrePasswordExists=false;
	}
	else {
		return isrePasswordExists=true;
	}
}

</script>
</head>

<body>
<div class="body">
<div class="content">
     <div class="search">
               <div class="searchcont">
                   <input type="text" value="搜索" class="socont fl"/><input type="submit" value="" class="sobut fr"/>
               </div>
               <!--searchcont-->
      </div>
     <div class="midcont">
                  <div class="list"> 
                      <h3 class="tit9s">修改密码</h3>
					<form id="password_form" name="password_form" method="post" action="<%=request.getContextPath()%>/modify_password.action"enctype="multipart/form-data" >
                      <div class="xiugaimm">
                         <div><label>当前密码：</label><input type="password" id="oldpassword"/></div>
                         <div><label>新密码：</label><input type="password" id="newpassword"name="user.password"/></div>
                         <div><label>确认密码：</label><input type="password"id="renewpassword" /></div>
                         <div class="baocun"><input type="Submit" id="password_submit"value="保存" /></div>
                     </div>
                     </form>
                     <!--zhuceform-->                      
               </div>        
                
     </div>
     <!--midcont-->
 </div>
 </div>

<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
