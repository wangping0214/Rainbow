<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>审批处理-提交</title>
<link href="<%=request.getContextPath()%>/SuperAdmin/css/style.css" rel="stylesheet" type="text/css" />
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
                      <li><a href="<%=request.getContextPath()%>/mem_manager.action?isuserType=individualGroups" target="main">会员管理审批</a></li>
                      </ul>
                      <div class="guanggaocont">
                          <div class="huiyuancont">
                              <div class="tit7"><b>个体用户：</b><span class="green"><%=session.getAttribute("realname") %></span></div>
								<form id="form1" name="form1" method="post" action="reg_approved.action" enctype="multipart/form-data">
                                  <div class="form4">
                                     <div><input type="radio" value="ok"name="radioselect"/>通过前方打钩</div>
                                     <div><input type="radio" value="no_ok"name="radioselect"/>未通过前方打钩<textarea class="weliyou">未通过理由</textarea></div>
                                  </div>
                                  <!--form2-->
                                  <div class="back back2"><a href="<%=request.getContextPath()%>/SuperAdmin/shenpigeren.jsp" target="main">上一步</a>
                                  <input type="submit" class="tijiao" value="提交" /></div>
   
								</form>
                          </div>
                          
                      </div>
                      <!--guanggaocont-->

               </div>
     </div>
 </div>
 </div> 
</body>
</html>
