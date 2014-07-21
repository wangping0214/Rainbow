<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>新刊编辑</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"src="js/jquery.min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath()%>/scripts/appUpload.js" type="text/javascript"></script>
<script charset="utf-8" src="<%=request.getContextPath()%>/scripts/ajaxfileupload.js" type="text/javascript"></script>
<style type="text/css">
*{padding:0; margin:0;}
.body{
	color: #0066CC;
	font-family: "微软雅黑";
	font-size: 14px;
	margin-left: 0px;
	font-weight: bold;
	height:100%;
	width: 100%;
	background-color: f2f2f2;
}
.head{
	color: #0066CC;
	font-family: "微软雅黑";
	font-size: 20px;
	margin-left: 20px;
	margin-top:20px;
	font-weight: bold;
	height: 50px;
	width: 240px;
	background-color: #FFFFFF;
}
.b1{
	color: #99CC00;
	font-family: "微软雅黑";
	font-size: 16px;
	margin-left: 20px;
	margin-top:5px;
	font-weight: bold;
	height: 25px;
	width: 90px;
	text-align:center;
	background-color: #FFFFFF;
}
.b2{
	 clear:both;
	color: #0066CC;
	font-family: "微软雅黑";
	margin-left: 150px;
	margin-top:20px; overflow:hidden; zoom:1;
	width: auto;
	background-color: #FFFFFF;
}
.b3{
	color: #000000;
	font-family: "微软雅黑";
	font-size: 14px;
	margin-left: 5px;
	margin-top:5px;
	font-weight: bold;
	height: 225px;
	width: 140px;
	float: left;
}
.head{ width:160px;}
.b3-1{
	color: #999999;
	font-family: "微软雅黑";
	font-size: 20px;
	margin-left: 5px;
	margin-top:5px;
	height: 205px;
	width: 160px;
	float: left;
	border:1px solid #999;
	text-align:center;
	line-height:205px;
}
.b31{
	font-family: "微软雅黑";
	height: 20px;
	width: 160px;
}
#left{
	color: #0066CC;
	font-family: "微软雅黑";
	font-size: 14px;
	margin-left: 30px;
	height: 300px;
	width: 500px;
	float: left;
}
#right{
	color: #000000;
	font-family: "微软雅黑";
	font-size: 14px;
	height: 300px;
	float: right;
	width: 500px;
	margin-right: 100px;
}
</style>
<script type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<script language="javascript" type="text/javascript"> 
function fn_browse() 
{ 
document.form1.id_logo1.click(); 
document.form1.id_logo1.value = document.all.form1.id_logo1.value; 
} 
$(document).ready(function(){
	
	$("#id_logo1").uploadPreview({ Img: "id_logo1_photo" });
	
	$("#id_submit").click(function(){
		if($("#id_appName").val()==""){
			alert("请输入您的APP名称！");
			$("#id_appName").focus();
			 return false;
		}
		if($("#id_logo1").val()==""){
			alert("请上传48*48的APP图标！");
			 return false;
		}
		$("#form1").submit();
	});
	
	$("#id_logo1").live("change",function(){
		var filename=$("#id_logo1").val();
		if(!/\.(png)$/i.test(filename)){
			alert("请上传png文件！");
			$("#id_logo1").val("");
			$("#id_logo1_photo").attr("src","images/img26.png");
			return false;
		}
		
		else{
			return $.ajaxFileUpload({  //异步上传文件
                url:"getImgSize.action",  
                secureuri:false,  
                fileElementId:'id_logo1',  
                dataType: 'text/xml',             
                success: function (data) {  
                    if(data=="0"){
                    	alert("请上传48px*48px的logo图标");
                    	$("#id_logo1_photo").attr("src","images/img26.png");
                    	$("#id_logo1").val("");
                    	return false;
                    }
                    else {
                    	$("#id_logo1").uploadPreview({ Img: "id_logo1_photo" });
						return true;
                    }
                },
                error: function (){  
                    alert("获取图片失败！"); 
                    $("#id_logo1_photo").attr("src","images/img26.png");
                    $("#id_logo1").val("");
                    return false;
                }  
            });  
   		}  
	});
});
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
                      <h3 class="tit2">注册APP</h3>
                      <div class="form">
                           <form id="form1" name="form1" method="post" action="dev_zhuce_App.action"  enctype="multipart/form-data" >
                               <div><label>APP 名称：</label><input type="text" name="appInfo.appName" id="id_appName" class="shuru"/></div>
                               <div class="shangchuan"><label>应用图标 ：</label><div class="suolv">
                               <input type="file"  name="appTmp.logo1Content" id="id_logo1" style="display:none;"  />
                               <a href="javascript:fn_browse();"> 
                               <img name="btn" src="images/img26.png" id="id_logo1_photo" width="90" height="80" border="0" /></a>
                               </div>
                               <p class="clear shuoming">尺寸48x48px，jpg或png，<a href="#"><i>示例照片</i></a></p>
                               </div>
                               <div class="apptijiao"><input type="button" id="id_submit" /></div>
                          </form>
                      </div>
                      <!--form-->
 
                   </div>
                   <!--list-->
               </div>
     </div>
 </div>
</body>
</html>
