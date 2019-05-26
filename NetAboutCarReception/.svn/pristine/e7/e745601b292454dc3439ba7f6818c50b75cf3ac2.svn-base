<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${basePath}css/userReg.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui-1.10.4.custom.min.css"/>
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<title>平台资质业务</title>
		<style type="text/css">
			.buss_area {
			}
			
			.buss_area .buss_row {
				margin-bottom: 20px;
			}
			
			.buss_area .buss_row .row_title {
				font-size: 16px;
				height: 40px;
				line-height: 40px;
				padding: 0px 10px;
				background: #f5f5f5 none repeat scroll 0 0;
				border-top: 2px solid #ccc;
			}
			
			.buss_area .buss_row .row_title:after {
				content: "."; 
			    display: block;
			    height: 0; 
			    clear: both; 
			    visibility: hidden;
			}
			
			.buss_area .buss_row .row_title span {
				margin: 5px 10px 0px 0px;
				display: inline-block;
				float: left;
			}
			
			.buss_area .buss_row .row_title.blue {
				border-color: #002ec0;
				color: #002ec0; 
			}
			
			.buss_area .buss_row .row_title.green {
				border-color: #0a721d;
				color: #0a721d; 
			}
			
			.buss_area .buss_row .row_title.darkblue {
				border-color: #002e73;
				color: #002e73; 
			}
			
			.buss_area .buss_row .row_ul {
				list-style: outside none none;
			}
			
			.buss_area .buss_row .row_ul:after {
				content: "."; 
			    display: block;
			    height: 0; 
			    clear: both; 
			    visibility: hidden;
			}
			
			.buss_area .buss_row .row_ul li {
				border-bottom: 1px solid #e5e5e5;
				cursor: pointer;
				float: left;
				height: 70px;
				padding-top: 10px;
				position: relative;
				width: 30%;
			}
			
			.buss_area .buss_row .row_ul li.non_border {
				border-bottom: medium none;
			}
			
			.buss_area .buss_row .row_ul li .block_img {
				margin: 10px 10px 0px 0px;
				float: left;
			}
			
			.buss_area .buss_row .row_ul li .block_content {
				float: left;
			}
			
			.buss_area .buss_row .row_ul li .block_content .content_title {
				padding-top: 16px;
				line-height: 20px;
				color: #464749;
			}
			
			.buss_area .buss_row .row_ul li .block_content .content_title a {
				color: #464749;
			}
			
			.buss_area .buss_row .row_ul li .block_content .content_info {
				float: left;
				font-size: 12px;
				line-height: 20px;
			}
			
			.buss_area .buss_row .row_ul li .block_content .content_info .deal {
				color: #a2030d;
			}
			
			.buss_area .buss_row .row_ul li .block_content .content_info .deal:hover {
				color: #e85d66;
			}
			
			.buss_area .buss_row .row_ul li .block_content .content_info .opr {
				color: #002ec0;
			}
			
			.buss_area .buss_row .row_ul li .block_content .content_info .opr:hover {
				color: #4772fa;
			}
			
			.buss_area .buss_row .row_ul li .block_content .content_info .poli {
				color: #0a721d;
			}
			
			.buss_area .buss_row .row_ul li .block_content .content_info .poli:hover {
				color: #3f9d51;
			}
			
		</style>
		<script type="text/javascript">
			function gotoBuss(url) {
				if ($("#main")) {
					$("#main").load(url, function() {
						
					});
				}
			}
		</script>
	</head>
	<body>
		<div class="buss_area">
			<div class="personalmenu">
				<jsp:include page="/WEB-INF/jsp/driver/personalMenu.jsp">
					<jsp:param name="leftmenu" value="platForm"/>
				</jsp:include>
			</div>
			<div id="workarea" class="workarea">
				<div class="buss_row">
					<div class="row_title darkblue">
						<span><img src="${basePath}images/bussdeal/plat.png"/></span>平台资质业务
					</div>
					<ul class="row_ul">
						<li>
							<div class="block_img">
								<img src="${basePath}images/bussdeal/apply-darkblue.png"/>
							</div>
							<div class="block_content">
								<div class="content_title">
									<a href="javascript:void(0);" onclick="gotoBuss('${basePath}terrace/openPilotApplyList.action?id=zxsq');">许可申请</a>
								</div>
								<%-- <div class="content_info">
									<a class="deal" href="javascript:void(0);" onclick="gotoBuss('${basePath}terrace/openPilotApplyList.action?id=zxsq');">在线办理</a>
									<a class="opr" href="${basePath}driver/toPilotApply.action?id=xksq" target="_blank">操作指南</a>
									<a class="poli" href="${basePath}driver/toPilotApply.action?id=xksq" target="_blank">相关政策</a>
								</div> --%>
							</div>
						</li>
						<li>
							<div class="block_img">
								<img src="${basePath}images/bussdeal/update-darkblue.png"/>
							</div>
							<div class="block_content">
								<div class="content_title">
									<a href="javascript:void(0);" onclick="gotoBuss('${basePath}terrace/openChangeApplyList.action?id=zxsq');">变更申请</a>
								</div>
								<%-- <div class="content_info">
									<a class="deal" href="javascript:void(0);" onclick="gotoBuss('${basePath}terrace/openChangeApplyList.action?id=zxsq');">在线办理</a>
									<a class="opr" href="${basePath}driver/toPilotApply.action?id=xksq" target="_blank">操作指南</a>
									<a class="poli" href="${basePath}driver/toPilotApply.action?id=xksq" target="_blank">相关政策</a>
								</div> --%>
							</div>
						</li>
						<li>
							<div class="block_img">
								<img src="${basePath}images/bussdeal/query-darkblue.png"/>
							</div>
							<div class="block_content">
								<div class="content_title">
									<a href="javascript:void(0);" onclick="gotoBuss('${basePath}terrace/openProgressList.action');">进度查询</a>
								</div>
								<%-- <div class="content_info">
									<a class="deal" href="javascript:void(0);" onclick="gotoBuss('${basePath}terrace/openProgressList.action');">在线办理</a>
									<a class="opr"  href="javascript:void(0);" >操作指南</a>
									<a class="poli"  href="javascript:void(0);" >相关政策</a>
								</div> --%>
							</div>
						</li>
						<li class="non_border">
							<div class="block_img">
								<img src="${basePath}images/bussdeal/cancel-darkblue.png"/>
							</div>
							<div class="block_content">
								<div class="content_title">
									<a href="javascript:void(0);" onclick="gotoBuss('${basePath}terrace/openCancelApplyList.action?id=zxsq');">注销申请</a>
								</div>
								<%-- <div class="content_info">
									<a class="deal" href="javascript:void(0);" onclick="gotoBuss('${basePath}terrace/openCancelApplyList.action?id=zxsq');">在线办理</a>
									<a class="opr" href="${basePath}driver/toPilotApply.action?id=xksq" target="_blank">操作指南</a>
									<a class="poli" href="${basePath}driver/toPilotApply.action?id=xksq" target="_blank">相关政策</a>
								</div> --%>
							</div>
						</li>
						<li class="non_border">
							<div class="block_img">
								<img src="${basePath}images/bussdeal/reapply-darkblue.png"/>
							</div>
							<div class="block_content">
								<div class="content_title">
									<a href="javascript:void(0);" onclick="gotoBuss('${basePath}terrace/openCompensateApplyList.action?id=zxsq');">补办申请</a>
								</div>
								<%-- <div class="content_info">
									<a class="deal" href="javascript:void(0);" onclick="gotoBuss('${basePath}terrace/openCompensateApplyList.action?id=zxsq');">在线办理</a>
									<a class="opr" href="${basePath}driver/toPilotApply.action?id=xksq" target="_blank">操作指南</a>
									<a class="poli" href="${basePath}driver/toPilotApply.action?id=xksq" target="_blank">相关政策</a>
								</div> --%>
							</div>
						</li>
						<li>
							<div class="block_img">
								<img src="${basePath}images/bussdeal/reapply-darkblue.png"/>
							</div>
							<div class="block_content">
								<div class="content_title">
									<a href="javascript:void(0);" onclick="gotoBuss('${basePath}vehicle/openPilotApply.action?id=bgsq');">车辆申请</a>
								</div>
								<%-- <div class="content_info">
									<a class="deal" href="javascript:void(0);" onclick="gotoBuss('${basePath}vehicle/openPilotApply.action?id=bgsq');">在线办理</a>
									<%-- <a class="opr" onclick="gotoHelp('${basePath}help/toHelpContent3_2_1.action');">操作指南</a>
									<a class="poli" onclick="gotoHelp('${basePath}help/toHelpContent3_2_1.action');">相关政策</a> 
								</div>   --%>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>