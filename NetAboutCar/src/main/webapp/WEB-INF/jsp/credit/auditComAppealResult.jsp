<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html ng-app="wyc">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
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
	width: 220px;
	height: 150px;
 }
textarea{
 margin-bottom: 4px;
}
</style>
<script type="text/javascript">
angular.module('wyc',[]).controller('WycController',function($http,$scope){
	$scope.appeal_result='${cad.appeal_result}';	
});


$(function() {
	$("#check_all").click(function() {
		var totalScore = 0;
	    if (this.checked) {
	        $("input[name='indics']").each(function() {
	        	this.checked = true;
	        	totalScore += parseInt($(this).attr("score"));
	        });
	    }else{
	        $("input[name='indics']").each(function() {
	            this.checked = false;
	        });
	    }
	    $("#totalScore").html(totalScore);
	});
});

function countScore(obj,score){
	if (obj.checked) {
		var totalScore = parseInt(score)+parseInt($("#totalScore").text());
        $("#totalScore").html(totalScore);
    }else{
    	var totalScore = parseInt($("#totalScore").text()) - parseInt(score);
        $("#totalScore").html(totalScore);
    }
}

//获取文件名
function getFile(obj){
	var file_name = $(obj).val();
	var houzhui=file_name.split(".");
	var last=houzhui[houzhui.length-1];
	var tp ="doc,docx";
	var rs=tp.indexOf(last);
				
	//如果返回的结果大于或等于0，说明包含允许上传的文件类型
	if(rs>=0){
		$("input[name='result']").val(file_name);
	}else{
		alert("您选择的上传文件不是有效的word文件！");
		$("input[name='result']").val("");
	}
}


</script>

</head>
<body ng-controller="WycController">
<div class="container">
	<div id="zhongxin">
		<div style="padding-top:30px;"></div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span style="font-size:15px" class="title">基本信息</span>
                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
					<tr>
						<th style="text-align: right;width: 20%">统一社会信用号：</th>
						<td style="width:30%;">${platform.creditCode}</td>
					    <th style="text-align: right;width: 20%">企业名称：</th>
						<td style="width:30%">${platform.comName}</td>
					</tr>
					<tr>
						<th style="text-align: right;">企业简称：</th>
						<td>${platform.shortName}</td>
					    <th style="text-align: right;">平台名称：</th>
						<td>${platform.platformName}</td>
					</tr>
					<tr>
						<th style="text-align: right;">企业营业执照号：</th>
						<td>${platform.busiliceNo}</td>
					    <th style="text-align: right;">注册地址：</th>
						<td>${platform.regAddress}</td>
					</tr>
				</table>
            </div>
        </div>
        <div style="padding-top:30px;"></div>
        <div class="panel panel-default">
            <div class="panel-body">
            	<span style="font-size:15px;width:100px;" class="title">失信事件信息</span>
				<table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
					<tr>
						<th style="text-align: right;width:20%;">事件概要：</th>
						<td style="width:30%;">${event.event_desc}</td>
					    <th style="text-align: right;width:20%;">事件详情：</th>
						<td style="width:30%;">${event.event_detail}</td>
					</tr>
					<tr>
					    <th style="text-align: right;">内容附件：</th>
						<td>
							<c:choose>
								<c:when test="${null == event.attachment || event.attachment == ''}">无</c:when>
								<c:otherwise><a href="${event.attachment}">点击下载</a></c:otherwise>
							</c:choose>
						</td>
					    <th style="text-align: right;">违规事实：</th>
						<td>${event.ar_fact}</td>
					</tr>
					<tr>
						<th style="text-align: right;">发生日期：</th>
						<td><fmt:formatDate  value="${event.occur_date}" type="both" pattern="yyyy-MM-dd hh:mm:ss" /></td>
					    <th style="text-align: right;">发生地点：</th>
						<td>${event.occur_address}</td>
					</tr>
					<tr>
						<th style="text-align: right;">数据来源：</th>
						<td>${event.data_source}</td>
					    <th style="text-align: right;">事件状态：</th>
						<td>${event.event_status}</td>
					</tr>
				</table>
            </div>
        </div>
        <div style="padding-top:30px;"></div>
		        <div class="panel panel-default">
		            <div class="panel-body">
		            	<span style="font-size:15px" class="title">记分列表</span>
						<table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
							<tr>
							    <th style="text-align: center;">序号</th>
								<th style="text-align: center;">细则编码</th>
								<th style="text-align: center;">细则名称</th>
								<th style="text-align: center;">记分值</th>
							</tr>
							<c:forEach items="${comScoreRecordList}" var="scoreRecord" varStatus="vs">
								<tr>
									<td style="text-align: center;">${vs.index+1}</td>
									<td style="text-align: center;">${scoreRecord.indic_code}</td>
									<td style="text-align: center;">${scoreRecord.indic_text}</td>
									<td style="text-align: center;">${scoreRecord.score}</td>
								</tr>
							</c:forEach>
						</table>
		            </div>
		        </div>
		        
		        
		        <div style="padding-top:30px;"></div>
		        <div class="panel panel-default">
		            <div class="panel-body">
						<span style="font-size:15px" class="title">申诉信息</span>
		                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
							<tr>
							    <th style="text-align: right;" >申诉内容：</th>
							    <td colspan="3">${ca.appeal_text }</td>
							</tr>
							<tr>
								<th style="text-align: right;" >申诉材料：</th>
								<td colspan="3">
									<c:choose>
										<c:when test="${null == ca.appeal_file || ca.appeal_file== ''}">无</c:when>
										<c:otherwise><a href="${ca.appeal_file}">点击下载</a></c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
							    <th style="text-align: right;" >申诉时间：</th>
							    <td colspan="3"><fmt:formatDate  value="${ca.appeal_date }" type="both" pattern="yyyy-MM-dd hh:mm:ss" /></td>
							</tr>
							<tr>
							    <th style="text-align: right;" >申诉结论：</th>
							    <td colspan="3" ng-show='appeal_result=="0"'>申诉无效，维持记分</td>
							    <td colspan="3" ng-show='appeal_result=="1"'>同意申诉，撤销记分</td>
							</tr>
							<tr>
							    <th style="text-align: right;" >处理意见：</th>
							    <td colspan="3">${cad.deal_result }</td>
							</tr>
							<tr>
							    <th style="text-align: right;" >处理时间：</th>
							    <td colspan="3"><fmt:formatDate  value="${cad.update_time}" type="both" pattern="yyyy-MM-dd hh:mm:ss" /></td>
							</tr>
		                </table>
		           	</div>
		   		</div>
		   		
				<table width="100%" border="0" cellpadding="5" cellspacing="2">
					<tr>
						<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
							<a class="btn btn-mini btn-grey" onclick="top.Dialog.close();">关闭</a>
						</td>
					</tr>
				</table>
		   		
	</div>
	<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="<%=basePath %>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
</div>
<script language="javascript" src="jquery-1.4.2.min.js"></script>
</body>
</html>