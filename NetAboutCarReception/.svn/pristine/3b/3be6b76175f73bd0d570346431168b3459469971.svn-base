<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery-ui-1.10.4.custom.min.js"></script>
		<title>消息通知</title>
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
			function showonclick(){
				alert("该功能暂未开放！");
			}
		</script>
	</head>
	<body>
		<div class="buss_area">
			<div class="personalmenu">
				<jsp:include page="/WEB-INF/jsp/driver/personalMenu.jsp">
					<jsp:param name="leftmenu" value="person3"/>
				</jsp:include>
			</div>
			<div id="workarea" class="workarea">
				<div class="title_area">
					<div class="title">待阅告知与提示信息
						<div class="help">
							<a class="policy" href="javascript:void(0);" onclick="funcGo(this,'${basePath}driver/readMsg.action');">全部标记为已读</a>
						</div>
					</div>
					<div style="overflow:auto;overflow-x:hidden;width:100%;height:550px;">
						<table width="100%" border="0" cellpadding="5" cellspacing="2" class="table_main">
							<c:forEach items="${msgNoticeList}" var="msg" varStatus="vs">  
								<tr>
									<td width="5%" align="center">${vs.index + 1}</td>
									<td align="left">
										<c:if test="${msg.isread == 0 }">
											<span style="color:red;">${msg.msgcontent}</span>
										</c:if>
										<c:if test="${msg.isread == 1 }">
											${msg.msgcontent}
										</c:if>
									</td>
									<td align="center">
									 <fmt:formatDate  value="${msg.createtime}" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<!-- <div class="title">
					</div> -->
				</div>
			</div>
		</div>
	</body>
</html>