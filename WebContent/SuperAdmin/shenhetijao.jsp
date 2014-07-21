<%@ page import="com.rainbow.entity.AppInfo" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%AppInfo info = (AppInfo)session.getAttribute("info"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="<%=request.getContextPath()%>/scripts/jquery.min.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">
$(document).ready(function(){
	$("#id_form").submit(check);
		

});

function check(){

var recomLevel = parseInt($("#id_recomLevel").val());
var score = parseInt($("#id_score").val());
if(recomLevel>100||recomLevel<0){
	alert("推荐级别取值为取值0-100 ！");
	$("#id_recomLevel").focus();
	return false;
};
if(score>100||score<0){
	alert("评分取值为取值0-100 ！");
	$("#id_score").focus();
	return false;
};
return true;
};
</script>
<title>管理审核 & 提交</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style>
.xinxicont label{ width:180px; }
.zhushi{ padding:5px 0 0 190px; font-weight:normal; clear:both;}

</style>


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
                      <h3 class="tit2">管理审核 & 提交</h3>
                      <div class="xinxicont">
                      <form id="id_form" name="form1" method="post" onsubmit="test()" action="auditSubmit.action?appTmp.auditManagementId=<%=info.getId() %>"  enctype="multipart/form-data">
                          <div class="shenhecont">
                              <div class="shen">
                                   <div class="xuanze"><input type="radio" name="subApp.appInfo.isThrough" value='-1' id="id_isThrough" />未通过前方打钩</div>
                                   <div class="liyou"><textarea cols="40" rows="5" name="subApp.appAut.reasonsNotThrough">未通过理由</textarea></div>
                             </div>
                             <div class="shen">
                                   <div class="xuanze"><input type="radio" name="subApp.appInfo.isThrough" value='1' id="id_isThrough"/>通过前方打钩</div>
                                   <div class="tguo">
                                       <div>推荐级别选择：<input type="text" name="subApp.appAut.strRecomLevel" id="id_recomLevel"/> 取值0-100
                                       </div>
                                       <div>评分：<input type="text" name="subApp.appAut.strScore" id="id_score"  /> 取值0-100</div>
                                       <div>下载量：<input type="text" name="subApp.appAut.strAmountOfDown" id="id_amountOfDown" /> 设置初始下载量</div>
                                   </div>
                             </div>
                          </div>
                          <div class="uppage"><a href="glshsucai.jsp" target="main">上一页</a><input type="submit" value="提交" class="tijiao"/></div>
                      	</form>
                      </div>
                      <!--dailist-->

               </div>
     </div>
 </div>
 </div>
 
</body>
</html>
