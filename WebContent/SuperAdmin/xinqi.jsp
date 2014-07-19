<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>新刊编辑</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
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
document.form1.browse.click(); 
document.form1.file.value = document.all.form1.browse.value; 
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
                      <h3 class="tit2">新刊编辑</h3>
                      <div class="form">
                           <form id="form1" name="form1" method="post" action=""  ENCTYPE="multipart/form-data"  onsubmit="alert(document.test_form.browse.value);">
                               <div><label>输入刊期 ：</label><input type="text" class="shuru"/></div>
                               <div class="shangchuan"><label>上传封面 ：</label><div class="suolv"><input type="file"  name="browse" style="display:none;"  /><a href="javascript:fn_browse();"> <img name="btn" src="images/img26.png" width="81" height="71" border="0" /></a><input type="submit" value="上传" class="scbut" /></div>
                               <p class="clear shuoming">尺寸827x180，jpg或png，<a href="#"><i>示例照片</i></a></p>
                               </div>
                               <div class="jianjie"><label>本期简介 ：</label><textarea>此框编写简介</textarea></div>
                               <div class="buttwo buttwo2"><input type="reset" value="× 取消" class="quxiao"/><a href="xinqi_bianji.jsp" class="bj">√编辑</a></div>
                          </form>
                      </div>
                      <!--form-->
 
                   </div>
                   <!--list-->
               </div>
     </div>
 </div>
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
