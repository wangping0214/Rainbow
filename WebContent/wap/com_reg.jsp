<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript" src="<%=request.getContextPath()%>/scripts/jquery-1.10.2.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<title>无标题文档</title>
<script type="text/javascript">
$(document).ready
(
		function()
		{
			check();
			$("#com_reg").submit(checkSubmit);
		}
);
function checkSubmit(){
	if(isUsernameExists&&isEmailExists&&isIdcardExists&&isPasswordExists&&isrePasswordExists&&isAllExists){
		alert("恭喜您,注册成功!点击“确定”返回登陆页面。 ");
		return true;
	}
	else{
		alert("很遗憾,请确认填写信息是否符合要求! ");
		return false;
	}
}
var isUsernameExists =false;var isEmailExists =false;var isIdcardExists =false;
var isPasswordExists=false;var isrePasswordExists=false;var isAllExists=false;
function check(){
	$("#id_username").blur(function(){
		var inusername = $("#id_username").val();
		
		if(inusername!=""){
			var reg=/^(?!_)(?!.*?_$)[a-zA-Z0-9_]+$/;
			if(!reg.test(inusername)){
				$("#id_username").text(function(){
					$("#id_username_div").text("用户名格式提醒：6~10位的字母、数字和下划线组成且首尾不能为下划线");
				});
				return isUsernameExists =false;
			}
			else if(inusername.length<6||inusername.length>10){
				
				$("#id_username").text(function(){
					$("#id_username_div").text("用户名格式提醒：6~10位的字母、数字和下划线组成且首尾不能为下划线");
				});
				return isUsernameExists =false;
			}
			else js_on_username();
		}
		else {
			$("#id_username_div").text("用户名不能为空 ");
			return isUsernameExists =false;
		}
		});
	$("#id_email").blur(function(){
		var inemail = $("#id_email").val();
		if(inemail!=""){
			 var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
	          if (!reg.test(inemail)) {
	        	  $("#id_email").text(function(){
	      			$("#id_email_div").text("邮箱格式不正确，请输入正确的邮箱");
	      		});
	             return isEmailExists =false;
	             }
	          else js_on_email();
		}
		else{
			$("#id_email_div").text("邮箱不能为空 ");
			return isEmailExists =false;
		}
	});
	
	$("#id_password").blur(function(){
		var inpassword = $("#id_password").val();
		
		if(inpassword!=""){
			var reg=/^(?!_)(?!.*?_$)[a-zA-Z0-9_]+$/;
			if(!reg.test(inpassword)){
				$("#id_password").text(function(){
					$("#id_password_div").text("密码格式提醒：6~20位的字母、数字和下划线组成且首尾不能为下划线");
				});
				return isPasswordExists =false;
			}
			else if(inpassword.length<6||inpassword.length>20){
				
				$("#id_password").text(function(){
					$("#id_password_div").text("密码格式提醒：6~20位的字母、数字和下划线组成且首尾不能为下划线");
				});
				return isPasswordExists =false;
			}
			else{
				$("#id_password_div").text("密码格式正确！");
				return isPasswordExists=true;
			}
		}
		else {
			$("#id_password_div").text("密码不能为空 ");
			return isPasswordExists =false;
		}
		});
	$("#id_confirm_password").blur(function(){
		var inpassword=$("#id_password").val();
		var inrepassword=$("#id_confirm_password").val();
		ispass(inpassword,inrepassword);
	});
	$("#id_idcard").blur(function(){
		
		 var inidcard=$("#id_idcard").val();
		 if(inidcard!=""){
			 var reg=/(^[0-9]{3,4}-[0-9]{3,8}$)|(^[0-9]{3,8}$)|(^([0-9]{3,4})[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)/;
	          if (!reg.test(inidcard)) {
	        	  $("#id_idcard").text(function(){
	      			$("#id_idcard_div").text("传真号不正确，请输入正确的传真号");
	      		});
	             return isIdcardExists =false;
	             }
	          else js_on_idcard();
		}
		else{
			$("#id_idcard_div").text("传真号不能为空 ");
			return isIdcardExists =false;
		}
	});
	$("#id_register2").click(function(){
		var idcard=$("#id_idcard").val();var username=$("#id_username").val();var password=$("#id_password").val();
		var repassword=$("#id_confirm_password").val();var email=$("#id_email").val();var cord=$("#id_cord").val();
		if(idcard==""||username==""||password==""||repassword==""||email==""||cord==""){
			alert("友情提示： * 为必填信息 ！");
			return isAllExists=false;
		}
			
		else return isAllExists=true;
	});
}
function js_on_username()
{
	var inusername = $("#id_username").val();
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
					$("#id_username_div").html("此用户名可用!");
					isUsernameExists=true;
				}
				else{
					$("#id_username_div").html("此用户名已被注册!");
					isUsernameExists=false;
				}
				//$("#id_username_div").html(response);
			}
		}
	);
}

function js_on_email()
{
	var inemail = $("#id_email").val();
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
					$("#id_email_div").html("此邮箱可用!");
					isEmailExists =true;
				}
				else{
					$("#id_email_div").html("此邮箱已被注册!");
					isEmailExists =false;
				}
				//$("#id_email_div").html(response);
			}
		}
	);
}

function js_on_idcard()
{
	var inidcard = $("#id_idcard").val();
	jQuery.ajax
	(
		{
			type : "post",
			url : "<%=request.getContextPath()%>/checkidcard.action",
			data : "inidcard=" + inidcard,
			cache : false,
			success : function(response)
			{
				if(response=="0"){
					$("#id_idcard_div").html("此传真号可用!");
					isIdcardExists =true;
				}
				else{
					$("#id_idcard_div").html("此传真号已被注册!");
					isIdcardExists =false;
				}
				//$("#id_idcard_div").html(response);
			}
		}
	);
}
function ispass(inpassword,inrepassword){
	if(inpassword!=inrepassword){
		$("#id_confirm_password_div").text("两次输入密码不一致！");
		return isrePasswordExists=false;
	}
	else {
		$("#id_confirm_password_div").text("两次输入密码相同！");
		return isrePasswordExists=true;
	}
}


</script>
<style type="text/css">
.main{
	background-color: #FFFFFF;
	height: 700px;
	width: 960px;
}
.head{
	color: #000000;
	font-family: "微软雅黑";
	font-size: 16px;
	margin-left: 20px;
	margin-top:3px;
	font-weight: bold;
	height: 50px;
	width: 120px;
	background-color: #FFFFFF;
	float: left;
}
.b2{
	color: #0066CC;
	font-family: "微软雅黑";
	font-size: 14px;
	margin-top:0px;
	height: 700px;
	width: 600px;
	background-color: #FFFFFF;
}
.b3{
	color: #000000;
	font-family: "微软雅黑";
	font-size: 14px;
	margin-left: 5px;
	margin-top:40px;
	font-weight: bold;
	height: 123px;
	width: 100%;
}
.b4{
	color: #000000;
	font-family: "微软雅黑";
	margin-left: 5px;
	margin-top:10px;
	height: 60px;
	width: 100%;
}
.b5{
	color: #000000;
	font-family: "微软雅黑";
	margin-left: 5px;
	margin-top:20px;
	height: 200px;
	width: 100%;
}
.right{
	color: #000000;
	font-family: "微软雅黑";
	font-size: 14px;
	height: 120px;
	width: 120px;
	float: right;
	margin-right: 80px;
}
.left{
	color: #000000;
	font-family: "微软雅黑";
	font-size: 14px;
	height: 120px;
	width: 120px;
	float: left;
	margin-left: 80px;
}
</style>
<script language="javascript">
cityareaname=new Array(35);
cityareacode=new Array(35);
 function first(preP,preC,formname,selectP,selectC)
   {
     a=0;
if (selectP=='01')
  { a=1;tempoption=new Option('北京','01',false,true); }
else
  { tempoption=new Option('北京','01'); }
eval('document.'+formname+'.'+preP+'.options[1]=tempoption;');
cityareacode[0]=new Array('0101','0102','0103','0104','0105','0106','0107','0108');
cityareaname[0]=new Array('东城区','西城区','崇文区','宣武区','朝阳区','海淀区','丰台区','石景山');
if (selectP=='02')
  { a=2;tempoption=new Option('深圳','02',false,true); }
else
  { tempoption=new Option('深圳','02'); }
eval('document.'+formname+'.'+preP+'.options[2]=tempoption;');
cityareacode[1]=new Array('0201','0202','0203','0204','0205','0206');
cityareaname[1]=new Array('罗湖','福田','南山','盐田','宝安','龙岗');
if (selectP=='03')
  { a=3;tempoption=new Option('上海','03',false,true); }
else
  { tempoption=new Option('上海','03'); }
eval('document.'+formname+'.'+preP+'.options[3]=tempoption;');
cityareacode[2]=new Array('0301','0302','0303','0304','0305','0306','0307','0308','0309','0310','0311','0312','0313','0314','0315','0316','0317','0318','0319','0320');
cityareaname[2]=new Array('宝山','金山','南市','长宁','静安','青浦','崇明','卢湾','松江','奉贤','浦东','杨浦','虹口','普陀','闸北','黄浦','闵行','徐汇','嘉定','南汇');
if (selectP=='04')
  { a=4;tempoption=new Option('重庆','04',false,true); }
else
  { tempoption=new Option('重庆','04'); }
eval('document.'+formname+'.'+preP+'.options[4]=tempoption;');
cityareacode[3]=new Array('0401','0402','0403','0404','0405','0406');
cityareaname[3]=new Array('渝中','江北','沙坪坝','南岸','九龙坡','大渡口');
if (selectP=='05')
  { a=5;tempoption=new Option('天津','05',false,true); }
else
  { tempoption=new Option('天津','05'); }
eval('document.'+formname+'.'+preP+'.options[5]=tempoption;');
cityareacode[4]=new Array('0501','0502','0503','0504','0505','0506','0507','0508','0509','0510','0511','0512','0513','0514','0515');
cityareaname[4]=new Array('和平','河北','河西','河东','南开','红桥','塘沽','汉沽','大港','东丽','西青','津南','北辰','武清','滨海');
if (selectP=='06')
  { a=6;tempoption=new Option('广东','06',false,true); }
else//欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
  { tempoption=new Option('广东','06'); }
eval('document.'+formname+'.'+preP+'.options[6]=tempoption;');
cityareacode[5]=new Array('0601','0602','0603','0604','0605','0606','0607','0608','0609','0610','0611','0612','0613','0614','0615');
cityareaname[5]=new Array('广州','珠海','中山','佛山','东莞','清远','肇庆','阳江','湛江','韶关','惠州','河源','汕尾','汕头','梅州');
if (selectP=='07')
  { a=7;tempoption=new Option('河北','07',false,true); }
else//欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
  { tempoption=new Option('河北','07'); }
eval('document.'+formname+'.'+preP+'.options[7]=tempoption;');
cityareacode[6]=new Array('0701','0702','0703','0704','0705','0706','0707','0708','0709','0710','0711');
cityareaname[6]=new Array('石家庄','唐山','秦皇岛','邯郸','邢台','张家口','承德','廊坊','沧州','保定','衡水');
if (selectP=='08')
  { a=8;tempoption=new Option('山西','08',false,true); }
else
  { tempoption=new Option('山西','08'); }
eval('document.'+formname+'.'+preP+'.options[8]=tempoption;');
cityareacode[7]=new Array('0801','0802','0803','0804','0805','0806','0807');
cityareaname[7]=new Array('太原','大同','阳泉','朔州','长治','临汾','晋城');
if (selectP=='09')
  { a=9;tempoption=new Option('内蒙古','09',false,true); }
else
  { tempoption=new Option('内蒙古','09'); }
eval('document.'+formname+'.'+preP+'.options[9]=tempoption;');
cityareacode[8]=new Array('0901','0902','0903','0904','0905','0906','0907','0908','0909','0910','0911');
cityareaname[8]=new Array('呼和浩特','包头','乌海','临河','东胜','集宁','锡林浩特','通辽','赤峰','海拉尔','乌兰浩特');
if (selectP=='10')
  { a=10;tempoption=new Option('辽宁','10',false,true); }
else
  { tempoption=new Option('辽宁','10'); }
eval('document.'+formname+'.'+preP+'.options[10]=tempoption;');
cityareacode[9]=new Array('1001','1002','1003','1004','1005','1006','1007','1008','1009','1010','1011','1012','1013','1014');
cityareaname[9]=new Array('沈阳','大连','鞍山','锦州','丹东','盘锦','铁岭','抚顺','营口','辽阳','阜新','本溪','朝阳','葫芦岛');
if (selectP=='11')
  { a=11;tempoption=new Option('吉林','11',false,true); }
else
  { tempoption=new Option('吉林','11'); }
eval('document.'+formname+'.'+preP+'.options[11]=tempoption;');
cityareacode[10]=new Array('1101','1102','1103','1104','1105','1106','1107','1108','1109');
cityareaname[10]=new Array('长春','吉林','四平','辽源','通化','白山','松原','白城','延边');
if (selectP=='12')
  { a=12;tempoption=new Option('黑龙江','12',false,true); }
else
  { tempoption=new Option('黑龙江','12'); }
eval('document.'+formname+'.'+preP+'.options[12]=tempoption;');
cityareacode[11]=new Array('1201','1202','1203','1204','1205','1206','1207','1208','1209','1210','1211','1212','1213');
cityareaname[11]=new Array('哈尔滨','齐齐哈尔','牡丹江','佳木斯','大庆','伊春','黑河','鸡西','鹤岗','双鸭山','七台河','绥化','大兴安岭');
if (selectP=='13')
  { a=13;tempoption=new Option('江苏','13',false,true); }
else
  { tempoption=new Option('江苏','13'); }
eval('document.'+formname+'.'+preP+'.options[13]=tempoption;');
cityareacode[12]=new Array('1301','1302','1303','1304','1305','1306','1307','1308','1309','1310','1311','1312','1313');
cityareaname[12]=new Array('南京','苏州','无锡','常州','镇江','连云港 ','扬州','徐州 ','南通','盐城','淮阴','泰州','宿迁');
if (selectP=='14')
  { a=14;tempoption=new Option('浙江','14',false,true); }
else
  { tempoption=new Option('浙江','14'); }
eval('document.'+formname+'.'+preP+'.options[14]=tempoption;');
cityareacode[13]=new Array('1401','1402','1403','1404','1405','1406','1407','1408','1409','1410','1411');
cityareaname[13]=new Array('杭州','湖州','丽水','温州','绍兴','舟山','嘉兴','金华','台州','衢州','宁波');
if (selectP=='15')
  { a=15;tempoption=new Option('安徽','15',false,true); }
else
  { tempoption=new Option('安徽','15'); }
eval('document.'+formname+'.'+preP+'.options[15]=tempoption;');
cityareacode[14]=new Array('1501','1502','1503','1504','1505','1506','1507','1508','1509','1510','1511','1512','1513','1514','1515','1516','1517');
cityareaname[14]=new Array('合肥  ','芜湖 ','蚌埠 ','滁州 ','安庆 ','六安 ','黄山 ','宣城 ','淮南 ','宿州 ','马鞍山 ','铜陵','淮北 ','阜阳 ','池州 ','巢湖 ','亳州');
if (selectP=='16')
  { a=16;tempoption=new Option('福建','16',false,true); }
else
  { tempoption=new Option('福建','16'); }
eval('document.'+formname+'.'+preP+'.options[16]=tempoption;');
cityareacode[15]=new Array('1601','1602','1603','1604','1605','1606','1607','1608','1609');
cityareaname[15]=new Array('福州 ','厦门 ','泉州 ','漳州 ','龙岩 ','南平 ','宁德 ','莆田 ','三明');
if (selectP=='17')
  { a=17;tempoption=new Option('江西','17',false,true); }
else
  { tempoption=new Option('江西','17'); }
eval('document.'+formname+'.'+preP+'.options[17]=tempoption;');
cityareacode[16]=new Array('1701','1702','1703','1704','1705','1706','1707','1708','1709','1710','1711');
cityareaname[16]=new Array('南昌','景德镇','九江','萍乡','新余','鹰潭','赣州','宜春','吉安','上饶','抚州');
if (selectP=='18')
  { a=18;tempoption=new Option('山东','18',false,true); }
else//欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
  { tempoption=new Option('山东','18'); }
eval('document.'+formname+'.'+preP+'.options[18]=tempoption;');
cityareacode[17]=new Array('1801','1802','1803','1804','1805','1806','1807','1808','1809','1810','1811','1812','1813','1814','1815','1816','1817');
cityareaname[17]=new Array('济南','青岛','淄博','德州','烟台','潍坊','济宁','泰安','临沂','菏泽','威海','枣庄','日照','莱芜','聊城','滨州','东营');
if (selectP=='19')
  { a=19;tempoption=new Option('河南','19',false,true); }
else
  { tempoption=new Option('河南','19'); }
eval('document.'+formname+'.'+preP+'.options[19]=tempoption;');
cityareacode[18]=new Array('1901','1902','1903','1904','1905','1906','1907','1908','1909','1910','1911','1912','1913','1914','1915','1916','1917','1918');
cityareaname[18]=new Array('郑州','开封','洛阳','平顶山','安阳','鹤壁','新乡','焦作','濮阳','许昌','漯河','三门峡','南阳','商丘','周口','驻马店','信阳','济源');
if (selectP=='20')
  { a=20;tempoption=new Option('湖北','20',false,true); }
else
  { tempoption=new Option('湖北','20'); }
eval('document.'+formname+'.'+preP+'.options[20]=tempoption;');
cityareacode[19]=new Array('2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017');
cityareaname[19]=new Array('武汉','黄石','十堰','荆州','宜昌','襄樊','鄂州','荆门','孝感','黄冈','咸宁','恩施','随州','仙桃','天门','潜江','神农架');
if (selectP=='21')
  { a=21;tempoption=new Option('湖南','21',false,true); }
else//欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
  { tempoption=new Option('湖南','21'); }
eval('document.'+formname+'.'+preP+'.options[21]=tempoption;');
cityareacode[20]=new Array('2101','2102','2103','2104','2105','2106','2107','2108','2109','2110','2111','2112','2113');
cityareaname[20]=new Array('长沙','株州','湘潭','衡阳','邵阳','岳阳','常德','郴州','益阳','永州','怀化','娄底','湘西 ');
if (selectP=='22')
  { a=22;tempoption=new Option('广西','22',false,true); }
else
  { tempoption=new Option('广西','22'); }
eval('document.'+formname+'.'+preP+'.options[22]=tempoption;');
cityareacode[21]=new Array('2201','2202','2203','2204','2205','2206','2207','2208','2209','2210','2211','2212');
cityareaname[21]=new Array('南宁','柳州','桂林','梧州','北海','防城港','钦州','贵港','玉林','贺州','百色','河池');
if (selectP=='23')
  { a=23;tempoption=new Option('海南','23',false,true); }
else
  { tempoption=new Option('海南','23'); }
eval('document.'+formname+'.'+preP+'.options[23]=tempoption;');
cityareacode[22]=new Array('2301','2302','2303','2304','2305','2306','2307','2308','2309');
cityareaname[22]=new Array('海口 ','三亚','通什','琼海','琼山','文昌','万宁','东方','儋州');
if (selectP=='24')
  { a=24;tempoption=new Option('四川','24',false,true); }
else
  { tempoption=new Option('四川','24'); }
eval('document.'+formname+'.'+preP+'.options[24]=tempoption;');
cityareacode[23]=new Array('2401','2402','2403','2404','2405','2406','2407','2408','2409','2410','2411','2412','2413','2414','2415','2416','2417','2418','2419','2420');
cityareaname[23]=new Array('成都','自贡','攀枝花','泸州','德阳','绵阳','广元','遂宁','内江','乐山','南充  ','宜宾','广安','达川','巴中','雅安','眉山  ','阿坝 ','甘孜 ','凉山 ');
if (selectP=='25')
  { a=25;tempoption=new Option('贵州','25',false,true); }
else
  { tempoption=new Option('贵州','25'); }
eval('document.'+formname+'.'+preP+'.options[25]=tempoption;');
cityareacode[24]=new Array('2501','2502','2503','2504','2505','2506','2507','2508','2509');
cityareaname[24]=new Array('贵阳 ','六盘水','遵义','铜仁','毕节','安顺','黔西南 ','黔东南','黔南');
if (selectP=='26')
  { a=26;tempoption=new Option('云南','26',false,true); }
else
  { tempoption=new Option('云南','26'); }
eval('document.'+formname+'.'+preP+'.options[26]=tempoption;');
cityareacode[25]=new Array('2601','2602','2603','2604','2605','2606','2607','2608','2609','2610','2611','2612','2613','2614','2615','2616','2617');
cityareaname[25]=new Array('昆明','东川','曲靖','玉溪','昭通','思茅','临沧','保山','丽江','文山 ','红河 ','西双版纳 ','楚雄 ','大理 ','德宏 ','怒江','迪庆');
if (selectP=='27')
  { a=27;tempoption=new Option('西藏','27',false,true); }
else
  { tempoption=new Option('西藏','27'); }
eval('document.'+formname+'.'+preP+'.options[27]=tempoption;');
cityareacode[26]=new Array('2701','2702','2703','2704','2705','2706','2707');
cityareaname[26]=new Array('拉萨','那曲','昌都','山南','日喀则','阿里','林芝');
if (selectP=='28')
  { a=28;tempoption=new Option('陕西','28',false,true); }
else
  { tempoption=new Option('陕西','28'); }
eval('document.'+formname+'.'+preP+'.options[28]=tempoption;');
cityareacode[27]=new Array('2801','2802','2803','2804','2805','2806','2807','2808','2809','2810');
cityareaname[27]=new Array('西安','铜川','宝鸡','咸阳','渭南','延安','汉中','榆林','商洛','安康');
if (selectP=='29')
  { a=29;tempoption=new Option('甘肃','29',false,true); }
else//欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
  { tempoption=new Option('甘肃','29'); }
eval('document.'+formname+'.'+preP+'.options[29]=tempoption;');
cityareacode[28]=new Array('2901','2902','2903','2904','2905','2906','2907','2908','2909','2910','2911','2912','2913','2914');
cityareaname[28]=new Array('兰州','金昌','白银','天水','嘉峪关','定西','平凉','庆阳','陇南','武威','张掖','酒泉','甘南 ','临夏');
if (selectP=='30')
  { a=30;tempoption=new Option('青海','30',false,true); }
else
  { tempoption=new Option('青海','30'); }
eval('document.'+formname+'.'+preP+'.options[30]=tempoption;');
cityareacode[29]=new Array('3001','3002','3003','3004','3005','3006','3007','3008');
cityareaname[29]=new Array('西宁','海东',' 海北 ','黄南','海南','果洛','玉树','海西');
if (selectP=='31')
  { a=31;tempoption=new Option('宁夏','31',false,true); }
else
  { tempoption=new Option('宁夏','31'); }
eval('document.'+formname+'.'+preP+'.options[31]=tempoption;');
cityareacode[30]=new Array('3101','3102','3103','3104');
cityareaname[30]=new Array('银川','石嘴山','银南','固原');
if (selectP=='32')
  { a=32;tempoption=new Option('新疆','32',false,true); }
else
  { tempoption=new Option('新疆','32'); }
eval('document.'+formname+'.'+preP+'.options[32]=tempoption;');
cityareacode[31]=new Array('3201','3202','3203','3204','3205','3206','3207','3208','3209','3210','3211','3212','3213');
cityareaname[31]=new Array('乌鲁木齐','克拉玛依','石河子','吐鲁番','哈密','和田','阿克苏','喀什','克孜勒苏','巴音郭楞','昌吉','博尔塔拉','伊犁');
if (selectP=='33')
  { a=33;tempoption=new Option('香港','33',false,true); }
else
  { tempoption=new Option('香港','33'); }
eval('document.'+formname+'.'+preP+'.options[33]=tempoption;');
cityareacode[32]=new Array();
cityareaname[32]=new Array();
if (selectP=='34')
  { a=34;tempoption=new Option('澳门','34',false,true); }
else
  { tempoption=new Option('澳门','34'); }
eval('document.'+formname+'.'+preP+'.options[34]=tempoption;');
cityareacode[33]=new Array();
cityareaname[33]=new Array();
if (selectP=='35')
  { a=35;tempoption=new Option('台湾','35',false,true); }
else
  { tempoption=new Option('台湾','35'); }
eval('document.'+formname+'.'+preP+'.options[35]=tempoption;');
cityareacode[34]=new Array();
cityareaname[34]=new Array();
eval('document.'+formname+'.'+preP+'.options[a].selected=true;');
cityid=selectP;
    if (cityid!='0')
      {
        b=0;for (i=0;i<cityareaname[cityid-1].length;i++)
           {
             if (selectC==cityareacode[cityid-1][i])
               {b=i+1;tempoption=new Option(cityareaname[cityid-1][i],cityareacode[cityid-1][i],false,true);}
             else
               tempoption=new Option(cityareaname[cityid-1][i],cityareacode[cityid-1][i]);
            eval('document.'+formname+'.'+preC+'.options[i+1]=tempoption;');
           }
        eval('document.'+formname+'.'+preC+'.options[b].selected=true;');
      }
    }
 function selectcityarea(preP,preC,formname)
   {
     cityid=eval('document.'+formname+'.'+preP+'.selectedIndex;');
     j=eval('document.'+formname+'.'+preC+'.length;');
     for (i=1;i<j;i++)
        {eval('document.'+formname+'.'+preC+'.options[j-i]=null;')}
     if (cityid!="0")
       {
         for (i=0;i<cityareaname[cityid-1].length;i++)
            {
             tempoption=new Option(cityareaname[cityid-1][i],cityareacode[cityid-1][i]);
             eval('document.'+formname+'.'+preC+'.options[i+1]=tempoption;');
            }
       }
    }
</script>
</head>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<body>
<center>
<div class="main">
  <div class="b2"><br />
    <div class="b4"><img src="images/b1.jpg" width="648" height="59" /></div>
	<div align="left">用户信息：</div>
	<div class="b5"> 
	  <form id="com_reg" name="com_reg" method="post" action="<%=request.getContextPath()%>/register2.action">
	  <table width="100%" border="0">

  <tr>
    <th width="30%" scope="row">帐号：</th>
    <td width="30%"><label>
      <input type="text" id="id_username" name="user.username" />
   <font color="#CC0000"> *</font></label></td>
    <td><div class="div-left"><label id="id_username_div" class="warning">用户名由6~10位的字母、数字和下划线组成</label></div></td>
  </tr>
  <tr>
    <th scope="row">密码：</th>
    <td><label>
      <input type="password" id="id_password" name="user.password" />
    <font color="#CC0000"> *</font></label></td>
    <td><div class="div-left"><label id="id_password_div" class="warning">密码由6~20位的字母、数字和下划线组成</label></div></td>
  </tr>
  <tr>
   <th scope="row">确认密码：</th>
    <td><label>
      <input type="password" id="id_confirm_password"/>
    <font color="#CC0000"> *</font></label></td>
    <td><div class="div-left"><label id="id_confirm_password_div" class="warning"></label></div></td>
  </tr>
    <tr>
    <th scope="row">验证码：</th>
    <td><label>
      <input type="text" id="id_cord" name="user.cord" />
    <font color="#CC0000"> *</font></label></td>
    <td><div class="div-left"><label id="id_cord_div" class="warning">请输入您的验证码</label></div></td>
  </tr>
</table>
<p align="left"><font color="#0066CC">开发者信息</font>
<table width="100%" border="0">
  <tr>
    <th width="30%" scope="row">公司名称：</th>
    <td width="30%"><label>
     <input type="text" id="id_developername" name="user.developername" />
    </label></td>
  </tr>
  <tr>
    <th scope="row">联系人：</th>
    <td><label>
       <input type="text" id="id_realname" name="user.realname" />
    </label></td>
  </tr>
  <tr>
    <th scope="row">联系电话：</th>
    <td><label>
      <input type="text" id="id_telephone" name="user.telephone" />
    </label></td>
  </tr>
  <tr>
    <th scope="row">QQ:</th>
    <td><label>
     <input type="text" id="id_qqname" name="user.qqname" />
    </label></td>
  </tr>
  <tr>
   <th scope="row">邮箱：</th>
    <td><label>
      <input type="text" id="id_email" name="user.email" />
    <font color="#CC0000"> *</font></label></td>
     <td><div class="div-left"><label id="id_email_div" class="warning">请填写正确的邮箱</label></div></td>
  </tr>
  <tr>
     <th scope="row">公司详细地址：</th>
    <td><label>        <select id="id_addr1" name="selectp" onChange="selectcityarea('selectp','selectc','com_reg');">
          <option value="0" selected>不限--
        </select>        <select id="id_addr2" name="selectc">
          <option value="0" selected>不限--
        </select></label></td>
  </tr>
  <tr>
    <th scope="row">&nbsp;</th>
    <td><label>
      <input id="id_addr3" name="selectpc" type="text" value="详细地址"onclick="this.value='';focus()" />
    </label></td>
  </tr>
  <tr>
    <th scope="row">传真：</th>
    <td><label>
      <input type="text" id="id_idcard" name="user.idcard"/>
<font color="#CC0000"> *</font></label></td>
<td><div class="div-left"><label id="id_idcard_div" class="warning">请填写真正的传真号</label></div></td>
  </tr>
  <tr>
    <th scope="row">营业执照：</th>
    <td><label>
      <input type="text"id="id_photo" name="user.photo" />
    </label></td>
  </tr>
  <tr>
    <th scope="row">&nbsp;</th>
    <td><p><font color="#CC0000">营业执照信息可见，照片内容真实有效，不做任何修改。
      支持JPG,PNG格式。不超过1M。</font></p></td>
  </tr>
</table>
  <label>
  <input type="checkbox" name="checkbox" value="checkbox" />
  我已阅读<a href="#">《柴米用户服务条款》</a>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	<input type="submit"id="id_register2"class="button button-purple" value="马上注册"/>
</label>
</form>
<script language="javascript">
first("selectp","selectc","com_reg",0,0);
</script>

</div>
	</div>
	
  </div>
</center>
</body>
</html>
