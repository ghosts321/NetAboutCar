<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery-ui-1.10.4.custom.min.js"></script>
		<title></title>
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
					<div class="title">处罚信息
					</div>
					<table width="100%" border="0" cellpadding="5" cellspacing="2" class="table_main">
						<tr>
							<th align="center">案件编号</th>
							<th align="center">车牌号</th>
							<th align="center">组织机构</th>
							<th align="center">案件来源</th>
							<th align="center">案发时间</th>
							<th align="center">最后受理时间</th>
							<th align="center">操作</th>
						</tr>
						<%-- <c:forEach items="${list}" var="complain" varStatus="vs">
						<tr>
							<td align="center">${complain.complainId}</td>
							<td align="center">${complain.carNumber}</td>
							<td align="center">${complain.rideTime}</td>
							<td align="center">${complain.carLicence}</td>
							<td align="center">${complain.driverLicence}</td>
							<td align="center">${complain.carCompany}</td>
							<td align="center">${complain.complainName}</td>
							<td align="center">${complain.phoneNumber}</td>
							<td align="center">${complain.complainReason}</td>
							 
						</tr>
						</c:forEach> --%>
						<tr>
							<td align="center">A190C8008</td>
							<td align="center">京AF3952</td>
							<td align="center">河南省洛阳市新安县</td>
							<td align="center">稽查执法查扣违章</td>
							<td align="center">2017-2-18 23:23:10</td>
							<td align="center">2017-2-20 23:23:10</td>
							<td align="center"><a href="#" onclick="funcGo(this,'${basePath}driver/openAppeal.action?applyid=')">申诉</a></td>
						</tr>
						<tr>
							<td align="center">A190C8008</td>
							<td align="center">京AF3952</td>
							<td align="center">河南省洛阳市新安县</td>
							<td align="center">稽查执法查扣违章</td>
							<td align="center">2017-2-18 23:23:10</td>
							<td align="center">2017-2-20 23:23:10</td>
							<td align="center"><a href="#" onclick="funcGo(this,'${basePath}driver/openAppeal.action?applyid=')">申诉</a></td>
						</tr>
						<tr>
							<td align="center">A190C8008</td>
							<td align="center">京AF3952</td>
							<td align="center">河南省洛阳市新安县</td>
							<td align="center">稽查执法查扣违章</td>
							<td align="center">2017-2-18 23:23:10</td>
							<td align="center">2017-2-20 23:23:10</td>
							<td align="center"><a href="#" onclick="funcGo(this,'${basePath}driver/openAppeal.action?applyid=')">申诉</a></td>
						</tr>
						<tr>
							<td align="center">A190C8008</td>
							<td align="center">京AF3952</td>
							<td align="center">河南省洛阳市新安县</td>
							<td align="center">稽查执法查扣违章</td>
							<td align="center">2017-2-18 23:23:10</td>
							<td align="center">2017-2-20 23:23:10</td>
							<td align="center"><a href="#" onclick="funcGo(this,'${basePath}driver/openAppeal.action?applyid=')">申诉</a></td>
						</tr>
					</table>
					<div class="title">
					</div>
				</div>
			</div>
		</div>
	</body>
</html>