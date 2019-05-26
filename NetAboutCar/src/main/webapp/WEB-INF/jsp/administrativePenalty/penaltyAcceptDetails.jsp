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

//受理立案
function toRegister(id){
	document.plantCaseInfoForm.action="toAcceptRegister.action?id="+id;
	$("#plantCaseInfoForm").submit();
  
}
//受理不立案
 function toNotRegister(id){
		document.plantCaseInfoForm.action='toNotAcceptRegister.action?id='+id;;
		$("#plantCaseInfoForm").submit();
	  
} 
//受理不立案
 function toNotRegister(id){
		document.plantCaseInfoForm.action='toNotAcceptRegister.action?id='+id;;
		$("#plantCaseInfoForm").submit();
	  
}

 function showMore(obj){
	 	//var caseId = $("#caseId").val();
	 	//document.plantCaseInfoForm.action='toFindTsfw.action?casId='+caseId;;
		$("tr[name='moreInfo']").css("display","");
		$(obj).html("收起..");
		$(obj).attr("onclick","showLess(this);");
	}
 
 function showLess(obj){
		$("tr[name='moreInfo']").css("display","none");
		$(obj).html("点击查看投诉基本信息");
		$(obj).attr("onclick","showMore(this);");
	}
 
 $(function(){
	 $("tr[name='moreInfo']").css("display","none");
	});

</script>

</head>
<body>
<div class="container">
<form name="plantCaseInfoForm" id="plantCaseInfoForm" method="post" >
<input type="hidden" id="caseId" name="caseId" value="${plantCaseInfo.caseId }" />

		<div id="zhongxin">
		<table border="1" class="table">
		    <tr>
		      <th colspan="4">案件基本信息</th>
		    </tr>
			<tr>
				<th style="text-align: right;width: 100px;">案件编号：</th>
				<td style="width:200px;">${plantCaseInfo.caseId }</td>
			    <th style="text-align: right;width: 100px;">平台名称：</th>
				<td style="width:200px;">
					${plantCaseInfo.plateName }
				</td>
			</tr>
			<tr>
				<th style="text-align: right;">案件来源：</th>
				<c:choose>
				<c:when test="${plantCaseInfo.source=='01'}">
					<td>稽查执法查扣违章</td>
				</c:when>
				<c:when test="${plantCaseInfo.source=='02'}">
					<td>信访投诉违章</td>
				</c:when>
				<c:when test="${plantCaseInfo.source=='00'}">
					<td>手工录入</td>
				</c:when>
				<c:otherwise></c:otherwise>
				</c:choose>
			    <th style="text-align: right;">行政区划：</th>
				<td id="nationTd">${plantCaseInfo.areaCode }</td>
			</tr>
			<tr>
				<th style="text-align: right;">组织机构：</th>
				<td>
					${plantCaseInfo.instId }
				</td>
			    <th style="text-align: right;">案件承办人：</th>
				<td>${plantCaseInfo.caseUserId }</td>
			</tr>
			<tr>
				<th style="text-align: right;">案发时间：</th>
				<td>
					${plantCaseInfo.caseTime }
				</td>
			    <th style="text-align: right;">最后受理时间：</th>
				<td>${plantCaseInfo.updateTime }</td>
			</tr>
			<tr height="30px">
				<th style="text-align: right;">案件事由：</th>
				<td colspan="3">${plantCaseInfo.caseReason }</td>
			</tr>
			<c:choose>
			<c:when test="${plantCaseInfo.source=='02'}">
			<tr >
				<th colspan="4">投诉信息</th>
			</tr>
			<tr >
				<th style="text-align: right;">投诉基本信息</th>
				<td colspan="3"><a style="cursor:pointer;text-align: right;" onclick="showMore(this);">点击查看投诉基本信息</a></td>
			</tr>
			<tr name="moreInfo">
				<td style="text-align:left;" colspan="4"><strong>投诉人信息</strong></td>
			</tr>	      
			<tr name="moreInfo">
			<td style="text-align: right;">姓名：</td>
			<td>${comcomplaintinfo.compn_name}</td>	
			<td style="text-align:right;">性别:</td>
			<td style="text-align:left;"> 
				<c:if test="${comcomplaintinfo.compn_sex=='1'}">男</c:if> 
				<c:if test="${comcomplaintinfo.compn_sex=='2'}">女</c:if>
			</td>
			</tr >
			<tr name="moreInfo">
				<td style="text-align: right;">手机号：</td>
				<td>${comcomplaintinfo.compn_tel}</td>	
				<td style="text-align:right;" >身份证号：</td>
				<td style="text-align:left;" >${comcomplaintinfo.compn_number}</td>
			</tr>

			<tr name="moreInfo">
			    <td style="text-align: right;">电子邮件：</td>
				<td style="text-align:left;" colspan="3">${comcomplaintinfo.compn_email}</td>
			</tr>
			<tr name="moreInfo">  
				<td style="text-align: right;">现住地址：</td>
				<td style="text-align:left;" colspan="3">${comcomplaintinfo.compn_address}</td>
			</tr>
  			<tr name="moreInfo">
  				<td style="text-align:left;" colspan="4" ><strong>投诉内容信息<strong></td>
  			</tr>
			<tr name="moreInfo"> 
				<td style="text-align: right;">平台名称：</td>
				<td style="text-align:left;" colspan="3">${comcomplaintinfo.compn_compy}
				     <input type="hidden" id="complain_code" name="complain_code" value="${comcomplaintinfo.complain_code}"/>
				      <input type="hidden" id="complain_info_id" name="complain_info_id" value="${comcomplaintinfo.complain_info_id}"/>
				</td>
			</tr>
			<c:if test="${comcomplaintinfo.compn_file!=null && comcomplaintinfo.compn_file!=''}">
			<tr height="40" name="moreInfo">
				<td align="right">投诉文件：</td>
				<td style="text-align:left;" colspan="3">
					<div class="box">
						<a href="${comcomplaintinfo.compn_file}">点击下载</a>
					</div>         
				</td>
			</tr> 
			</c:if>
			<tr name="moreInfo">
			    <td style="text-align: right;">投诉内容：</td>
			    <td style="text-align:left;" colspan="3">${comcomplaintinfo.compn_reason}</td>
			</tr>
			<tr name="moreInfo">
			    <td style="text-align: right;">受理意见：</td>
			    <td style="text-align:left;" colspan="3"><textarea style="width:200px;height:80px;" name="distri_idea" id="distri_idea" >${drvComplainDistribute.distri_idea}</textarea></td>
			</tr>
			
			</c:when>
			</c:choose>
			
			<c:choose>
			<c:when test="${plantCaseInfo.dealStatus=='01'}">
			<tr>
				<th colspan="4">调查取证</th>
			</tr>
			
			<tr height="30px">
				<th style="text-align: right;">取证下载：</th>
				<td colspan="3">
				<c:choose>  
					    <c:when test=""> 
							  <a href="${plantCaseInfo.evidenceUrl}">点击下载</a>
					    </c:when>  
					    <c:otherwise>
							<a href="${plantCaseInfo.evidenceUrl}">点击下载</a>
						</c:otherwise>	
					 </c:choose>	
				
				</td>
			</tr>
			<tr height="30px">
				<th style="text-align: right;">取证意见：</th>
				<td colspan="3"><textarea name="evidenceView" id="evidenceView" style="width:450px;height:80px;">${plantCaseInfo.evidenceView }</textarea></td>
			</tr>
			</c:when>
			<c:otherwise></c:otherwise>
			</c:choose>
			<c:choose>
			<c:when test="${plantCaseInfo.dealStatus=='02'}">
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
				<td colspan="3"><textarea name="evidenceView" id="evidenceView" style="width:450px;height:80px;">${plantCaseInfo.evidenceView }</textarea></td>
			</tr>
			</c:when>
			<c:when test="${plantCaseInfo.dealStatus=='04'}">
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
				<td colspan="3"><textarea name="evidenceView" id="evidenceView" style="width:450px;height:80px;">${plantCaseInfo.evidenceView }</textarea></td>
			</tr>
			</c:when>
			<c:otherwise></c:otherwise>
			</c:choose>
			
			<c:choose>
			<c:when test="${plantCaseInfo.dealStatus=='02'}">
			<tr>
				<th colspan="4">处罚决定</th>
			</tr>
			
			<tr height="30px">
				<th style="text-align: right;">处罚类型：</th>
				<td colspan="3">
					<select class="form-control" name="punishType" id="punishType" style="width:450px;">
						<option value="0001" selected>口头警告</option>
						<option value="0002" >200元以下罚款</option>
						<option value="0003" >暂扣或吊销驾驶证</option>
						
					</select>				
				</td>
			</tr>
			<tr height="30px">
				<th style="text-align: right;">处罚内容：</th>
				<td colspan="3"><textarea name="punishContent" id="punishContent" style="width:450px;height:80px;">${plantCaseInfo.punishContent }</textarea></td>
			</tr>
			</c:when>
			<c:otherwise></c:otherwise>
			</c:choose>
			
			<c:choose>
			<c:when test="${plantCaseInfo.dealStatus=='04'}">
			<tr>
				<th colspan="4">处罚决定</th>
			</tr>
			
			<tr height="30px">
				<th style="text-align: right;">处罚类型：</th>
				<td colspan="3">
					<select class="form-control" name="punishType" id="punishType" style="width:450px;">
						<c:if test="${plantCaseInfo.punishType=='0001'}">
						<option value="0001" selected>口头警告</option>
						<option value="0002" >200元以下罚款</option>
						<option value="0003" >暂扣或吊销驾驶证</option>
						</c:if>
						<c:if test="${plantCaseInfo.punishType=='0002'}">
						<option value="0001" >口头警告</option>
						<option value="0002" selected>200元以下罚款</option>
						<option value="0003" >暂扣或吊销驾驶证</option>
						</c:if>
						<c:if test="${plantCaseInfo.punishType=='0003'}">
						<option value="0001" >口头警告</option>
						<option value="0002" >200元以下罚款</option>
						<option value="0003" selected>暂扣或吊销驾驶证</option>
						</c:if><c:if test="${plantCaseInfo.punishType==''}">
						<option value="0001" >口头警告</option>
						<option value="0002" >200元以下罚款</option>
						<option value="0003" selected>暂扣或吊销驾驶证</option>
						</c:if>
					</select>						
				</td>
			</tr>
			<tr height="30px">
				<th style="text-align: right;">处罚内容：</th>
				<td colspan="3"><textarea name="punishContent" id="punishContent" style="width:450px;height:80px;">${plantCaseInfo.punishContent }</textarea></td>
			</tr>
			</c:when>
			<c:otherwise></c:otherwise>
			</c:choose>
			<tr>
				<th colspan="4">意见</th>
			</tr>
			<tr height="30px">
				<th style="text-align: right;">处理意见：</th>
				<td colspan="3"><textarea name="dealView" id="dealView" style="width:450px;height:80px;">${plantCaseInfo.dealView }</textarea></td>
			</tr>
			<c:choose>
			<c:when test="${plantCaseInfo.dealStatus=='00'}">
			<tr>
				<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
					<button type="button" class="btn btn-mini btn-primary" value="01" onclick="toRegister('00');">立案</button>
					<button type="button" class="btn btn-mini btn-primary" value="02" onclick="toNotRegister('00')">不予立案</button>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
				</td>
			</tr>
			</c:when>
			<c:when test="${plantCaseInfo.dealStatus=='01'}">
			<tr>
				<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
					<button type="button" class="btn btn-mini btn-primary" value="01" onclick="toRegister('01');">案件成立</button>
					<button type="button" class="btn btn-mini btn-primary" value="02" onclick="toNotRegister('01')">案件不成立</button>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
				</td>
			</tr>
			</c:when>
			<c:when test="${plantCaseInfo.dealStatus=='02'}">
			<tr>
				<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
					<button type="button" class="btn btn-mini btn-primary" value="01" onclick="toRegister('02');">处罚告知</button>
					<button type="button" class="btn btn-mini btn-primary" value="02" onclick="toNotRegister('02')">案件不予成立</button>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
				</td>
			</tr>
			</c:when>
			<c:when test="${plantCaseInfo.dealStatus=='04'}">
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
					<%-- <input type="hidden" id=""caseId"" name="caseId" value="${plantCaseInfo.caseId}" /> --%>
					
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
</body>
</html>