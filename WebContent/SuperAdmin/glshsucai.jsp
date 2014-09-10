<%@ page import="com.rainbow.entity.AppSource" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		String bowser= "";
		//火狐
		                if (request.getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0) {
		                    bowser = "firefox";
		                }
		                //IE
		                else {
		                	 bowser = "IE";
		                }
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>管理审核&素材</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style>
.xinxicont label{ width:180px; }
.zhushi{ padding:5px 0 0 190px; font-weight:normal; clear:both;}

</style>
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
     <%
     	AppSource appSou = (AppSource)session.getAttribute("appSou");
     %>
                  <div class="list">
                      <h3 class="tit2">素材</h3>
                      <div class="xinxicont">
                         <form id="form1" name="form1" method="post" action="auditSou.action">
                               <div><label>应用程序包:</label><p class="pp">
                               <%if(appSou.getPackge()==null){ %>
                               <input name="subApp.appSou.packge"  type="text" size="40" id="id_tx_packge" readonly/>
                               <input type="file" name="appTmp.packgeContent" style="display:none;" id="id_packge" onchange="id_tx_packge.value=this.value"/>
                               <%}
                               else{%>
                               <input name="subApp.appSou.packge"  type="text" size="40" id="id_tx_packge" value="<%=appSou.getPackge() %>" readonly/>
                               <input type="file" name="appTmp.packgeContent" style="display:none;" id="id_packge"  onchange="id_tx_packge.value=this.value"/>
                               <%} %>
                               <a href="downApk.action?bowser=<%=bowser %>&appSouId=<%=appSou.getId() %>&downPath=<%=appSou.getPackge() %>" class="scyy" >导出</a>
                               </p>
                               <p class="zhushi">请上传首发时的软件应用包APK文件，大小不超过1GB<br /><a href="#" class="bluea">上传失败常见问题及解决办法！
</a>
</p>
                               </div>
                               <div><label>logo图标:</label><p class="pp">
                               <%if(appSou.getLogo1()==null){ %>
                               <input name="subApp.appSou.logo1" type="text" size="40" id="id_tx_logo1" readonly/>
                               <%}
                               else{%>
                               <input name="subApp.appSou.logo1" type="text" size="40" id="id_tx_logo1" value="<%=appSou.getLogo1() %>" readonly/>
                               <%} %>
                               <input type="file"  name="appTmp.logo1Content" style="display:none;" id="id_logo1" onchange="id_tx_logo1.value=this.value" />
                               <a href="downPhoto.action?bowser=<%=bowser %>&appSouId=<%=appSou.getId() %>&downPath=<%=appSou.getLogo1() %>" class="scyy" >导出</a></p>
                               <p class="zhushi">尺寸48px*48px，png格式，圆角 ，具体请参考<a href="#" class="bluea"> Logo样本</a>
</p>
                               </div>
                               <div><label>logo图标(94*94):</label><p class="pp">
                               <%if(appSou.getLogo2()==null){ %>
                               <input name="subApp.appSou.logo2"  type="text" size="40" id="id_tx_logo2" readonly/>
                               <%}
                               else{%>
                               <input name="subApp.appSou.logo2"  type="text" size="40" id="id_tx_logo2" value="<%=appSou.getLogo2() %>" readonly/>
                               <%} %>
                               <input type="file"  name="appTmp.logo2Content" style="display:none;" id="id_logo2" onchange="id_tx_logo2.value=this.value" />
                               <a href="downPhoto.action?bowser=<%=bowser %>&appSouId=<%=appSou.getId() %>&downPath=<%=appSou.getLogo2() %>" class="scyy" >导出</a></p>
                               <p class="zhushi">我们建议您提供高清的LOGO图标，这样可以获得更好的视觉展示效果和用户点击。
尺寸94px*94px，png格式，圆角，具体参考Logo样本
我们建议您提供高清的LOGO图标，这样可以获得更好的视觉展示效果和用户点击。<br />
尺寸94px*94px，png格式，圆角，具体参考
<a href="#" class="bluea"> Logo样本</a>
</p>
                               </div>
                               <div style="clear:both; overflow:hidden; zoom:1;"><label>游戏图片素材:</label><div class="sclogo">
                                   <div class="logoimg">
                                       
                                      	  <input type="file"  name="appTmp.gamePhotoContent1" style="display:none;" id="gamePhoto1" />
                                       
                                          <%if(appSou.getGamePhoto1()==null){ %>
                                          <img name="btn" src="images/img26.png"  width="81" height="71" border="0" style="vertical-align:middle" id="photo1"/>
                                          <%}
                                          else{%>
                                          <a href="downPhoto.action?bowser=<%=bowser %>&appSouId=<%=appSou.getId() %>&downPath=<%=appSou.getGamePhoto1() %>">
                                          <img name="btn" src="<%=request.getContextPath()+appSou.getGamePhoto1() %>"  width="81" height="71" border="0" style="vertical-align:middle" id="photo1"/></a>
                                          <%} %>
                                        
                                          <input type="file"  name="appTmp.gamePhotoContent2" style="display:none;" id="gamePhoto2" />
                                         
                                          <%if(appSou.getGamePhoto2()==null){ %>
                                          <img name="btn" src="images/img26.png"  width="81" height="71" border="0" style="vertical-align:middle" id="photo2"/>
                                          <%}
                                          else{%>
                                          <a href="downPhoto.action?bowser=<%=bowser %>&appSouId=<%=appSou.getId() %>&downPath=<%=appSou.getGamePhoto2() %>">
                                          <img name="btn" src="<%=request.getContextPath()+appSou.getGamePhoto2() %>"  width="81" height="71" border="0" style="vertical-align:middle" id="photo2"/></a>
                                          <%} %>
                                         
                                          <input type="file"  name="appTmp.gamePhotoContent3" style="display:none;" id="gamePhoto3" />
                                          
                                          <%if(appSou.getGamePhoto3()==null){ %>
                                          <img name="btn" src="images/img26.png"  width="81" height="71" border="0" style="vertical-align:middle" id="photo3"/>
                                          <%}
                                          else{%>
                                          <a href="downPhoto.action?bowser=<%=bowser %>&appSouId=<%=appSou.getId() %>&downPath=<%=appSou.getGamePhoto3() %>">
                                          <img name="btn" src="<%=request.getContextPath()+appSou.getGamePhoto3() %>"  width="81" height="71" border="0" style="vertical-align:middle" id="photo3"/></a>
                                          <%} %>
                                          
                                          <input type="file"  name="appTmp.gamePhotoContent4" style="display:none;" id="gamePhoto4" />
                                          
                                          <%if(appSou.getGamePhoto4()==null){ %>
                                          <img name="btn" src="images/img26.png"  width="81" height="71" border="0" style="vertical-align:middle" id="photo4"/>
                                          <%}
                                          else{%>
                                          <a href="downPhoto.action?bowser=<%=bowser %>&appSouId=<%=appSou.getId() %>&downPath=<%=appSou.getGamePhoto4() %>">
                                          <img name="btn" src="<%=request.getContextPath()+appSou.getGamePhoto4() %>"  width="81" height="71" border="0" style="vertical-align:middle" id="photo4"/></a>
                                          <%} %>
                                          
                                          <input type="file"  name="appTmp.gamePhotoContent5" style="display:none;" id="gamePhoto5" />
                                          
                                          <%if(appSou.getGamePhoto5()==null){ %>
                                          <img name="btn" src="images/img26.png"  width="81" height="71" border="0" style="vertical-align:middle" id="photo5"/>
                                          <%}
                                          else{%>
                                          <a href="downPhoto.action?bowser=<%=bowser %>&appSouId=<%=appSou.getId() %>&downPath=<%=appSou.getGamePhoto1() %>">
                                          <img name="btn" src="<%=request.getContextPath()+appSou.getGamePhoto5() %>"  width="81" height="71" border="0" style="vertical-align:middle" id="photo5"/></a>
                                          <%} %>
                                         
                                   </div>
                                   <!--logoimg-->
                                   <p class="zhushi3">尺寸246x409，jpg或png，<a href="#" class="bluea">示例照片</a></p>
                               </div> 
                               </div>
                          </form>
                          <div class="uppage"><a href="guanlishenhe.jsp" target="main">上一页</a><a href="shenhetijao.jsp" target="main">下一页</a></div>
                      </div>
                      <!--dailist-->

               </div>
     </div>
 </div>
 </div>
 
</body>
</html>
