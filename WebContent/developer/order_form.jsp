<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>会员管理</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script charset="utf-8"  type="text/javascript"src="js/jquery.min.js"></script>
<script  charset="GB2312" type="text/javascript" src="js/manhuaDate.1.0.js"></script>
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
                         <li>全部应用</li>
                      </ul>
                      <div class="guanggaocont">
                          <div class="huiyuancont">
                              <div class="tit6">
                                  <p>全部应用  [<a href="#" class="red">500</a>]</p>
                                  <p>总订单数：xxxxx</p>
                                  <p>总支付金额：xxxxx</p>
                              </div>
                              <!--tit6-->
                              <div class="searchcont2">
                                <input type="text" value="输入应用名称" class="socont2 fl"/><input type="submit" value="" class="sobut fr"/>
                             </div>
                              <div class="yonghu2">
                                  <div class="orderlist">
                                      <ul class="ornav">
                                          <li>应用名称</li>
                                          <li>订单总数</li>
                                          <li>总支付金额</li>
                                          <li>&nbsp;</li>
                                      </ul>
                                      <div class="ordercont">
                                         <div>
                                            <p>应用名称</p>
                                            <p>20101010</p>
                                            <p>889900</p>
                                            <p><a href="#dddd"  class="xinxi">查看明细</a></p>
                                         </div>
                                         <div>
                                            <p>应用名称</p>
                                            <p>20101010</p>
                                            <p>889900</p>
                                            <p><a href="#dddd" class="xinxi">查看明细</a></p>
                                         </div>
                                         <div>
                                            <p>应用名称</p>
                                            <p>20101010</p>
                                            <p>889900</p>
                                            <p><a href="#dddd" class="xinxi">查看明细</a></p>
                                         </div>
                                         <div>
                                            <p>应用名称</p>
                                            <p>20101010</p>
                                            <p>889900</p>
                                            <p><a href="#dddd" class="xinxi">查看明细</a></p>
                                         </div>
                                      </div>
                                      <!--orderconts-->
                                  </div>
                                  <!--orderlist-->
                             </div>
                             <!--yonghu-->
                             <div class="allcha">
                                <select>
                                      <option>全部应用</option>
                                      <option>游戏名称</option>
                                  </select>
                                  <p>订单号/应用名称查询<input type="text" class="chatext" /><input type="submit" value="查询" class="chaxun" /></p>
                             </div>
                             <!--allcha-->
                             <div class="allcha">
                                <select>
                                      <option>全部支付</option>
                                      <option>支付成功</option>
                                      <option>支付失败</option>
                                  </select>
                                  <select>
                                      <option>支付类型</option>
                                      <option>短代</option>
                                      <option>支付宝</option>
                                      <option>银联</option>
                                  </select>
                                  <p>从 <input type="text" class="mh_date" readonly="true" /> 到 <input type="text" class="mh_date" readonly="true" />&nbsp;<input type="submit" value="查询" class="chaxun" /></p>
                             </div>
                             <!--allcha-->
                             <div class="allorder">
                                <p class="fl">订单总支付额：<span class="red"> xxx</span></p><input type="submit" value="导出" class="odaochu fr" />
                             </div>
                             <!--allorder-->
                             <a name="dddd"></a>
                             <table border="0" cellpadding="0" cellspacing="0" width="98%" class="table1">
                                   <tr>
                                       <th width="15%">企业名称</th>
                                       <th width="15%">应用名称</th>
                                       <th width="10%">下单时间</th>
                                       <th width="10%">订单号</th>
                                       <th width="10%">支付金额</th>
                                       <th width="10%">支付类型</th>
                                       <th width="10%">支付状态</th>
                                       <th width="10%">分成比例%</th>
                                       <th width="10%">通道费率%</th>
                                   </tr>
                                   <tr>
                                       <td class="name">北京五彩时空</td>
                                       <td>斗地主</td>
                                       <td>2010-10-10</td>
                                       <td>20101010</td>
                                       <td>8888880</td>
                                       <td>短代</td>
                                       <td>成功</td>
                                       <td>30</td>
                                       <td>10</td> 
                                   </tr>
                                   <tr>
                                       <td class="name">北京五彩时空</td>
                                       <td>斗地主</td>
                                       <td>2010-10-10</td>
                                       <td>20101010</td>
                                       <td>8888880</td>
                                       <td>短代</td>
                                       <td>成功</td>
                                       <td>30</td>
                                       <td>10</td> 
                                   </tr>
                              </table>
                          </div>
                          
                      </div>
                      <!--guanggaocont-->
                      <div class="guanggaocont">
                         <div class="qyzcshenpi">
                             <div class="daishenpi">待审批数量<span class="red">10</span></div>
                             <div class="all"><select><option>全部</option><option>企业用户</option><option>个人用户</option></select></div>
                             <div class="qi"><span>企业</span><span class="green">五彩时空科技有限公司</span><a href="chulishenpi.html" target="main" class="chuli">处理审批</a></div>
                         </div>
                         <!--qyzcshenpi-->
                      </div>
                      <!--guanggaocont-->

               </div>
     </div>
 </div>
 </div>
</div> 
</body>
</html>
