<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加新应用</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript"> 
function fn_browse() 
{ 
document.form1.browse.click(); 
document.form1.file.value = document.all.form1.browse.value; 
document.form1.browse1.click(); 
document.form1.file.value = document.all.form1.browse1.value; 
document.form1.browse2.click(); 
document.form1.file.value = document.all.form1.browse2.value; 
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
                 <p class="headnav">个人开发者-财务信息</p>
             </div>
             <!--tit-->
             <form id="form1" name="form1" method="post" action="">
             <div class="tit2">财务信息</div>
             <div class="contauto">
                 <div class="xinxicont">
                      <div><label>收款方账户名:</label>
                         <p class="pp shoukuan"><input type="text" class="inputs2" /></p>
                      </div>
                      <div><label>开户银行:</label>
                         <p class="pp"><select><option>请选择</option><option>工商</option><option>农业银行</option></select></p>
                      </div>
                      <div><label>支行名称:</label>
                         <p class="pp"><input type="text" class="inputs2" /><p class="zhushi">输入支行名称，例如：中关村支行。</p></p>
                      </div>
                      <div><label>银行账号:</label>
                         <p class="pp"><input type="text" class="inputs2" /><p class="zhushi">请填写企业银行账户，用于财务结算</p></p>
                      </div>
                      
                      
                 </div>
                <!--xinxicont-->
             </div>
             <!--cont-->
             <div class="tit2">财务联系方式：</div>
             <div class="contauto">
                 <div class="xinxicont">
                     <div><label>财务联系人:</label><p class="pp"><input name="textfield2" type="text" class="inputs" /></p><p class="zhushi">请填写对应的财务负责人姓名</p></div>
                     <div><label>财务手机号:</label><p class="pp"><input name="textfield2" type="text" class="inputs" /></p><p class="zhushi">请填写财务负责人手机联系方式，方便即时联系</p></div>
                     <div><label>财务Email:</label>
                         <p class="pp"><input name="textfield2" type="text" class="inputs2" /><p class="zhushi">公司指定的财务邮箱或结算邮箱</p></p>
                      </div>
                      <div class="red"><label>&nbsp;</label>* 财务信息保存后不可修改，请您正确填写。 </div>
                    </div>
                    <!--xinxicont-->
                    
                    <div class="uppage"><input type="submit" value="保存信息并返回" class="tijiao" /></div>
             </div>
             <!--cont-->
             
             </form>
       </div>
       <!--midcont-->
 </div>
</body>
</html>
