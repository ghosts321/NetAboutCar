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

//受理立案
function toRegister(id){
	document.drvPlantCaseInfoForm.action="toAcceptRegister.action?id="+id;
	$("#drvPlantCaseInfoForm").submit();
  
}

//受理不立案
function toNotRegister(id){
	document.drvPlantCaseInfoForm.action='toNotAcceptRegister.action?id='+id;;
	$("#drvPlantCaseInfoForm").submit();
}
		
	

function showMore(obj){
 	//var caseId = $("#caseId").val();
 	//document.plantCaseInfoForm.action='toFindTsfw.action?casId='+caseId;;
	$("tr[name='moreInfo1']").css("display","");
	$(obj).html("收起..");
	$(obj).attr("onclick","showLess(this);");
}

function showLess(obj){
	$("tr[name='moreInfo1']").css("display","none");
	$(obj).html("点击查看投诉基本信息");
	$(obj).attr("onclick","showMore(this);");
}

$(function(){
 $("tr[name='moreInfo1']").css("display","none");
});

function showMore1(obj){
 	//var caseId = $("#caseId").val();
 	//document.plantCaseInfoForm.action='toFindTsfw.action?casId='+caseId;;
	$("tr[name='moreInfo']").css("display","");
	$(obj).html("收起..");
	$(obj).attr("onclick","showLess1(this);");
}

function showLess1(obj){
	$("tr[name='moreInfo']").css("display","none");
	$(obj).html("点击查看投诉基本信息");
	$(obj).attr("onclick","showMore1(this);");
}

$(function(){
 $("tr[name='moreInfo']").css("display","none");
});

//获取处罚内容
function getTerm(){
	<%--  var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="处罚规则";
	 diag.URL = '<%=basePath%>penalty/tremIndex.action';
	 diag.Width = 1000;
	 diag.Height = 1000;
	 diag.CancelEvent = function(){ //关闭事件
		/* if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		} */
		location.reload();
		diag.close();
	 };
	 diag.show();  --%>
 	 window.open("<%=basePath%>penalty/tremsIndex.action","","status:no;resizable:yes;dialogHeight:410px;dialogWidth:460px;unadorne:yes")
 }
</script>

</head>
<body>
<div class="container">
<form name="drvPlantCaseInfoForm" id="drvPlantCaseInfoForm" method="post" >
<input type="hidden" id="caseid" name="caseid" value="${drvPlantCaseInfo.caseid }" />

		<div id="zhongxin">
		<table border="1" class="table">
		    <tr>
		      <th colspan="4">基本信息</th>
		    </tr>
			<tr>
				<th style="text-align: right;width: 100px;">案件编号：</th>
				<td style="width:200px;">${drvPlantCaseInfo.caseid }</td>
			    <th style="text-align: right;width: 100px;">车牌号：</th>
				<td style="width:200px;">${drvPlantCaseInfo.carid }
				</td>
			</tr>
			<tr>
				<th style="text-align: right;width: 100px;">驾驶证号：</th>
				<td  style="width:200px;">${drvPlantCaseInfo.drivcarno }</td>
			    <th style="text-align: right;width: 100px;">案件来源：</th>
				<td  style="width:200px;">
				<c:choose>
				     <c:when test="${drvPlantCaseInfo.casesource=='01'}">稽查执法查扣违章</c:when>
				      <c:when test="${drvPlantCaseInfo.casesource=='02'}">信访投诉违章</c:when>
				</c:choose></td>
			</tr>
			<tr>
				<th style="text-align: right;width: 100px;">行政区划：</th>
				<td  style="width:200px;">${drvPlantCaseInfo.areacode }</td>
			    <th style="text-align: right;width: 100px;">组织机构：</th>
				<td  style="width:200px;">${drvPlantCaseInfo.instid }</td>
			</tr>
			<tr>
				<th style="text-align: right;width: 100px;">案发时间：</th>
				<td  style="width:200px;">${drvPlantCaseInfo.casetime}</td>

			    <th style="text-align: right;width: 100px;">最后处理时间：</th>
				<td  style="width:200px;">${drvPlantCaseInfo.updatetime }</td>
			</tr>
			<tr height="30px">
				<th style="text-align: right;">案件承办人：</th>
				<td colspan="3">${drvPlantCaseInfo.caseuserid }</td>
			</tr>
			<tr height="30px">
				<th style="text-align: right;">案件事由：</th>
				<td colspan="3">${drvPlantCaseInfo.casereason }</td>
			</tr>
			<c:choose>
			<c:when test="${drvPlantCaseInfo.casesource=='02'}">
			<tr >
				<th colspan="4"><strong>投诉信息</strong></th>
			</tr>
			<tr >
				<th style="text-align: right;">投诉基本信息</th>
				<td colspan="3"><a style="cursor:pointer;text-align: right;" onclick="showMore1(this);">点击查看投诉基本信息</a></td>
			</tr>
			<tr name="moreInfo">
				<td style="text-align:left;" colspan="4">
				<strong>投诉人基本信息</strong>
				</td>
			</tr>      
			<tr name="moreInfo">
				<td style="text-align: right;">姓名：</td>
				<td style="text-align:left;">${drvcomplaintinfo.compn_name}</td>	
				<td style="text-align: right;">性别：</td>
				<td style="text-align:left;">  
					<c:if test="${drvcomplaintinfo.compn_sex=='1'}">男</c:if> 
					<c:if test="${drvcomplaintinfo.compn_sex=='2'}">女</c:if>
				</td>
			</tr>
			<tr name="moreInfo">
				<td style="text-align: right;">手机号：</td>
				<td>${drvcomplaintinfo.compn_tel}</td>	
				<td style="text-align: right;" >身份证号：</td>
				<td style="text-align:left;">${drvcomplaintinfo.compn_number}</td>
			</tr>
			
			<tr name="moreInfo">
			    <td style="text-align: right;">电子邮件：</td>
				<td style="text-align:left;" colspan="3">${drvcomplaintinfo.compn_email}</td>
			</tr>
			<tr name="moreInfo">  
				<td style="text-align: right;">现住地址：</td>
				<td style="text-align:left;" colspan="3">${drvcomplaintinfo.compn_address}</td>
			</tr>
			<tr name="moreInfo">
				<td style="text-align:left;" colspan="4"><strong>被投诉驾驶员信息<strong></td>
			</tr>
			<tr name="moreInfo">  
				<td style="text-align: right;">车牌号：</td>
				<td style="text-align:left;">${drvcomplaintinfo.car_number}</td>
				<td style="text-align: right;">驾驶证号码：</td>
				<td style="text-align:left;" >${drvcomplaintinfo.driver_licence}</td>
			</tr>
				<tr>  </tr>
			<tr name="moreInfo"> 
				<td style="text-align: right;">网约车所属平台名称：</td>
				<td style="text-align:left;" colspan="3">${drvcomplaintinfo.car_company}
				     <input type="hidden" id="complain_code" name="complain_code" value="${drvcomplaintinfo.complain_code}"/>
				     <input type="hidden" id="drv_complain_info_id" name="drv_complain_info_id" value="${drvcomplaintinfo.drv_complain_info_id}"/>
				</td>
			</tr>
			<c:if test="${drvcomplaintinfo.compn_file!=null && drvcomplaintinfo.compn_file!=''}">
				<tr height="40" name="moreInfo">
					<td align="right">投诉文件：</td>
					<td style="text-align:left;" colspan="3"><a href="${drvcomplaintinfo.compn_file}">点击下载</a></td>
				</tr>
			</c:if> 
			<tr name="moreInfo">
			    <td style="text-align: right;">投诉内容：</td>
			    <td style="text-align:left;" colspan="3">${drvcomplaintinfo.compn_reason}</td>
			</tr>
			
			<tr name="moreInfo">
			    <td style="text-align: right;">受理意见:</td>
			    <td style="text-align:left;" colspan="3"><textarea style="width:220px;height:80px;" name="distri_idea" id="distri_idea" readonly>${drvComplainDistribute.distri_idea}</textarea></td>
			</tr>
			 <tr name="moreInfo">
			 	<td style="text-align: right;">选择下级处理部门：</td>
				<td style="text-align:left;" colspan="3"> 
				<select style="width:220px;" name="allot_depme" id="allot_depme">
				      <c:if test="${drvComplainDistribute.allot_depme=='受理部门'}"><option value="受理部门" selected>受理部门</option></c:if>
				      <c:if test="${drvComplainDistribute.allot_depme=='稽查办'}"><option value="稽查办" selected>稽查办</option></c:if>
				      <c:if test="${drvComplainDistribute.allot_depme=='诚信部'}"><option value="诚信部" selected>诚信部</option></c:if>
				      <c:if test="${drvComplainDistribute.allot_depme=='运营平台'}"><option value="受理部门" selected>运营平台</option></c:if>   
				  </select>
				  </td>
			</tr>
			
			
			</c:when>
			
			
			<c:when test="${drvPlantCaseInfo.casesource=='01'}">
			<tr >
				<th colspan="4">执法稽查信息</th>
			</tr>
			<tr >
				<th style="text-align: right;">执法稽查基本信息</th>
				<td colspan="3"><a style="cursor:pointer;text-align: right;" onclick="showMore(this);">点击查看执法稽查基本信息</a></td>
			</tr>
			<tr name="moreInfo1">
				<th style="text-align: right;width: 80px;">驾驶员姓名：</th>
				<td style="text-align: left; width:220px;">${drvIllegalInfo.name}</td>
			    <th style="text-align: right;width: 80px;">身份证号：</th>
				<td style="ext-align: left; width:220px;">${drvIllegalInfo.certno}</td>
			</tr>
			<tr name="moreInfo1">
				<th style="text-align: right;">所属平台：</th>
				<td style="ext-align: left;">${drvIllegalInfo.company_name}</td>
			    <th style="text-align: right;">车牌号：</th>
				<td style="ext-align: left;">${drvIllegalInfo.car_num}</td>
			</tr>
			<tr name="moreInfo1">
				<th style="text-align: right;">手机号：</th>
				<td style="ext-align: left;">${drvIllegalInfo.phone_number}</td>
			    <th style="text-align: right;">违章时间：</th>
				<td style="ext-align: left;">${drvIllegalInfo.illegal_time}</td>
			</tr>
			<tr name="moreInfo1">
				<th style="text-align: right;">违章来源：</th>
				<td style="ext-align: left;">${drvIllegalInfo.illegal_source}</td>
			    <th style="text-align: right;">状态：</th>
				<td style="ext-align: left;"><c:choose>  
					    <c:when test="${drvIllegalInfo.status=='2'}"> 
							     未审核
					    </c:when>  
					    <c:when test="${drvIllegalInfo.status=='3'}"> 
							      已审核
					    </c:when>
					 </c:choose>	
			   </td>
			</tr>
			<tr name="moreInfo1">
				<th style="text-align: right;">违章内容：</th>
				<td colspan="3" style="text-align: left;">${drvIllegalInfo.illegal_content}</td>
			</tr>
			<c:choose>  
					    <c:when test="${drvIllegalInfo.illegal_source=='订单'}"> 
			<tr name="moreInfo1">
		      <th colspan="4">订单信息</th>
		    </tr>
			<tr name="moreInfo1">
				<th style="text-align: right;">订单信息：</th>
				<td colspan="3" style="text-align: left;"><a href="">跳转到订单信息查询页面</a></td>
			</tr>					   
		                </c:when>  
					    <c:when test="${drvIllegalInfo.illegal_source=='运营数据'}"> 
			<tr name="moreInfo1">
		      <th colspan="4">运营信息</th>
		    </tr>
			<tr name="moreInfo1">
				<th style="text-align: right;">运营信息：</th>
				<td colspan="3" style="text-align: left;"><a href = "">跳转到运营信息查询页面</a></td>
			</tr></c:when>
		    </c:choose>
			<tr name="moreInfo1">
		      <th colspan="4">违规判定</th>
		    </tr>
			<tr name="moreInfo1">
				<th style="text-align: right;">判定结果：</th>
				<td colspan="3" style="text-align: left;">
				<c:choose>  
					    <c:when test="${drvIllegalInfo.decision_result=='0'}"> 
							     不构成违规行为
					    </c:when>  
					    <c:when test="${drvIllegalInfo.decision_result=='1'}"> 
							      巡游
					    </c:when>
					    <c:when test="${drvIllegalInfo.decision_result=='2'}"> 
							     非法聚集
					    </c:when>  
					    <c:when test="${drvIllegalInfo.decision_result=='3'}"> 
							      违规行驶
					    </c:when><c:when test="${drvIllegalInfo.decision_result=='4'}"> 
							     异常运价
					    </c:when>  
					    <c:when test="${drvIllegalInfo.decision_result=='5'}"> 
							     长期未运营
					    </c:when><c:when test="${drvIllegalInfo.decision_result=='6'}"> 
							     违法行为
					    </c:when>  
					 </c:choose>	
			    </td>
			</tr>
			<tr name="moreInfo1">
				<th style="text-align: right;">审核结果：</th>
				<td colspan="3" style="text-align: left;">
				<!-- <textarea style="width:200px;height:50px;" id="check_result" name="check_result">
				</textarea> -->
				<input style="width:200px;height:50px;" type="text" name="check_result" id="check_result" value=""/>
				</td>
			</tr>
			
			
			</c:when>
			</c:choose>
			<c:choose>
			<c:when test="${drvPlantCaseInfo.dealstatus=='01'}">
			<tr>
				<th colspan="4">调查取证</th>
			</tr>
			
			<tr height="30px">
				<th style="text-align: right;">取证下载：</th>
				<td colspan="3">
				<c:choose>  
					    <c:when test=""> 
							  <a href="${carPermitApply.externalExploration}">点击下载</a>
					    </c:when>  
					    <c:otherwise>
							<a href="${carPermitApply.externalExploration}">点击下载</a>
						</c:otherwise>	
					 </c:choose>
				
				</td>
			</tr>
			<tr height="30px">
				<th style="text-align: right;">取证意见：</th>
				<td colspan="3"><textarea name="evidenceview" id="evidenceview" style="width:450px;height:80px;">${drvPlantCaseInfo.evidenceview }</textarea></td>
			</tr>
			</c:when>
			<c:when test="${drvPlantCaseInfo.dealstatus=='02'}">
			<tr>
				<th colspan="4">调查取证</th>
			</tr>
			
			<tr height="30px">
				<th style="text-align: right;">取证下载：</th>
				<td colspan="3">
				<c:choose>  
					    <c:when test=""> 
							  <a href="${drvPlantCaseInfo.evidenceurl}">点击下载</a>
					    </c:when>  
					    <c:otherwise>
							<a href="${drvPlantCaseInfo.evidenceurl}">点击下载</a>
						</c:otherwise>	
					 </c:choose>
				
				</td>
			</tr>
			<tr height="30px">
				<th style="text-align: right;">取证意见：</th>
				<td colspan="3"><textarea name="evidenceview" id="evidenceview" style="width:450px;height:80px;">${drvPlantCaseInfo.evidenceview }</textarea></td>
			</tr>
			</c:when>
			
			<c:when test="${drvPlantCaseInfo.dealstatus=='04'}">
			<tr>
				<th colspan="4">调查取证</th>
			</tr>
			
			<tr height="30px">
				<th style="text-align: right;">取证下载：</th>
				<td colspan="3">
				<c:choose>  
					    <c:when test=""> 
							  <a href="${carPermitApply.externalExploration}">点击下载</a>
					    </c:when>  
					    <c:otherwise>
							<a href="${carPermitApply.externalExploration}">点击下载</a>
						</c:otherwise>	
					 </c:choose>
				
				</td>
			</tr>
			<tr height="30px">
				<th style="text-align: right;">取证意见：</th>
				<td colspan="3"><textarea name="evidenceview" id="evidenceview" style="width:450px;height:80px;">${drvPlantCaseInfo.evidenceview }</textarea></td>
			</tr>
			</c:when>
			<c:otherwise></c:otherwise>
			</c:choose>
			
			<c:choose>
			<c:when test="${drvPlantCaseInfo.dealstatus=='02'}">
			<tr>
				<th colspan="4">处罚决定</th>
			</tr>
			
			<tr height="30px">
				<th style="text-align: right;">处罚类型：</th>
				<td colspan="3">
					<select  name="punishtype" id="punishtype">
					<option value="0001" >口头警告</option>
					<option value="0002" >200元以下罚款</option>
					<option value="0003" >暂扣或吊销驾驶证</option>
					</select>				
				</td>
			</tr>
			<!-- <tr height="30px">
				<th style="text-align: right;">处罚依据：</th>
				<td colspan="3"><textarea name="punishrule" id="pubishrule" style="width:450px;height:80px;" onfocus="getTerm()" readonly></textarea></td>
			</tr> -->
			<tr height="30px">
				<th style="text-align: right;">处罚内容：</th>
				<td colspan="3"><textarea name="punishcontent" id="punishcontent" style="width:450px;height:80px;">${drvPlantCaseInfo.punishcontent }</textarea></td>
			</tr>
			</c:when>
			
			<c:when test="${drvPlantCaseInfo.dealstatus=='04'}">
			<tr>
				<th colspan="4">处罚决定</th>
			</tr>
			
			<tr height="30px">
				<th style="text-align: right;">处罚类型：</th>
				<td colspan="3">
					<select class="form-control" name="punishtype" id="punishtype" style="width:450px;">
						<c:if test="${drvPlantCaseInfo.punishtype=='0001'}">
						<option value="0001" selected>口头警告</option>
						</c:if>
						<c:if test="${drvPlantCaseInfo.punishtype=='0002'}">
						<option value="0002" selected>200元以下罚款</option>
						</c:if>
						<c:if test="${drvPlantCaseInfo.punishtype=='0003'}">
						<option value="0003" selected>暂扣或吊销驾驶证</option>
						</c:if>
						<c:if test="${drvPlantCaseInfo.punishtype==''}">
						<option value="0001" >口头警告</option>
						</c:if>
					</select>					
				</td>
			</tr>
			<tr height="30px">
				<th style="text-align: right;">处罚内容：</th>
				<td colspan="3"><textarea name="punishcontent" id="punishcontent" style="width:450px;height:80px;">${drvPlantCaseInfo.punishcontent }</textarea></td>
			</tr>
			</c:when>
			
			<c:otherwise></c:otherwise>
			</c:choose>
			
			<tr>
				<th colspan="4">意见</th>
			</tr>
			<tr>
				<th style="text-align: right;width: 100px;">处理意见：</th>
				<td colspan="3">
				<textarea name="dealview" id="dealview" style="width:450px;height:80px;">${drvPlantCaseInfo.dealview }</textarea>
				</td>			
			</tr>
			
			<c:choose>
			<c:when test="${drvPlantCaseInfo.dealstatus=='00'}">
			<tr>
				<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
					<button type="button" class="btn btn-mini btn-primary" value="01" onclick="toRegister('00');">立案</button>
					<button type="button" class="btn btn-mini btn-primary" value="02" onclick="toNotRegister('00')">不予立案</button>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
				</td>
			</tr>
			</c:when>
			<c:when test="${drvPlantCaseInfo.dealstatus=='01'}">
			<tr>
				<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
					<button type="button" class="btn btn-mini btn-primary" value="01" onclick="toRegister('01');">案件成立</button>
					<button type="button" class="btn btn-mini btn-primary" value="02" onclick="toNotRegister('01')">案件不成立</button>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
				</td>
			</tr>
			</c:when>
			<c:when test="${drvPlantCaseInfo.dealstatus=='02'}">
			<tr>
				<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
					<button type="button" class="btn btn-mini btn-primary" value="01" onclick="toRegister('02');">处罚告知</button>
					<button type="button" class="btn btn-mini btn-primary" value="02" onclick="toNotRegister('02')">案件不予成立</button>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
				</td>
			</tr>
			</c:when>
			<c:when test="${drvPlantCaseInfo.dealstatus=='04'}">
			<tr>
				<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
					<button type="button" class="btn btn-mini btn-primary" value="01" onclick="toRegister('03');">处罚成立</button>
					<button type="button" class="btn btn-mini btn-primary" value="02" onclick="toNotRegister('03')">处罚不成立</button>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
				</td>
			</tr>
			</c:when>
			<c:otherwise></c:otherwise>
			</c:choose>
			<tr style="display:none;">
				<td>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
</body>
</html>