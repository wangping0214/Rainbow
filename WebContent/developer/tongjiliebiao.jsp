<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>统计列表</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.searchcont2{ background:url(images/searchs.png) no-repeat; width:227px; height:25px; line-height:25px; margin:30px 0 7px 60px;}
.searchcont2 input{outline:none; height:25px; line-height:25px; float:left;}
.socont2{ width:175px; height:25px;background:none; border:none; margin-left:4px; display:inline; color:#000; font-size:12px;}
.sobut2{ width:35px; height:25px; background:none; border:none; cursor:pointer}
.guanggaonav .blue a{ color:#06F}
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
     <div class="midcont tongjimidcont">
                  <div class="list">
                      <ul class="guanggaonav">
                         <li><a href="pingtai.jsp">平台访问</a></li>
                         <li class="blue"><a class="tongjiliebiao.jsp">下载量</a></li>
                      </ul>
                        <div class="searchcont2">
                            <input type="text" value="搜索应用名称" class="socont2 fl"/><input type="submit" value="" class="sobut fr"/>
                          </div>
                          <table cellpadding="0" cellspacing="0" class="dnum dnum2">
                            <caption>&nbsp;</caption>
                            <tr>
                                <th>应用名称</th>
                                <th>点击次数</th>
                                <th>下载次数</th>
                            </tr>
                            <tr class="allyingyong">
                               <td>所有应用</td>
                               <td>200</td>
                               <td>300</td>
                            </tr>
                            <tr>
                               <td>愤怒的小鸟</td>
                               <td>200</td>
                               <td>300</td>
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
 </div>
 </div>
</div> 
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252900022'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/z_stat.php%3Fid%3D1252900022%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
