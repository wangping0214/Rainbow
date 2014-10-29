<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.rainbow.entity.Magazine"%>
<%@page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>杂志上传</title>
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

function checka(){
	   var len = document.all.filepath.value.length;
	   var str = document.all.filepath.value;
	   var zip = str.substr(str.lastIndexOf("."),len);
	   alert(zip);
	}


  function ck()
  {
   if(confirm("确定要删除杂志么？"))
   {
    return true;
   }
   else{
	   return false;
   }
  
  }
 </script>
<body>
<div style="background:#adc;width:690px; height:110px;">

            <form action="Uploaddecompression" method="post" enctype="multipart/form-data">  
                <table cellpadding="0" cellspacing="0" style="width: 350px;">  
                    <tr>  
                        <td colspan="2" >  
                        上传杂志   
                        </td>  
                    </tr> 
                     <tr>  
                        <td>  
                           杂志期数：  
                        </td>  
                        <td>  
                            <input type="text"  name="period" />  
                        </td>  
                        
                    </tr>  
                       <tr>  
                        <td>  
                           杂志简介：  
                        </td>  
                        <td>  
                            <input type="text"  name="Introduction" />  
                        </td>  
                        
                    </tr>  
                                 <tr>  
                        <td>  
                           杂志名字：  
                        </td>  
                        <td>  
                            <input type="text"  name="name" />  
                        </td>  
                        
                    </tr>  
                    <tr>  
                        <td>  
                           选择杂志：  
                        </td>  
                        <td>  
                            <input type="file" name="upFile" onclick="checka()"  />  
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
<div style="background:#adc;width:690px; height:900px;Float:left">                                                                                                                                                                                                                                                                                                                                                                                                                                                      
	<h3>点击删除杂志</h3>
	<%
	List<List> l=(List)session.getAttribute("l");
	
	int i=0;
	for(;i<l.size();i++){
		Magazine a= (Magazine) l.get(i);
				
		
	%>
			<br>杂志名字：<%=a.getName() %></br>
			<br>第-<%=a.getPeriod() %>-期</br>
			<a href="AppMagazinedelete?id=<%=a.getId() %>" onclick="return ck()">
			<img src="<%=request.getContextPath()+a.getImg() %>">
			</a>
		
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


<br>共<%=n%>页</br>
<br>第<%=currentPage%>页</br>
    <a href="Earch?currentPage=1">首页</a>
  	<a href="Earch?currentPage=<%=currentPage-1%>">上一页</a>
  	<a href="Earch?currentPage=<%=currentPage+1%>">下一页</a>
  	<a href="Earch?currentPage=<%=n%>">末页</a>
  	
</p>
</div>
</body>
</html>