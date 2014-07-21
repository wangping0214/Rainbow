<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>重新提交基本信息</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />

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
                      <h3 class="tit2">重新提交-基本信息</h3>
                      <div class="xinxicont">
                          <form id="form1" name="form1" method="post" action="">
                               <div><label>名称:</label><p class="pp"><input height="30" name="textfield2" type="text" size="40" /><p class="zhushi">不超过15个中文字符或30个英文字符。</p></p>
                               </div>
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
                                    <p><input type="radio" value="" name="1" />没有收费内容</p>
                                    <p><input type="radio" value="" name="1" />这个应用是试用版，付费后才能使用完整功能</p>
                                    <p><input type="radio" value="" name="1" />这个应用包含付费内容，如表情，道具，电子书等虚拟物品</p>
                                    <p><input type="radio" value="" name="1" />这个应用是试用版，付费后才能使用完整功能，同时应用中包含付费方可购买的虚拟物品</p>
                                 
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
                                   <div class="zhushi">50到1500字，简述应用的作用、使用方法等信息</div>
                                 </p>
                              </div>
                              <div><label class="zifei">描述:</label>
                                 <p class="pp pp2">
                                   <textarea>详细描述</textarea>
                                   <div class="zhushi">可输入500字，详细应用的作用、使用方法等信息</div>
                                 </p>
                              </div>
                              <div><label class="zifei">本版本简介:</label>
                                 <p class="pp pp2">
                                   <textarea>版本简介</textarea>
                                   <div class="zhushi zhushi2">长度不超过400字符，介绍当前应用版本及更新内容的描述。我们建议您按照规范填写"当前版本介绍"因为我们会把更新说明展示给用户，同时您的应用还可以获得优先审核及小编推荐的机会
</div>
                                 </p>
                              </div>
                          </form>
                          <div class="nextpage"><a href="rechuansucai.jsp" target="main">下一页</a></div>
                      </div>
                      <!--dailist-->

               </div>
     </div>
 </div>
 </div>
 
</body>
</html>
