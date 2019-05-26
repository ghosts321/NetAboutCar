<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery-ui-1.10.4.custom.min.js"></script>
		<title>许可申请</title>
		<style type="text/css">
			.table_main {
				width: 100%;
				border-collapse: collapse;
				border: 0px none;
				margin: auto;
			}
			
			.table_main tr {
				height: 38px;
				color: #363636;
			}
			
			.table_main th {
				color: #ffffff;
				font-weight: normal;
				background-color: #9370db;
				border: 1px solid #9370db !important;
			}
			
			.table_main td {
				border: 1px solid #cccccb !important;
				padding: 3px;
				color: #464646;
			}
			.login_area {
			}
			
			.login_area .login_block {
				margin: 0;
				padding: 0;
			}
			
			.login_area .login_block .login_tabs {
				ist-style: outside none none;
				border-bottom: 1px solid #ddd;
			}
			
			.login_tabs1 {
				ist-style: outside none none;
				border-bottom: 1px solid #ddd;
			}
			
			.login_area .login_block .login_tabs:after {
				content: "."; 
			    display: block;
			    height: 0; 
			    clear: both; 
			    visibility: hidden;
			}
			
			.login_tabs1:after {
				content: "."; 
			    display: block;
			    height: 0; 
			    clear: both; 
			    visibility: hidden;
			}
			
			.login_area .login_block .login_tabs li {
				line-height: 20px;
				margin-bottom: -1px;
				float: left;
			}
			
			.login_tabs1 li {
				line-height: 20px;
				margin-bottom: -1px;
				float: left;
			}
			
			.login_area .login_block .login_tabs li a {
				display: block;
				background-color: #f5f5f5;
				border: 1px solid transparent;
				color: #555;
				line-height: 20px;
				padding: 10px 12px;
				text-align: center;
				cursor: pointer;
			}
			
			.login_tabs1 li a {
				display: block;
				background-color: #f5f5f5;
				border: 1px solid transparent;
				color: #555;
				line-height: 20px;
				padding: 10px 12px;
				text-align: center;
				cursor: pointer;
			}
			
			.login_area .login_block .login_tabs li a:hover {
				background-color: #eeeeee;
			}
			
			.login_tabs1 li a:hover {
				background-color: #eeeeee;
			}
			
			.login_area .login_block .login_tabs li a.active {
				background-color: #fff;
				border-top: 1px solid #dddddd;
				border-left: 1px solid #dddddd;
				border-right: 1px solid #dddddd;
				cursor: default;
			}
			
			.login_tabs1 li a.active {
				background-color: #fff;
				border-top: 1px solid #dddddd;
				border-left: 1px solid #dddddd;
				border-right: 1px solid #dddddd;
				cursor: default;
			}
			
			.login_area .login_block .tab_content {
				margin: 0;
				padding: 0;
			}
			
			.login_area .login_block .tab_content .login_form {
				margin-top: 30px;
			}
			
			.login_area .login_block .tab_content .login_form .form_table {
				width: 100%;
				border-collapse: collapse;
				border: none;
			}
			
			.login_area .login_block .tab_content .login_form .form_table td {
				border: 0px;
				padding: 10px 6px;
				color: #555555;
			}
			
			.login_area .login_block .tab_content .login_form .form_table .but_area {
				background: rgba(255, 255, 255, 0.6) none repeat scroll 0 0;
				border-top: 1px solid #e5e5e5;
				margin: 20px 0px;
				padding-top: 20px;
				padding-left: 155px;
			}
			
			.login_area .login_block .tab_content .login_form .form_table .but_area:after {
				content: "."; 
			    display: block;
			    height: 0; 
			    clear: both; 
			    visibility: hidden;
			}
		</style>
		<script type="text/javascript">
			$(function(){
			
				$(".login_tabs").children("li").children("a").removeClass("active");
				
				var usertype = "0";
				if (usertype && usertype != "") {
					if (usertype == "0") {
						$(".login_tabs").children("li").eq(0).children("a").addClass("active");
						$(".tab_content").children("div").eq(0).show().siblings().hide();
					} else if (usertype == "1"){
						$(".login_tabs").children("li").eq(1).children("a").addClass("active");
						$(".tab_content").children("div").eq(1).show().siblings().hide();
					} else if (usertype == "2"){
						$(".login_tabs").children("li").eq(1).children("a").addClass("active");
						$(".tab_content").children("div").eq(2).show().siblings().hide();
					}
				}
				
				$(".login_tabs li a").click(function() {
					$(".login_tabs").children("li").children("a").removeClass("active");
					$(this).addClass("active");
					var index = $(".login_tabs li a").index(this);
					$(".tab_content>div").eq(index).show().siblings().hide();
				});
				
				$(".login_tabs1").children("li").children("a").removeClass("active");
				
				var usertype = "0";
				if (usertype && usertype != "") {
					if (usertype == "0") {
						$(".login_tabs1").children("li").eq(0).children("a").addClass("active");
						$(".tab_content1").children("div").eq(0).show().siblings().hide();
					} else if (usertype == "1"){
						$(".login_tabs1").children("li").eq(1).children("a").addClass("active");
						$(".tab_content1").children("div").eq(1).show().siblings().hide();
					} 
				}
				
				$(".login_tabs1 li a").click(function() {
					$(".login_tabs1").children("li").children("a").removeClass("active");
					$(this).addClass("active");
					var index = $(".login_tabs1 li a").index(this);
					$(".tab_content1>div").eq(index).show().siblings().hide();
				});
				
				
			});
			
			function showonclick(){
				alert("该功能暂未开放！");
			}
		</script>
	</head>
	<body>
		<div class="buss_area">
			<div class="personalmenu">
				<jsp:include page="/WEB-INF/jsp/driver/personalMenu.jsp">
					<jsp:param name="leftmenu" value="person2"/>
				</jsp:include>
			</div>
			<div id="workarea" class="workarea">
				<div class="title_area">
					<!-- <div class="title">我的机动车 
					</div>
					<table width="100%" border="0" cellpadding="5" cellspacing="2" class="table_main">
						<tr>
							<th width='20'></th>
							<th align="center">号牌号码</th>
							<th align="center">车辆类型</th>
							<th align="center">检验有效期止</th>
							<th align="center">强制报废期止</th>
							<th align="center">电子监控</th>
							<th align="center">机动车状态</th>
							<th align="center">是否本人</th>
							<th align="center">是否挂靠</th>
						</tr>
						<tr>
							<td align="right"></td>
							<td align="left"  colspan="8">还没有绑定机动车.<a href="#" onclick="showonclick();">添加机动车</a></td>
						</tr>
					</table>
					<div class="title">
					</div>
					<div class="login_area">
						<div class="login_block">
						<ul class="login_tabs1">
							<li>
								<a class=""><i class="fa fa-truck"></i>&nbsp;待处理电子监控</a>
							</li>
							<li>
								<a class=""><i class="fa fa-male"></i>&nbsp;告知与提示信息</a>
							</li>
						</ul>
						<div class="tab_content1">
								<div class="">
									<form id="form4" class="login_form" action="">
										<input type="hidden" name="usertype" value="0" />
										<table class="table_main">
											<tr>
												<th width='20'></th>
												<th align="center">号牌号码</th>
												<th align="center">违法时间</th>
												<th align="center">违法时间</th>
												<th align="center">违法地点</th>
												<th align="center">违法行为</th>
											</tr>
											<tr>
												<td align="right"></td>
												<td align="left"  colspan="5">无未处理的电子监控记录.<a href="#" onclick="showonclick();">查看历史违法记录</a></td>
											</tr>
										</table>
									</form>
								</div>
								<div class="" >
									<form id="form5" class="login_form" action="userLogin.action">
										<input type="hidden" name="usertype" value="2" />
										<table class="table_main">
											<tr>
												<td align="right"></td>
												<td align="left"  colspan="6">无待阅告知与提示信息.</td>
											</tr>
										</table>
									</form>
								</div>
							</div>
						</div>
					</div> -->
					<!-- <div class="title">我的驾驶证
					</div>
					<table width="100%" border="0" cellpadding="5" cellspacing="2" class="table_main">
						<tr>
							<th width='20'></th>
							<th align="center">驾驶证号码</th>
							<th align="center">审验有效期止</th>
							<th align="center">驾驶证有效期止</th>
							<th align="center">下一清分日期</th>
							<th align="center">累积记分</th>
							<th align="center">驾驶证状态</th>
							<th align="center">是否挂靠</th>
							<th align="center">操作</th>
						</tr>
						<tr>
							<td align="right"></td>
							<td align="center">220322198605096833</td>
							<td align="center">2018-12-27</td>
							<td align="center">2018-12-27</td>
							<td align="center">2016-12-27</td>
							<td align="center">3</td>
							<td align="center">正常</td>
							<td align="center">未挂靠</td>
							<td align="center"><a href="">记分详情</a></td>
						</tr>
					</table> -->
					<div class="title">我的营运资格证
					</div>
					<table width="100%" border="0" cellpadding="5" cellspacing="2" class="table_main">
						<tr>
							<th width='20'></th>
							<th align="center">营运证编号</th>
							<th align="center">发证日期</th>
							<th align="center">有效截止时间</th>
							<th align="center">发证机构</th>
							<th align="center">状态</th>
						</tr>
						<c:choose>
							<c:when test="${not empty drvPermitcert}">
								<tr>
									<td align="right"></td>
									<td align="center">${drvPermitcert.pcertno}</td>
									<td align="center">
										${drvPermitcert.senddate}
									</td>
									<td align="center">
										${drvPermitcert.enddate}
									</td>
									<td align="center">${drvPermitcert.instid}</td>
									<td align="center">
										<c:if test="${drvPermitcert.status == 1 }">正常</c:if>
										<c:if test="${drvPermitcert.status == 2 }">吊销</c:if>
										<c:if test="${drvPermitcert.status == 3 }">作废</c:if>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td align="right"></td>
									<td align="left" colspan="5">无营运资格证信息.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
					<div class="title">我的车辆运输证
					</div>
					<table width="100%" border="0" cellpadding="5" cellspacing="2" class="table_main">
						<tr>
							<th width='20'></th>
							<th align="center">营运证编号</th>
							<th align="center">发证日期</th>
							<th align="center">有效截止时间</th>
							<th align="center">发证机构</th>
							<th align="center">状态</th>
						</tr>
						<c:choose>
							<c:when test="${not empty carPermitcert}">
								<tr>
									<td align="right"></td>
									<td align="center">${carPermitcert.pcertNo}</td>
									<td align="center">${carPermitcert.sendDate}</td>
									<td align="center">${carPermitcert.endDate}</td>
									<td align="center">${carPermitcert.instId}</td>
									<td align="center">
										<c:if test="${carPermitcert.status == 1 }">正常</c:if>
										<c:if test="${carPermitcert.status == 2 }">吊销</c:if>
										<c:if test="${carPermitcert.status == 3 }">作废</c:if>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td align="right"></td>
									<td align="left" colspan="5">无车辆运输证信息.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
					<div class="title">我的备案信息
					</div>
					<table width="100%" border="0" cellpadding="5" cellspacing="2" class="table_main">
						<tr>
							<th width='20'></th>
							<th align="center">姓名</th>
							<th align="center">身份证号</th>
							<th align="center">驾驶证号</th>
							<th align="center">车牌号</th>
							<th align="center">平台名称</th>
							<th align="center">合同内容</th>
						</tr>
						<c:choose>
							<c:when test="${not empty drvRecord}">
								<tr>
									<td align="right"></td>
									<td align="center">${drvRecord.username}</td>
									<td align="center">${drvRecord.certno}</td>
									<td align="center">${drvRecord.drivecardno}</td>
									<td align="center">${drvRecord.carnum}</td>
									<td align="center">${drvRecord.platformname}</td>
									<td align="center"><a href="${drvRecord.url}">点击下载</a></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td align="right"></td>
									<td align="left"  colspan="6">还没有备案信息.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
					<!-- <div class="title">
					</div>
					<div class="login_area">
						<div class="login_block">
							<ul class="login_tabs">
								<li>
									<a class=""><i class="fa fa-truck"></i>&nbsp;未缴款违法纪录</a>
								</li>
								<li>
									<a class=""><i class="fa fa-male"></i>&nbsp;未处理强制措施记录</a>
								</li>
								<li>
									<a class=""><i class="fa fa-trash"></i>&nbsp;告知与提示信息</a>
								</li>
							</ul>
							<div class="tab_content">
								<div class="">
									<form id="form1" class="login_form" action="">
										<input type="hidden" name="usertype" value="0" />
										<table class="table_main">
											<tr>
												<th width='20'></th>
												<th align="center">决定书编号</th>
												<th align="center">号牌号码</th>
												<th align="center">违法时间</th>
												<th align="center">违法地点</th>
												<th align="center">违法行为</th>
												<th align="center">处理机关</th>
												<th align="center">交款标记</th>
											</tr>
											<tr>
												<td align="right"></td>
												<td align="left"  colspan="7">无未处理违法记录.<a href="#" onclick="showonclick();">查看历史违法记录</a></td>
											</tr>
										</table>
									</form>
								</div>
								<div class="" >
									<form id="form2" class="login_form" action="userLogin.action">
										<input type="hidden" name="usertype" value="1" />
										<table class="table_main">
											<td align="left"  colspan="6">系统繁忙.</td>
										</table>
									</form>
								</div>
								<div class="" >
									<form id="form3" class="login_form" action="userLogin.action">
										<input type="hidden" name="usertype" value="2" />
										<table class="table_main">
											<tr>
												<th width='20'></th>
												<th align="center">凭证编号</th>
												<th align="center">号牌号码</th>
												<th align="center">违法时间</th>
												<th align="center">违法地点</th>
												<th align="center">违法行为</th>
												<th align="center">发现机关</th>
											</tr>
											<tr>
												<td align="right"></td>
												<td align="left"  colspan="6">无未处理强制措施记录.<a href="#" onclick="showonclick();">查看历史违法记录</a></td>
											</tr>
										</table>
									</form>
								</div>
							</div>
						</div>
					</div> -->
				</div>
			</div>
		</div>
	</body>
</html>