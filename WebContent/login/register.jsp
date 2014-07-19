<%@ page language="java" import="com.rainbow.entity.User" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import = "java.io.*" %><%@ page import = "java.net.*" %><%@ page import = "java.util.*" %><%@ page import = "java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>注册</title>
<link href="<%=request.getContextPath()%>/login/style/style.css" rel="stylesheet" type="text/css" /><!--为尾部-->
<link href="<%=request.getContextPath()%>/login/style/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"src="<%=request.getContextPath()%>/login/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript"src="<%=request.getContextPath()%>/login/js/nav.js"></script>
<script type="text/javascript"src="<%=request.getContextPath()%>/login/js/jq.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
var isEmailUsername =false;var isEmailEmail =false;var isEmailPassword =false;
var isEmailRepassword=false;var isEmailAll=false;
var isTelUsername =false;var isTelTelephone =false;var isTelPassword =false;
var isTelRepassword=false;var isTelAll=false;var codeRight = false;
var mobile_code ;
$(document).ready(function(){
			email_check();
			$("#email_submit").click(function(){
				if(!checkSubmit0())
					return false;					
				jQuery.ajax({
						type:"post",
						url:"checkVerificationCode.action",
						data:{"code":$("#email_cade_id").val()},
						success:function(data){
							if(data=="0"){
								alert("验证码输入错误！");
								return false;
							}
							else{
								alert("恭喜您,注册成功!点击“确定”返回登陆页面。 ");
								$("#email_form").submit();
								return true;
							}
						}
					});

			}
	);
			
			
			tel_check();
			$("#tel_submit").click(function(){
				if(!checkSubmit1())
					return false;
				if($("#mobile_code").val()!=mobile_code){
					alert("验证码错误！");
					return false;
				}
				else{
					alert("恭喜您,注册成功!点击“确定”返回登陆页面。 ");
					$("#tel_form").submit();
					return true;
				}
					
			});
			
			
		}
);

function getVerificationCode(){
	jQuery.ajax({
		type : "post",
		url :	"<%=request.getContextPath()%>/getVerificationCode.action",
		
	});
}

function checkSubmit0(){
	if(isEmailUsername&&isEmailEmail&&isEmailPassword&&isEmailRepassword){
		
		return true;
		
	}
	else {
		alert("很遗憾,请确认填写信息是否符合要求! ");
		return false;
		}
}
function checkSubmit1(){
	if(isTelUsername&&isTelTelephone&&isTelPassword&&isTelRepassword&&isTelAll){
		
		return true;
	}
	else {
		alert("很遗憾,请确认填写信息是否符合要求! ");
		return false;
		}
}

function email_check(){
	$("#email_username").blur(function(){
	var inusername = $("#email_username").val();
	if(inusername!=""){
		var reg=/^[\u4E00-\u9FA5A-Za-z0-9_]+$/;
		if(!reg.test(inusername)){
			$("#email_username").text(function(){
				$("#email_username_div").text("昵称只能输入中文、英文、数字 ");
			});
			return isEmailUsername =false;
		}
		else if(inusername.length<4||inusername.length>20){
			
			$("#email_username").text(function(){
				$("#email_username_div").text(" 昵称长度为：4~20个字符");
			});
			return isEmailUsername =false;
		}
		else js_email_username();
	}
	else {
		$("#email_username_div").text("用户名不能为空 ");
		return isEmailUsername =false;
	}
	});
	$("#email_email").blur(function(){
		var inemail = $("#email_email").val();
		if(inemail!=""){
			 var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
	          if (!reg.test(inemail)) {
	        	  $("#email_email").text(function(){
	      			$("#email_email_div").text("邮箱格式不正确，请输入正确的邮箱");
	      		});
	             return isEmailEmail =false;
	             }
	          else js_email_email();
		}
		else{
			$("#email_email_div").text("邮箱不能为空 ");
			return isEmailEmail =false;
		}
	});
	$("#email_password").blur(function(){
		var inpassword = $("#email_password").val();
		
		if(inpassword!=""){
			var reg=/^(?!_)(?!.*?_$)[a-zA-Z0-9_]+$/;
			if(!reg.test(inpassword)){
				$("#email_password").text(function(){
					$("#email_password_div").text("密码只能输入英文数字下划线,区分大小写");
				});
				return isEmailPassword =false;
			}
			else if(inpassword.length<6||inpassword.length>20){
				
				$("#email_password").text(function(){
					$("#email_password_div").text("密码应为6~20个字符，区分大小写");
				});
				return isEmailPassword =false;
			}
			else{
				$("#email_password_div").text("密码格式正确！");
				return isEmailPassword=true;
			}
		}
		else {
			$("#email_password_div").text("密码不能为空 ");
			return isEmailPassword =false;
		}
		});
	$("#email_repassword").blur(function(){
		var inpassword=$("#email_password").val();
		var inrepassword=$("#email_repassword").val();
		ispass0(inpassword,inrepassword);
	});
	
}
function js_email_username()
{
	var inusername = $("#email_username").val();
	jQuery.ajax
	(
		{
			type : "post",
			url : "<%=request.getContextPath()%>/checkusername.action",
			data : "inusername=" + inusername,
			cache : false,
			success : function(response)
			{
				if(response=="0"){
					$("#email_username_div").html("此用户名可用!");
					isEmailUsername=true;
				}
				else{
					
					$("#email_username_div").html("此用户名已被注册!");
					isEmailUsername=false;
				}
				//$("#id_username_div").html(response);
			}
		}
	);
}

function js_email_email()
{
	var inemail = $("#email_email").val();
	jQuery.ajax
	(
		{
			type : "post",
			url : "<%=request.getContextPath()%>/checkemail.action",
			data : "inemail=" + inemail,
			cache : false,
			success : function(response)
			{
				
				if(response=="0"){
					$("#email_email_div").html("此邮箱可用!");
					isEmailEmail =true;
				}
				else{
					$("#email_email_div").html("此邮箱已被注册!");
					isEmailEmail =false;
				}
			}
		}
	);
}
function ispass0(inpassword,inrepassword){
	if(inpassword!=inrepassword){
		$("#email_repassword_div").text("两次输入密码不一致！");
		return isEmailRepassword=false;
	}
	else {
		$("#email_repassword_div").text("两次输入密码相同！");
		return isEmailRepassword=true;
	}
}


function tel_check(){
	$("#tel_telephone").blur(function(){
		var intelephone=$("#tel_telephone").val();
		if(intelephone!=""){
			var reg=/^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/;
			if(!reg.test(intelephone)){
				$("#tel_telephone").text(function(){
					$("#tel_telephone_div").text("请输入正确的手机号");
				});
				return isTelTelphone =false;
			}
			else return js_tel_telephone();
		}
		else {
			$("#tel_telephone").text(function(){
				$("#tel_telephone_div").text("手机号不能为空");
			});
			return isTelTelphone =false;
		}
	});
	$("#tel_username").blur(function(){
	var inusername = $("#tel_username").val();
	if(inusername!=""){
		var reg=/^[\u4E00-\u9FA5A-Za-z0-9_]+$/;
		if(!reg.test(inusername)){
			$("#tel_username").text(function(){
				$("#tel_username_div").text("昵称只能输入中文、英文、数字");
			});
			return isTelUsername =false;
		}
		else if(inusername.length<4||inusername.length>20){
			
			$("#tel_username").text(function(){
				$("#tel_username_div").text("昵称长度为：4~20个字符");
			});
			return isTelUsername =false;
		}
		else js_tel_username();
	}
	else {
		$("#tel_username_div").text("用户名不能为空 ");
		return isTelUsername =false;
	}
	});

	$("#tel_password").blur(function(){
		var inpassword = $("#tel_password").val();
		
		if(inpassword!=""){
			var reg=/^(?!_)(?!.*?_$)[a-zA-Z0-9_]+$/;
			if(!reg.test(inpassword)){
				$("#tel_password").text(function(){
					$("#tel_password_div").text("密码只能输入字母数字下划线,区分大小写");
				});
				return isTelPassword =false;
			}
			else if(inpassword.length<6||inpassword.length>20){
				
				$("#tel_password").text(function(){
					$("#tel_password_div").text("密码长度为6~20位");
				});
				return isTelPassword =false;
			}
			else{
				$("#tel_password_div").text("密码格式正确！");
				return isTelPassword=true;
			}
		}
		else {
			$("#tel_password_div").text("密码不能为空 ");
			return isTelPassword =false;
		}
		});
	$("#tel_repassword").blur(function(){
		var inpassword=$("#tel_password").val();
		var inrepassword=$("#tel_repassword").val();
		ispass1(inpassword,inrepassword);
	});
	
	$("#tel_submit").click(function(){
		var username=$("#tel_username").val();var password=$("#tel_password").val();
		var repassword=$("#tel_repassword").val();var telephone=$("#tel_telephone").val();
		if(username==""||password==""||repassword==""||telephone==""){
			alert("友情提示： * 为必填信息 ！");
			return isTelAll=false;
		}
			
		else isTelAll=true;
	});
}
function js_tel_username()
{
	var inusername = $("#tel_username").val();
	jQuery.ajax
	(
		{
			type : "post",
			url : "<%=request.getContextPath()%>/checkusername.action",
			data : "inusername=" + inusername,
			cache : false,
			success : function(response)
			{
				if(response=="0"){
					$("#tel_username_div").html("此用户名可用!");
					isTelUsername=true;
				}
				else{
					$("#tel_username_div").html("此用户名已被注册!");
					isTelUsername=false;
				}
				//$("#id_username_div").html(response);
			}
		}
	);
}
function js_tel_telephone()
{
	var intelephone = $("#tel_telephone").val();
	jQuery.ajax
	(
		{
			type : "post",
			url : "<%=request.getContextPath()%>/checktelephone.action",
			data : "intelephone=" + intelephone,
			cache : false,
			success : function(response)
			{
				if(response=="0"){
					$("#tel_telephone_div").html("此手机号可用!");
					isTelTelephone =true;
				}
				else{
					$("#tel_telephone_div").html("此手机号已被注册");
					isTelTelephone =false;
				}
			}
		}
	);
}
function ispass1(inpassword,inrepassword){
	if(inpassword!=inrepassword){
		$("#tel_repassword_div").text("两次输入密码不一致！");
		return isTelRepassword=false;
	}
	else {
		$("#tel_repassword_div").text("两次输入密码相同！");
		return isTelRepassword=true;
	}
}

	function get_mobile_code(){
		mobile_code = <%=(int)((Math.random()*9+1)*100000)%>;
        $.post('sms.jsp', {mobile:jQuery.trim($('#tel_telephone').val()),mobile_code:mobile_code}, function(msg) {
				RemainTime();

        });
	};
	var iTime = 300;
	var Account;
	function RemainTime(){
		document.getElementById('zphone').disabled = true;
		var iSecond,sSecond="",sTime="";
		if (iTime >= 0){
			iSecond = parseInt(iTime%60);
			iMinute = parseInt(iTime/60);
			if (iSecond >= 0){
				if(iMinute>0){
					sSecond = iMinute + "分" + iSecond + "秒";
				}else{
					sSecond = iSecond + "秒";
				}
			}
			sTime=sSecond;
			if(iTime==0){
				clearTimeout(Account);
				sTime='获取手机验证码';
				iTime = 59;
				document.getElementById('zphone').disabled = false;
			}else{
				Account = setTimeout("RemainTime()",1000);
				iTime=iTime-1;
			}
		}else{
			sTime='没有倒计时';
		}
		document.getElementById('zphone').value = sTime;
	}
</script>
</head>

<body>
<div  class="mainCon">
	<div  id="wrap">
        <div id="header">
            <div class="nav">
                <a href="<%=request.getContextPath()%>/login/index.jsp" class="fl"><img src="<%=request.getContextPath()%>/login/images/im_02.jpg" /></a>
                <div class="fr navright">
                    <%User user = (User)session.getAttribute("user"); 
       	if(user==null){
       %>
       <div class="huiyuan fr"><p><a href="<%=request.getContextPath()%>/login/login.jsp">登录</a>|<a href="<%=request.getContextPath()%>/login/register.jsp">注册</a></p></div>
       <%}
       	else{%>
       	<div class="huiyuan fr"><a href="#" class="tou"><img src="images/tj_11.jpg" /></a><p><a href="" id="id_exit">退出</a></p></div>
       	<%} %>
                    <div class="search2s fl">
                        <input type="text" value="搜索安卓软件和游戏" class="sou2"/>
                        <input type="button" value="" class="soubut" />
                   </div>
                </div>
                <!--navright-->
            </div>
            <!--nav-->
        </div>
        <!--header-->
        <div class="zccont">
    <ul class="zcnav">
       <li class="li1">邮箱注册</li>
       <li class="li2">手机注册</li>
    </ul>
    <div class="zhuce">
     <form id="email_form" name="email_form" method="post" action="email_register.action">
        <div class="zhuceform"><table>
           <tr>
           <td><div><label>&nbsp;邮&nbsp;&nbsp;&nbsp;箱&nbsp;：</label><input type="text" size="25" id="email_email" name="user.email"/></div></td>
           </tr>
           <tr>
           <td><div><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><p id="email_email_div">请填写正确的邮箱</p></div></td>
           </tr>
           <tr>
           <td><div><label>&nbsp;昵&nbsp;&nbsp;&nbsp;称&nbsp;：</label><input type="text" size="25" id="email_username" name="user.username" /></div></td>
           
           </tr>
           <tr>
           		<td><div><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><p id="email_username_div">昵称长度为：4~20个字符</p></div></td>
           </tr>
           <tr>
           <td><div><label>&nbsp;密&nbsp;&nbsp;&nbsp;码&nbsp;：</label><input type="password" size="25" id="email_password" name="user.password" /></div></td>
           
           </tr>
           <tr>
           		<td><div><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><p id="email_password_div">密码应为6~20个字符，区分大小写</p></div></td>
           </tr>
           <tr>
           <td><div class="border0"><label>确认密码：</label><input type="password" size="25" id="email_repassword" /></div></td>
          
           </tr>
           <tr>
           		 <td><div><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><p id="email_repassword_div" class="warning"></p></div></td>
           </tr>
            </table>
        </div>
        <!--zhuceform-->
        <div class="yanzheng">
            <div class="ma"><div><label>验证码：</label><input type="text" id="email_cade_id" /></div><p><img src="getVerificationCode()" /><a href="javascript:location.reload();"><img src="<%=request.getContextPath()%>/login/images/sx.png" /></a></p></div>
            <div class="gree"><input type="checkbox" checked="checked" />我已经阅读并同意<span class="red">《柴米用户服务条数》</span><a href="use_item.jsp">详情阅读</a></div>
        </div>
        <div class="zcbut"><input type="button"id="email_submit"  value="马上注册"/></div>
        <!--yanzheng-->
        </form>
       
    </div>
    <!--zhuce-->
    <div class="zhuce">
    <form id="tel_form" name="tel_form" method="post" action="<%=request.getContextPath()%>/tel_register.action">
        <div class="zhuceform"><table>
           <tr>
           <td><div><label>手机号码：</label><input type="text"id="tel_telephone" name="user.telephone" /></div></td>         
           </tr>
           <tr>
           <td><div><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><p id="tel_telephone_div">请填写正确的手机号</p></div></td>
           </tr>
           <tr>
           <td><div><label>&nbsp;昵&nbsp;&nbsp;&nbsp;称&nbsp;：</label><input type="text"id="tel_username" name="user.username" /></div></td>
           </tr>
           <tr>
           <td><div><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><p id="tel_username_div">昵称长度为：4~20个字符</p></div></td>
           </tr>
           <tr>
           <td><div><label>&nbsp;密&nbsp;&nbsp;&nbsp;码&nbsp;：</label><input type="password" id="tel_password" name="user.password"/></div></td>
           </tr>
           <tr>
           <td><div><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><p id="tel_password_div">密码应为6~20个字符，区分大小写</p></div></td>
           </tr>
           <tr>
           <td><div class="border0"><label>确认密码：</label><input type="password"id="tel_repassword" /></div></td>
           </tr>
			<tr>
           <td><div><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><p id="tel_repassword_div"></p></div></td>
           </tr>
           </table>
        </div>
        <!--zhuceform-->
        <div class="yanzheng">
            <div class="ma"><div><label>验证码：</label><input type="text" id="mobile_code" /></div><p><input id="zphone" type="button" value="发送手机验证码 " onclick="get_mobile_code();"/></p></div>
            <div class="gree"><input type="checkbox" checked="checked" />我已经阅读并同意<span class="red">《柴米用户服务条数》</span><a href="use_item.jsp">详情阅读</a></div>
        </div>
        <div class="zcbut"><input type="button"id="tel_submit" value="马上注册"/></div>
        <!--yanzheng-->
        </form>
    </div>
    <!--zhuce-->
</div>
    </div>
    <!--wrap-->
</div>
<!--mainCon-->
   <div class="icon2"><img src="<%=request.getContextPath()%>/login/images/ic_03.jpg" /></div>
     <div class="fotter fotter2"> 
          <div class="footcont">
             <div class="footmain">
                <div class="copyright">
                   <p class="tit3"><a href="<%=request.getContextPath()%>/login/index.jsp">柴米游戏丨中国第一手游杂志</a></p>
                   <p>&copy;2014 - 2020 柴米游戏 丨京ICP备11000000号-2</p>
                   <p>除非特别注明，应用程序由第三方市场提供，柴米游戏仅根据您的指令提供搜索结果链接，与出处无关，详情请参阅 知识产权保护声明</p>
                </div>
                <!--copyright-->
                <dl>
                   <dt>意见与服务</dt>
                   <dd><a href="about_us.jsp">关于我们</a></dd>
                   <dd><a href="teamwork.jsp">商务洽谈</a></dd>
                   <dd><a href="developer_center.jsp">开发者中心</a></dd>
                 </dl>
                 <dl>
                 
                   <dt>帮助与支持</dt>
                   <dd><a href="use_item.jsp">使用条款</a></dd>
                   <dd><a href="users_privacy.jsp">用户隐私</a></dd>
                   <dd><a href="knowledge_equity.jsp">知识产权保护声明</a></dd>
                 </dl>
                 <p class="logo2 fl"><a href="#"><img src="<%=request.getContextPath()%>/login/images/im_14.jpg" /></a></p>
               </div>
               <!--footmain-->
           </div>
           <!--footcont-->
       </div>
       <!--fotter-->

<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
