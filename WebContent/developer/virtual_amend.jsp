<%@ page language="java" import="com.rainbow.server.Pay" import="com.rainbow.server.App" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%Pay pay = (Pay)session.getAttribute("pay"); %>
	<%App app = (App)session.getAttribute("app"); %>
	<%Integer mes_price=(Integer)session.getAttribute("mes_price"); %>
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
	
});


function editPaySub(payId,apkId,e){		//编辑物品
	if($("#mes_product_id").val()==""){
		alert("短代支付的物品ID不能为空");
		e.preventDefault();
	}
	if($("#mes_name").val()==""){
		alert("短代支付的物品名称不能为空");
		e.preventDefault();
	}
	if($("#mes_description").val()==""){
		alert("短代支付的物品描述不能为空");
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
	if($("#mes_product_id").val()!=$("#other_product_id").val()){
		alert("请确认短代支付和支付宝&银联支付的物品ID一致！");
		e.preventDefault();
	}
	
				jQuery.ajax({
					type:"post",
					url:"editPaySub.action",
					data:{
						"mesPay.product_id": $("#mes_product_id").val(),
						"mesPay.name": $("#mes_name").val(),
						"mes_price":parseInt($("#mes_price_id").val()),
						"mesPay.description": $("#mes_description").val(),
						"otherPay.product_id": $("#other_product_id").val(),
						"otherPay.name": $("#other_name").val(),
						"otherPay.price": parseFloat($("#price").val()),
						"otherPay.description": $("#other_description").val(),
						"payId":payId,
						"apkId":apkId
					},
					success: function(){
						alert("修改物品成功！");
						$("#mes_product_id").attr("value","");
						$("#mes_name").attr("value","");
						$("#china_unicom_product_id").attr("value","");
						$("#china_unicom_consume_code").attr("value","");
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
                 <div class="zeng">
                        <div class="xinzeng xinzeng2">
                            <p class="xintit">短代支付</p>
                            <div><label><span>物品ID：</span><p><input id="mes_product_id" type="text"<%if(pay.getMesPay().getProduct_id()!=null){ %>value="<%=pay.getMesPay().getProduct_id() %>" <%}else{ %>value=""<%} %> /></p></label></div>
                            <div><label><span>物品名称：</span><p><input id="mes_name" type="text"<%if(pay.getMesPay().getName()!=null){ %>value="<%=pay.getMesPay().getName() %>"<%}else{ %>value=""<%} %> /></p></label></div>
                            
                            <div><label><span>物品价格：</span><p>
                            
                            <select name="mes_price" id="mes_price_id">
                            <option value="1" <%if(mes_price==1){ %>selected="selected"<%} %>>1元</option>
                            <option value="2"<%if(mes_price==2){ %>selected="selected"<%} %>>2元</option>
                            <option value="3"<%if(mes_price==3){ %>selected="selected"<%} %>>3元</option>
                            <option value="4"<%if(mes_price==4){ %>selected="selected"<%} %>>4元</option>
                            <option value="5"<%if(mes_price==5){ %>selected="selected"<%} %>>5元</option>
                            <option value="6"<%if(mes_price==6){ %>selected="selected"<%} %>>6元</option>
                            <option value="7"<%if(mes_price==7){ %>selected="selected"<%} %>>7元</option>
                            <option value="8"<%if(mes_price==8){ %>selected="selected"<%} %>>8元</option>
                            <option value="9"<%if(mes_price==9){ %>selected="selected"<%} %>>9元</option>
                            <option value="10"<%if(mes_price==10){ %>selected="selected"<%} %>>10元</option>
                            <option value="11"<%if(mes_price==11){ %>selected="selected"<%} %>>11元</option>
                            <option value="12"<%if(mes_price==12){ %>selected="selected"<%} %>>12元</option>
                            <option value="13"<%if(mes_price==13){ %>selected="selected"<%} %>>13元</option>
                            <option value="14"<%if(mes_price==14){ %>selected="selected"<%} %>>14元</option>
                            <option value="15"<%if(mes_price==15){ %>selected="selected"<%} %>>15元</option>
                            <option value="16"<%if(mes_price==16){ %>selected="selected"<%} %>>16元</option>
                            <option value="17"<%if(mes_price==17){ %>selected="selected"<%} %>>17元</option>
                            <option value="18"<%if(mes_price==18){ %>selected="selected"<%} %>>18元</option>
                            <option value="19"<%if(mes_price==19){ %>selected="selected"<%} %>>19元</option>
                            <option value="20"<%if(mes_price==20){ %>selected="selected"<%} %>>20元</option>
                            <option value="21"<%if(mes_price==21){ %>selected="selected"<%} %>>21元</option>
                            <option value="22"<%if(mes_price==22){ %>selected="selected"<%} %>>22元</option>
                            <option value="23"<%if(mes_price==23){ %>selected="selected"<%} %>>23元</option>
                            <option value="24"<%if(mes_price==24){ %>selected="selected"<%} %>>24元</option>
                            <option value="25"<%if(mes_price==25){ %>selected="selected"<%} %>>25元</option>
                            <option value="26"<%if(mes_price==26){ %>selected="selected"<%} %>>26元</option>
                            <option value="27"<%if(mes_price==27){ %>selected="selected"<%} %>>27元</option>
                            <option value="28"<%if(mes_price==28){ %>selected="selected"<%} %>>28元</option>
                            <option value="29"<%if(mes_price==29){ %>selected="selected"<%} %>>29元</option>
                            <option value="30"<%if(mes_price==30){ %>selected="selected"<%} %>>30元</option>
                            </select></p></label></div>
                            <div><label><span>物品描述：</span><p><textarea id="mes_description"><%if(pay.getMesPay().getDescription()!=null){ %><%=pay.getMesPay().getDescription() %><%} %></textarea></p></label></div>
                            <hr />
                            <p class="xintit">其他支付（支付宝&银联支付）</p>
                            <div><label><span>物品ID：</span><p><input id="other_product_id" type="text"<%if(pay.getOtherPay().getProduct_id()!=null){ %>value="<%=pay.getOtherPay().getProduct_id() %>"<%} %> /></p></label></div>
                            <div><label><span>物品名称：</span><p><input id="other_name" type="text"<%if(pay.getOtherPay().getName()!=null){ %>value="<%=pay.getOtherPay().getName() %>"<%} %> /></p></label></div>
                            <div><label><span>价格：</span><p><input id="price" type="text"<%if(pay.getOtherPay()!=null){ %>value="<%=pay.getOtherPay().getPrice() %>"<%} %> /></p></label></div>
                            <div><label><span>物品描述：</span><p><textarea id="other_description"><%if(pay.getOtherPay().getDescription()!=null){ %><%=pay.getOtherPay().getDescription() %><%} %></textarea></p></label></div>
                           <div class="sdksure"><a href="javascript:editPaySub('<%=pay.getMesPay().getId() %>','<%=app.getAppInfo().getId() %>');" >确认</a></div>
                           <p class="sdkcolse"><a href="javascript:history.back(-1);"><img src="images/g.jpg" /></a></p>
                     </div>
                    <!--xinzeng-->
                 
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
