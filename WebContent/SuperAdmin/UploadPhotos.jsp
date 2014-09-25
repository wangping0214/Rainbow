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
<div style="background:#adc;width:690px; height:1200px;Float:left">                                                                                                                                                                                                                                                                                                                                                                                                                                                      
			<h3>点击图片进行删除:</h3>
			
			<br>有${requestScope.c}个数据</br>
			<br>ID=${requestScope.l[0]}</br> 
			<br>SRC=${requestScope.l[1]}</br> 
	
			<br>ID=${requestScope.l[2]}</br> 
			<br>SRC=${requestScope.l[3]}</br> 
	
			<br>ID=${requestScope.l[4]}</br> 
			<br>SRC=${requestScope.l[5]}</br>
	
			<br>ID=${requestScope.l[6]}</br>
			<br>SRC=${requestScope.l[7]}</br>
			<a href="DeleteImg?id=${requestScope.l[0]}" onclick="return ck()">
			<img src="${requestScope.l[1]}"/>
			</a>
			<a href="DeleteImg?id=${requestScope.l[2]}" onclick="return ck()">
			<img src="${requestScope.l[3]}"/>
			</a>
			<a href="DeleteImg?id=${requestScope.l[4]}" onclick="return ck()">
			<img src="${requestScope.l[5]}"/>
			</a>
			<a href="DeleteImg?id=${requestScope.l[6]}" onclick="return ck()">
			<img src="${requestScope.l[7]}"/>
			</a>
	
	<%
	int i=0;
	for(;i<8;i=i+2){
	%>
	
			<a href="DeleteImg?id=${requestScope.l[i]}" onclick="return ck()">
			<img src="${requestScope.l[i+1]}"/>
			<input  type="button" value=<%=i %>></input]>
			</a>
		<%
		
	}
		%>
	
	
			
		
		
		
</div>
</body>
</html>