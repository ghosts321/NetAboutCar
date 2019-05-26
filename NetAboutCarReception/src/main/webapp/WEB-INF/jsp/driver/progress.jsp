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
		</style>
		<script type="text/javascript">
			function showProgress(){
				
			}
		</script>
	</head>
	<body>
		<div class="buss_area">
			<div class="personalmenu">
				<jsp:include page="/WEB-INF/jsp/driver/personalMenu.jsp">
					<jsp:param name="leftmenu" value="driver"/>
				</jsp:include>
			</div>
			<div id="workarea" class="workarea">
				<div class="title_area">
					<div class="title">我的申请记录
					</div>
					<table width="100%" border="0" cellpadding="5" cellspacing="2" class="table_main">
						<tr>
							<th align="center">申请编号</th>
							<th align="center">身份证号</th>
							<th align="center">申请时间</th>
							<th align="center">申请类型</th>
							<th align="center">操作</th>
						</tr>
						<c:forEach items="${permitapplyList}" var="apply" varStatus="vs">  
						<tr>
							<td align="center">${apply.applyid}</td>
							<td align="center">${apply.certno}</td>
							<td align="center">
								<fmt:formatDate  value="${apply.applydate}" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td align="center">
								<c:if test="${apply.applytype == 1 }">申请</c:if>
								<c:if test="${apply.applytype == 2 }">变更</c:if>
								<c:if test="${apply.applytype == 3 }">注销</c:if>
								<c:if test="${apply.applytype == 4 }">换证</c:if>
								<c:if test="${apply.applytype == 5 }">补办</c:if>
							</td>
							<td align="center">
								<a href="#" onclick="funcGo(this,'${basePath}driver/openDetail.action?applyid=${apply.applyid}&applytype=${apply.applytype}')">详情</a>
								|<a href="#" onclick="funcGo(this,'${basePath}driver/drvprogress.action?appstatus=${apply.appstatus}&applytype=${apply.applytype}')">查看进度</a>
							</td>
						</tr>
						</c:forEach>
					</table>
					<div class="title">
					</div>
				</div>
			</div>
		</div>
		
	</body>
</html>