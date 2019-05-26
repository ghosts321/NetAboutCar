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
$(function() {
	$("tr[name='moreInfo']").css("display","none");
	
});
//保存校验
function save(){
	var appStatus=$("#select").val();
	
	if(appStatus==4 ){
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
function show(type){
	if(type == 1){
		top.Dialog.open({
	        InnerHtml: "<img src='${carPermitApply.carPhoto}'>",
	        Title:"车辆照片",
	        Width:300,
	        Height:400
	    });
	}else if(type == 2){
		top.Dialog.open({
			InnerHtml: "<img src='${carPermitApply.drivePhoto}'>",
	        Title:"驾驶证照片",
	        Width:300,
	        Height:400
	    });
	}else if(type == 3){
		top.Dialog.open({
			InnerHtml: "<img src='${carPermitApply.changeProperty}'>",
	        Title:"车辆变更性质照片",
	        Width:300,
	        Height:400
	    });
	}
}
	function carDetail(applyId,carId){
		var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="车辆详情";
		 diag.URL = '<%=basePath%>car/showDetail.action?carId=' + carId + '&applyId=' + applyId;
		 diag.Width = 800;
		 diag.Height = 450;
		 diag.CancelEvent = function(){ //取消事件
			diag.close();
		 };
		 diag.show();
	}
	function showLess(obj){
		$("tr[name='moreInfo']").css("display","none");
		$(obj).html("更多..");
		$(obj).attr("onclick","showMore(this);");
	}
	function showMore(obj){
		$("tr[name='moreInfo']").css("display","");
		$(obj).html("收起..");
		$(obj).attr("onclick","showLess(this);");
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
            	<div align="right">
            	<div style="text-align: right;"><a style="cursor:pointer;text-align: right;" onclick="showMore(this);">更多..</a></div>
	  <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
			<tr>
				<th style="text-align: right;width: 20%;">车辆编号：</th>
				<td style="width:30%;">${carInfo.carId}</td>
			    <th style="text-align: right;width: 20%;" >车牌号：</th>
				<td style="width:30%;">${carInfo.carNum}</td>
			</tr>
			<tr>
				<th style="text-align: right;width: 20%;" >身份证号码：</th>
				<td style="width:30%;">${carInfo.certNo}</td>
				</td>
			    <th style="text-align: right;width: 20%;" >车主名称：</th>
				<td style="width:30%;">${carInfo.manCompany}</td>
				</td>
			</tr>
			<tr name="moreInfo">
				<th style="text-align: right;" >联系地址：</th>
				<td style="width:30%;">${carInfo.address}</td>
			    <th style="text-align: right;" >联系电话：</th>
				<td style="width:30%;">${carInfo.telNo}</td>
			</tr>
			
			<tr name="moreInfo">
				<th style="text-align: right;">发动机号：</th>
				<td style="width:30%;">${carInfo.engineNum}</td>
			    <th style="text-align: right;">车架号/VIN：</th>
				<td style="width:30%;">${carInfo.chassisNum}</td>
			</tr>
			<tr name="moreInfo">
				<th style="text-align: right;">品牌：</th>
				<td style="width:30%;">${carInfo.label}</td>
			    <th style="text-align: right;" >型号：</th>
				<td style="width:30%;">${carInfo.model}</td>
			</tr>
			
			<tr name="moreInfo">
				
			    <th style="text-align: right;" >座位数：</th>
				<td style="width:30%;">${carInfo.seatNum}</td>
				<th style="text-align: right;" >轴距：</th>
				<td style="width:30%;">${carInfo.wheelBase}</td>
			</tr>
			<tr name="moreInfo">
			    <th style="text-align: right;" >车辆所属：</th>
			    <td >
				<c:choose>  
					    <c:when test="${carInfo.belongs=='1'}">
					 自有车辆
					    </c:when>  
					    <c:when test="${carInfo.belongs=='2'}"> 
					        平台车辆
					    </c:when>
					    <c:when test="${carInfo.belongs=='3'}"> 
					         自有车辆
					    </c:when>
					 </c:choose></td>
				<th style="text-align: right;" >车辆类别：</th>
				<td style="width:30%;">
			    	<c:choose>  
					    <c:when test="${carInfo.category=='1'}"> 
					  新能源
					    </c:when>  
					    <c:when test="${carInfo.category=='2'}"> 
					   自然吸气发动机
					    </c:when>
					 </c:choose>
					     ${carInfo.economyType}
			    </td>
			</tr>
			<tr name="moreInfo">
				<th style="text-align: right;" >发证行政区划代码：</th>
				<td style="width:30%;">${carInfo.areaCode}</td>
			    <th style="text-align: right;" >发证基层交管部门：</th>
				<td style="width:30%;">${carInfo.endDept}</td>
			</tr>
			
			<tr name="moreInfo">
				<th style="text-align: right;" >初次登记证编码：</th>
				<td style="width:30%;">${carInfo.regCode}</td>
			    <th style="text-align: right;" >初次登记时间：</th>
				<td style="width:30%;">${carInfo.regDate}</td>
			</tr>
		</table>
		</div>
		</div>
		</div>
		<br/>
			<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">申请信息</span>
            	  <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
			<tr>
				<th style="text-align: right;width: 20%;" >申请机构代码：</th>
				<td style="width:30%;">${carPermitApply.instId}</td>
			    <th style="text-align: right;width: 20%;" >申请时间：</th>
				<td style="width:30%;">${carPermitApply.applyDate}</td>
			</tr>
				<tr>
				<th style="text-align: right;width:20%;" >车辆年检：</th>
				<td colspan="3" style="width:80%">${carPermitApply.inspectionInfo}</td>
			</tr>
			</table>
			</div>
			</div>
			<br/>
		<div class="panel panel-default">
            <div class="panel-body">
            <span class="title">附件</span>
            	  <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
			<tr>
				<th style="text-align: right;width: 20%;">车辆照片：</th>
				<c:set value="${ fn:split(carPermitApply.carPhoto, ';') }" var="url" />
				<td colspan="3" style="text-align: left;width: 80%;" >
				<a href="javascript:show(1)" id="a">查看车辆照片</a>
				<div style="display:none" id="div">
				  <c:forEach items="${url}" var="s">
					<c:if test="${s=='' }">
				     	<img class="img" src="${basePath}static/images/zwzp.png">
				     </c:if>
				     <c:if test="${s!='' }">
					 	<img class="img" src="${s}">
					 </c:if>	
				  </c:forEach>
				  </div>
				</td>
				</tr>
				<tr>
			    <th style="text-align: right;width: 20%;" >行驶证照片：</th>
				<c:set value="${ fn:split(carPermitApply.drivePhoto, ';') }" var="url" />
				<td colspan="3" style="text-align: left;width: 80%;" >
				<a href="javascript:show(2)" id="a2">查看行驶证照片</a>
				<div id="div2" style="display:none">
				  <c:forEach items="${url}" var="s">
					<c:if test="${s=='' }">
				     	<img class="img" src="${basePath}static/images/zwzp.png">
				     </c:if>
				     <c:if test="${s!='' }">
					 	<img class="img" src="${s}">
					 </c:if>	
				  </c:forEach>
				  </div>
				</td>
			</tr>
				
			<tr>
				<th style="text-align: right;width: 20%;" >外勘资料：</th>
				<td colspan="3" style="text-align: left;" style="width:80%;">
					<c:choose>  
					    <c:when test="${carPermitApply.externalExploration==null}"> 
							    <input type="text" value="无" disabled="disabled" style="background:#EDEDED"/>
					    </c:when>  
					    <c:otherwise>
							<a href="${carPermitApply.externalExploration}">点击下载</a>
						</c:otherwise>	
					 </c:choose>
				</td>
		</tr>
		<tr>
			    <th style="text-align: right;width: 20%;"   >变更车辆性质文件：</th>
				<td colspan="3" style="text-align: left;" style="width:80%;">
					<c:choose>  
					    <c:when test="${carPermitApply.changeProperty==null}"> 
							 <input type="text" value="无" disabled="disabled" style="background:#EDEDED"/> 
					    </c:when>  
					    <c:otherwise>
					    	<a href="javascript:show(3)" id="a">查看变更性质照片</a>
						</c:otherwise>	
					 </c:choose>
				</td>
			</tr>
		</table>
		</div>
		</div>
		<br/>
		<c:if test="${not empty approve}">
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">审批记录</span>
		<table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
		<tr>
		  <th style="text-align: center;" colspan="2">处理人</th>
		  <th style="text-align: center;" colspan="2">操作类型</th>
		  <th style="text-align: center;" colspan="4">提交时间</th>
		  <th style="text-align: center;" colspan="2">处理结果</th>
		  <th style="text-align: center;" colspan="5">意见</th>
		</tr>
			<c:forEach items="${approve}" var="approve">
		<tr width="100%">
				<td colspan="2" style="text-align: center;" >${approve.username}</td>
				<c:if test="${approve.apprtype==1}">
				<td style="text-align: center;" colspan="2">申请</td>
				</c:if>
				<c:if test="${approve.apprtype==2}">
				<td style="text-align: center;" colspan="2">车辆外勘</td>
				</c:if>
				<c:if test="${approve.apprtype==3}">
				<td style="text-align: center;" colspan="2">性质变更</td>
				</c:if>
				<c:if test="${approve.apprtype==4}">
				<td style="text-align: center" colspan="2">窗口预约</td>
				</c:if>
				<c:if test="${approve.apprtype==5}">
				<td style="text-align: center;" colspan="2">变更</td>
				</c:if> 
				<td colspan="4">${approve.apprdatetime }</td>
				<c:if test="${approve.opinions==1 }">
				<td style="text-align: center;"  colspan="2">不通过</td>
				</c:if>
				<c:if test="${approve.opinions==2 }">
				<td  style="text-align: center;"  colspan="2">通过</td></c:if>
				<td colspan="5" style="text-align: center;" >${approve.description}</td>
			</tr>
			</c:forEach>
			</table>
			</div>
			</div>
			</c:if>
			<br/>
			<c:choose>
			<c:when test="${carPermitApply.appStatus==0 || carPermitApply.appStatus == 1 ||  carPermitApply.appStatus == 2 || carPermitApply.appStatus == 3 ||carPermitApply.appStatus == 4 || carPermitApply.appStatus == '5'}">
			
			<input type="hidden" id="applyId" name="applyId" value="${carPermitApply.applyId}">
			<input type="hidden" id="carId" name="carId" value="${carInfo.carId}">
			<input type="hidden" id="appStatus" name="appStatus" value="${carPermitApply.appStatus}">
			<c:choose>
				<c:when test="${carPermitApply.appStatus==0}">
				<div class="panel panel-default">
            	<div class="panel-body">
            	<span class="title">认证信息</span>
            	 <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
					<tr>
					    <th style="text-align: right;width:20%">信息验证接口：</th>
					    <th style="width:80%"><a href='#' id="yz" onclick='javascript:$("#tg").show();$("#yz").hide()'>验证</a>&nbsp;<span id="tg" style="display: none"><font color="green">已通过</font></span></th>
					</tr>
					</table>
					</div>
					</div>
					<br/>
					<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">认证审核</span>
            	 <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
						<th style="text-align: right;width:20%">审核意见：</th>
					    <td style="width:80%">
					    <select name="appStatus" id="select" style="width: 200px">
					    	<option value="1">通过</option>
					    	<option value="-1">不通过</option>
					    </select>
						</td>
					</tr>
					<tr>
					    <th style="text-align: right;width:20%">审核意见说明：</th>
					    <td style="width:80%"><textarea style="width: 400px;height:50px" cols="40" rows="5" name="description" id="description" ></textarea></td>
					</tr>
						<tr>
						<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
						<a class="btn btn-mini btn-primary" onclick="save();" >提交</a>&nbsp;&nbsp;&nbsp;						
					   <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					</td>
					</table>
					</div>
					</div>
				</c:when>
				</c:choose>
				<c:choose>
				<c:when test="${carPermitApply.appStatus==1 }">
					<div class="panel panel-default">
            		<div class="panel-body">
            			<span class="title">外勘审核</span>
            			 <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
						<th style="text-align: right;width:20%" >审核意见：</th>
					    <td style="width:80%">
					 <%--    <c:choose>
					     <c:when test="${carPermitApply.externalExploratio == null}"> 
					    <select name="appStatus" id="select" disabled="true">
					    	<option value="2">通过</option>
					    	<option value="-2">不通过</option>
					    </select>
					    </c:when>
					      <c:otherwise> --%>
					    <select name="appStatus" id="select" style="width: 200px">
					    	<option value="2">通过</option>
					    	<option value="-2">不通过</option>
					    </select>
					    <%-- </c:otherwise>
					    </c:choose> --%>
						</td>
					</tr>
					<tr>
					    <th style="text-align: right;width:20%">审核意见说明：</th>
					    <td style="width:80%"><textarea style="width: 400px;height:50px" cols="40" rows="5" name="description" id="description" ></textarea></td>
					</tr>
					<tr>
						<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
						<a class="btn btn-mini btn-primary" onclick="save();" type="hidden">提交</a>&nbsp;&nbsp;&nbsp;						
					   <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					</td>
					</tr>
					</table>
					</div>
					</div>
				</c:when>
				</c:choose>
				<c:choose>
				<c:when test="${carPermitApply.appStatus==2  }">
					<div class="panel panel-default">
            	<div class="panel-body">
            	<span class="title">变更审核</span>
             <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
					<tr>
					<th style="text-align: right;width:20%" >审核意见：</th>
					    <td style="width:80%">
					      <c:choose>  
							    <c:when test="${carPermitApply.changeProperty==null}"> 
					    <select name="appStatus" id="select" disabled="true" style="width: 200px">
					    	<option value="3" >通过</option>
					    	<option value="-3">不通过</option>
					    </select>
					    </c:when>
					      <c:otherwise>
					    <select name="appStatus" id="select" style="width: 200px">
					    	<option value="3" >通过</option>
					    	<option value="-3">不通过</option>
					    </select>
					      </c:otherwise>
					      </c:choose>
						</td>
					</tr>
					<tr>
					    <th style="text-align: right;width:20%">审核意见说明：</th>
					    <td style="width:80%"><textarea style="width: 400px;height:50px" cols="40" rows="5" name="description" id="description" ></textarea></td>
					</tr>
					<tr>
						<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
						<a class="btn btn-mini btn-primary" onclick="save();" type="hidden">提交</a>&nbsp;&nbsp;&nbsp;						
					   <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					</td>
					</tr>
					</table>
					</div>
					</div>
				</c:when>
				</c:choose>
				<c:choose>
				<c:when test="${carPermitApply.appStatus==3 }">
				<div class="panel panel-default">
            	<div class="panel-body">
            	<span class="title">档案信息</span>
            	 <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
					<tr>
					    <th style="text-align: right;width:20%" >档案编码：</th>
					    <td style="width:30%"><input type="text" id="archivenum" name="archivenum" value="" class="form-control" /></td>
					    <th style="text-align: right;width:20%">档案名称：</th>
					    <td style="width:30%"><input type="text" id="archivename" name="archivename" value="" class="form-control" /></td>
					</tr>
					</table>
					</div>
					</div>
					<br/>
					<div class="panel panel-default">
            	<div class="panel-body">
            	<span class="title">窗口审核</span>
            	 <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
					<tr>
					<th style="text-align: right;width:20%">审核意见：</th>
					    <td style="width:80%">
					     <c:choose>  
							    <c:when test="${carPermitApply.appStatus==4}"> 
					    <select name="appStatus" id="select" disabled="true" style="width: 200px">
					    	<option value="4">通过</option>
					    	<option value="-4">不通过</option>
					    </select>
					    </c:when>
					    <c:otherwise>
					    <select name="appStatus" id="select" style="width: 200px">
					    	<option value="4">通过</option>
					    	<option value="-4">不通过</option>
					    </select>
					    </c:otherwise>
					    </c:choose>
						</td>
					</tr>
					<tr>
					    <th style="text-align: right;width:20%">审核意见说明：</th>
					    <td style="width:80%"><textarea style="width: 400px;height:50px" cols="40" rows="5" name="description" id="description" colspan="3"></textarea></td>
					</tr>
					<tr>
						<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
						<a class="btn btn-mini btn-primary" onclick="save();" type="hidden">提交</a>&nbsp;&nbsp;&nbsp;						
					   <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					</td>
					</tr>
					</table>
					</div>
					</div>
					</c:when>
				</c:choose>
				<c:choose>
				<c:when test="${carPermitApply.appStatus==5 || carChangeApply.appStatus == 0 || carChangeApply.appStatus == 2}">
				<div class="panel panel-default">
            	<div class="panel-body">
            	<span class="title">变更审核</span>
            	 <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
					<tr>
					<th style="text-align: right;width:20%">审核意见：</th>
					    <td style="width:80%">
					    <select name="appStatus" id="appStatus" style="width: 200px">
					    	<option value="6">通过</option>
					    	<option value="-6">不通过</option>
					    </select>
						</td>
					</tr>
					<tr>
					    <th style="text-align: right;width:20%">审核意见说明：</th>
					    <td style="width:80%"><textarea style="width: 400px;height:50px" cols="40" rows="5" name="description" id="description" colspan="3"></textarea></td>
					</tr>
					<tr>
						<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
						<a class="btn btn-mini btn-primary" onclick="save();" type="hidden">提交</a>&nbsp;&nbsp;&nbsp;						
					   <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					</td>
					</tr>
					</table>
					</div>
					</div>
					</c:when>
					</c:choose>
	</c:when>
	<c:otherwise>
	<div style="text-align: center; padding-top: 5px;padding-bottom: 5px;"><a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a></div>
	</c:otherwise>
	</c:choose>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/>
		<h4 class="lighter block green"></h4></div>
	
	</form>
	</div>
	<script language="javascript" src="jquery-1.4.2.min.js"></script>
</body>
</html>