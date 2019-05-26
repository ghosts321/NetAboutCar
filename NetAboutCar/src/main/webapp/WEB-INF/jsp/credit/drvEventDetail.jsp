<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html ng-app='wyc'>
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

function submitForm(){
	var review_result = $("#review_result").val();
	if(review_result == ""){
		$("#review_result").tips({
			side:3,
            msg:'请填写处理结论！',
            bg:'#AE81FF',
            time:2
        });
		$("#review_result").focus();
	}else{
		$("#scoreSum").val($("#totalScore").text());
		$("#form1").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
}

</script>

</head>
<body ng-controller="WycController">
<div class="container">
<form action="<%=basePath %>credit/drvEventReview.action" name="form1" id="form1" method="post" enctype ="multipart/form-data">
	<div id="zhongxin">
		<div style="padding-top:30px;"></div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span style="font-size:15px" class="title">基本信息</span>
                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
					<tr>
						<th style="text-align: right;width:20%;">姓名：</th>
						<td style="width:30%;">${drv.username}</td>
					    <th style="text-align: right;width:20%;">性别：</th>
						<td style="width:30%;">
							<c:if test="${drv.sex==1}">男</c:if>
							<c:if test="${drv.sex==0}">女</c:if>
						</td>
					</tr>
					<tr>
					    <th style="text-align: right;">身份证号：</th>
						<td>${drv.certno}</td>
					    <th style="text-align: right;">车牌号：</th>
						<td>${drv.carnum}</td>
					</tr>
					<tr>
						<th style="text-align: right;">车辆型号：</th>
						<td>${drv.model}</td>
					    <th style="text-align: right;">所属平台：</th>
						<td>${drv.platformname}</td>
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
        <c:choose>
			<c:when test="${drvEventReview.review_status == '已审核'}">
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
							<c:forEach items="${drvScoreRecordList}" var="scoreRecord" varStatus="vs">
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
						<span style="font-size:15px" class="title">审核信息</span>
		                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
							<tr>
								<th style="text-align: right;" >结论材料：</th>
								<td colspan="3">
									<c:choose>
										<c:when test="${null == drvEventReview.result_file || drvEventReview.result_file == ''}">无</c:when>
										<c:otherwise><a href="${drvEventReview.result_file}">点击下载</a></c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
							    <th style="text-align: right;" >处理结论：</th>
							    <td colspan="3"><textarea style="width: 400px;height:50px" cols="40" rows="5">${drvEventReview.review_result}</textarea></td>
							</tr>
		                </table>
		           	</div>
		   		</div>
				<table width="100%" border="0" cellpadding="5" cellspacing="2">
					<tr>
						<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
							<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
						</td>
					</tr>
				</table>
       		</c:when>
			<c:otherwise>
				<div style="padding-top:30px;"></div>
		        <div class="panel panel-default">
		            <div class="panel-body">
		            	<span style="font-size:15px" class="title">记分列表</span>
						<table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
							<tr>
							    <th style="text-align: center;width:5%;"><input style="width: 15px;" type="checkbox" id="check_all" /></th>
							    <th style="text-align: center;">序号</th>
								<th style="text-align: center;">指标名称</th>
								<th style="text-align: center;">细则名称</th>
								<th style="text-align: center;">记分值</th>
							</tr>
							<c:forEach items="${indicList}" var="indic" varStatus="vs">
								<tr>
									<td style="text-align: center;width:5%;">
										<input style="width: 15px;" type="checkbox" name="indics" value="${indic.indic_code}" score="${indic.score}" onclick="countScore(this,${indic.score})"/>
									</td>
									<td style="text-align: center;">${vs.index+1}</td>
									<td style="text-align: center;">${indic.type_name}</td>
									<td style="text-align: center;">${indic.indic_text}</td>
									<td style="text-align: center;">${indic.score}</td>
								</tr>
							</c:forEach>
							<tr>
								<td style="text-align: center;" colspan="2">总记分值</td>
								<td style="text-align: center;" colspan="3" id="totalScore">0</td>
							</tr>
						</table>
		            </div>
		        </div>
		        <div style="padding-top:30px;"></div>
		        <div class="panel panel-default">
		            <div class="panel-body">
						<span style="font-size:15px" class="title">审核信息</span>
		                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
							<tr>
								<th style="text-align: right;" >结论材料上传：</th>
								<td colspan="3">
									 <div class="box">
										<input type="text" name="result" id="result" class="file_textbox" />
										<a href="javascript:void(1);" class="upload_link">上传</a>
										<input type="file" class="uploadFile" name="resultfile"  id="resultfile" onchange="getFile(this)" />
									</div>         
								</td>
							</tr>
							<tr>
							    <th style="text-align: right;" >处理结论：</th>
							    <td colspan="3"><textarea style="width: 400px;height:50px" cols="40" rows="5" name="review_result" id="review_result"></textarea></td>
							</tr>
		                </table>
		           	</div>
		   		</div>
				<table width="100%" border="0" cellpadding="5" cellspacing="2">
					<tr>
						<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
							<input type="hidden" id="event_no" name="event_no" value="${event.event_no}" />
							<input type="hidden" id="certno" name="certno" value="${drv.certno}" />
							<input type="hidden" id="drvName" name="drvName" value="${drv.username}" />
							<input type="hidden" id="scoreSum" name="scoreSum" value="" />
							<button type="button" class="btn btn-mini btn-primary" onclick="submitForm();">提交</button>&nbsp;&nbsp;&nbsp;
							<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
						</td>
					</tr>
				</table>
			</c:otherwise>	
		</c:choose>
	</div>
	<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="<%=basePath %>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
</form>
</div>
<script language="javascript" src="jquery-1.4.2.min.js"></script>
</body>
</html>