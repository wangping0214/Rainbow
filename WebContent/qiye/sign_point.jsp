<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加新应用</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jq.js"></script>
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
                 <p class="headnav"><a href="app_perfect.jsp">完善APP信息</a>->注册计费点</p>
             </div>
             <!--tit-->
             <div class="tit2">注册商品计费点</div>
             <form id="form1" name="form1" method="post" action="">
             <div class="cont">
                 <p class="explain">1.联通短代 - 商品价格仅支持1-30元整数。</p>
                 <p class="explain">2. 若您的商品价格超过30元，只需填写其他支付（支付宝&银联支付）。     </p>
                 <div class="jifeicont">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="jifeitable">
                         <tr>
                            <th width="10%" class="dd">计费点</th>
                            <th width="18%" class="dd">商品名称</th>
                            <th width="10%" class="dd">短代价格</th>
                            <th width="15%" class="dd">支付宝&网银 </th>
                            <th width="27%" class="dd">商品ID</th>
                            <th width="20%" class="dd">操作</th>
                         </tr>
                         <tr>
                            <td>No.1</td>
                            <td>xxxx</td>
                            <td>XX 元</td>
                            <td>XXXX 元</td>
                            <td>12345678912345678912.....<a href="#" class="pid">复制</a></td>
                            <td><a href="javascript:void(0);" class="amend"><img src="images/gs_06.jpg" />修改</a>　<a href="#"><img src="images/gs_03.jpg" />删除</a></td>
                         </tr>
                         <tr>
                            <td colspan="6" class="jjcont">
                                
                                <div class="xinxicont xinxicont120">
                                   <div class="tit5">计费点NO.1</div>
                                    <div class="wpid"><label>商品ID:</label><p>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p></div>
                                    <div><label>商品名称:</label><p class="pp"><input name="textfield2" type="text" class="inputs" /><p class="zhushi">请与游戏内商品名称保持一致。</p></p></div>
                                    <div><label>短代价格:</label>
                                        <p class="pp">
                                          <select name="select">
                                             <option>1</option>
                                             <option>2</option>
                                           </select>
                                        </p>
                                        <p class="zhushi2">联通短代 - 商品价格仅支持1-30元整数</p>
                                      </div>
                                      <div><label>支付宝&银联价格: </label><p class="pp yinlian"><input name="textfield2" type="text" class="inputs" /></p></div>
                                       <div class="uppage uppage2"><input type="submit" value="保存并继续" class="tijiao" /><input type="submit" value="取消" class="quxiao" /></div>
                                </div>
                               <!--xinxicont-->
                            </td>
                         </tr>
                         <tr>
                            <td>No.2</td>
                            <td><p class="pname">xxxxxxxxxxxxxxxxxxxxxxxx</p></td>
                            <td>XX 元</td>
                            <td>XX 元</td>
                            <td>12345678912345678912.....<a href="#" class="pid">复制</a></td>
                            <td><a href="javascript:void(0);" class="amend"><img src="images/gs_06.jpg" />修改</a>　<a href="#"><img src="images/gs_03.jpg" />删除</a></td>
                         </tr>
                         <tr>
                            <td colspan="6" class="jjcont">
                                
                                <div class="xinxicont xinxicont120">
                                   <div class="tit5">计费点NO.2</div>
                                    <div class="wpid"><label>商品ID:</label><p>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p></div>
                                    <div><label>商品名称:</label><p class="pp"><input name="textfield2" type="text" class="inputs" /><p class="zhushi">请与游戏内商品名称保持一致。</p></p></div>
                                    <div><label>短代价格:</label>
                                        <p class="pp">
                                          <select name="select">
                                             <option>1</option>
                                             <option>2</option>
                                           </select>
                                        </p>
                                        <p class="zhushi2">联通短代 - 商品价格仅支持1-30元整数</p>
                                      </div>
                                      <div><label>支付宝&银联价格: </label><p class="pp yinlian"><input name="textfield2" type="text" class="inputs" /></p></div>
                                       <div class="uppage uppage2"><input type="submit" value="保存并继续" class="tijiao" /><input type="submit" value="取消" class="quxiao" /></div>
                                </div>
                               <!--xinxicont-->
                            </td>
                         </tr>
                    </table>
                 </div>
                 <!--jifeicont-->
                 <div class="newadd">
                    <p class="newaddbut"><a href="javascript:void(0)"><img src="images/jia.png" />添加新计费点</a></p>
                    <div class="addcont">
                        <div class="xinxicont xinxicont120">
                                   <div class="tit5">添加计费点</div>
                                    <div class="wpid"><label>商品ID:</label><p>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p></div>
                                    <div><label>商品名称:</label><p class="pp"><input name="textfield2" type="text" class="inputs" /><p class="zhushi">请与游戏内商品名称保持一致。</p></p></div>
                                    <div><label>短代价格:</label>
                                        <p class="pp">
                                          <select name="select">
                                             <option>1</option>
                                             <option>2</option>
                                           </select>
                                        </p>
                                        <p class="zhushi2">联通短代 - 商品价格仅支持1-30元整数</p>
                                      </div>
                                      <div><label>支付宝&银联价格: </label><p class="pp yinlian"><input name="textfield2" type="text" class="inputs" /></p></div>
                                       <div class="uppage uppage2"><input type="submit" value="保存并继续" class="tijiao" /><input type="submit" value="取消" class="quxiao" /></div>
                                </div>
                               <!--xinxicont-->  
                               <p class="close"><img src="images/g.jpg" /></p>
                               
                    </div>
                    <!--addcont-->  
                 </div>
                 <!--newadd-->
                 <div class="uppage uppage3"><input type="submit" value="下一步" class="tijiao" /><input type="submit" value="取消" class="quxiao" /></div>
             </div>
             <!--cont-->
             </form>
       </div>
       <!--midcont-->
 </div>
</body>
</html>
