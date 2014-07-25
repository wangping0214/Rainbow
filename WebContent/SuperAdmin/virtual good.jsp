<%@ page language="java" import="com.rainbow.server.App" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
	<%App app = (App)session.getAttribute("app"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>会员管理</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"src="js/jquery.min.js"></script>
<script type="text/javascript"src="js/nav.js"></script>
<style type="text/css">
.searchcont2{ background:url(images/searchs.png) no-repeat; width:227px; height:25px; line-height:25px; margin:20px 0 7px 0px;}
.searchcont2 input{outline:none; height:25px; line-height:25px; float:left;}
.socont2{ width:175px; height:25px;background:none; border:none; margin-left:4px; display:inline; color:#FFF; font-size:14px;}
.sobut2{ width:35px; height:25px; background:none; border:none; cursor:pointer}
</style>
<script type="text/javascript" language="javascript">

$(document).ready(function(){
	$("#mes_product_id").change(function(){
		$("#other_product_id").attr("value",$("#mes_product_id").val());
	});
	$("#other_product_id").change(function(){
		$("#mes_product_id").attr("value",$("#other_product_id").val());
	});
	$("#mes_name").change(function(){
		$("#other_name").attr("value",$("#mes_name").val());
	});
	$("#other_name").change(function(){
		$("#mes_name").attr("value",$("#other_name").val());
	});
	
});


function payFormSub(apkId,e){		//新增物品
	var prise = parseFloat($("#price").val());
	if($("#mes_product_id").val()==""&&prise<=30){
		alert("商品价格不超过30元，请在短代支付中填写物品ID");
		e.preventDefault();
	}
	if($("#mes_name").val()==""&&prise<=30){
		alert("商品价格不超过30元，请在短代支付中填写物品名称");
		e.preventDefault();
	}
	
	if($("#mes_description").val()==""&&prise<=30){
		alert("商品价格不超过30元，请在短代支付中填写物品描述");
		e.preventDefault();
	}
	if($("#other_product_id").val()==""){
		alert("支付宝&银联支付的物品ID不能为空");
		e.preventDefault();
	}
	if($("#other_name").val()==""){
		alert("支付宝&银联支付的物品名称不能为空");
		e.preventDefault();
	}
	if($("#price").val()==""){
		alert("支付宝&银联支付的价格不能为空");
		e.preventDefault();
	}
	if($("#other_description").val()==""){
		alert("支付宝&银联支付的物品描述不能为空");
		e.preventDefault();
	}
	if($("#mes_product_id").val()!=$("#other_product_id").val()&&prise<=30){
		alert("请确认短代支付和支付宝&银联支付的物品ID一致！");
		e.preventDefault();
	}
	jQuery.ajax({
		type:"post",
		url:"checkProductId.action",
		data:{"product_id":$("#mes_product_id").val()},
		success:function(response){
			if(response=="0"){
				alert("此物品ID已被使用！");
				e.preventDefault();
			}
			else {
				jQuery.ajax({
					type:"post",
					url:"payFormSub.action",
					data:{
						"mesPay.product_id": $("#mes_product_id").val(),
						"mesPay.name": $("#mes_name").val(),
						"mes_price":parseInt($("#mes_price_id").val()),
						"mesPay.description": $("#mes_description").val(),
						"otherPay.product_id": $("#other_product_id").val(),
						"otherPay.name": $("#other_name").val(),
						"otherPay.price": parseFloat($("#price").val()),
						"otherPay.description": $("#other_description").val()
					},
					success: function(){
						alert("添加物品成功！");
						$("#mes_product_id").attr("value","");
						$("#mes_name").attr("value","");
						$("#mes_description").attr("value","");
						$("#other_product_id").attr("value","");
						$("#other_name").attr("value","");
						$("#price").attr("value","");
						$("#other_description").attr("value","");
						location.href="showAppProduct.action?apkId="+apkId;
					},
					error: function(){
						alert("添加物品失败，请刷新后重试！");
					}
				});
				return true;
			}
				
		}
	});
		
	
}

function deletePay(name,payId,apkId){	//删除物品
	if(window.confirm("确认删除"+name+"?")){
	jQuery.ajax({
		type:"post",
		url:"deletePay.action",
		data:{"payId":payId},
		success: function(){
			alert(name+"已删除！");
			location.href="showAppProduct.action?apkId="+apkId;
			},
		error:function(){
			alert("删除失败！");
		}
	});
	}
	
}
function editPay(payId){
	jQuery.ajax({
		type:"post",
		url:"editPay.action",
		data:{"payId":payId},
		success:function(){
			location.href="virtual_amend.jsp";
		}
	});
	
}
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
             <div class="lianyun">
                 <ul class="lianlist">
                 	<s:iterator value="#request['pay']" id="pay">
                    <s:property value="#st.count" />
                    <li><span><s:property value="#pay.otherPay.name" /></span><p>
                    <a href="javascript:editPay('<s:property value="#pay.otherPay.id" />')">修改<img src="images/xiu.jpg" /></a>
                    <a href="javascript:deletePay('<s:property value="#pay.otherPay.name" />','<s:property value="#pay.otherPay.id" />','<%=app.getAppInfo().getId()%>')">删除<img src="images/del.jpg"/></a></p>
                    </li>
                    </s:iterator>
                 </ul>
                 <!--liannav-->
                 <div class="zeng">
                     <p class="newadd"><a href="javascript:void(0)"><img src="images/z.jpg" />新增</a></p>
                        <div class="xinzeng">
                        <p ><font color="#F00">注：
若您的商品价格超过30元，只需填写其他支付（支付宝&银联支付）。
即使填写了短代支付，也无法生效。</font></p>
                            <p class="xintit">短代支付</p>
                            <div><label><span>物品ID：</span><p><input id="mes_product_id" type="text" /></p></label></div>
                            <div><label><span>物品名称：</span><p><input id="mes_name" type="text" /></p></label></div>
                            <div><label><span>物品价格：</span><p>
                            <select name="mes_price" id="mes_price_id">
                            <option value="1">1元</option>
                            <option value="2">2元</option>
                            <option value="3">3元</option>
                            <option value="4">4元</option>
                            <option value="5">5元</option>
                            <option value="6">6元</option>
                            <option value="7">7元</option>
                            <option value="8">8元</option>
                            <option value="9">9元</option>
                            <option value="10">10元</option>
                            <option value="11">11元</option>
                            <option value="12">12元</option>
                            <option value="13">13元</option>
                            <option value="14">14元</option>
                            <option value="15">15元</option>
                            <option value="16">16元</option>
                            <option value="17">17元</option>
                            <option value="18">18元</option>
                            <option value="19">19元</option>
                            <option value="20">20元</option>
                            <option value="21">21元</option>
                            <option value="22">22元</option>
                            <option value="23">23元</option>
                            <option value="24">24元</option>
                            <option value="25">25元</option>
                            <option value="26">26元</option>
                            <option value="27">27元</option>
                            <option value="28">28元</option>
                            <option value="29">29元</option>
                            <option value="30">30元</option>
                            </select></p></label></div>
                            <div><label><span>物品描述：</span><p><textarea id="mes_description"></textarea></p></label></div>
                            <hr />
                            <p class="xintit">其他支付（支付宝&银联支付）</p>
                            <div><label><span>物品ID：</span><p><input id="other_product_id" type="text" /></p></label></div>
                            <div><label><span>物品名称：</span><p><input id="other_name" type="text" /></p></label></div>
                            <div><label><span>价格：</span><p><input id="price" type="text" /></p></label></div>
                            <div><label><span>物品描述：</span><p><textarea id="other_description"></textarea></p></label></div>
                           <div class="sdksure"><a href="javascript:payFormSub('<%=app.getAppInfo().getId()%>');" >确认</a></div>
                           <p class="sdkcolse"><a href="javascript:void(0)"><img src="images/g.jpg" /></a></p>
                     </div>
                    <!--xinzeng-->
                    <p class="back"><a href="Joint operation.jsp">返回</a></p>
                </div>
                <!--zeng-->
             </div>
             <!--lianyun-->
          </div>        
          <!--list-->        
     </div>
 </div>
 </div>
</div> 
</body>
</html>
