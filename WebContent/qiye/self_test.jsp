<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加新应用</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jq.js"></script>
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
                 <p class="headnav"><a href="app_perfect.jsp">完善APP信息</a> -> 自测</p>
             </div>
             <!--tit-->
             <div class="tit2">测试您的应用</div>
             <form id="form1" name="form1" method="post" action="">
             <div class="cont">
                 <p class="explain">祝贺，您的 SDK 集成即将完毕！请依照下方指引对游戏进行测试。</p>                          
                                <div class="xinxicont">
                                   <div class="tit4">1. 请填写工程师提供的回调地址</div>
                                    <div><label>回调地址:</label><p class="pp"><input name="textfield2" type="text" value="" class="inputs" /><input type="button" value="确定" class="buton1" /><input type="button" value="修改" class="buton2" /><p class="zhushi">上线后若需修改，直接输入新的回调地址并点击确定。<span class="tishi">不能为空！</span></p></p></div>
                                        <div class="tit4">2. 验证自测结果 </div>
                                        <div><input type="button" value="确认" class="buton1" /><span class="yanzheng">验证状态</span><p class="zhushi4">我们的服务器将会对您的测试行为进行验证，以确定所有项目均测试成功。验证无误后，即可开始上传游戏。</p></p></div>
                                        
                                       <div class="uppage uppage2"><input type="submit" value="保存并继续" class="tijiao" /><input type="submit" value="取消" class="quxiao" /></div>
                                </div>
                               <!--xinxicont-->

             </div>
             <!--cont-->
             </form>
       </div>
       <!--midcont-->
 </div>
</body>
</html>
