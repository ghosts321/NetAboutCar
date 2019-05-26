<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
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
$(function() {
	$.ajaxSettings.async = false; //设置getJson同步
	$.getJSON("<%=basePath %>static/js/minzu.json",function(datas){
		$.each(datas,function(index,msg){
			if("${drv.nation}" == msg.id){
				$("#nationTd").html(msg.name);
				return false;
			}
		});
	});
	$.ajaxSettings.async = true;//设置getJson异步
	
});

//处理考试审核结果（通过、不通过）
function sendValidate(){
	var status = $("#result").val();
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
			$("#description").val("备案审核已通过");
		}else{
			if(status == 1){
				$("#description").val("备案审核不通过，原因："+description);
			}
		}
		$("#form1").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
}

</script>

</head>
<body>
<div class="container">
<form action="<%=basePath %>pilotApply/recordAuthentication.action" name="form1" id="form1" method="post" >
		<div id="zhongxin">
		<div style="padding-top:30px;"></div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span style="font-size:15px;width:80px;" class="title">驾驶员信息</span>
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
						<th style="text-align: right;">区域编码：</th>
						<td>${drv.areacode}</td>
					    <th style="text-align: right;">民族：</th>
						<td id="nationTd">${drv.nation}</td>
					</tr>
					<tr>
						<th style="text-align: right;">政治背景：</th>
						<td>
							<c:if test="${drv.political==0}">群众</c:if>
							<c:if test="${drv.political==1}">团员</c:if>
							<c:if test="${drv.political==2}">党员</c:if>
						</td>
					    <th style="text-align: right;">身份证号：</th>
						<td>${drv.certno}</td>
					</tr>
					<tr>
						<th style="text-align: right;">现在住址：</th>
						<td>${drv.address}</td>
						<th style="text-align: right;">手机：</th>
						<td>${drv.telno}</td>
					</tr>
				</table>
            </div>
        </div>
        
        <div style="padding-top:30px;"></div>
        <div class="panel panel-default">
            <div class="panel-body">
            	<span style="font-size:15px" class="title">车辆信息</span>
                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
                	<tr>
						<th style="text-align: right;width:20%;">车辆编号：</th>
						<td style="width:30%;">${drv.carid}</td>
					    <th style="text-align: right;width:20%;">车牌号：</th>
						<td style="width:30%;">${drv.carnum}</td>
					</tr>
					<tr>
						<th style="text-align: right;">发动机号：</th>
						<td>${drv.enginenum}</td>
					    <th style="text-align: right;">车架号/VIN：</th>
						<td>${drv.chassisnum}</td>
					</tr>
					<tr>
						<th style="text-align: right;">品牌：</th>
						<td>${drv.labels}</td>
					    <th style="text-align: right;">型号：</th>
						<td>${drv.model}</td>
					</tr>
				</table>
            </div>
        </div>
        
        <div style="padding-top:30px;"></div>
        <div class="panel panel-default">
            <div class="panel-body">
            	<span style="font-size:15px" class="title">平台信息</span>
                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
					<tr>
						<th style="text-align: right;width:20%;">统一社会信用代码：</th>
						<td style="width:30%;">${drv.creditcode}</td>
					    <th style="text-align: right;width:20%;">企业名称：</th>
						<td style="width:30%;">${drv.comname}</td>
					</tr>
					<tr>
						<th style="text-align: right;">企业营业执照号：</th>
						<td>${drv.busiliceno}</td>
					    <th style="text-align: right;">注册地址：</th>
						<td>${drv.regaddress}</td>
					</tr>
					<tr>
						<th style="text-align: right;">法人代表姓名：</th>
						<td>${drv.corpname}</td>
					    <th style="text-align: right;">法人证件号码：</th>
						<td>${drv.corpcertno}</td>
					</tr>
				</table>
            </div>
        </div>
        
        <div style="padding-top:30px;"></div>
        <div class="panel panel-default">
            <div class="panel-body">
            	<span style="font-size:15px" class="title">合同信息</span>
                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
                	<tr>
						<th style="text-align: right;width:20%;">合同ID：</th>
						<td style="width:30%;">${drv.contractid}</td>
					    <th style="text-align: right;width:20%;">合同类型：</th>
						<td style="width:30%;">
							<c:if test="${drv.type==1}">合同</c:if>
							<c:if test="${drv.type==2}">协议</c:if>
						</td>
					</tr>
					<tr>
						<th style="text-align: right;">合同开始时间：</th>
						<td><fmt:formatDate  value="${drv.startdate}" type="both" pattern="yyyy-MM-dd" /></td>
					    <th style="text-align: right;">合同结束时间：</th>
						<td><fmt:formatDate  value="${drv.enddate}" type="both" pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<th style="text-align: right;">合同文件：</th>
						<td colspan="3"><a href="${drv.url}">点击下载</a></td>
					</tr>
				</table>
            </div>
        </div>
        
        <c:choose>
			<c:when test="${drv.status == 0}">
				<div style="padding-top:30px;"></div>
		        <div class="panel panel-default">
		            <div class="panel-body">
		            	<span style="font-size:15px" class="title">审核处理</span>
		                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
		               		<tr>
							    <th style="text-align: right;" >审核结果：</th>
							    <td colspan="3">
							    	<select style="width: 200px" id="result" name="result">
							    		<option value='2'>通过</option>
							    		<option value='1'>不通过</option>
							  		</select>
							    </td>
							</tr>
							<tr>
							    <th style="text-align: right;" >审核意见：</th>
							    <td colspan="3"><textarea style="width: 400px;height:50px" cols="40" rows="5" name="description" id="description"></textarea></td>
							</tr>
							<tr>
								<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
									<button type="button" class="btn btn-mini btn-primary" onclick="sendValidate();">提交</button>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
		                </table>
		            </div>
		        </div>
			</c:when>
			<c:otherwise>
                <table width="100%" border="0" cellpadding="5" cellspacing="2">
					<tr>
						<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
							<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
						</td>
					</tr>
                </table>
			</c:otherwise>
		</c:choose>
        
		<table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
			<tr style="display:none;">
				<td>
					<input type="hidden" id="recordid" name="recordid" value="${drv.recordid}" />
					<input type="hidden" id="certno" name="certno" value="${drv.certno}" />
					<input type="hidden" id="status" name="status" value="" />
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="<%=basePath %>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
	<script language="javascript" src="jquery-1.4.2.min.js"></script>
</body>
</html>