<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
</head>
<script type = "text/javascript" language = "javascript">
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
<div style="background:#ccc;width:300px; height:200px;">

            <form action="UploadPhotos" method="post" enctype="multipart/form-data">  
                <table cellpadding="0" cellspacing="0" style="width: 350px;">  
                    <tr>  
                        <td colspan="2" >  
                        上传文件   
                        </td>  
                    </tr> 
                     <tr>  
                        <td>  
                           文件类型：  
                        </td>  
                        <td>  
                            <input type="text" name="type"  />  
                        </td>  
                    </tr>  
                    <tr>  
                        <td>  
                           选择文件：  
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
<div style="background:#ccc;width:690px; height:1200px;Float:left">                                                                                                                                                                                                                                                                                                                                                                                                                                                      
		
			
	<br>有${requestScope.c}个数据</br>
	<br>${requestScope.l[0]}</br> 
	<br>${requestScope.l[1]}</br> 
	
	<br>${requestScope.l[2]}</br> 
	<br>${requestScope.l[3]}</br> 
	
	<br>${requestScope.l[4]}</br> 
	<br>${requestScope.l[5]}</br>
	
	<br>${requestScope.l[6]}</br>
	<br>${requestScope.l[7]}</br>
	
	<%
	int i=0;
	for(;i<8;i++){
	%>
	<%=i %>
			<a href="DeleteImg?id=${requestScope.l[i]}" onclick="return ck()">
			<img src="http://localhost:8080/Rainbow${requestScope.l[<%=i %>+1]}"/>
			</a>
		<%
		i=i+1;
	}
		%>
	
	
	<!--  	<s:iterator value="l" var="b">-->
 <!--  <img src="http://localhost:8080/Rainbow<%=b%>"/>-->
  <!-- </s:iterator> -->
			
		
		
		
</div>
</body>
</html>