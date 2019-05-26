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
width: 220px;
height: 150px;
}
</style>
<script type="text/javascript">

//保存校验
function save(appStatus){
	if(appStatus==4 || appStatus==-4){
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
	}
	if(appStatus==-1 || appStatus==-2 || appStatus==-3 || appStatus==-4 || appStatus==-6){
		if($("#description").val()==""){
			$("#description").tips({
				side:3,
	            msg:'请输入审核意见',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#description").focus();
			return false;
		}
	}
	$("#appStatus").val(appStatus);
	$("#carInfoForm").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}
function showPhoto(photoPath){
	var iTop = (window.screen.availHeight - 30 - 650) / 2;
    //获得窗口的水平位置
    var iLeft = (window.screen.availWidth - 10 - 413) / 2; 
		win=window.open ('../echarts5.jsp','newWin', 'modal=yes, width=650,height=413,resizable=no, scrollbars=no,top=' + iTop + ',left=' + iLeft +' '); 
		if (win.location.href != "about:blank") {
			 win.focus();
		}
	
}
function show(data){

	if(data=='1'){
	document.getElementById('div').style.display="block";
	document.getElementById("a").style.display="none";
	}else if(data=='2'){
	document.getElementById('div2').style.display="inline-table";
	document.getElementById("a2").style.display="none";
	}
}
	function carDetail(applyId,carId){
		var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="车辆详情";
		 diag.URL = '<%=basePath%>car/showDetail.action?carId=' + carId + '&applyId=' + applyId;
		 diag.Width = 1000;
		 diag.Height = 250;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.show();
	}

</script>

</head>
<body>
<div class="container">
<form action="approve.action" name="carInfoForm" id="carInfoForm" method="post" >
		<div id="zhongxin">
		<br/>
			<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">基本信息</span>
		<table border="0"  style="width:90px;height:50px">
			<tr>
				<th style="text-align: right;width: 150px;height:10px" >车辆编号：</th>
				<td style="width:170px;" >
				<input type="text" value="${carInfo.carId}" disabled="disabled" style="background:#EDEDED;width:170px;"/></td>
			    <th style="text-align: right;width: 150px;" >车牌号：</th>
				<td style="width:160px;" ><input type="text" value="${carInfo.carNum}" disabled="disabled" style="background:#EDEDED"/></td>
			</tr>
			<tr>
				<th style="text-align: right;" >身份证号码：</th>
				<td ><input type="text" value="${carInfo.certNo}" disabled="disabled" style="background:#EDEDED;width:170px;"/></td>
			    <th style="text-align: right;" >车主名称：</th>
				<td ><input type="text" value="${carInfo.manCompany}" disabled="disabled" style="background:#EDEDED"/></td>
			</tr>
			<tr>
				<th style="text-align: right;" >联系地址：</th>
				<td ><input type="text" value="${carInfo.address}" disabled="disabled" style="background:#EDEDED;width:170px;"/></td>
			    <th style="text-align: right;" >联系电话：</th>
				<td ><input type="text" value="${carInfo.telNo}" disabled="disabled" style="background:#EDEDED"/></td>
			</tr>
			
			<tr>
				<th style="text-align: right;">发动机号：</th>
				<td ><input type="text" value="${carInfo.engineNum}" disabled="disabled" style="background:#EDEDED;width:170px;"/></td>
			    <th style="text-align: right;">车架号/VIN：</th>
				<td ><input type="text" value="${carInfo.chassisNum}" disabled="disabled" style="background:#EDEDED"/></td>
			</tr>
			<tr>
				<th style="text-align: right;">品牌：</th>
				<td ><input type="text" value="${carInfo.label}" disabled="disabled" style="background:#EDEDED;width:170px;"/></td>
			    <th style="text-align: right;" >型号：</th>
				<td ><input type="text" value="${carInfo.model}" disabled="disabled" style="background:#EDEDED"/></td>
			</tr>
			
			<tr>
				
			    <th style="text-align: right;" >座位数：</th>
				<td ><input type="text" value="${carInfo.seatNum}" disabled="disabled" style="background:#EDEDED;width:170px;"/></td>
				<th style="text-align: right;" >轴距：</th>
				<td ><input type="text" value="${carInfo.wheelBase}" disabled="disabled" style="background:#EDEDED"/></td>
			</tr>
			<tr>
			    <th style="text-align: right;" >车辆所属：</th>
			    <td >
				<c:choose>  
					    <c:when test="${carInfo.belongs=='1'}">
					    <input type="text" value="  自有车辆" disabled="disabled" style="background:#EDEDED;width:170px;"/>
					    </c:when>  
					    <c:when test="${carInfo.belongs=='2'}"> 
					        <input type="text" value=" 平台车辆" disabled="disabled" style="background:#EDEDED;width:170px;"/> 
					    </c:when>
					    <c:when test="${carInfo.belongs=='3'}"> 
					        <input type="text" value="  自有车辆" disabled="disabled" style="background:#EDEDED;width:170px;"/>
					    </c:when>
					 </c:choose></td>
				<th style="text-align: right;" >车辆类别：</th>
				<td >
			    	<c:choose>  
					    <c:when test="${carInfo.category=='1'}"> 
					    <input type="text" value="新能源" disabled="disabled" style="background:#EDEDED;width:80px"/>
							  
					    </c:when>  
					    <c:when test="${carInfo.category=='2'}"> 
					     <input type="text" value="自然吸气发动机" disabled="disabled" style="background:#EDEDED;width:113px;"/>
					    </c:when>
					 </c:choose>
					      <input type="text" value="${carInfo.economyType}" disabled="disabled" style="background:#EDEDED;width:70px"/>
				</td>
			    </td>
			</tr>
			<tr>
				<th style="text-align: right;" >发证行政区划代码：</th>
				<td ><input type="text" value="${carInfo.areaCode}" disabled="disabled" style="background:#EDEDED;width:170px;"/></td>
			    <th style="text-align: right;" >发证基层交管部门：</th>
				<td ><input type="text" value="${carInfo.endDept}" disabled="disabled" style="background:#EDEDED"/></td>
			</tr>
			
			<tr>
				<th style="text-align: right;" >初次登记证编码：</th>
				<td ><input type="text" value="${carInfo.regCode}" disabled="disabled" style="background:#EDEDED;width:170px;"/></td>
			    <th style="text-align: right;" >初次登记时间：</th>
				<td ><input type="text" value="${carInfo.regDate}" disabled="disabled" style="background:#EDEDED"/></td>
			</tr>
			</table>
			</div>
			</div>
			
			<br/>
			
			
	</form>
	</div>
	<center><a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a></center>
	<script language="javascript" src="jquery-1.4.2.min.js"></script>
</body>
</html>