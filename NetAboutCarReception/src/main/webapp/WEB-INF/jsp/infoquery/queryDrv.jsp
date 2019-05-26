<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<%-- <script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery-ui-1.10.4.custom.min.js"></script> --%>
		<title>查询结果</title>
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
			
		</script>
	</head>
	<body>
		<div class="buss_area">
			<%-- <div class="personalmenu">
				<jsp:include page="/WEB-INF/jsp/driver/personalMenu.jsp">
					<jsp:param name="leftmenu" value="driver"/>
				</jsp:include>
			</div> --%>
			<div id="workarea" class="workarea">
				<div class="title_area">
					<div class="title">驾驶员运营许可查询结果
					</div>
					<table width="100%" border="0" cellpadding="5" cellspacing="2" class="table_main">
						<tr>
						<th align="center">姓名</th>
						<th align="center">准驾车型</th>
							
							<th align="center">证书代码</th>
							<th align="center">证书编号</th>
							<th align="center">申请编号</th>
							<th align="center">发证日期</th>
							<th align="center">有效期</th>
							<th align="center">发证机构</th>
						</tr>
						<tr>
							<td align="center">${drvuserinfo.username}</td>
							<td align="center">${carType}</td>
							
							<td align="center">${drvPermitcert.pcertid}</td>
							<td align="center">${drvPermitcert.pcertno}</td>
							<td align="center">${drvPermitcert.applyid}</td>
							<td align="center">${drvPermitcert.senddate}</td>
							<td align="center">${drvPermitcert.enddate}</td>
							<td align="center">${instname}</td>
							
						</tr>
					</table>
					<div class="title">
					</div>
				</div>
			</div>
		</div>
	</body>
</html>