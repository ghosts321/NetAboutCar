<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
table{
	table-layout:fixed;
	empty-cells:show;
	border-collapse: collapse;
	margin:0 auto;
}
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
padding:5px 0.5em 0;
}
.table tr.alter{
background-color:#f5fafe;
}
img{
margin-bottom:0.5em;
width: 100px;
height: 100px;
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
<div class="container">
<form action="approve.action" name="carInfoForm" id="carInfoForm" method="post" >
		<div id="zhongxin">
		<br/>
			<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">基本信息</span>
            	<div align="right">
	  <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
			<c:forEach items="${list}" var="appeal">
			<tr>
				<th style="text-align: right;width: 20%;">姓名：</th>
				<td style="width:30%;">${appeal.drvname}</td>
			    <th style="text-align: right;width: 20%;" >身份证号：</th>
				<td style="width:30%;">${appeal.certno}</td>
			</tr>
			<tr>
				<th style="text-align: right;width: 20%;" >所属平台：</th>
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
				</td>
			    <th style="text-align: right;width: 20%;" >车牌号：</th>
				<td style="width:30%;">${appeal.carnum}</td>
				</td>
			</tr>
			<tr name="moreInfo">
				<th style="text-align: right;" >案由：</th>
				<td style="width:30%;">${appeal.eventDetail}</td>
			</tr>
			</c:forEach>
		</table>
		</div>
		</div>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">违反指标</span>
            	<div align="right">
	  <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
			
			<tr >
				<th style="text-align: center;width: 20%;">指标分类</th>
				<th style="text-align: center;width: 20%;" colspan="3">具体指标</th>
			</tr>
			<c:forEach items="${listType}" var="type">
			<tr><th style="text-align: center;width: 20%;" id="name">${type.name}</th>
				<td>指标名称</td>
				
				<td>得分</td>
				
				<td>操作</td>
				
				</tr>
				<tr>
				<td></td>
				<td>${type.indicText}</td>
				<td>${type.score}</td>
				<td><a href="">申诉</a></td>
				</tr>
			</c:forEach>
		</table>
		</div>
		</div>
		</div>
		</div>
		</form>
		</div>
		</div>
		</div>
	<script language="javascript" src="jquery-1.4.2.min.js"></script>
</body>
</html>