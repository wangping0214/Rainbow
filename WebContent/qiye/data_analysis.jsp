<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>已发布</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"src="js/jquery.min.js"></script>
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
                 <p class="headnav">数据总汇</p>
             </div>
             <!--tit-->
             <div class="cont">
                <div class="select">
                   <select>
                          <option>--全部应用--</option>
                          <option>--已上线应用--</option>
                          <option>--未上线应用--</option>
                   </select>
                </div>
                <!--select-->
                <div class="chalist">
                    <div class="riqi"><p>从 <input type="text" class="mh_date" id="kaishi" readonly="true" /> 到 <input type="text" class="mh_date" id="jieshu" readonly="true" />&nbsp;<input type="submit" value="搜索" class="chaxun" /></p></div>
                    
                    <table border="0" cellpadding="0" cellspacing="0" class="idtable" width="100%">
                        <tr>
                           <th width="30%">应用名称</th>
                           <th width="23%">下载总数</th>
                           <th width="23%">评论次数</th>
                           <th width="24%">浏览总数</th>
                        </tr>
                        <tr>
                           <td>
                              <dl>
                                 <dt><img src="images/img22.png" /></dt>
                                 <dd>水果忍者</dd>
                              </dl>
                           </td>
                           <td>89900887778次</td>
                           <td>89900887778次</td>
                           <td>89900887778次</td>
                        </tr>
                        <tr>
                           <td>
                              <dl>
                                 <dt><img src="images/img22.png" /></dt>
                                 <dd>水果忍者水果忍者</dd>
                              </dl>
                           </td>
                           <td>89900887778次</td>
                           <td>89900887778次</td>
                           <td>89900887778次</td>
                        </tr>
                        <tr>
                           <td colspan="4">
                              <ul class="page page2">
                               <li><a href="#"><span>首页</span></a></li>
                               <li><a href="#"><span>上一页</span></a></li>
                               <li class="current2"><a href="#"><span>1</span></a></li>
                               <li><a href="#"><span>2</span></a></li>
                               <li><a href="#"><span>3</span></a></li>
                               <li><a href="#"><span>4</span></a></li>
                               <li><a href="#"><span>下一页</span></a></li>
                               <li><a href="#"><span>尾页</span></a></li>
                            </ul>
                            <!--page-->
                           
                           </td>
                        </tr>
                    </table>
                    
                </div>
                <!--chalist-->
             </div>
             <!--cont-->
       </div>
       <!--midcont-->
 </div>
</body>
</html>
