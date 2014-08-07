<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>会员管理</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"src="js/jquery.min.js"></script>
<!--<script type="text/javascript"src="js/nav.js"></script>
--><script charset="GB2312" type="text/javascript" src="js/manhuaDate.1.0.js"></script>
<script type="text/javascript">
$(function (){

	$("input.mh_date").manhuaDate({					       
		Event : "click",//可选				       
		Left : 0,//弹出时间停靠的左边位置
		Top : -16,//弹出时间停靠的顶部边位置
		fuhao : "-",//日期连接符默认为-
		isTime : false,//是否开启时间值默认为false
		beginY : 1949,//年份的开始默认为1949
		endY :2100//年份的结束默认为2049
	});
	
});
</script>
<style type="text/css">
.searchcont2{ background:url(images/searchs.png) no-repeat; width:227px; height:25px; line-height:25px; margin:20px 0 7px 0px;}
.searchcont2 input{outline:none; height:25px; line-height:25px; float:left;}
.socont2{ width:175px; height:25px;background:none; border:none; margin-left:4px; display:inline; color:#FFF; font-size:14px;}
.sobut2{ width:35px; height:25px; background:none; border:none; cursor:pointer}
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
                      <ul class="guanggaonav">
                         <li>企业订单</li>
                      </ul>
                      <div class="guanggaocont">
                          <div class="huiyuancont">
                              <div class="tit6 tit6s">
                                  <p>联运应用：  [<a href="#" class="red">500</a>]</p>
                                  <p>订单总数：  [<a href="#" class="red">500</a>]</p>
                                  <p>总支付额： [<a href="#" class="red">500</a>]</p>
                              </div>
                              <!--tit6-->
                              <div class="allorder">
                                <p class="fl jine">金额：<span class="red"> xxx</span></p>
                             </div>
                             <!--allorder-->
                             <div class="allcha">
                                  <select>
                                      <option>全部支付</option>
                                      <option>短代</option>
                                      <option>支付宝</option>
                                      <option>银联</option>
                                  </select>
                                  <p>从 <input type="text" class="mh_date" readonly="true" /> 到 <input type="text" class="mh_date" readonly="true" />&nbsp;<input type="submit" value="金额查询" class="chaxun chaxun2" /></p>
                             </div>
                             <!--allcha-->
                             <div class="allcha">
                                  <p><input type="text" class="chatext chatext2" value="搜索企业名称" /><input type="submit" value="查询" class="chaxun" /></p>
                             </div>
                             <!--allcha-->
                             <a name="dddd"></a>
                             <table border="0" cellpadding="0" cellspacing="0" width="98%" class="table1">
                                   <tr>
                                       <th width="25%">企业名称</th>
                                       <th width="20%">联运应用总数</th>
                                       <th width="18%">订单总数</th>
                                       <th width="20%">总支付金额</th>
                                       <th width="15%">&nbsp;</th>
                                   </tr>
                                   <tr>
                                       <td class="name">北京五彩时空</td>
                                       <td>222</td>
                                       <td>333</td>
                                       <td>20101010</td>
                                       <td><a href="order_form.html" class="mingxi">查看明细</a></td>
                                   </tr>
                                  
                              </table>
                              <ul class="page">
                               <li><a href="#">首页</a></li>
                               <li><a href="#">上一页</a></li>
                               <li><a href="#">1</a></li>
                               <li><a href="#">2</a></li>
                               <li><a href="#">3</a></li>
                               <li><a href="#">4</a></li>
                               <li><a href="#">5</a></li>
                               <li><a href="#">下一页</a></li>
                             </ul>
                          </div>
                          
                      </div>
                      <!--guanggaocont-->

               </div>
     </div>
 </div>
 </div>
</div> 
</body>
</html>
