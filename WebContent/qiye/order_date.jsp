<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>已发布</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"src="js/jquery.min.js"></script>
<script type="text/javascript"src="js/order_date.js"></script>

<script type="text/javascript" src="js/manhuaDate.1.0.js"></script>
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
<script type="text/javascript">
window.onload=function(){
	var oinput=document.getElementById("kaishi");
	var but1=document.getElementById("jieshu");
	var odate=new Date();
	var yearval=odate.getFullYear()
    var mounthval=odate.getMonth()+1;
	var mounthval2=odate.getMonth()+2;
	var dateval=odate.getDate();
	if(mounthval<10){
		mounthval="0"+mounthval;
		}
	if(dateval<10){
		dateval="0"+dateval;
		}	
	oinput.value=yearval+"-"+mounthval+"-"+dateval;
	but1.value=yearval+"-"+mounthval2+"-"+dateval;
	
}
</script>





 </head>

<body>
<div class="content">
     <div class="search">
               <div class="searchcont">
                   <input type="text" value="搜索关键词" class="socont"/><input type="image" src="images/a1_04.jpg" value="" class="sobut"/>
               </div>
               <!--searchcont-->
      </div>
      <!--serach-->
      <div class="midcont">
             <div class="tit">
                 <p class="headnav">支付订单记录</p>
             </div>
             <!--tit-->
             <div class="cont">
                    <div class="tit5">订单总计</div>
                    <div class="company_name">北京五彩时空科技有限公司</div>
                    <div class="total"><span>全部应用「<b>XX</b> 」</span><span>订单总数「<b>XX,XXXXXX</b> 」</span><span>总支付金额「<b>XX,XXXXXXXXX</b> 」</span></div>
                    <table border="0" cellpadding="0" cellspacing="0" class="idtable" width="100%">
                        <tr>
                           <th width="25%">应用名称</th>
                           <th width="18%" class="zhuang"><select><option>状态</option><option>已上线</option><option>已下线</option><option>等待完善</option></select></th>
                           <th width="19%">订单数</th>
                           <th width="19%">总金额</th>
                           <th width="19%">操作</th>
                        </tr>
                        
                    </table>

                    <ul class="orderlist">
                        <li>
                           <p class="gamename"><img src="images/img22.png" width="48" height="48" />水果忍者</p>
                           <p class="statu status1">[已上线]</p>
                           <p>899,00887778</p>
                           <p>899,00887778</p>
                           <p><a href="#nade" class="detail">查看详情</a></p>
                       </li>
                       <li>
                           <p class="gamename"><img src="images/img22.png" width="48" height="48" />水果忍者水水果忍者水果忍者果忍者</p>
                           <p class="statu status2">[已下线]</p>
                           <p>899,00887778</p>
                           <p>899,00887778</p>
                           <p><a href="#nade" class="detail" onclick="click_scroll();">查看详情</a></p>
                       </li>
                       <li>
                           <p class="gamename"><img src="images/img22.png" width="48" height="48" />水果忍者</p>
                           <p class="statu status3">[等待完善]</p>
                           <p>899,00887778</p>
                           <p>899,00887778</p>
                           <p><a href="#nade" class="detail">查看详情</a></p>
                       </li>
                       <li>
                           <p class="gamename"><img src="images/img22.png" width="48" height="48" />水果忍者水水果忍者水果忍者果忍者</p>
                           <p class="statu status2">[已下线]</p>
                           <p>899,00887778</p>
                           <p>899,00887778</p>
                           <p><a href="#nade" class="detail">查看详情</a></p>
                       </li>
                       <li>
                           <p class="gamename"><img src="images/img22.png" width="48" height="48" />水果忍者</p>
                           <p class="statu status3">[等待完善]</p>
                           <p>899,00887778</p>
                           <p>899,00887778</p>
                           <p><a href="#nade" class="detail">查看详情</a></p>
                       </li> 
                    </ul>
                    <a name="nade"></a>
                   <div class="border2">&nbsp;</div>
                   <div class="mingxi">
                       <div class="tit5">订单明细</div>
                       <div class="xinxicont orcont">
                           <div><p class="pp">
                                 <select name="select">
                                   <option>游戏</option>
                                   <option>应用</option>
                                 </select>
                               </p>
                            </div>
                            <div><p class="pp">
                                <select name="select">
                                   <option>全部支付</option>
                                   <option>应用</option>
                                </select>
                                </p>
                                <p>从 <input type="text" class="mh_date" id="kaishi" readonly="true" /> 到 <input type="text" class="mh_date" id="jieshu" readonly="true" />&nbsp;<input type="submit" value="查询" class="chaxun2" /></p>
                           </div>
                           <div><label>订单号查询:</label><p class="pp"><input name="textfield2" type="text" class="inputs" /><input type="submit" value="查询" class="chaxun2" /></p></div>
                           <div class="zonge"><p class="fl">订单总额：[<b>999999</b>]</p><p class="fr"><input type="button" value="导出" class="chaxun" /></p></div>
                           
                           
                            <table border="0" cellpadding="0" cellspacing="0" width="98%" class="table1">
                                   <tr>
                                       <th width="15%">应用名称</th>
                                       <th width="12%">下单时间</th>
                                       <th width="17%">订单号</th>
                                       <th width="10%">支付金额</th>
                                       <th width="10%">支付类型</th>
                                       <th width="10%">支付状态</th>
                                       <th width="12%">分成比例%</th>
                                       <th width="12%">通道费率%</th>
                                   </tr>
                                   <tr>
                                       <td width="15%"><p class="appname">斗地主</p></td>
                                       <td width="15%"><p class="time2">2010-10-10 10:11:30</p></td>
                                       <td width="17%"><p class="danhao">201010102010101020101010</p><p class="ctrl"><a href="#">复制</a></p></td>
                                       <td width="10%">8888880</td>
                                       <td width="10%">短代</td>
                                       <td width="10%">成功</td>
                                       <td width="12%">30</td>
                                       <td width="12%">10</td> 
                                   </tr>
                                   <tr>
                                       <td width="15%"><p class="appname">斗地主斗地主斗地主斗地主斗地主斗地主</p></td>
                                       <td width="15%"><p class="time2">2010-10-10 10:11:30</p></td>
                                       <td width="17%"><p class="danhao">2010101020101010201010102010101020101010</p><p class="ctrl"><a href="#">复制</a></p></td>
                                       <td width="10%">8888880</td>
                                       <td width="10%">短代</td>
                                       <td width="10%">成功</td>
                                       <td width="12%">30</td>
                                       <td width="12%">10</td> 
                                   </tr>
                                   <tr>
                                       <td width="15%"><p class="appname">斗地主</p></td>
                                       <td width="15%"><p class="time2">2010-10-10 10:11:30</p></td>
                                       <td width="17%"><p class="danhao">201010102010101020101010</p><p class="ctrl"><a href="#">复制</a></p></td>
                                       <td width="10%">8888880</td>
                                       <td width="10%">短代</td>
                                       <td width="10%">成功</td>
                                       <td width="12%">30</td>
                                       <td width="12%">10</td> 
                                   </tr>
                                   <tr>
                                       <td width="15%"><p class="appname">斗地主</p></td>
                                       <td width="15%"><p class="time2">2010-10-10 10:11:30</p></td>
                                       <td width="17%"><p class="danhao">201010102010101020101010</p><p class="ctrl"><a href="#">复制</a></p></td>
                                       <td width="10%">8888880</td>
                                       <td width="10%">短代</td>
                                       <td width="10%">成功</td>
                                       <td width="12%">30</td>
                                       <td width="12%">10</td> 
                                   </tr>
                                   <tr>
                                       <td width="15%"><p class="appname">斗地主斗地主斗地主斗地主斗地主斗地主</p></td>
                                       <td width="15%"><p class="time2">2010-10-10 10:11:30</p></td>
                                       <td width="17%"><p class="danhao">2010101020101010201010102010101020101010</p><p class="ctrl"><a href="#">复制</a></p></td>
                                       <td width="10%">8888880</td>
                                       <td width="10%">短代</td>
                                       <td width="10%">成功</td>
                                       <td width="12%">30</td>
                                       <td width="12%">10</td> 
                                   </tr>
                                   <tr>
                                       <td width="15%"><p class="appname">斗地主</p></td>
                                       <td width="15%"><p class="time2">2010-10-10 10:11:30</p></td>
                                       <td width="17%"><p class="danhao">201010102010101020101010</p><p class="ctrl"><a href="#">复制</a></p></td>
                                       <td width="10%">8888880</td>
                                       <td width="10%">短代</td>
                                       <td width="10%">成功</td>
                                       <td width="12%">30</td>
                                       <td width="12%">10</td> 
                                   </tr>



                              </table>
                              
                       </div>
                       <!--mingxi-->
                   </div>
                   <!--xinxicont-->
             </div>
             <!--cont-->
       </div>
       <!--midcont--><div class="toTop" id="roll_top"><a href="javascript:scroll(0,0)">返回顶部</a></div>
 </div>
 
</body>
</html>
