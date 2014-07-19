<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>管理游戏&应用</title>

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
	margin-left: 20px;
	margin-top:25px;
	font-weight: bold;
	height: 400px;
	width: auto;
}



.twobut{ background:url(images/but3.png) no-repeat; width:85px; height:30px; margin-top:5px;}
.twobut a,.twobut input{ float:left; width:42px; height:30px; background:none; border:0;}
.page{ clear:both; overflow:hidden; zoom:1; padding-top:30px; width:260px; font-size:14px; margin:0 auto;}
.page li{ float:left; padding:0 5px;}
.page a:hover{ text-decoration:underline}
.paimingnav{ margin-top:20px; overflow:hidden; zoom:1; width:250px; padding-bottom:5px; cursor:pointer; color:#666; font-size:16px;}
.paimingnav li{ float:left; margin-left:10px; display:inline; border-bottom:#999 solid 1px; }
.paimingnav li.blue{ color:#06F; border-bottom:#06F solid 1px;}
</style>
<script src="<%=request.getContextPath()%>/scripts/jquery.min.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript"> 
function rankSubmit(rankSubmitId,num){
	var recomLevel = parseInt($("#recomLevel"+num).val());
	var score = parseInt($("#score"+num).val());
	var amountOfDown = parseInt($("#amountOfDown"+num).val());
	if(recomLevel>100||recomLevel<0){
		alert("推荐级别取值为取值0-100 ！");
		$("#recomLevel").focus();
		return false;
	}
	if(score>100||score<0){
		alert("评分取值为取值0-100 ！");
		$("#score").focus();
		return false;
	}

		jQuery.ajax(
				{
				
				type : "post",
				url : "<%=request.getContextPath()%>/rankSubmit.action",
				data : {"appTmp.rankSubmitId" : rankSubmitId, 
						"appAut.recomLevel" : recomLevel ,
						"appAut.score" : score , 
						"appAut.amountOfDown" : amountOfDown
						},
				success : function(){
						alert("修改成功");
						location.reload();
					}
				}
				);
		
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
                      <ul class="paimingnav">
                        <li>全部</li>
                      </ul>
                      <div class="b2">
                      	 <s:iterator value="#request['app']" id="app" status="st">

                         <div class="every">
                             <p class="num"><s:property value="#st.count" /></p>
                             <dl>
                                <dt><a href="showInfo.action?appTmp.showInfoId=<s:property value='#app.appAut.id' />" target="main"><img src="<%=request.getContextPath() %><s:property value="#app.appSou.logo1"/>" width="80" height="80"/></a></dt>
                                <dd><a href="showInfo.action?appTmp.showInfoId=<s:property value='#app.appAut.id' />"><s:property value="#app.appInfo.appName" /></a></dd>
                             </dl>
                             <div class="shuju">
                                 <div><label>推荐级别选择</label><input name="appAut.recomLevel" id="recomLevel<s:property value='#st.count' />" type="text" value="<s:property value="#app.appAut.recomLevel" />" /><p>取值0-100</p></div>
                                 <div><label>评分</label><input name="appAut.score" id="score<s:property value='#st.count' />" type="text" value="<s:property value="#app.appAut.score" />" /><p>取值0-100</p></div>
                                 <div><label>下载量</label><input name="appAut.amountOfDown" id="amountOfDown<s:property value='#st.count' />" type="text" value="<s:property value="#app.appAut.amountOfDown" />"/><span>次</span></div>
                                 <div class="sure"><input type="submit" value="确认修改" onclick="rankSubmit(<s:property value='#app.appAut.id' />,<s:property value='#st.count' />)"/></div>
                             </div>
                         </div>
                         </s:iterator>
                         <!--every-->
                         
        <ul class="page">
    	<s:set name="page" value="#request.page"/>
       <s:if test="#page.hasFirst">
       <li><a href="rank.action?appTmp.rankCurrentPage=1">首页</a>
		</li>
		</s:if>
       <s:if test="#page.hasPrevious">
       <li><a href="rank.action?appTmp.rankCurrentPage=<s:property value="#page.currentPage-1"/>">上一页</a>
		</li>
		</s:if>
		<s:if test="#page.totalPage>1">
       <li><a href="rank.action?appTmp.rankCurrentPage=1">1</a></li>
       </s:if>
       <s:if test="#page.totalPage>2">
       <li><a href="rank.action?appTmp.rankCurrentPage=2">2</a></li>
        </s:if>
        <s:if test="#page.totalPage>3">
       <li><a href="rank.action?appTmp.rankCurrentPage=3">3</a></li>
        </s:if>
        <s:if test="#page.totalPage>4">
       <li><a href="rank.action?appTmp.rankCurrentPage=4">4</a></li>
       </s:if>
       <s:if test="#page.totalPage>5">
       <li><a href="rank.action?appTmp.rankCurrentPage=5">5</a></li>
       </s:if>
       <s:if test="#page.hasNext">
       <li><a href="rank.action?appTmp.rankCurrentPage=<s:property value="#page.currentPage+1"/>">下一页</a></li>
       </s:if>
       <s:if test="#page.hasLast">
		<li><a href="rank.action?appTmp.rankCurrentPage=<s:property value="#page.totalPage"/>">尾页</a></li>
		</s:if>
		<li>当前第<s:property value="#page.currentPage"/>页，总共<s:property value="#page.totalPage"/>页
		</li>
     </ul>
                      </div>
                      <!--b2-->
               </div>
     </div>
      
 </div>

 </div>
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
