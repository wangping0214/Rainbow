<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>待发布</title>

<script type="text/javascript"src="js/jquery.min.js"></script>
<script type="text/javascript"src="js/nav.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
*{ margin:0; padding:0;}
ul{ list-style:none;}
a{ text-decoration:none; color:#666;}
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
	color:#666;
	font-family: "微软雅黑";
	font-size: 20px;
	margin-left: 10px;
	margin-top:20px;
	margin-bottom:30px;
	font-weight: bold;
	width: 180px; text-align:center;
	background-color: #FFFFFF; border-bottom:#CCC solid 1px; padding-bottom:5px;
}
.b1{
	color: #0066CC;
	font-family: "微软雅黑";
	font-size: 16px;
	margin-left: 20px;
	margin-top:5px;
	margin-bottom:20px;
	font-weight: bold;
	height: 25px;
	width: 180px;
	background-color: #FFFFFF;
}
.b1 select{ width:150px; font-size:14px; font-weight:bold; text-align:center; height:30px;}
.b2{
	color: #0066CC;
	font-family: "微软雅黑";
	font-size: 20px;
	margin-left: 40px;
	margin-top:5px;
	font-weight: bold;
	height: 400px;
	overflow:hidden;
	width: auto;
}
.b3{
	color: #000000;
	font-family: "微软雅黑";
	font-size: 14px;
	margin-left: 15px;
	margin-top:15px;
	font-weight: bold;
	height: 135px;
	width: 110px;
	float: left;
	text-align:center;
	display:inline;
}
.b31{
	font-family: "微软雅黑";
	height: 20px;
	width: 160px;
}
.b4{
	color: #000000;
	font-size: 16px;
	margin-left: 150px;
	margin-top:5px;
	font-weight: bold;
	height: 20px;
	width: auto;
	background-color: #FFFFFF;
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
.twobut{ background:url(images/dai.png) no-repeat; width:110px; height:30px; margin-top:5px;}
.twobut a,.twobut input{ float:left; width:27px; height:30px; background:none; border:0; cursor:pointer; outline:none;}
.page{ clear:both; overflow:hidden; zoom:1; padding-top:30px; width:260px; font-size:14px; margin:0 auto;}
.page li{ float:left; padding:0 5px;}
.page a:hover{ text-decoration:underline}
.shenhenav{ margin-top:20px; overflow:hidden; zoom:1; width:230px; border-bottom:#999 solid 1px; padding-bottom:5px; cursor:pointer; color:#666; font-size:16px;}
.shenhenav li{ float:left; margin-left:20px; display:inline; }
.shenhenav li.red a{ color:#F00}
</style>
<script type="text/javascript" language="javascript">
function setIsShelf(name,id){
	if(window.confirm("将"+name+"上架？")){
		location.href="userSetIsShelf.action?appTmp.setIsShelfId="+id;
	}
}
function setWithdrawn(name,id){
	if(window.confirm("将"+name+"下架？"))
		location.href="userSetWithdrawn.action?appTmp.setWithdrawnId="+id;
}
function setWithdrawnForce(name,id){
	if(window.confirm("将"+name+"强制下架？"))
		location.href="setWithdrawnForce.action?appTmp.setWithdrawnId="+id;
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
      <ul class="shenhenav">
         <li><a href="isShelf.action?appTmp.isShelfCurrentPage=1&appTmp.isShelf=1" target="main">已上架</a></li>
         <li class="red"><a href="isShelf.action?appTmp.isShelfCurrentPage=1&appTmp.isShelf=0" target="main">待发布</a></li>
         <li><a href="isShelf.action?appTmp.isShelfCurrentPage=1&appTmp.isShelf=-1" target="main">已下架</a></li>
      </ul>
    <div class="b2">  
  <s:iterator value="#request['app']" id="app">
	<div class="b3">
	     <p><img src="<%=request.getContextPath() %><s:property value="#app.appSou.logo1"/>" width="80" height="80" /></p>
		 <p><s:property value="#app.appInfo.appName" /></p>
		 <div class="twobut">
             <a href="editApp.action?appTmp.editId=<s:property value="#app.appInfo.id"/>" target="main"></a>
             <a href="javascript:setIsShelf('<s:property value="#app.appInfo.appName" />','<s:property value="#app.appInfo.id"/>');"></a>
             <a href="tongjiliebiao2.jsp"></a>
             <a href="javascript:setWithdrawn('<s:property value="#app.appInfo.appName" />','<s:property value="#app.appInfo.id"/>');"></a>
		  </div>
	</div>
	</s:iterator>
    </div>
    <ul class="page">
    <s:set name="page" value="#request.page"/>
       <s:if test="#page.hasFirst">
       <li><a href="isShelf.action?appTmp.isShelfCurrentPage=1&appTmp.isShelf=0">首页</a>
		</li>
		</s:if>
       <s:if test="#page.hasPrevious">
       <li><a href="isShelf.action?appTmp.isShelfCurrentPage=<s:property value="#page.currentPage-1"/>&appTmp.isShelf=0">上一页</a>
		</li>
		</s:if>
		<s:if test="#page.totalPage>1">
       <li><a href="isShelf.action?appTmp.isShelfCurrentPage=1&appTmp.isShelf=0">1</a></li>
       </s:if>
       <s:if test="#page.totalPage>2">
       <li><a href="isShelf.action?appTmp.isShelfCurrentPage=2&appTmp.isShelf=0">2</a></li>
        </s:if>
        <s:if test="#page.totalPage>3">
       <li><a href="isShelf.action?appTmp.isShelfCurrentPage=3&appTmp.isShelf=0">3</a></li>
        </s:if>
        <s:if test="#page.totalPage>4">
       <li><a href="isShelf.action?appTmp.isShelfCurrentPage=4&appTmp.isShelf=0">4</a></li>
       </s:if>
       <s:if test="#page.totalPage>5">
       <li><a href="isShelf.action?appTmp.isShelfCurrentPage=5&appTmp.isShelf=0">5</a></li>
       </s:if>
       <s:if test="#page.hasNext">
       <li><a href="isShelf.action?appTmp.isShelfCurrentPage=<s:property value="#page.currentPage+1"/>&appTmp.isShelf=0">下一页</a></li>
       </s:if>
       <s:if test="#page.hasLast">
		<li><a href="isShelf.action?appTmp.isShelfCurrentPage=<s:property value="#page.totalPage&appTmp.isShelf=0"/>">尾页</a></li>
		</s:if>
		<li>当前第<s:property value="#page.currentPage"/>页，总共<s:property value="#page.totalPage"/>页
		</li>
     </ul>

 <!--b2-->

                       
                   </div>
     </div>
 </div>
</body>
</html>
