<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${basePath}css/userReg.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}css/calendar.css">
		<link rel="stylesheet" type="text/css" href="${basePath}css/jquery.selectlist.css"/>
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidator_min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidatorRegex.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery-ui-1.10.4.custom.min.js"></script>
		<script type="text/javascript" src="${basePath}js/calendar.js"></script> 
		<script type="text/javascript" src="${basePath}js/jquery.selectlist.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery.form.js"></script>
		<title>处分详情</title>
		<style type="text/css">
			.table{
			border:1px solid #cad9ea;
			color:#666;
			margin-bottom: 10px;
			margin-top: 10px;
			}
			.table th {
			background-repeat:repeat-x;
			height:30px;
			}
			.table td,.table th{
			border:1px solid #cad9ea;
			padding:0 0.5em 0;
			}
			.table tr.alter{
			background-color:#f5fafe;
			}
			.imgStyle{
			margin-bottom:0.5em;
			width: 120px;
			height: 80px;
			}
		</style>
		<script type="text/javascript">
		
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
					<div class="title">驾驶员处分详情
					</div>
				</div>
				<div>
					<form action="${basePath}driver/addChangeApply.action" method="post" name="form1" id="form1" enctype="multipart/form-data">
						<table class="table" id="basicInfo" width="100%" border="1" cellpadding="5" cellspacing="2">
							<tr height="40">
								<td colspan="4" align="left">
									基本信息：
								</td>
							</tr>
							<c:forEach items="${list}" var="appeal">
							<tr height="40">
								<th width="20%" align="right">姓名：</th>
								<td style="width:30%;">${appeal.drv_name}</td>
							    <th width="20%" align="right" >身份证号：</th>
								<td style="width:30%;">${appeal.certno}</td>
							</tr>
							
							<tr height="40">
							<th width="20%" align="right" >所属平台：</th>
							<td style="width:30%;"><c:choose>
					    		<c:when test="${appeal.belongs=='1'}">
								 自有车辆
					   			 </c:when>  
					    		<c:when test="${appeal.belongs=='2'}"> 
					       		 平台车辆
					    		</c:when>
					    		<c:when test="${appeal.belongs=='3'}"> 
					        	 自有车辆
					    		</c:when>
					    		</c:choose>
					    	</td>
			    	<th width="20%" align="right" >车牌号：</th>
					<td style="width:30%;">${appeal.carnum}</td>
							</tr>
							<tr height="40">
								<th width="20%" align="right" >案由：</th>
						<td style="width:30%;" colspan="3">${appeal.eventDetail}</td>
							</tr>
							</c:forEach>
							<tr height="40">
							<td colspan="4" align="left">
								违反指标:</td>
							</tr>
							<tr height="40">
							<th width="20%" align="center">指标分类</th>
							<th width="20%" align="center" colspan="3">具体指标</th>
							</tr>
							<c:forEach items="${listType}" var="type">
							<tr height="40">
							<td width="20%" align="center">${type.name}</td>
								<td width="20%" align="center">指标名称</td>
								<td width="20%" align="center">得分</td>
								<td width="20%" align="center">操作</td>
							</tr>
							<tr height="40">
								<td align="center"></td>
								<td  align="center">${type.indicText}</td>
								<td  align="center">${type.score}</td>
								<td  align="center">
								<a href="javascript:void(0);" onclick="gotoBuss('${basePath}driver/toAppeal.action?indic_code=${type.indic_code}&indicText=${type.indicText}');">申诉</a>
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