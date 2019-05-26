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
img{
margin-bottom:0.5em;
width: 220px;
height: 150px;
}
</style>
<script type="text/javascript">
function showPhoto(photoPath){
	var iTop = (window.screen.availHeight - 30 - 650) / 2;
    //获得窗口的水平位置
    var iLeft = (window.screen.availWidth - 10 - 413) / 2; 
		win=window.open ('../echarts5.jsp','newWin', 'modal=yes, width=650,height=413,resizable=no, scrollbars=no,top=' + iTop + ',left=' + iLeft +' '); 
		if (win.location.href != "about:blank") {
			 win.focus();
		}
	
}
//证书作废
function operateComPermitcert(){
	var reason = $('#reason').val();
	if(reason == ""){
		alert("请填写原因！");
	}else{
		$("#comInfoForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
}
</script>

</head>
<body>
<div class="container">
<form action="<%=basePath %>platform/operateComPermitcert.action" name="comInfoForm" id="comInfoForm" method="post" >
		<div id="zhongxin">
		<table border="1" class="table">
		    <tr>
		      <th colspan="4">基本信息</th>
		    </tr>
			<tr>
				<th style="text-align: right;width: 100px;">统一社会信用代码：</th>
				<td style="width:200px;">${platform.creditCode}</td>
			    <th style="text-align: right;width: 100px;">企业名称：</th>
				<td style="width:200px;">${platform.comName}</td>
			</tr>
			<tr>
				<th style="text-align: right;">企业简称：</th>
				<td>${platform.shortName}</td>
			    <th style="text-align: right;">网约车平台名称：</th>
				<td>${platform.platformName}</td>
			</tr>
			<tr>
				<th style="text-align: right;">企业营业执照号：</th>
				<td>${platform.busiliceNo}</td>
			    <th style="text-align: right;">注册地址：</th>
				<td>${platform.regAddress}</td>
			</tr>
			<tr>
				<th style="text-align: right;">经营地址：</th>
				<td>${platform.busiAddress}</td>
			    <th style="text-align: right;">通信地址：</th>
				<td>${platform.postAddress}</td>
			</tr>
			<tr>
				<th style="text-align: right;">邮编：</th>
				<td>${platform.areaCode}</td>
			    <th style="text-align: right;">联系电话：</th>
				<td>${platform.contactsTel}</td>
			</tr>
			<tr>
				<th style="text-align: right;">法人代表姓名：</th>
				<td>${platform.corpName}</td>
			    <th style="text-align: right;">法人证件号码：</th>
				<td>${platform.corpcertNo}</td>
			</tr>
			<tr>
				<th style="text-align: right;">法人电话：</th>
				<td>${platform.corpTelNo}</td>
			    <th style="text-align: right;">公司负责人：</th>
				<td>${platform.prinName}</td>
			</tr>
			<tr>
				<th style="text-align: right;">负责人电话：</th>
				<td>${platform.printelNo}</td>
			</tr>
			<tr>
		      <th colspan="4">申请信息</th>
		    </tr>
			<tr>
				<th style="text-align: right;">企业申请编码：</th>
				<td>${platformApply.applyId}</td>
			    <th style="text-align: right;">统一社会信用代码：</th>
				<td>${platformApply.creditCode}</td>
			</tr>
			<tr>
				<th style="text-align: right;">申请人名称（公司全名）：</th>
				<td>${platformApply.applyCompany}</td>
			    <th style="text-align: right;">负责人姓名：</th>
				<td>${platformApply.dutyName}</td>
			</tr>
			
			<tr>
				<th style="text-align: right;">经办人姓名：</th>
				<td>${platformApply.handleName}</td>
			    <th style="text-align: right;">通信地址：</th>
				<td>${platformApply.address}</td>
			</tr>
			
			<tr>
				<th style="text-align: right;">邮编：</th>
				<td>${platformApply.zipCode}</td>
			    <th style="text-align: right;">电话：</th>
				<td>${platformApply.tel}</td>
			</tr>
			
			<tr>
				<th style="text-align: right;">手机：</th>
				<td>${platformApply.mobile}</td>
			    <th style="text-align: right;">电子邮箱：</th>
				<td>${platformApply.email}</td>
			</tr>
			<tr>
				<th style="text-align: right;">备注：</th>
				<td>${platformApply.remark}</td>
			    <th style="text-align: right;">附件：</th>
				<td><a href="${platformApply.annex}">点击下载</a></td>
			</tr>
			<tr>
			    <th style="text-align: right;" >作废原因：</th>
			    <td colspan="3"><textarea style="width: 400px" cols="40" rows="2" name="reason" id="reason" ></textarea></td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
					<input type="hidden" id="applyid" name="applyid" value="${platformApply.applyId}">
					<input type="hidden" id="creditCode" name="creditCode" value="${platformApply.creditCode}">
					<input type="hidden" id="status" name="status" value="3" />
					<a class="btn btn-mini btn-primary" onclick="operateComPermitcert();">作废</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
	<script language="javascript" src="jquery-1.4.2.min.js"></script>
</body>
</html>