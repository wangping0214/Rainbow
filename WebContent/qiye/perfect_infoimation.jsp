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
                 <p class="headnav"><a href="app_perfect.jsp">完善APP信息</a> -> 完善应用信息</p>
             </div>
             <!--tit-->
             <div class="tit2">完善应用信息</div>
             <form id="form1" name="form1" method="post" action="">
             <div class="cont">
                 <div class="xinxicont">
                     <div><label>应用名称:</label><p class="pp"><input name="textfield2" type="text" class="inputs" /><p class="zhushi">建议您与应用包中的名称一致。</p></p></div>
                     <div><label>类型:</label>
                         <p class="pp">
                              <select name="select">
                                  <option>游戏</option>
                                  <option>应用</option>
                              </select>
                           </p>
                      </div>
                      <div><label>分类:</label>
                           <p class="pp">
                               <select name="select">
                                   <option>游戏分类</option>
                                   <option>应用</option>
                               </select>
                            </p>
                            <p class="pp">
                                <select name="select">
                                   <option>游戏分类</option>
                                   <option>应用</option>
                                 </select>
                             </p>
                       </div>
                       <div><label>语言:</label>
                           <p class="pp">
                               <select style="width:120px" name="select">
                                   <option>简体中文</option>
                                   <option>英文</option>
                               </select>
                            </p>
                       </div>
                       <div><label class="zifei">资费内容:</label>
                           <p class="pp">
                               <p><input type="radio" name="1"checked="checked" />没有收费内容</p>
                               <p><input type="radio" name="1" />这个应用是试用版，付费后才能使用完整功能</p>
                               <p><input type="radio" name="1" />这个应用包含付费内容，如表情，道具，电子书等虚拟物品</p>
                               <p><input type="radio" name="1" />这个应用是试用版，付费后才能使用完整功能，同时应用中包含付费方可购买的虚拟物品</p>
                            </p>
                       </div>
                       <div><label>安全防范:</label>
                          <p class="fangfan">
                               <input type="checkbox" checked="checked" value="无广告">无广告
                               <input type="checkbox" checked="checked" value="无病毒">无病毒
                               <input type="checkbox" checked="checked" value="隐私">隐私
                               <input type="checkbox" checked="checked" value="官方版">官方版
                           </p>
                       </div>
                       <div><label class="zifei">简介:</label>
                           <p class="pp pp2">
                               <textarea>应用简介</textarea>
                               <div class="zhushi">可输入10~XX字，一句话描述应用的特色功能，如「史诗级手游巨作！再降人间！！！」 </div>
                           </p>
                       </div>
                       <div><label class="zifei">描述:</label>
                           <p class="pp pp2">
                               <textarea>详细描述</textarea>
                               <div class="zhushi">可输入50-1500字。</div>
                           </p>
                       </div>
                       <div><label class="zifei">本版本简介:</label>
                           <p class="pp pp2">
                               <textarea>版本简介</textarea>
                               <div class="zhushi zhushi2">可输入500字，建议将各个更新内容使用数字序号进行分段。</div>
                           </p>
                       </div>
                       
                    </div>
                    <!--xinxicont-->
             </div>
             <!--cont-->
             <div class="tit2">素材</div>
             <div class="cont">
                 <div class="xinxicont">
                      <div><label>应用安装包:</label>
                         <p class="pp">
                           <input name="textfield2" type="text" class="inputs2" /><input type="file"  name="browse" style="display:none;"  /><a href="javascript:fn_browse();" title="上传"> <img name="btn" src="images/liulan.jpg" width="60" height="30" border="0" style="vertical-align:top"/></a><p class="zhushi">请上传您的应用。</p></p></div>
                      <div><label>应用图标:</label>
                          <p class="pp">
                             <dl class="sclogo">
                                <dt><img src="images/icon2.jpg" /></dt>
                                <dd>请上传高清的LOGO图标<br />尺寸要求：PNG格式透明图标、256x256。</dd>
                                <dd class="margint10"><input type="file"  name="browse2" style="display:none;"  /><a href="javascript:fn_browse();" title="上传"> <img name="btn" src="images/sc_03.jpg" width="70" height="30" border="0" style="vertical-align:top"/></a></dd>
                             </dl>
                           </p>
                       </div>
                       <div><label>游戏图片素材:</label>
                           <p><input type="file"  name="browse2" style="display:none;"  /><a href="javascript:fn_browse();" title="截图"> <img name="btn" src="images/icon2.jpg"  border="0" style="vertical-align:middle"/></a></p>                                         
                           <p class="zhushi3"><input type="file"  name="browse2" style="display:none;"  /><a href="javascript:fn_browse();" title="上传"> <img name="btn" src="images/liulan.jpg"  border="0" style="vertical-align:middle"/></a></p>                                     
                           <p class="zhushi3">请上传4-5张截图（尺寸保持一致），支持JPG、PNG格式。截图尺寸要求：不小于300x500</p>   
                       </div> 
                       <div class="time"><label>发布时间:</label><p class="pp margint5"><input type="radio" name="1" checked="checked" /><b>审核后立即发布</b><br /><br /><input type="radio" name="1"/><b>等待发布</b><br /><br /><span class="red">5天内，可随时发布。若超过5天，由系统自动发布。</span></p>
                       </div>
                       <div class="uppage uppage2"><input type="submit" value="保存并返回" class="tijiao" /><input type="submit" value="提交审核" class="quxiao" /></div>
                 </div>
                <!--xinxicont-->
             </div>
             <!--cont-->
             </form>
       </div>
       <!--midcont-->
 </div>
</body>
</html>
