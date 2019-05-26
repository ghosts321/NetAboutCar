<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

$(function(){ 
  	//日期框
	$('.date-picker').datepicker();
	 
})
//保存校验
function save(){
	
	$("#addForm").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}

</script>
<style>
select,textarea{
	margin-bottom: 8px;
}
textarea{
  width: 220px;
}
</style>
</head>
<body>
<div class="container">
<form  action="update.action" name="addForm" id="addForm" method="post" >
		<div id="zhongxin" align="center" style="padding-top:30px">
		<table>
			<!-- <tr>
			    <td style="text-align: right;">办理地点：</td>
				<td><input type="text" name="address" id="address" value="" title="办理地点"/></td>
			</tr> -->
			<input type="hidden" name="bespeakId" value="${orderInfo.bespeakId}"> 
			<input type="hidden" name="address" value="${orderInfo.address}"> 
			<input type="hidden" name="year" value="${orderInfo.year}"> 
			<input type="hidden" name="month" value="${orderInfo.month}"> 
			<input type="hidden" name="bespeakDate" value="${orderInfo.bespeakDate}"> 
			<input type="hidden" name="createUser" value="${orderInfo.createUser}"> 			
			<input type="hidden" name="createTime" value="${orderInfo.createTime}"> 			
			
			<tr>
  
			
			    <td style="text-align: right;">上午人数：</td>
				<td><input type="text" name="morningCount" id="morningCount" value="${orderInfo.morningCount}" title="上午人数"/></td>
			</tr>
			<tr>
			    <td style="text-align: right;">下午人数：</td>
				<td><input type="text" name="afternoonCount" id="afternoonCount" value="${orderInfo.afternoonCount}" title="下午人数"/></td>
			</tr>
			 
			<tr>
				<td colspan="2" style="text-align: center; padding-top: 20px;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>&nbsp;&nbsp;&nbsp;
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
</body>
</html>