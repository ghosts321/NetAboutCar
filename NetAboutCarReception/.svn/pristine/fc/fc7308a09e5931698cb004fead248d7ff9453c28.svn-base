<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link rel="stylesheet" href="${basePath}css/userReg.css" />
	<link rel="stylesheet" type="text/css" href="${basePath}css/calendar.css">
	<link rel="stylesheet" type="text/css" href="${basePath}css/jquery.selectlist.css"/>
	<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${basePath}js/formValidator_min.js"></script>
	<script type="text/javascript" src="${basePath}js/formValidatorRegex.js"></script>
	<script type="text/javascript" src="${basePath}js/jquery-ui-1.10.4.custom.min.js"></script>
	<script type="text/javascript" src="${basePath}js/calendar.js"></script> 
	<script type="text/javascript" src="${basePath}js/jquery.selectlist.js"></script>
	<title>变更申请</title>
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
	</style>
</head>
<body>
	<div class="buss_area">
		<div class="personalmenu">
			<jsp:include page="/WEB-INF/jsp/driver/personalMenu.jsp">
				<jsp:param name="leftmenu" value="platForm"/>
			</jsp:include>
		</div>
		<div id="workarea" class="workarea">
			<div class="title_area">
				<div class="title">网约车资质业务变更申请
				</div>
			</div>
			<div>
				<form action="addPilotApply.action" method="post" name="form1" id="form1">
					<table class="table_main">
					<tr>
						<th width='30'>序号</th>
						<th align="center">企业名称</th>
						<th align="center">社会信用代码号</th>
						<th align="center">负责人姓名</th>
						<!-- <th align="center">法人身份证</th>
						<th align="center">手机号</th> -->
						<th align="center">申请日期</th>
						<th align="center">审核状态</th>
						<th align="center">操作</th>
					</tr>
					<c:forEach var="permitapp" items="${permitapplyList}" varStatus="status">
					<tr>
						<td style="text-align: center;">${status.index+1}</td>
						<td style="text-align: center;">${permitapp.applyCompany}</td>
						<td style="text-align: center;">${permitapp.creditCode}</td>
						<td style="text-align: center;">${permitapp.dutyName}</td>
						<td style="text-align: center;">${permitapp.applyDate}
						<%-- <fmt:formatDate value="${permitapp.applyDate}" type="both" pattern="yyyy-MM-dd" /> --%>
						</td>
						<td style="text-align: center;">
						<c:if test="${permitapp.appStatus=='-1'}">不通过</c:if>
						<c:if test="${permitapp.appStatus=='0'}">不通过</c:if>
						<c:if test="${permitapp.appStatus=='1'}">通过</c:if>
						<c:if test="${permitapp.appStatus=='2'}">已发证 </c:if>
						<c:if test="${permitapp.appStatus=='3'}">待注销</c:if>
						</td>
						<td style="text-align: center;">
						<c:if test="${permitapp.appStatus == '2'}">
							<a href="#" onclick="gotoBuss('${basePath}terrace/openChangeApply.action?applyId=${permitapp.applyId}'<%-- +'&creditCode='+${permitapp.creditCode} --%>);">变更</a>
						</c:if>
						</td>
					</tr>
					</c:forEach>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>