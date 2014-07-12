<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>添加对应内容</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script charset="utf-8" src="<%=request.getContextPath()%>/kindeditor-4.1.7/kindeditor.js"></script><!--调用-->
<script>          
					var editor;          
					KindEditor.ready(function(K) {
						editor = K.create('#editor_id');         
					}); 
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
                      <h3 class="tit2 mulutit">目录对应内容</h3>
                       <div class="neirongcont">
                           <h3 class="tit5">目录标题</h3>
                           <div><textarea id="editor_id" name="content" style="width:100%;height:400px;"> &lt;strong&gt;HTML内容&lt;/strong&gt; </textarea> </div>
                           <div class="w64 margin15" align="center"><a href="xinqi.jsp">返回</a><input type="submit"  value="保存"  class="scbtnShow"/></div>
                       </div>
                      <!--form-->
 
                   </div>
                   <!--list-->
               </div>
     </div>
 </div>
</body>
</html>
