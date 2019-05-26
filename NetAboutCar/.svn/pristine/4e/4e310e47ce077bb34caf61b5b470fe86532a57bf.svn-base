<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.imgStyle{
	margin-bottom:0.5em;
	width: 220px;
	height: 150px;
 }
textarea{
 margin-bottom: 4px;
}
</style>
<script type="text/javascript">


</script>

</head>
<body>
<div class="container">
<form action="<%=basePath %>pilotApply/authentication.action" name="form1" id="form1" method="post" >
		<div id="zhongxin">
		<table border="1" class="table">
		    <tr>
		      <th colspan="5">修改历史</th>
		    </tr>
			
			<tr>
				<td style="text-align: center; width:130px">修改时间</td><td style="text-align:center; width:130px">修改人</td><td style="text-align:center;width:130px; ">修改字段</td>
				 <td style="text-align: center;width:130px">修改内容（前）</td> <td style="text-align:center;width:130px">修改内容（后）</td>
			</tr>
			<c:forEach items="${DrvPlantManageHisInfo}" var="drvPlantManageHisInfo">
			<tr>
			 <td style="text-align:center">${drvPlantManageHisInfo.updatetime}</td>
			 <td style="text-align:center">${drvPlantManageHisInfo.upduserid }</td>
			 <td style="text-align:center">${drvPlantManageHisInfo.alterzd}</td>
			 <td style="text-align:center">
			 <c:if test="${drvPlantManageHisInfo.alterzd=='案件来源'}">
			 <c:choose>
			 <c:when test="${drvPlantManageHisInfo.altercontentb=='01'}">稽查执法查扣违章</c:when>
			 <c:when test="${drvPlantManageHisInfo.altercontentb=='02'}">信访投诉违章 </c:when>
			 </c:choose>
			 </c:if>
			 <c:if test="${drvPlantManageHisInfo.alterzd=='案件状态'}">
			 <c:choose>
			 <c:when test="${drvPlantManageHisInfo.altercontentb=='00'}">已结案</c:when>
			 <c:when test="${drvPlantManageHisInfo.altercontentb=='01'}">未交罚款</c:when>
			 
			 </c:choose>
			 </c:if>
			 <c:if test="${drvPlantManageHisInfo.alterzd!='案件状态' && drvPlantManageHisInfo.alterzd!='案件来源'}">
			     ${drvPlantManageHisInfo.altercontentb}
			 </c:if>
			 </td>
			 <td style="text-align:center"><c:if test="${drvPlantManageHisInfo.alterzd=='案件来源'}">
			 <c:choose>
			 <c:when test="${drvPlantManageHisInfo.altercontenta=='01'}">稽查执法查扣违章</c:when>
			 <c:when test="${drvPlantManageHisInfo.altercontenta=='02'}">信访投诉违章 </c:when>
			 </c:choose>
			 </c:if>
			 <c:if test="${drvPlantManageHisInfo.alterzd=='案件状态'}">
			 <c:choose>
			 <c:when test="${drvPlantManageHisInfo.altercontenta=='00'}">已结案</c:when>
			 <c:when test="${drvPlantManageHisInfo.altercontenta=='01'}">未交罚款</c:when>
			 
			 </c:choose>
			 </c:if>
			 <c:if test="${drvPlantManageHisInfo.alterzd !='案件状态' && drvPlantManageHisInfo.alterzd!='案件来源'}">
			     ${drvPlantManageHisInfo.altercontenta}
			 </c:if></td>
			</tr>
			</c:forEach>
		
	
			<tr>
				<td colspan="5" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
				</td>
			</tr>
			
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
</body>
</html>