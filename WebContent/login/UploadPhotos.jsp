<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
</head>
<body>

            <form action="UploadPhotos" method="post" enctype="multipart/form-data">  
                <table cellpadding="0" cellspacing="0" style="width: 350px;">  
                    <tr>  
                        <td colspan="2" >  
                        上传文件   
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

</body>
</html>