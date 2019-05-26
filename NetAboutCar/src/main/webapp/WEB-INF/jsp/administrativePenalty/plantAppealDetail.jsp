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

//驾驶员身份验证（修改驾驶员申请表验证状态为1）
function validateDrv(){
	var applyid = $('#applyid').val();
	$.ajax({
		type: "POST",
		url: '<%=basePath %>pilotApply/validateDrv.action',
    	data: {applyid:applyid},
		dataType:'json',
		success: function(data){
			$("#checkresult").html("已提交认证");
		}
	});
}
//处理身份审核结果（通过、不通过）
function sendValidate(status){
	$("#status").val(status);
	var description = $("#description").val();
	if(status == 1 && description == ""){
		$("#description").tips({
			side:3,
            msg:'请填写审核意见！',
            bg:'#AE81FF',
            time:2
        });
		$("#description").focus();
	}else{
		if(description == ""){
			$("#description").val("身份验证已通过");
		}else{
			if(status == 1){
				$("#description").val("身份验证审核不通过，原因："+description);
			}
		}
		$("#form1").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
}
//处理窗口审核结果（通过、不通过）
function windowValidate(status){
	$("#status").val(status);
	var description = $("#description").val();
	if($("#archivenum").val()==""){
		$("#archivenum").tips({
			side:3,
            msg:'请输入档案编号',
            bg:'#AE81FF',
            time:2
        });
		$("#archivenum").focus();
		return false;
	}
	if($("#archivename").val()==""){
		$("#archivename").tips({
			side:3,
            msg:'请输入档案名称',
            bg:'#AE81FF',
            time:2
        });
		$("#archivename").focus();
		return false;
	}
	if(status == 5 && description == ""){
		$("#description").tips({
			side:3,
            msg:'请填写审核意见！',
            bg:'#AE81FF',
            time:2
        });
		$("#description").focus();
	}else{
		if(description == ""){
			$("#description").val("窗口办理验证已通过");
		}else{
			if(status == 5){
				$("#description").val("窗口办理验证不通过，原因："+description);
			}
		}
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
}
</script>

</head>
<body>
<div class="container">
<form action="<%=basePath %>pilotApply/authentication.action" name="form1" id="form1" method="post" >
		<div id="zhongxin">
		<table border="1" class="table">
		    <tr>
		      <th colspan="4">基本信息</th>
		    </tr>
			<tr>
				<th style="text-align: right;width: 100px;">案件编号：</th>
				<td style="width:200px;">${plantcaseinfo.caseId }</td>
			    <th style="text-align: right;width: 100px;">平台名称：</th>
				<td style="width:200px;">
					${plantcaseinfo.plateName }
				</td>
			</tr>
			<tr>
				<th style="text-align: right;">案件来源：</th>
				<td>${plantcaseinfo.source }</td>
			    <th style="text-align: right;">行政区划：</th>
				<td id="nationTd">${plantcaseinfo.areaCode }</td>
			</tr>
			<tr>
				<th style="text-align: right;">组织机构：</th>
				<td>
					${plantcaseinfo.instId }
				</td>
			    <th style="text-align: right;">案件承办人：</th>
				<td>${plantcaseinfo.caseUserId }</td>
			</tr>
			<tr>
				<th style="text-align: right;">案发时间：</th>
				<td >
					${plantcaseinfo.caseTime }
				</td>
			    <th style="text-align: right;">最后受理时间：</th>
				<td >
					${plantcaseinfo.caseTime }
				</td>
			</tr>
			<tr height="30px">
				<th style="text-align: right;">案件事由：</th>
				<td colspan="3">${plantcaseinfo.caseReason }</td>
			</tr>
			
			<%-- <tr>
				<th colspan="4">调查取证</th>
			</tr>
			<tr>
				<th style="text-align: right;">取证下载：</th>
				<td colspan="3"><input value='下载'></td>
			</tr>
			<tr>
				<th style="text-align: right;">取证意见：</th>
				<td colspan="3">${map.evidenceView }</td>
			</tr> --%>
			
			<tr>
				<th colspan="4">处罚决定</th>
			</tr>
			<tr>
				<th style="text-align: right;">处罚类型：</th>
				
			<c:choose>
			<c:when test="${plantcaseinfo.punishType=='0001'}">
				<td colspan="3">
					口头警告
				</td>
			</c:when>
			<c:when test="${plantcaseinfo.punishType=='0002'}">
				<td colspan="3">
					两百元一下罚款
				</td>
			</c:when>
			<c:when test="${plantcaseinfo.punishType=='0003'}">
				<td colspan="3">
					暂扣或吊销驾驶证
				</td>
			</c:when>
			<c:otherwise></c:otherwise>
			</c:choose>
				
			</tr>
			<tr>
				<th style="text-align: right;">处罚内容：</th>
				<td colspan="3">${plantcaseinfo.punishContent }</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
				</td>
			</tr>
			<%--  <tr style="display:none;">
				<td>
					<input type="hidden" id="applyid" name="applyid" value="${drv.applyid}" />
					<input type="hidden" id="certno" name="certno" value="${drv.certno}" />
					<input type="hidden" id="status" name="status" value="" />
				</td> 
			</tr> --%>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
</body>
</html>