<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s"%>
	<%@page import="java.util.*"%>
	<%@page import="com.rainbow.entity.ADV"%>
	

	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
</head>
<script type = "text/javascript" language = "javascript">
function check() {
    var oInput = document.getElementsByName("cartCheckBox");
    for (var i = 0; i < oInput.length; i++) {
        oInput[i].checked = document.getElementById("allCheckBox").checked;
    }
}
function pro() {
    var oInput = document.getElementsByName("cartCheckBox");
    var c = 0;
    for (var i = 0; i < oInput.length; i++) {
        if (oInput[i].checked) {
            c++;
        }
    }
    if (c == oInput.length) {
        document.getElementById("allCheckBox").checked = true;
    }
    else {
        document.getElementById("allCheckBox").checked = false;
    }
}

  function ck()
  {
   if(confirm("确定要删除图片么？"))
   {
    return true;
   }
   else{
	   return false;
   }
  
  }
 </script>
 
<body>
<div style="background:#ccc;width:300px; height:100px;">

            <form action="UploadPhotos" method="post" enctype="multipart/form-data">  
                <table cellpadding="0" cellspacing="0" style="width: 350px;">  
                    <tr>  
                        <td colspan="2" >  
                        上传广告   
                        </td>  
                    </tr> 
                     <tr>  
                        <td>  
                           广告类型：  
                        </td>  
                        <td>  
                            <input type="text" name="type"  />  
                        </td>  
                    </tr>  
                    <tr>  
                        <td>  
                           选择logo：  
                        </td>  
                        <td>  
                            <input type="file" name="upFile"  />  
                        </td>  
                    </tr>  
               
                    <tr>  
                        <td colspan="2" >  
                            <input type="submit" value="上传" />  
                            <input type="reset" value="重置" />  
                        </td>  
                    </tr>  
                </table>  
            </form>  
</div>
<div style="background:#adc;width:690px; height:1200px;Float:left">                                                                                                                                                                                                                                                                                                                                                                                                                                                      
			<h2>点击图片进行删除</h2>
			全部选择：<input id="allCheckBox" type="CheckBox" onclick="return check()" / > 
	
	<%
	ADV v=new ADV();
	List<List> l=(List)session.getAttribute("l");
	
	int i=0;
	
	for(;i<l.size();i++){
		ADV a= (ADV) l.get(i);
		
	%>
			<!--
			<br>上传时间    :<%=a.getLogotime() %></br>
			
			<br>图片ID  &nbsp&nbsp:<%=a.getId() %></br>
				
			-->
			<br>页面类型    :<%=a.getType()%></br>
			<a href="DeleteImg?id=<%=a.getId() %>" onclick="return ck()">
			<img src="http://192.168.3.15:8080/Rainbow<%=a.getLogo() %>"/>
			<br></br>
			 
			</a>
			
			<form method="post" action="ADVn">
			请选择:
			<input name="cartCheckBox" type="checkbox"  value="<%=a.getId() %>" onclick="return  pro()"/>	
		<%
		
		
	}	
	
		
	
		%>
	
<ul>
		
    <%
    	int currentPage=0;
    	int n=0;
    	currentPage=Integer.parseInt(session.getAttribute("currentPage").toString());//当前页码
    	n=Integer.parseInt(session.getAttribute("n").toString());//获取 共有多少页
    	
     %>
   
  	
   
     
  </ul>
  <p>
<br></br>
<input type="submit" name="sc" value="删除"/>
<input type="submit" name="sc" value="人气"/>
<input type="submit" name="sc" value="推荐"/>
<input type="submit" name="sc" value="杂志"/>
<input type="submit" name="sc" value="清空"/>


</form>

<br>共<%=n%>页</br>
<br>第<%=currentPage%>页</br>
  <a href="Search?currentPage=1">首页</a>
  	<a href="Search?currentPage=<%=currentPage-1%>">上一页</a>
  	<a href="Search?currentPage=<%=currentPage+1%>">下一页</a>
  	<a href="Search?currentPage=<%=n%>">末页</a>
  	
  </p>
</div>

</body>
</html>