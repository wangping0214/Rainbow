<%@ page import="com.rainbow.entity.AppInfo" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%AppInfo info = (AppInfo)session.getAttribute("info"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>管理审核� 基本信息</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/scripts/jquery.min.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript"> 

$(document).ready(function(){
	
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
                      <h3 class="tit2">管理审核& 基本信息</h3>
                      <div class="xinxicont">
                          <form id="form1" name="form1" method="post" action="auditInfo.action" enctype="multipart/form-data">
                               <div><label>APP名称:</label><p class="pp">
                               <input height="30" name="subApp.appInfo.appName" type="text" size="40" value="<%=info.getAppName()%>"/><p class="zhushi">不超过15个中文字符或30个英文字符。</p></p>
                               </div>
                               <div><label>类型:</label>
                                 <p class="pp">
                                 <%if(info.getType()==null){ %>
                                 	<select name="subApp.appInfo.type" onchange="selectAppType()" id="id_type">
                                 	<option>请选择类型</option>
                                   	<option>游戏</option>
                                   	<option>应用</option>
                                   	</select>
                                   <div><label>分类:</label>
                                 <p class="pp">
                                 <select name="subApp.appInfo.category" id="id_category" onchange="selectCategory()">
                                 </select>
                                 </p>
                                 <p class="pp">
                                 <select name="subApp.appInfo.classification" id="id_classification"></select>
                                 </p>
                              </div>
                                 <%}
                                 else if(info.getType().equals("游戏")){
                                 %>
                                 	<select name="subApp.appInfo.type" onchange="selectAppType()" id="id_type">
                                   		<option selected="selected">游戏</option>
                                   		<option>应用</option>
                                   	</select>
                                   	<div><label>分类:</label>
                                   <%if(info.getCategory().equals("角色扮演")){ %>
                                   <p class="pp">
                                	 	<select name="subApp.appInfo.category" id="id_category" onchange="selectCategory()">
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
                                 		<select name="subApp.appInfo.classification" id="id_classification">
                                 		<option <%if(info.getClassification().equals("回合制")){ %> selected="selected"<%} %>>回合制</option>
                                 		<option <%if(info.getClassification().equals("卡牌")){ %> selected="selected"<%} %>>卡牌</option>
                                 		<option <%if(info.getClassification().equals("玄幻")){ %> selected="selected"<%} %>>玄幻</option>
                                 		<option <%if(info.getClassification().equals("武侠")){ %> selected="selected"<%} %>>武侠</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(info.getCategory().equals("飞行射击")){%>
                                   <p class="pp">
                                	 	<select name="subApp.appInfo.category" id="id_category" onchange="selectCategory()">
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
                                 		<select name="subApp.appInfo.classification" id="id_classification">
                                 		<option <%if(info.getClassification().equals("射击")){ %> selected="selected"<%} %>>射击</option>
                                 		<option <%if(info.getClassification().equals("阻击")){ %> selected="selected"<%} %>>阻击</option>
                                 		<option <%if(info.getClassification().equals("坦克")){ %> selected="selected"<%} %>>坦克</option>
                                 		<option <%if(info.getClassification().equals("飞行")){ %> selected="selected"<%} %>>飞行 </option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(info.getCategory().equals("体育竞技")){ %>
                                   <p class="pp">
                                	 	<select name="subApp.appInfo.category" id="id_category" onchange="selectCategory()">
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
                                 		<select name="subApp.appInfo.classification" id="id_classification">
                                 		<option <%if(info.getClassification().equals("街机")){ %> selected="selected"<%} %>>街机</option>
                                 		<option <%if(info.getClassification().equals("足球")){ %> selected="selected"<%} %>>足球</option>
                                 		<option <%if(info.getClassification().equals("篮球")){ %> selected="selected"<%} %>>篮球</option>
                                 		<option <%if(info.getClassification().equals("台球")){ %> selected="selected"<%} %>>台球 </option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(info.getCategory().equals("益智棋牌")){ %>
                                   <p class="pp">
                                	 	<select name="subApp.appInfo.category" id="id_category" onchange="selectCategory()">
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
                                 		<select name="subApp.appInfo.classification" id="id_classification">
                                 		<option <%if(info.getClassification().equals("斗地主")){ %> selected="selected"<%} %>>斗地主</option>
                                 		<option <%if(info.getClassification().equals("麻将")){ %> selected="selected"<%} %>>麻将</option>
                                 		<option <%if(info.getClassification().equals("纸牌")){ %> selected="selected"<%} %>>纸牌</option>
                                 		<option <%if(info.getClassification().equals("拼图")){ %> selected="selected"<%} %>>拼图</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(info.getCategory().equals("竞赛动作")){ %>
                                   <p class="pp">
                                	 	<select name="subApp.appInfo.category" id="id_category" onchange="selectCategory()">
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
                                 		<select name="subApp.appInfo.classification" id="id_classification">
                                 		<option <%if(info.getClassification().equals("跑酷")){ %> selected="selected"<%} %>>跑酷</option>
                                 		<option <%if(info.getClassification().equals("横版")){ %> selected="selected"<%} %>>横版</option>
                                 		<option <%if(info.getClassification().equals("3D")){ %> selected="selected"<%} %>>3D</option>
                                 		<option <%if(info.getClassification().equals("赛车")){ %> selected="selected"<%} %>>赛车</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(info.getCategory().equals("创意休闲")){ %>
                                   <p class="pp">
                                	 	<select name="subApp.appInfo.category" id="id_category" onchange="selectCategory()">
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
                                 		<select name="subApp.appInfo.classification" id="id_classification">
                                 		<option <%if(info.getClassification().equals("卡通")){ %> selected="selected"<%} %>>卡通</option>
                                 		<option <%if(info.getClassification().equals("连连看")){ %> selected="selected"<%} %>>连连看</option>
                                 		<option <%if(info.getClassification().equals("捕鱼")){ %> selected="selected"<%} %>>捕鱼</option>
                                 		<option <%if(info.getClassification().equals("祖玛")){ %> selected="selected"<%} %>>祖玛</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                    <%if(info.getCategory().equals("策略经营")){ %>
                                   <p class="pp">
                                	 	<select name="subApp.appInfo.category" id="id_category" onchange="selectCategory()">
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
                                 		<select name="subApp.appInfo.classification" id="id_classification">
                                 		<option <%if(info.getClassification().equals("经营")){ %> selected="selected"<%} %>>经营</option>
                                 		<option <%if(info.getClassification().equals("卡牌")){ %> selected="selected"<%} %>>卡牌</option>
                                 		<option <%if(info.getClassification().equals("塔防")){ %> selected="selected"<%} %>>塔防</option>
                                 		<option <%if(info.getClassification().equals("战争")){ %> selected="selected"<%} %>>战争</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                 <%}
                                 else{
                                 %>
                                 	<select name="subApp.appInfo.type" onchange="selectAppType()" id="id_type">
                                   		<option>游戏</option>
                                   		<option selected="selected">应用</option>
                                 	</select>
                                 	<div><label>分类:</label>
                                 	<%if(info.getCategory().equals("系统安全")){ %>
                                   <p class="pp">
                                	 	<select name="subApp.appInfo.category" id="id_category" onchange="selectCategory()">
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
                                 		<select name="subApp.appInfo.classification" id="id_classification">
                                 		<option <%if(info.getClassification().equals("杀毒")){ %> selected="selected"<%} %>>杀毒</option>
                                 		<option <%if(info.getClassification().equals("安全")){ %> selected="selected"<%} %>>安全</option>
                                 		<option <%if(info.getClassification().equals("流量")){ %> selected="selected"<%} %>>流量</option>
                                 		<option <%if(info.getClassification().equals("优化")){ %> selected="selected"<%} %>>优化</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(info.getCategory().equals("常用工具")){%>
                                   <p class="pp">
                                	 	<select name="subApp.appInfo.category" id="id_category" onchange="selectCategory()">
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
                                 		<select name="subApp.appInfo.classification" id="id_classification">
                                 		<option <%if(info.getClassification().equals("浏览器")){ %> selected="selected"<%} %>>浏览器</option>
                                 		<option <%if(info.getClassification().equals("输入法")){ %> selected="selected"<%} %>>输入法</option>
                                 		<option <%if(info.getClassification().equals("文件")){ %> selected="selected"<%} %>>文件</option>
                                 		<option <%if(info.getClassification().equals("办公 ")){ %> selected="selected"<%} %>>办公 </option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(info.getCategory().equals("摄影美化")){ %>
                                   <p class="pp">
                                	 	<select name="subApp.appInfo.category" id="id_category" onchange="selectCategory()">
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
                                 		<select name="subApp.appInfo.classification" id="id_classification">
                                 		<option <%if(info.getClassification().equals("相机")){ %> selected="selected"<%} %>>相机</option>
                                 		<option <%if(info.getClassification().equals("壁纸")){ %> selected="selected"<%} %>>壁纸</option>
                                 		<option <%if(info.getClassification().equals("桌面")){ %> selected="selected"<%} %>>桌面</option>
                                 		<option <%if(info.getClassification().equals("主题")){ %> selected="selected"<%} %>>主题</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(info.getCategory().equals("影音图象")){ %>
                                   <p class="pp">
                                	 	<select name="subApp.appInfo.category" id="id_category" onchange="selectCategory()">
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
                                 		<select name="subApp.appInfo.classification" id="id_classification">
                                 		<option <%if(info.getClassification().equals("播放器")){ %> selected="selected"<%} %>>播放器</option>
                                 		<option <%if(info.getClassification().equals("相册")){ %> selected="selected"<%} %>>相册</option>
                                 		<option <%if(info.getClassification().equals("视频")){ %> selected="selected"<%} %>>视频</option>
                                 		<option <%if(info.getClassification().equals("音乐")){ %> selected="selected"<%} %>>音乐</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(info.getCategory().equals("便捷生活")){ %>
                                   <p class="pp">
                                	 	<select name="subApp.appInfo.category" id="id_category" onchange="selectCategory()">
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
                                 		<select name="subApp.appInfo.classification" id="id_classification">
                                 		<option <%if(info.getClassification().equals("旅行")){ %> selected="selected"<%} %>>旅行</option>
                                 		<option <%if(info.getClassification().equals("理财")){ %> selected="selected"<%} %>>理财</option>
                                 		<option <%if(info.getClassification().equals("购物")){ %> selected="selected"<%} %>>购物</option>
                                 		<option <%if(info.getClassification().equals("健康")){ %> selected="selected"<%} %>>健康</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(info.getCategory().equals("社交通信")){ %>
                                   <p class="pp">
                                	 	<select name="subApp.appInfo.category" id="id_category" onchange="selectCategory()">
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
                                 		<select name="subApp.appInfo.classification" id="id_classification">
                                 		<option <%if(info.getClassification().equals("婚恋")){ %> selected="selected"<%} %>>婚恋</option>
                                 		<option <%if(info.getClassification().equals("微博")){ %> selected="selected"<%} %>>微博</option>
                                 		<option <%if(info.getClassification().equals("交友")){ %> selected="selected"<%} %>>交友</option>
                                 		<option <%if(info.getClassification().equals("聊天")){ %> selected="selected"<%} %>>聊天</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                   <%if(info.getCategory().equals("阅读学习")){ %>
                                   <p class="pp">
                                	 	<select name="subApp.appInfo.category" id="id_category" onchange="selectCategory()">
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
                                 		<select name="subApp.appInfo.classification" id="id_classification">
                                 		<option <%if(info.getClassification().equals("杂志")){ %> selected="selected"<%} %>>杂志</option>
                                 		<option <%if(info.getClassification().equals("新闻")){ %> selected="selected"<%} %>>新闻</option>
                                 		<option <%if(info.getClassification().equals("漫画")){ %> selected="selected"<%} %>>漫画</option>
                                 		<option <%if(info.getClassification().equals("电子书")){ %> selected="selected"<%} %>>电子书</option>
                                 		</select>
                                 	</p>
                                   <%} %>
                                 <%} %>
                                 </div>
                              </div>
                              <div><label>APP语言:</label>
                                 <p class="pp">
                                 <select style="width:120px" name="subApp.appInfo.language">
                                 <%if(info.getLanguage().equals("简体中文")){ %>
                                   <option selected="selected">简体中文</option>
                                   <option>英文</option>
                                   <%}
                                 else
                                 {%>
                                	<option>简体中文</option>
                                   <option selected="selected">英文</option>
                                   <%} %>
                                 </select>
                                 </p>
                              </div>
                              <div><label class="zifei">APP资费:</label>
                                 <p class="pp">
                                 <%if(info.getFee()!=null){
                                 switch(info.getFee().charAt(0)){
                                 case '1': %>
                                    <p><input type="radio" value="1" name="subApp.appInfo.fee" checked="checked" />没有收费内容</p>
                                    <p><input type="radio" value="2" name="subApp.appInfo.fee" />这个应用是试用版，付费后才能使用完整功能</p>
                                    <p><input type="radio" value="3" name="subApp.appInfo.fee" />这个应用包含付费内容，如表情，道具，电子书等虚拟物品</p>
                                    <p><input type="radio" value="4" name="subApp.appInfo.fee" />这个应用是试用版，付费后才能使用完整功能，同时应用中包含付费方可购买的虚拟物品</p>
                                    <%break;
                                 case '2':%>
                                 	<p><input type="radio" value="1" name="subApp.appInfo.fee"  />没有收费内容</p>
                                    <p><input type="radio" value="2" name="subApp.appInfo.fee" checked="checked" />这个应用是试用版，付费后才能使用完整功能</p>
                                    <p><input type="radio" value="3" name="subApp.appInfo.fee" />这个应用包含付费内容，如表情，道具，电子书等虚拟物品</p>
                                    <p><input type="radio" value="4" name="subApp.appInfo.fee" />这个应用是试用版，付费后才能使用完整功能，同时应用中包含付费方可购买的虚拟物品</p>
                                    <%break;
                                  case '3':%>
                                    <p><input type="radio" value="1" name="subApp.appInfo.fee"  />没有收费内容</p>
                                    <p><input type="radio" value="2" name="subApp.appInfo.fee"  />这个应用是试用版，付费后才能使用完整功能</p>
                                    <p><input type="radio" value="3" name="subApp.appInfo.fee" checked="checked" />这个应用包含付费内容，如表情，道具，电子书等虚拟物品</p>
                                    <p><input type="radio" value="4" name="subApp.appInfo.fee" />这个应用是试用版，付费后才能使用完整功能，同时应用中包含付费方可购买的虚拟物品</p>
                                    <%break;
                                   case '4':%>
                                   	<p><input type="radio" value="1" name="subApp.appInfo.fee"  />没有收费内容</p>
                                    <p><input type="radio" value="2" name="subApp.appInfo.fee"  />这个应用是试用版，付费后才能使用完整功能</p>
                                    <p><input type="radio" value="3" name="subApp.appInfo.fee" />这个应用包含付费内容，如表情，道具，电子书等虚拟物品</p>
                                    <p><input type="radio" value="4" name="subApp.appInfo.fee" checked="checked" />这个应用是试用版，付费后才能使用完整功能，同时应用中包含付费方可购买的虚拟物品</p>
                                    <%break;
                                    default:%>
                                    <p><input type="radio" value="1" name="subApp.appInfo.fee"  />没有收费内容</p>
                                    <p><input type="radio" value="2" name="subApp.appInfo.fee"  />这个应用是试用版，付费后才能使用完整功能</p>
                                    <p><input type="radio" value="3" name="subApp.appInfo.fee" />这个应用包含付费内容，如表情，道具，电子书等虚拟物品</p>
                                    <p><input type="radio" value="4" name="subApp.appInfo.fee" />这个应用是试用版，付费后才能使用完整功能，同时应用中包含付费方可购买的虚拟物品</p>
                                    <%break;
                                    } 
                                    }
                                    else{%>
                                    <p><input type="radio" value="1" name="subApp.appInfo.fee"  />没有收费内容</p>
                                    <p><input type="radio" value="2" name="subApp.appInfo.fee"  />这个应用是试用版，付费后才能使用完整功能</p>
                                    <p><input type="radio" value="3" name="subApp.appInfo.fee" />这个应用包含付费内容，如表情，道具，电子书等虚拟物品</p>
                                    <p><input type="radio" value="4" name="subApp.appInfo.fee" />这个应用是试用版，付费后才能使用完整功能，同时应用中包含付费方可购买的虚拟物品</p>
                                    <%} %>
                                    </p>
                              </div>
                              <div><label>安全防范:</label>
                                  <p class="pp pp2">
                                 <%if(info.getSecurity()==null){ %>
                                    <p class="fangfan">
                                    <input type="checkbox" name="appTmp.adv" value="0"/>无广告
                                    <input type="checkbox" name="appTmp.vir" value="0"/>无病毒
                                    <input type="checkbox" name="appTmp.pri" value="0"/>隐私
                                    <input type="checkbox" name="appTmp.off" value="0"/>官方版
                                 </p>
                                    <%}
                                 else {
                                 %>
                                 <%if(info.getSecurity().charAt(0)=='0'){ %>
                                 	<input type="checkbox" name="appTmp.adv" checked="checked" value="0"/>无广告
                                 <%}
                                 else{%>
                                 	<input type="checkbox" name="appTmp.adv" value="0"/>无广告
                                 <%} 
                                 if(info.getSecurity().charAt(2)=='0'){
                                 %>
                                	<input type="checkbox" name="appTmp.vir" checked="checked" value="0"/>无病毒
                                 <%}
                                 else{%>
                                 	<input type="checkbox" name="appTmp.vir" value="0"/>无病毒
                                 <%}
                                 if(info.getSecurity().charAt(4)=='0'){%>
                                 	<input type="checkbox" name="appTmp.pri" checked="checked" value="0"/>隐私
                                    <%}
                                 else{%>
                                 	<input type="checkbox" name="appTmp.pri" value="0"/>隐私
                                 <%}
                                 if(info.getSecurity().charAt(6)=='0'){%>
                                 	<input type="checkbox" name="appTmp.off" checked="checked" value="0"/>官方版
                                 <%}
                                 else{%>
                                 	<input type="checkbox" name="appTmp.off" value="0"/>官方版
                                 <%}
                                 } %>
                                 </p>
                              </div>
                              <div><label class="zifei">APP简介:</label>
                                 <p class="pp pp2">
                                 <%if(info.getAppIntrodution()==null){ %>
                                   <textarea id="id_appIntrodution" name="subApp.appInfo.appIntrodution">应用简介</textarea>
                                   <%}
                                 else{
                                 %>
                                 	<textarea id="id_appIntrodution" name="subApp.appInfo.appIntrodution"><%=info.getAppIntrodution() %></textarea>
                                 <%} %>
                                   <div class="zhushi">50到1500字，简述应用的作用、使用方法等信息</div>
                                   </p>
                              </div>
                              <div><label class="zifei">描述:</label>
                                  <p class="pp pp2">
                                 <%if(info.getElaborate()==null){ %>
                                   <textarea id="id_elaborate" name="subApp.appInfo.elaborate">详细描述</textarea>
                                   <%}
                                 else{
                                 %>
                                 <textarea id="id_elaborate" name="subApp.appInfo.elaborate"><%=info.getElaborate() %></textarea>
                                 <%} %>
                                   <div class="zhushi">可输入500字，详细应用的作用、使用方法等信息</div>
                                   </p>
                              </div>
                              <div><label class="zifei">版本简介:</label>
                                  <p class="pp pp2">
                                 <%if(info.getVersionIntrodution()==null){ %>
                                   <textarea id="id_versionIntroduction" name="subApp.appInfo.versionIntrodution">版本简介</textarea>
                                   <%}
                                 else{
                                 %>
                                 <textarea id="id_versionIntroduction" name="subApp.appInfo.versionIntrodution"><%=info.getVersionIntrodution() %></textarea>
                                 <%} %>
                                   <div class="zhushi zhushi2">长度不超过400字符，介绍当前应用版本及更新内容的描述。我们建议您按照规范填写“当前版本介绍”因为我们会把更新说明展示给用户，同时您的应用还可以获得优先审核及小编推荐的机会
</div>
                                 </p>
                              </div>
                          </form>
                          <div class="nextpage"><a href="auditSou.action?appSouId=<%=info.getId() %>" target="main">下一页</a></div>
                      </div>
                      <!--dailist-->

               </div>
     </div>
 </div>
 </div>
 
</body>
</html>
