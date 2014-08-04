<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>会员管理</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/nav.js"></script>
<style type="text/css">
.searchcont2 {
	background: url(images/searchs.png) no-repeat;
	width: 227px;
	height: 25px;
	line-height: 25px;
	margin: 20px 0 7px 0px;
}

.searchcont2 input {
	outline: none;
	height: 25px;
	line-height: 25px;
	float: left;
}

.socont2 {
	width: 175px;
	height: 25px;
	background: none;
	border: none;
	margin-left: 4px;
	display: inline;
	color: #FFF;
	font-size: 14px;
}

.sobut2 {
	width: 35px;
	height: 25px;
	background: none;
	border: none;
	cursor: pointer
}
</style>
<script type="text/javascript" language="javascript">
	function editAppDivided(appId, num) {
		var divided = $("#divided" + num).val();
		var channel_message = $("#channel_message" + num).val();
		var channel_bank = $("#channel_bank" + num).val();
		var channel_alipay = $("#channel_alipay" + num).val();
		if (divided<0||divided>100) {
			alert("分成比例在0-100之间！");
			$("#divided" + num).focus();
			return false;
		}
		if (channel_message<0||channel_message>100) {
			alert("短代的通道费率在0-100之间！");
			$("#channel_message" + num).focus();
			return false;
		}
		if (channel_bank<0||channel_bank>100) {
			alert("银联的通道费率在0-100之间！");
			$("#channel_bank" + num).focus();
			return false;
		}
		if (channel_alipay<0||channel_alipay>100) {
			alert("支付宝的通道费率在0-100之间！");
			$("#channel_alipay" + num).focus();
			return false;
		}
		if (window.confirm("确认修改?")) {
			jQuery.ajax({
				type : "post",
				url : "editAppDivided",
				data : {
					"appId" : appId,
					"appAut.divided" : divided,
					"appAut.channel_message" : channel_message,
					"appAut.channel_bank" : channel_bank,
					"appAut.channel_alipay" : channel_alipay
				},
				success : function() {
					alert("修改成功！")
				}
			});
		}
	}
</script>
</head>

<body>
	<div class="body">
		<div class="content">
			<div class="search">
				<div class="searchcont">
					<input type="text" value="搜索" class="socont fl" /><input
						type="submit" value="" class="sobut fr" />
				</div>
				<!--searchcont-->
			</div>
			<div class="midcont">
				<div class="list">
					<ul class="guanggaonav">
						<li>详情编辑</li>
					</ul>
					<s:set name="userApps" value="#request.userApps"></s:set>
					<div class="guanggaocont">
						<div class="huiyuancont">
							<div class="ptit">
								<p>
									企业用户><span><s:property value="#userApps.user.username" /></span>
								</p>
								<a href="findAllUserJoint" class="back3">返回</a>
							</div>
							<div class="ptit2">
								<span><s:property value="#userApps.user.corporatename" /></span>应用数量[<b><s:property
										value="#userApps.app.size()" /></b>]
							</div>
							<div class="yonghu2">
								<table border="0" cellpadding="0" cellspacing="0" width="90%"
									class="appslist">
									<s:iterator id="app" value="#userApps.app" status="st">
										<tr>
											<td>
												<dl>
													<dt>
														<img
															src="<%=request.getContextPath()%><s:property value="#app.appSou.logo1" />" />
													</dt>
													<dd>
														<s:property value="#app.appInfo.appName" />
													</dd>
												</dl>
											</td>
											<td>
												<div>
													<b>分成比例(%)</b>
												</div>
												<div>
													<input type="text" id="divided<s:property value='#st.count' />"
														value="<s:property value="#app.appAut.divided" />">
												</div>
											</td>
											<td>
												<div>
													<b>通道费率(%)</b>
												</div>
												<div>
													<p>
														短代：<input type="text" id="channel_message<s:property value='#st.count' />"
															value="<s:property value="#app.appAut.channel_message" />">
													</p>
													<p>
														银联：<input type="text" id="channel_bank<s:property value='#st.count' />"
															value="<s:property value="#app.appAut.channel_bank" />">
													</p>
													<p>
														支付宝：<input type="text" id="channel_alipay<s:property value='#st.count' />"
															value="<s:property value="#app.appAut.channel_alipay" />">
													</p>
												</div>
											</td>
											<td><input type="button" value="确认"
												onclick="editAppDivided('<s:property value="#app.appAut.id" />','<s:property value='#st.count' />')"
												class="appque" /></td>
										</tr>
									</s:iterator>
								</table>
								<ul class="page">
									<s:set name="page" value="#request.page" />
									<s:if test="#page.hasFirst">
										<li><a
											href="checkUserJointApps?userId=<s:property value="#userApps.user.id" />&currentPage=1">首页</a>
										</li>
									</s:if>
									<s:if test="#page.hasPrevious">
										<li><a
											href="checkUserJointApps?userId=<s:property value="#userApps.user.id" />&currentPage=<s:property value="#page.currentPage-1"/>">上一页</a>
										</li>
									</s:if>
									<s:if test="#page.totalPage>1">
										<li><a
											href="checkUserJointApps?userId=<s:property value="#userApps.user.id" />&currentPage=1">1</a></li>
									</s:if>
									<s:if test="#page.totalPage>2">
										<li><a
											href="checkUserJointApps?userId=<s:property value="#userApps.user.id" />&currentPage=2">2</a></li>
									</s:if>
									<s:if test="#page.totalPage>3">
										<li><a
											href="checkUserJointApps?userId=<s:property value="#userApps.user.id" />&currentPage=3">3</a></li>
									</s:if>
									<s:if test="#page.totalPage>4">
										<li><a
											href="checkUserJointApps?userId=<s:property value="#userApps.user.id" />&currentPage=4">4</a></li>
									</s:if>
									<s:if test="#page.totalPage>5">
										<li><a
											href="checkUserJointApps?userId=<s:property value="#userApps.user.id" />&currentPage=5">5</a></li>
									</s:if>
									<s:if test="#page.hasNext">
										<li><a
											href="checkUserJointApps?userId=<s:property value="#userApps.user.id" />&currentPage=<s:property value="#page.currentPage+1"/>">下一页</a></li>
									</s:if>
									<s:if test="#page.hasLast">
										<li><a
											href="checkUserJointApps?userId=<s:property value="#userApps.user.id" />&currentPage=<s:property value="#page.totalPage"/>">尾页</a></li>
									</s:if>
									<li>当前第<s:property value="#page.currentPage" />页，总共<s:property
											value="#page.totalPage" />页
									</li>
								</ul>
							</div>
							<!--yonghu-->
						</div>

					</div>
					<!--guanggaocont-->
					<div class="guanggaocont">
						<div class="qyzcshenpi">
							<div class="daishenpi">
								待审批数量<span class="red">10</span>
							</div>
							<div class="all">
								<select><option>全部</option>
									<option>企业用户</option>
									<option>个人用户</option></select>
							</div>
							<div class="qi">
								<span>企业</span><span class="green">五彩时空科技有限公司</span><a
									href="chulishenpi.html" target="main" class="chuli">处理审批</a>
							</div>
						</div>
						<!--qyzcshenpi-->
					</div>
					<!--guanggaocont-->

				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
