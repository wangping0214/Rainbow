<%@ page import="com.rainbow.server.App" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传基本信息</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style>
.xinxicont label{ width:180px; }
.zhushi{ padding:5px 0 0 190px; font-weight:normal; clear:both;}
</style>
<script type="text/javascript"src="js/jquery.min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath()%>/scripts/appUpload.js" type="text/javascript"></script>
<script charset="utf-8" src="<%=request.getContextPath()%>/scripts/ajaxfileupload.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript"> 
sec = new Array(); 
function fn_browse() 
{ 
document.form1.id_packge.click(); 
document.form1.id_packge.value = document.all.form1.id_packge.value; 

} 
function fn_browse1() 
{ 

document.form1.id_logo1.click(); 
document.form1.id_logo1.value = document.all.form1.id_logo1.value; 

} 
function fn_browse2() 
{ 

document.form1.id_logo2.click(); 
document.form1.id_logo2.value = document.all.form1.id_logo2.value; 
} 
function fn_browse3() 
{ 
document.form1.gamePhoto1.click(); 
document.form1.gamePhoto1.value = document.all.form1.gamePhoto1.value; 

} 
function fn_browse4() 
{ 

document.form1.gamePhoto2.click(); 
document.form1.gamePhoto2.value = document.all.form1.gamePhoto2.value; 

} 
function fn_browse5() 
{ 

document.form1.gamePhoto3.click(); 
document.form1.gamePhoto3.value = document.all.form1.gamePhoto3.value; 
} 
function fn_browse6() 
{ 

document.form1.gamePhoto4.click(); 
document.form1.gamePhoto4.value = document.all.form1.gamePhoto4.value; 
} 
function fn_browse7() 
{ 

document.form1.gamePhoto5.click(); 
document.form1.gamePhoto5.value = document.all.form1.gamePhoto5.value; 
} 
$(document).ready(function(){
	
	$("#gamePhoto1").uploadPreview({ Img: "photo1" });
	$("#gamePhoto2").uploadPreview({ Img: "photo2"});
	$("#gamePhoto3").uploadPreview({ Img: "photo3" });
	$("#gamePhoto4").uploadPreview({ Img: "photo4" });
	$("#gamePhoto5").uploadPreview({ Img: "photo5" });
	if($("#gamePhoto1").val()!=""){
		$("#dle3").style.display="block";	
	}
	
	$("#id_appIntrodution").focus(function(){
		if($("#id_appIntrodution").val()=="应用简介"){
			$("#id_appIntrodution").attr("value","");
		}
	});
	$("#id_appIntrodution").blur(function(){
		if($("#id_appIntrodution").val()==""){
			$("#id_appIntrodution").attr("value","应用简介");
		}
	});
	
	$("#id_elaborate").focus(function(){
		if($("#id_elaborate").val()=="详细描述"){
			$("#id_elaborate").attr("value","");
		}
	});
	$("#id_elaborate").blur(function(){
		if($("#id_elaborate").val()==""){
			$("#id_elaborate").attr("value","详细描述");
		}
	});
	
	$("#id_versionIntroduction").focus(function(){
		if($("#id_versionIntroduction").val()=="版本简介"){
			$("#id_versionIntroduction").attr("value","");
		}
	});
	$("#id_versionIntroduction").blur(function(){
		if($("#id_versionIntroduction").val()==""){
			$("#id_versionIntroduction").attr("value","版本简介");
		}
	});
	
	$("#form1").submit(function(event){
		

		/*
		表单提交前校验
		*/
		if($("#id_appName").val()==""){
			alert("请输入您上传的应用的名称！");
			$("#id_appName").focus();
			 event.preventDefault();
			 return false;
		}
		
		if($("#id_type").val()=="请选择类型"){
			alert("请选择类型");
			event.preventDefault();
			return false;
		}
		
		if($("#id_category").val()==""){
			alert("请选择类别");
			event.preventDefault();
			return false;
		}
		if($("#id_appIntrodution").val()=="应用简介"||$("#id_appIntrodution").val()==""){
			alert("请输入应用简介");
			$("#id_appIntrodution").focus();
			event.preventDefault();
			return false;
		}
		
		if($("#id_elaborate").val()=="详细描述"||$("#id_appIntrodution").val()==""){
			alert("请输入详细描述");
			$("#id_elaborate").focus();
			event.preventDefault();
			return false;
		}
		
		if($("#id_versionIntroduction").val()=="版本简介"||$("#id_appIntrodution").val()==""){
			alert("请输入版本简介");
			$("#id_versionIntroduction").focus();
			event.preventDefault();
			return false;
		}
		
		if($("#id_tx_packge").val()==""){
			alert("请上传应用包");
			event.preventDefault();
			return false;
		}
		if($("#id_tx_logo1").val()==""){
			alert("请上传48*48的图标");
			event.preventDefault();
			return false;
		}
		
		if($("#id_tx_logo2").val()==""){
			alert("请上传94*94的图标");
			event.preventDefault();
			return false;
		}
		
		/***********************************/
		var img = $("#progressImgage"); 
		var mask = $("#maskOfProgressImage");
		
            	img.show().css({ 
            		"position": "fixed", 
            		"top": "40%", 
            		"left": "45%", 
            		"margin-top": function () { return -1 * img.height() / 2; }, 
            		"margin-left": function () { return -1 * img.width() / 2; } 
            		}); 
            		mask.show().css("opacity", "0.1"); 
	});
	
	$("#id_packge").change(function(){
		var filename=$("#id_packge").val();
		if(!/\.(apk)$/i.test(filename)){
			alert("请上传apk文件！");
			$("#id_tx_packge").val("");
			return false;
		}
		else{
			$("#id_tx_packge").val(filename);
			return true;
		}
	});
	$("#id_logo1").live("change",function(){
		var filename=$("#id_logo1").val();
		if(!/\.(png)$/i.test(filename)){
			alert("请上传png文件！");
			$("#id_tx_logo1").val("");
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
                    	$("#id_tx_logo1").val("");
                    	return false;
                    }
                    else {
                    	$("#id_tx_logo1").val(filename);
                    	return true;
                    	}
                },
                error: function (){  
                    alert("获取图片失败！"); 
                    $("#id_tx_logo1").val("");
                    return false;
                }  
            });  
   		}  
	});
	$("#id_logo2").live("change",function(){
		var filename=$("#id_logo2").val();
		if(!/\.(png)$/i.test(filename)){
			alert("请上传png文件！");
			$("#id_tx_logo2").val("");
			return false;
		}
		else{
			return $.ajaxFileUpload({  //异步上传文件
                url:"getImgSize.action",  
                secureuri:false,  
                fileElementId:'id_logo2',  
                dataType: 'text/xml',             
                success: function (data) {  
                    if(data=="0"){
                    	alert("请上传94px*94px的logo图标");
                    	$("#id_tx_logo2").val("");
                    	return false;
                    }
                    else {
                    	$("#id_tx_logo2").val(filename);
                    	return true;
                    	}
                },
                error: function (data, status, e){  
                    alert("获取图片失败！"); 
                    $("#id_tx_logo2").val("");
                    return false;
                }  
            }); 
		}
	});

});
function selectAppType(){
		var tem = document.getElementById('id_type').value;
		var labels = new Array();
		switch(tem){
			case'游戏':
				labels = new Array("角色扮演","飞行射击","体育竞技","益智棋牌","策略经营","竞速动作","创意休闲");
		//		document.getElementById('id_category')。options.length() = labels.length; 
				break;
			case'应用':
				labels = new Array("系统安全","常用工具","摄影美化","影音图像","便捷生活","社交通信","学习阅读");
		//		document.getElementById('id_category')。options.length = labels.length; 
		
				break;
			default:
				var category = document.getElementById("id_category");
				//alert(category.options.length);
				for(var i = category.options.length-1; i >=0; i--) {
					category.options.remove(i);

				}
				labels =new Array();
			//	document.getElementById('id_category')。options.length = 0; 
			
		
				break;
		}
		for(var i = 0; i <labels.length; i++) {
			 document.getElementById('id_category').options[i] = new Option(labels[i],labels[i]);
		}
		var temp = document.getElementById('id_category').value;
		labels = new Array();
		switch(temp){
		case '角色扮演':
			labels = new Array("回合制","卡牌","玄幻","武侠");
			break;
		case '飞行射击':
			labels = new Array("射击","阻击","坦克","飞行");
			break;
		case '体育竞技':
			labels = new Array("街机","足球","篮球","台球");
			break;
		case '益智棋牌':
			labels = new Array("斗地主","麻将","纸牌","拼图");
			break;
		case '策略经营':
			labels = new Array("经营","卡牌","塔防","战争");
			break;
		case '竞速动作':
			labels = new Array("跑酷","横版","3D","赛车");
			break;
		case '创意休闲':
			labels = new Array("卡通","连连看","捕鱼","祖玛");
			break;
		case '系统安全':
			labels = new Array("优化","流量","安全","杀毒");
			break;
		case '常用工具':
			labels = new Array("浏览器","输入法","文件","办公");
			break;
		case '摄影美化':
			labels = new Array("主题","桌面","壁纸","相机");
			break;
		case '影音图像':
			labels = new Array("音乐","视频","相册","播放器");
			break;
		case '便捷生活':
			labels = new Array("健康","购物","理财","旅行");
			break;
		case '社交通信':
			labels = new Array("聊天","交友","微博","婚恋");
			break;
		case '学习阅读':
			labels = new Array("电子书","漫画","新闻","杂志");
			break;
		default:
			var category = document.getElementById("id_classification");
			//alert(category.options.length);
			for(var i = category.options.length-1; i >=0; i--) {
				category.options.remove(i);

			}
			labels =new Array();
			break;
		}
		for(var i = 0; i <labels.length; i++) {
			 document.getElementById('id_classification').options[i] = new Option(labels[i],labels[i]);
		}
	
}

function selectCategory(){
	var temp = document.getElementById('id_category').value;
	var labels = new Array();
	switch(temp){
	case '角色扮演':
		labels = new Array("回合制","卡牌","玄幻","武侠");
		break;
	case '飞行射击':
		labels = new Array("射击","阻击","坦克","飞行");
		break;
	case '体育竞技':
		labels = new Array("街机","足球","篮球","台球");
		break;
	case '益智棋牌':
		labels = new Array("斗地主","麻将","纸牌","拼图");
		break;
	case '策略经营':
		labels = new Array("经营","卡牌","塔防","战争");
		break;
	case '竞速动作':
		labels = new Array("跑酷","横版","3D","赛车");
		break;
	case '创意休闲':
		labels = new Array("卡通","连连看","捕鱼","祖玛");
		break;
	case '系统安全':
		labels = new Array("优化","流量","安全","杀毒");
		break;
	case '常用工具':
		labels = new Array("浏览器","输入法","文件","办公");
		break;
	case '摄影美化':
		labels = new Array("主题","桌面","壁纸","相机");
		break;
	case '影音图像':
		labels = new Array("音乐","视频","相册","播放器");
		break;
	case '便捷生活':
		labels = new Array("健康","购物","理财","旅行");
		break;
	case '社交通信':
		labels = new Array("聊天","交友","微博","婚恋");
		break;
	case '学习阅读':
		labels = new Array("电子书","漫画","新闻","杂志");
		break;
	default:
		var category = document.getElementById("id_classification");
		//alert(category.options.length);
		for(var i = category.options.length-1; i >=0; i--) {
			category.options.remove(i);

		}
		labels =new Array();
		break;
	}
	for(var i = 0; i <labels.length; i++) {
		 document.getElementById('id_classification').options[i] = new Option(labels[i],labels[i]);
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
                      <h3 class="tit2">上传-基本信息</h3>
                      <div class="xinxicont">
                      <%App app=new App();
                      if(session.getAttribute("app")!=null){
                      			app = (App)session.getAttribute("app");}
                      %>
                          <form id="form1" name="form1" method="post" action="<%=request.getContextPath()%>/devAppUpLoad.action" enctype="multipart/form-data" >
                          <!-- ********************************firstpage********************************** -->
                          <%if(app.getAppInfo().getId()==null){ %>
                          <input type="hidden" name="appTmp.changeId" value=0>
                          <%}
                          else{%>
                          <input type="hidden" name="appTmp.changeId" value=<%=app.getAppInfo().getId() %>>
                          <%} %>
                          <div id="firstPage">
                               <div><label>名称:</label><p class="pp">
                               <%if(app.getAppInfo().getAppName()!=null){ %>
                               <input height="30" name="appInfo.appName" type="text" size="40" id="id_appName" value=<%=app.getAppInfo().getAppName() %>>
                               <%}
                               else{
                               %>
                               <input height="30" name="appInfo.appName" type="text" size="40" id="id_appName">
                               <%} %><p class="zhushi">不超过15个中文字符或30个英文字符。</p>
                               </div>
                                 <%if(app.getAppInfo().getType()==null){ %>
                                 <div><label>类型:</label>
                                 <p class="pp">
                                 	<select name="appInfo.type" onchange="selectAppType()" id="id_type">
                                 	<option>请选择类型</option>
                                   	<option value="游戏">游戏</option>
                                   	<option value="应用">应用</option>
                                   	</select>
                                   	</p>
                                   	</div>
                                   <div><label>分类:</label>
                                 <p class="pp">
                                 <select name="appInfo.category" id="id_category" onchange="selectCategory()">
                                 </select>
                                 </p>
                                 <p class="pp">
                                 <select name="appInfo.classification" id="id_classification"></select>
                                 </p>
                              </div>
                                 <%}
                                 else if(app.getAppInfo().getType().equals("游戏")){
                                 %>	
                                 <div><label>类型:</label>
                                 <p class="pp">
                                 	<select name="appInfo.type" onchange="selectAppType()" id="id_type">
                                   		<option selected="selected">游戏</option>
                                   		<option>应用</option>
                                   	</select>
                                   	</p>
                                   	</div>
                                   	<div><label>分类:</label>
                                   <%if(app.getAppInfo().getCategory().equals("角色扮演")){ %>
                                   <p class="pp">
                                	 	<select name="appInfo.category" id="id_category" onchange="selectCategory()">
                                	 	<option selected="selected">角色扮演</option>
                                	 	<option>飞行射击</option>
                                	 	<option>体育竞技</option>
                                	 	<option>益智棋牌</option>
                                	 	<option>竞赛动作</option>
                                	 	<option>创意休闲 </option>
                                	 	<option>策略经营 </option>
                                 		</select>
                                	</p>
                                	<p class="pp">
                                 		<select name="appInfo.classification" id="id_classification">
                                 		<option <%if(app.getAppInfo().getClassification().equals("回合制")){ %> selected="selected"<%} %>>回合制</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("卡牌")){ %> selected="selected"<%} %>>卡牌</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("玄幻")){ %> selected="selected"<%} %>>玄幻</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("武侠")){ %> selected="selected"<%} %>>武侠</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(app.getAppInfo().getCategory().equals("飞行射击")){%>
                                   <p class="pp">
                                	 	<select name="appInfo.category" id="id_category" onchange="selectCategory()">
                                	 	<option>角色扮演</option>
                                	 	<option selected="selected">飞行射击</option>
                                	 	<option>体育竞技</option>
                                	 	<option>益智棋牌</option>
                                	 	<option>竞赛动作</option>
                                	 	<option>创意休闲 </option>
                                	 	<option>策略经营 </option>
                                 		</select>
                                	</p>
                                	<p class="pp">
                                 		<select name="appInfo.classification" id="id_classification">
                                 		<option <%if(app.getAppInfo().getClassification().equals("射击")){ %> selected="selected"<%} %>>射击</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("阻击")){ %> selected="selected"<%} %>>阻击</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("坦克")){ %> selected="selected"<%} %>>坦克</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("飞行")){ %> selected="selected"<%} %>>飞行 </option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(app.getAppInfo().getCategory().equals("体育竞技")){ %>
                                   <p class="pp">
                                	 	<select name="appInfo.category" id="id_category" onchange="selectCategory()">
                                	 	<option>角色扮演</option>
                                	 	<option>飞行射击</option>
                                	 	<option selected="selected">体育竞技</option>
                                	 	<option>益智棋牌</option>
                                	 	<option>竞赛动作</option>
                                	 	<option>创意休闲 </option>
                                	 	<option>策略经营 </option>
                                 		</select>
                                	</p>
                                	<p class="pp">
                                 		<select name="appInfo.classification" id="id_classification">
                                 		<option <%if(app.getAppInfo().getClassification().equals("街机")){ %> selected="selected"<%} %>>街机</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("足球")){ %> selected="selected"<%} %>>足球</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("篮球")){ %> selected="selected"<%} %>>篮球</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("台球")){ %> selected="selected"<%} %>>台球 </option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(app.getAppInfo().getCategory().equals("益智棋牌")){ %>
                                   <p class="pp">
                                	 	<select name="appInfo.category" id="id_category" onchange="selectCategory()">
                                	 	<option>角色扮演</option>
                                	 	<option>飞行射击</option>
                                	 	<option>体育竞技</option>
                                	 	<option selected="selected">益智棋牌</option>
                                	 	<option>竞赛动作</option>
                                	 	<option>创意休闲 </option>
                                	 	<option>策略经营 </option>
                                 		</select>
                                	</p>
                                	<p class="pp">
                                 		<select name="appInfo.classification" id="id_classification">
                                 		<option <%if(app.getAppInfo().getClassification().equals("斗地主")){ %> selected="selected"<%} %>>斗地主</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("麻将")){ %> selected="selected"<%} %>>麻将</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("纸牌")){ %> selected="selected"<%} %>>纸牌</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("拼图")){ %> selected="selected"<%} %>>拼图</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(app.getAppInfo().getCategory().equals("竞赛动作")){ %>
                                   <p class="pp">
                                	 	<select name="appInfo.category" id="id_category" onchange="selectCategory()">
                                	 	<option>角色扮演</option>
                                	 	<option>飞行射击</option>
                                	 	<option>体育竞技</option>
                                	 	<option>益智棋牌</option>
                                	 	<option selected="selected">竞赛动作</option>
                                	 	<option>创意休闲 </option>
                                	 	<option>策略经营 </option>
                                 		</select>
                                	</p>
                                	<p class="pp">
                                 		<select name="appInfo.classification" id="id_classification">
                                 		<option <%if(app.getAppInfo().getClassification().equals("跑酷")){ %> selected="selected"<%} %>>跑酷</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("横版")){ %> selected="selected"<%} %>>横版</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("3D")){ %> selected="selected"<%} %>>3D</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("赛车")){ %> selected="selected"<%} %>>赛车</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(app.getAppInfo().getCategory().equals("创意休闲")){ %>
                                   <p class="pp">
                                	 	<select name="appInfo.category" id="id_category" onchange="selectCategory()">
                                	 	<option>角色扮演</option>
                                	 	<option>飞行射击</option>
                                	 	<option>体育竞技</option>
                                	 	<option>益智棋牌</option>
                                	 	<option>竞赛动作</option>
                                	 	<option selected="selected">创意休闲 </option>
                                	 	<option>策略经营 </option>
                                 		</select>
                                	</p>
                                	<p class="pp">
                                 		<select name="appInfo.classification" id="id_classification">
                                 		<option <%if(app.getAppInfo().getClassification().equals("卡通")){ %> selected="selected"<%} %>>卡通</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("连连看")){ %> selected="selected"<%} %>>连连看</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("捕鱼")){ %> selected="selected"<%} %>>捕鱼</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("祖玛")){ %> selected="selected"<%} %>>祖玛</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                    <%if(app.getAppInfo().getCategory().equals("策略经营")){ %>
                                   <p class="pp">
                                	 	<select name="appInfo.category" id="id_category" onchange="selectCategory()">
                                	 	<option>角色扮演</option>
                                	 	<option>飞行射击</option>
                                	 	<option>体育竞技</option>
                                	 	<option>益智棋牌</option>
                                	 	<option>竞赛动作</option>
                                	 	<option>创意休闲 </option>
                                	 	<option selected="selected">策略经营 </option>
                                 		</select>
                                	</p>
                                	<p class="pp">
                                 		<select name="appInfo.classification" id="id_classification">
                                 		<option <%if(app.getAppInfo().getClassification().equals("经营")){ %> selected="selected"<%} %>>经营</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("卡牌")){ %> selected="selected"<%} %>>卡牌</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("塔防")){ %> selected="selected"<%} %>>塔防</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("战争")){ %> selected="selected"<%} %>>战争</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   </div>
                                 <%}
                                 else{
                                 %>	
                                 <div><label>类型:</label>
                                 <p class="pp">
                                 	<select name="appInfo.type" onchange="selectAppType()" id="id_type">
                                   		<option>游戏</option>
                                   		<option selected="selected">应用</option>
                                 	</select>
                                 	</p>
                                 	</div>
                                 	<div><label>分类:</label>
                                 	<%if(app.getAppInfo().getCategory().equals("系统安全")){ %>
                                   <p class="pp">
                                	 	<select name="appInfo.category" id="id_category" onchange="selectCategory()">
                                	 	<option selected="selected">系统安全</option>
                                	 	<option>常用工具</option>
                                	 	<option>摄影美化</option>
                                	 	<option>影音图象</option>
                                	 	<option>便捷生活</option>
                                	 	<option>社交通信</option>
                                	 	<option>阅读学习</option>
                                 		</select>
                                	</p>
                                	<p class="pp">
                                 		<select name="appInfo.classification" id="id_classification">
                                 		<option <%if(app.getAppInfo().getClassification().equals("杀毒")){ %> selected="selected"<%} %>>杀毒</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("安全")){ %> selected="selected"<%} %>>安全</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("流量")){ %> selected="selected"<%} %>>流量</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("优化")){ %> selected="selected"<%} %>>优化</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(app.getAppInfo().getCategory().equals("常用工具")){%>
                                   <p class="pp">
                                	 	<select name="appInfo.category" id="id_category" onchange="selectCategory()">
                                	 	<option>系统安全</option>
                                	 	<option selected="selected">常用工具</option>
                                	 	<option>摄影美化</option>
                                	 	<option>影音图象</option>
                                	 	<option>便捷生活</option>
                                	 	<option>社交通信</option>
                                	 	<option>阅读学习</option>
                                 		</select>
                                	</p>
                                	<p class="pp">
                                 		<select name="appInfo.classification" id="id_classification">
                                 		<option <%if(app.getAppInfo().getClassification().equals("浏览器")){ %> selected="selected"<%} %>>浏览器</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("输入法")){ %> selected="selected"<%} %>>输入法</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("文件")){ %> selected="selected"<%} %>>文件</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("办公 ")){ %> selected="selected"<%} %>>办公 </option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(app.getAppInfo().getCategory().equals("摄影美化")){ %>
                                   <p class="pp">
                                	 	<select name="appInfo.category" id="id_category" onchange="selectCategory()">
                                	 	<option>系统安全</option>
                                	 	<option>常用工具</option>
                                	 	<option selected="selected">摄影美化</option>
                                	 	<option>影音图象</option>
                                	 	<option>便捷生活</option>
                                	 	<option>社交通信</option>
                                	 	<option>阅读学习</option>
                                 		</select>
                                	</p>
                                	<p class="pp">
                                 		<select name="appInfo.classification" id="id_classification">
                                 		<option <%if(app.getAppInfo().getClassification().equals("相机")){ %> selected="selected"<%} %>>相机</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("壁纸")){ %> selected="selected"<%} %>>壁纸</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("桌面")){ %> selected="selected"<%} %>>桌面</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("主题")){ %> selected="selected"<%} %>>主题</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(app.getAppInfo().getCategory().equals("影音图象")){ %>
                                   <p class="pp">
                                	 	<select name="appInfo.category" id="id_category" onchange="selectCategory()">
                                	 	<option>系统安全</option>
                                	 	<option>常用工具</option>
                                	 	<option>摄影美化</option>
                                	 	<option selected="selected">影音图象</option>
                                	 	<option>便捷生活</option>
                                	 	<option>社交通信</option>
                                	 	<option>阅读学习</option>
                                 		</select>
                                	</p>
                                	<p class="pp">
                                 		<select name="appInfo.classification" id="id_classification">
                                 		<option <%if(app.getAppInfo().getClassification().equals("播放器")){ %> selected="selected"<%} %>>播放器</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("相册")){ %> selected="selected"<%} %>>相册</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("视频")){ %> selected="selected"<%} %>>视频</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("音乐")){ %> selected="selected"<%} %>>音乐</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(app.getAppInfo().getCategory().equals("便捷生活")){ %>
                                   <p class="pp">
                                	 	<select name="appInfo.category" id="id_category" onchange="selectCategory()">
                                	 	<option>系统安全</option>
                                	 	<option>常用工具</option>
                                	 	<option>摄影美化</option>
                                	 	<option>影音图象</option>
                                	 	<option selected="selected">便捷生活</option>
                                	 	<option>社交通信</option>
                                	 	<option>阅读学习</option>
                                 		</select>
                                	</p>
                                	<p class="pp">
                                 		<select name="appInfo.classification" id="id_classification">
                                 		<option <%if(app.getAppInfo().getClassification().equals("旅行")){ %> selected="selected"<%} %>>旅行</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("理财")){ %> selected="selected"<%} %>>理财</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("购物")){ %> selected="selected"<%} %>>购物</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("健康")){ %> selected="selected"<%} %>>健康</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(app.getAppInfo().getCategory().equals("社交通信")){ %>
                                   <p class="pp">
                                	 	<select name="appInfo.category" id="id_category" onchange="selectCategory()">
                                	 	<option>系统安全</option>
                                	 	<option>常用工具</option>
                                	 	<option>摄影美化</option>
                                	 	<option>影音图象</option>
                                	 	<option>便捷生活</option>
                                	 	<option selected="selected">社交通信</option>
                                	 	<option>阅读学习</option>
                                 		</select>
                                	</p>
                                	<p class="pp">
                                 		<select name="appInfo.classification" id="id_classification">
                                 		<option <%if(app.getAppInfo().getClassification().equals("婚恋")){ %> selected="selected"<%} %>>婚恋</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("微博")){ %> selected="selected"<%} %>>微博</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("交友")){ %> selected="selected"<%} %>>交友</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("聊天")){ %> selected="selected"<%} %>>聊天</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(app.getAppInfo().getCategory().equals("阅读学习")){ %>
                                   <p class="pp">
                                	 	<select name="appInfo.category" id="id_category" onchange="selectCategory()">
                                	 	<option>系统安全</option>
                                	 	<option>常用工具</option>
                                	 	<option>摄影美化</option>
                                	 	<option>影音图象</option>
                                	 	<option>便捷生活</option>
                                	 	<option>社交通信</option>
                                	 	<option selected="selected">阅读学习</option>
                                 		</select>
                                	</p>
                                	<p class="pp">
                                 		<select name="appInfo.classification" id="id_classification">
                                 		<option <%if(app.getAppInfo().getClassification().equals("杂志")){ %> selected="selected"<%} %>>杂志</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("新闻")){ %> selected="selected"<%} %>>新闻</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("漫画")){ %> selected="selected"<%} %>>漫画</option>
                                 		<option <%if(app.getAppInfo().getClassification().equals("电子书")){ %> selected="selected"<%} %>>电子书</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                 <%} %>
                                 </div>
                                 
                              
                              <div><label>语言:</label>
                                 <p class="pp">
                                 <select style="width:120px" name="appInfo.language" id="id_language">
                                 <%if(app.getAppInfo().getLanguage()==null){ %>
                                   <option>简体中文</option>
                                   <option>英文</option>
                                   <%}
                                 else if(app.getAppInfo().getLanguage().equals("简体中文")){
                                 %>
                                   <option selected="selected">简体中文</option>
                                   <option>英文</option>
                                 <%} 
                                 else{ %>
                                   <option>简体中文</option>
                                   <option selected="selected">英文</option>
                                 <%} %>
                                 </select>
                                 </p>
                              </div>
                              <div><label class="zifei">资费内容:</label>
                                 <p class="pp">
                                 <%if(app.getAppInfo().getFee()!=null){
                                 switch(app.getAppInfo().getFee().charAt(0)){
                                 case '1': %>
                                    <p><input type="radio" value="1" name="appInfo.fee" checked="checked" />没有收费内容</p>
                                    <p><input type="radio" value="2" name="appInfo.fee" />这个应用是试用版，付费后才能使用完整功能</p>
                                    <p><input type="radio" value="3" name="appInfo.fee" />这个应用包含付费内容，如表情，道具，电子书等虚拟物品</p>
                                    <p><input type="radio" value="4" name="appInfo.fee" />这个应用是试用版，付费后才能使用完整功能，同时应用中包含付费方可购买的虚拟物品</p>
                                    <%break;
                                 case '2':%>
                                 	<p><input type="radio" value="1" name="appInfo.fee"  />没有收费内容</p>
                                    <p><input type="radio" value="2" name="appInfo.fee" checked="checked" />这个应用是试用版，付费后才能使用完整功能</p>
                                    <p><input type="radio" value="3" name="appInfo.fee" />这个应用包含付费内容，如表情，道具，电子书等虚拟物品</p>
                                    <p><input type="radio" value="4" name="appInfo.fee" />这个应用是试用版，付费后才能使用完整功能，同时应用中包含付费方可购买的虚拟物品</p>
                                    <%break;
                                  case '3':%>
                                    <p><input type="radio" value="1" name="appInfo.fee"  />没有收费内容</p>
                                    <p><input type="radio" value="2" name="appInfo.fee"  />这个应用是试用版，付费后才能使用完整功能</p>
                                    <p><input type="radio" value="3" name="appInfo.fee" checked="checked" />这个应用包含付费内容，如表情，道具，电子书等虚拟物品</p>
                                    <p><input type="radio" value="4" name="appInfo.fee" />这个应用是试用版，付费后才能使用完整功能，同时应用中包含付费方可购买的虚拟物品</p>
                                    <%break;
                                   case '4':%>
                                   	<p><input type="radio" value="1" name="appInfo.fee"  />没有收费内容</p>
                                    <p><input type="radio" value="2" name="appInfo.fee"  />这个应用是试用版，付费后才能使用完整功能</p>
                                    <p><input type="radio" value="3" name="appInfo.fee" />这个应用包含付费内容，如表情，道具，电子书等虚拟物品</p>
                                    <p><input type="radio" value="4" name="appInfo.fee" checked="checked" />这个应用是试用版，付费后才能使用完整功能，同时应用中包含付费方可购买的虚拟物品</p>
                                    <%break;
                                    default:%>
                                    <p><input type="radio" value="1" name="appInfo.fee"  />没有收费内容</p>
                                    <p><input type="radio" value="2" name="appInfo.fee"  />这个应用是试用版，付费后才能使用完整功能</p>
                                    <p><input type="radio" value="3" name="appInfo.fee" />这个应用包含付费内容，如表情，道具，电子书等虚拟物品</p>
                                    <p><input type="radio" value="4" name="appInfo.fee" />这个应用是试用版，付费后才能使用完整功能，同时应用中包含付费方可购买的虚拟物品</p>
                                    <%break;
                                    } 
                                    }
                                    else{%>
                                    <p><input type="radio" value="1" name="appInfo.fee"  checked="checked"/>没有收费内容</p>
                                    <p><input type="radio" value="2" name="appInfo.fee"  />这个应用是试用版，付费后才能使用完整功能</p>
                                    <p><input type="radio" value="3" name="appInfo.fee" />这个应用包含付费内容，如表情，道具，电子书等虚拟物品</p>
                                    <p><input type="radio" value="4" name="appInfo.fee" />这个应用是试用版，付费后才能使用完整功能，同时应用中包含付费方可购买的虚拟物品</p>
                                    <%} %>
                              </div>
                              <div><label>安全防范:</label>
                              
                                 <p class="pp pp2">
                                 <%if(app.getAppInfo().getSecurity()==null){ %>
                                 <p class="fangfan">
                                    <input type="checkbox" name="appTmp.adv" value="0"/>无广告
                                    <input type="checkbox" name="appTmp.vir" value="0"/>无病毒
                                    <input type="checkbox" name="appTmp.pri" value="0"/>隐私
                                    <input type="checkbox" name="appTmp.off" value="0"/>官方版
                                 </p>
                                    <%}
                                 else {
                                 %>
                                 <%if(app.getAppInfo().getSecurity().charAt(0)=='0'){ %>
                                 	<input type="checkbox" name="appTmp.adv" checked="checked" value="0"/>无广告
                                 <%}
                                 else{%>
                                 	<input type="checkbox" name="appTmp.adv" value="0"/>无广告
                                 <%} 
                                 if(app.getAppInfo().getSecurity().charAt(2)=='0'){
                                 %>
                                	<input type="checkbox" name="appTmp.vir" checked="checked" value="0"/>无病毒
                                 <%}
                                 else{%>
                                 	<input type="checkbox" name="appTmp.vir" value="0"/>无病毒
                                 <%}
                                 if(app.getAppInfo().getSecurity().charAt(4)=='0'){%>
                                 	<input type="checkbox" name="appTmp.pri" checked="checked" value="0"/>隐私
                                    <%}
                                 else{%>
                                 	<input type="checkbox" name="appTmp.pri" value="0"/>隐私
                                 <%}
                                 if(app.getAppInfo().getSecurity().charAt(6)=='0'){%>
                                 	<input type="checkbox" name="appTmp.off" checked="checked" value="官方版"/>官方版
                                 <%}
                                 else{%>
                                 	<input type="checkbox" name="appTmp.off" value="0"/>官方版
                                 <%}
                                 } %>
                                 </p>
                              </div>
                              <div><label class="zifei">简介:</label>
                                 <p class="pp pp2">
                                 <%if(app.getAppInfo().getAppIntrodution()==null){ %>
                                   <textarea id="id_appIntrodution" name="appInfo.appIntrodution">应用简介</textarea>
                                   <%}
                                 else{
                                 %>
                                 	<textarea id="id_appIntrodution" name="appInfo.appIntrodution"><%=app.getAppInfo().getAppIntrodution() %></textarea>
                                 <%} %>
                                   <div class="zhushi">50到1500字，简述应用的作用、使用方法等信息</div>
                              </div>
                              <div><label class="zifei">详细描述:</label>
                                 <p class="pp pp2">
                                 <%if(app.getAppInfo().getElaborate()==null){ %>
                                   <textarea id="id_elaborate" name="appInfo.elaborate">详细描述</textarea>
                                   <%}
                                 else{
                                 %>
                                 <textarea id="id_elaborate" name="appInfo.elaborate"><%=app.getAppInfo().getElaborate() %></textarea>
                                 <%} %>
                                   <div class="zhushi">可输入500字，详细应用的作用、使用方法等信息</div>
                              </div>
                              <div><label class="zifei">版本简介:</label>
                                 <p class="pp pp2">
                                 <%if(app.getAppInfo().getVersionIntrodution()==null){ %>
                                   <textarea id="id_versionIntroduction" name="appInfo.versionIntrodution">版本简介</textarea>
                                   <%}
                                 else{
                                 %>
                                 <textarea id="id_versionIntroduction" name="appInfo.versionIntrodution"><%=app.getAppInfo().getVersionIntrodution() %></textarea>
                                 <%} %>
                                   <div class="zhushi zhushi2">长度不超过400字符，介绍当前应用版本及更新内容的描述。我们建议您按照规范填写“当前版本介绍”因为我们会把更新说明展示给用户，同时您的应用还可以获得优先审核及小编推荐的机会
</div>
                            </div>     
                               
                               
                              <!-- ********************************nextpage****************************************************** -->
                              <div id="nextPage">
                               <div><label>应用程序包:</label><p class="pp">
                               <%if(app.getAppSou().getPackge()==null){ %>
                               <input name="appSou.packge" height="30" type="text" size="40" id="id_tx_packge" readonly/>
                               <input type="file" name="appTmp.packgeContent" style="display:none;" id="id_packge"/>
                               <%}
                               else{%>
                               <input name="appSou.packge" height="30" type="text" size="40" id="id_tx_packge" value=<%=app.getAppSou().getPackge() %> readonly/>
                               <input type="file" name="appTmp.packgeContent" style="display:none;" id="id_packge" onchange="id_tx_packge.value=this.value"/>
                               <%} %>
                               <a href="javascript:fn_browse();" title="上传" >
                               <img name="btn" src="images/img25.png" width="26" height="26" border="0" style="vertical-align:middle"/>
                               </a><p class="zhushi">请上传首发时的软件应用包APK文件，大小不超过1GB<br /><a href="#" class="bluea">上传失败常见问题及解决办法！
</a>
</p>
                               </div>
                               <div><label>logo图标:</label><p class="pp">
                               <%if(app.getAppSou().getLogo1()==null){ %>
                               <input name="appSou.logo1" height="30" type="text" size="40" id="id_tx_logo1" readonly/>
                               <%}
                               else{%>
                               <input name="appSou.logo1" height="30" type="text" size="40" id="id_tx_logo1" value=<%=app.getAppSou().getLogo1() %> readonly/>
                               <%} %>
                               <input type="file"  name="appTmp.logo1Content" style="display:none;" id="id_logo1"  />
                               <a href="javascript:fn_browse1();" title="上传"> <img name="btn" src="images/img25.png" width="26" height="26" border="0" style="vertical-align:middle"/></a>
                               <p class="zhushi">尺寸48px*48px，png格式，圆角 ，具体请参考<a href="#" class="bluea"> Logo样本</a>
</p>
                               </div>
                               <div><label>logo图标(94*94):</label><p class="pp">
                               <%if(app.getAppSou().getLogo2()==null){ %>
                               <input name="appSou.logo2" height="30" type="text" size="40" id="id_tx_logo2" readonly/>
                               <%}
                               else{%>
                               <input name="appSou.logo2" height="30" type="text" size="40" id="id_tx_logo2" value=<%=app.getAppSou().getLogo2() %> readonly/>
                               <%} %>
                               <input type="file"  name="appTmp.logo2Content" style="display:none;" id="id_logo2"  />
                               <a href="javascript:fn_browse2();" title="上传"> <img name="btn" src="images/img25.png" width="26" height="26" border="0" style="vertical-align:middle"/></a>
                               <p class="zhushi">我们建议您提供高清的LOGO图标，这样可以获得更好的视觉展示效果和用户点击。
尺寸94px*94px，png格式，圆角，具体参考Logo样本
我们建议您提供高清的LOGO图标，这样可以获得更好的视觉展示效果和用户点击。<br />
尺寸94px*94px，png格式，圆角，具体参考
<a href="#" class="bluea"> Logo样本</a>
</p>
                               </div>
                               <div style=" clear:both; overflow:hidden; zoom:1;"><label>游戏图片素材:</label><div class="sclogo">
                                   <div class="logoimg">
                                      <div>
                                      	  <input type="file"  name="appTmp.gamePhotoContent1" style="display:none;" id="gamePhoto1" />
                                          <a href="javascript:fn_browse3();" title="上传"> 
                                          <%if(app.getAppSou().getGamePhoto1()==null){ %>
                                          <img name="btn" src="images/img26.png"  width="81" height="71" border="0" style="vertical-align:middle" id="photo1"/>
                                          </a><a href="#" id="del3" style="display: none;">删除</a>
                                          <%}
                                          else{%>
                                          <img name="btn" src="<%=request.getContextPath()+app.getAppSou().getGamePhoto1() %>"  width="81" height="71" border="0" style="vertical-align:middle" id="photo1"/>
                                          <%} %>
                                          </a>
                                          <input type="file"  name="appTmp.gamePhotoContent2" style="display:none;" id="gamePhoto2" />
                                          <a href="javascript:fn_browse4();" title="上传"> 
                                          <%if(app.getAppSou().getGamePhoto2()==null){ %>
                                          <img name="btn" src="images/img26.png"  width="81" height="71" border="0" style="vertical-align:middle" id="photo2"/>
                                          <%}
                                          else{%>
                                          <img name="btn" src="<%=request.getContextPath()+app.getAppSou().getGamePhoto2() %>"  width="81" height="71" border="0" style="vertical-align:middle" id="photo2"/>
                                          <%} %>
                                          </a>
                                          <input type="file"  name="appTmp.gamePhotoContent3" style="display:none;" id="gamePhoto3" />
                                          <a href="javascript:fn_browse5();" title="上传"> 
                                          <%if(app.getAppSou().getGamePhoto3()==null){ %>
                                          <img name="btn" src="images/img26.png"  width="81" height="71" border="0" style="vertical-align:middle" id="photo3"/>
                                          <%}
                                          else{%>
                                          <img name="btn" src="<%=request.getContextPath()+app.getAppSou().getGamePhoto3() %>"  width="81" height="71" border="0" style="vertical-align:middle" id="photo3"/>
                                          <%} %>
                                          </a>
                                          <input type="file"  name="appTmp.gamePhotoContent4" style="display:none;" id="gamePhoto4" />
                                          <a href="javascript:fn_browse6();" title="上传"> 
                                          <%if(app.getAppSou().getGamePhoto4()==null){ %>
                                          <img name="btn" src="images/img26.png"  width="81" height="71" border="0" style="vertical-align:middle" id="photo4"/>
                                          <%}
                                          else{%>
                                          <img name="btn" src="<%=request.getContextPath()+app.getAppSou().getGamePhoto4() %>"  width="81" height="71" border="0" style="vertical-align:middle" id="photo4"/>
                                          <%} %>
                                          </a>
                                          <input type="file"  name="appTmp.gamePhotoContent5" style="display:none;" id="gamePhoto5" />
                                          <a href="javascript:fn_browse7();" title="上传"> 
                                          <%if(app.getAppSou().getGamePhoto5()==null){ %>
                                          <img name="btn" src="images/img26.png"  width="81" height="71" border="0" style="vertical-align:middle" id="photo5"/>
                                          <%}
                                          else{%>
                                          <img name="btn" src="<%=request.getContextPath()+app.getAppSou().getGamePhoto5() %>"  width="81" height="71" border="0" style="vertical-align:middle" id="photo5"/>
                                          <%} %>
                                          </a>
                                      </div>
                                       
                                   </div>
                                   <!--logoimg-->
                                   <p class="zhushi3">尺寸246x409，jpg或png，<a href="#" class="bluea">示例照片</a></p>
                               </div> 
                               </div>
                               <div class="time"><label>发布时间:</label><p class="pp">
                               <%if(app.getAppInfo().getReleaseTime()==null){ %>
                               <input type="radio" name="appInfo.releaseTime" value="0" checked="checked"/><b>审核后立即发布</b><br /><br />
                               <input type="radio" name="appInfo.releaseTime" value="1"/><b>等待发布</b><br /><span>
</span></p>			
								<%}
                               else if(app.getAppInfo().getReleaseTime().equals("0")){%>
                               <input type="radio" name="appInfo.releaseTime" value="0" checked="checked"/><b>审核后立即发布</b><br /><br />
                               <input type="radio" name="appInfo.releaseTime" value="1"/><b>等待发布</b><br /><span>
</span>		
                               <%}
                               else{%>
                               <input type="radio" name="appInfo.releaseTime" value="0"/><b>审核后立即发布</b><br /><br />
                               <input type="radio" name="appInfo.releaseTime" value="1" checked="checked"/><b>等待发布</b><br /><span>
</span>		
                               <% } %>
                               </div>
                               <img id="progressImgage" class="progress" style="display:none" alt="" src="images/load.gif"/> 
									<div id="maskOfProgressImage" class="mask" style="display:none"></div> 
                               <div class="uppage"><input type="submit" value="提交" class="tijiao" id="id_submit"/></div>
                              </div>
                          </form>
            
                      </div>
                      <!--dailist-->

               </div>
     </div>
 </div>
 </div>
 
</body>
</html>
