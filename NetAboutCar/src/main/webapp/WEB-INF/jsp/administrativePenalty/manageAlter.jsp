<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
 a:hover{color:white;text-decoration:none;}
 table{border-collapse:separate;}
select,textarea{
	margin-top: 4px;
	margin-bottom: 4px;
}
textarea{
  width: 222px;
}
</style>
<script type="text/javascript">

		$(function(){
	//日期控件
	$('.date-picker').datepicker({
                    dateFormat: 'yy-mm-dd',
                    onSelect: function(dateText, inst) {
                        var selday = $(this).datepicker("casetime");
                        
                        selday.setDate(1);
                        var format = $(this).datepicker("option", "dateFormat");
                        var seldaystr = $.datepicker.formatDate(format, selday);
                        $(this).val(casetime);
                    }
                }
	);
});
//保存
		function save(){
	
	$("#manageForm").submit();
	
		}

		function plantB(){
			var alterzd	;
			var altercontentb;
			altercontentb=$("#plateNameBefore").val();
			alterzd=$("#alterzd").val();
			$("#alterzd").val(alterzd+"所属平台="+altercontentb+"^");	
		}
		
		function sourceB(){
			var alterzd;
			var altercontentb;
			altercontentb=$("#sourceBefore").val();
			alterzd=$("#alterzd").val();
			$("#alterzd").val(alterzd+"案件来源="+altercontentb+"^");
		}
		
		function isregisterB(){
			var alterzd	;
			var altercontentb;
			altercontentb=$("#isregisterBefore").val();
			alterzd=$("#alterzd").val();
			$("#alterzd").val(alterzd+"案件状态="+altercontentb+"^");	
		}
		
		function areacodeB(){
			var alterzd	;
			var altercontentb;
			altercontentb=$("#areaCodeBefore").val();
			alterzd=$("#alterzd").val();
			$("#alterzd").val(alterzd+"行政区划="+altercontentb+"^");	
		}
		
		function instidB(){
			var alterzd	;
			var altercontentb;
			altercontentb=$("#instIdBefore").val();
			alterzd=$("#alterzd").val();
			$("#alterzd").val(alterzd+"组织机构="+altercontentb +"^");	
		}
		
		function casetimeB(){
			var alterzd	;
			var altercontentb;
			altercontentb=$("#caseTimeBefore").val();
			alterzd=$("#alterzd").val();
			$("#alterzd").val(alterzd+"案发时间="+altercontentb +"^");	
		}
		
		function casereasonB(){
			var alterzd	;
			var altercontentb;
			altercontentb=$("#caseReasonBefore").val();
			alterzd=$("#alterzd").val();
			$("#alterzd").val(alterzd+"案件事由="+altercontentb +"^");	
		}
		
		
		
</script>
</head>
<body>
	<div class="container">
		<form action="caseRevise.action" method="post" name="manageForm" id="manageForm">
		<input type="hidden" name="caseId" value="${CaseManageInfo.caseId }" />
			<div id="zhongxin" align="center" style="padding-top: 25px">
		   	<table>
		   			<tr>
						<td align="right">案件编号：</td>
						<td align="left"><input class="form-control"
							value ="${CaseManageInfo.caseId }" name="caseId" id="caseId" type="text" placeholder="请输入案件编号" disabled="disabled"></td>
					</tr>
					
					<tr>
						<td align="right">平台名称：</td>
						<td align="left">
					<select name="plateName" id="plateName" style="width:220px;" onchange="plantB()">
			        <option value="请选择">请选择</option>
				     <c:forEach items="${comlist}" var="comlist">
				     <option value="${comlist.comname}" <c:if test="${comlist.comname==CaseManageInfo.plateName}">selected</c:if>>${comlist.comname}</option>
				     </c:forEach>     
				  </select></td>
					</tr>
					<tr>
						<td align="right">案件来源：</td>
						<td align="left">
							<select class="form-control" name="source" id="source" onchange="sourceB()">
								<option value="01" <c:if test="${CaseManageInfo.source=='01'}">selected</c:if>>稽查执法查扣违章</option>
								<option value="02" <c:if test="${CaseManageInfo.source=='02'}">selected</c:if>>信访投诉违章</option>
								<option value="02" <c:if test="${CaseManageInfo.source=='00'}">selected</c:if>>手工录入</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right">案件状态：</td>
						<td align="left">
							<select class="form-control" name="isRegister" id="isRegister" onchange="isregisterB()"/>
								<option value="00" <c:if test="${CaseManageInfo.isRegister=='00'}">selected</c:if>>已结案</option>
								<option value="01" <c:if test="${CaseManageInfo.isRegister=='01'}">selected</c:if>>未交罚款</option>
							</select>
							</td>
					</tr>
					<tr>
						<td align="right">行政区划：</td>
						<td align="left"><input class="form-control"
							value ="${CaseManageInfo.areaCode }" name="areaCode" id=""areaCode"" type="text" placeholder="请输入行政区划" onchange="areacodeB()"/></td>
					</tr>
					<tr>
						<td align="right">组织机构：</td>
						<td align="left"><input class="form-control"
							value ="${CaseManageInfo.createInstId }" name="createInstId" id="createInstId" type="text" placeholder="请输入组织机构" onchange="instidB()"/>
						</td>
					</tr>
					
					<td align="right">案发时间：</td>
						<td align="left"><input type="text" class="date-picker" id="caseTime" name="caseTime"  value="${CaseManageInfo.caseTime } "  
						data-date-format="yyyy-mm-dd" onchange="changeDateValue();"/>
						</td>
					
					<tr>
						<td align="right">案件事由：</td>
						<td align="left"><textarea class="form-control" rows="4" cols="1"  onchange="casereasonB()"
							 name="caseReason" id="caseReason" placeholder="请输入案件事由">${CaseManageInfo.caseReason }</textarea>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" style="text-align: center; padding-top: 25px;">
							<a class='btn btn-mini btn-primary' onclick='save()'>保存</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">返回</a>
						</td>
					</tr>
					<tr>
						<td>
						<input type="hidden" id="plateNameBefore" name="plateNameBefore" value="${CaseManageInfo.plateName }">
						<input type="hidden" id="sourceBefore" name="sourceBefore" value="${CaseManageInfo.source }">
						<input type="hidden" id="isregisterBefore" name="isregisterBefore" value="${CaseManageInfo.isRegister }">
						<input type="hidden" id="areaCodeBefore" name="areaCodeBefore" value="${CaseManageInfo.areaCode }">
						<input type="hidden" id="instIdBefore" name="instIdBefore" value="${CaseManageInfo.instId }">
						<input type="hidden" id="caseTimeBefore" name="caseTimeBefore" value="${CaseManageInfo.caseTime }">
						<input type="hidden" id="caseReasonBefore" name="caseReasonBefore" value="${CaseManageInfo.caseReason }">
						<input type="hidden" id="alterzd" name="alterzd" value="">
						<input type="hidden" id="altercontentb" name="altercontentb" value="">
						</td>
					</tr>
				</table>
			</div>
			<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="<%=basePath%>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
        </form>     
	</div>
</body>
</html>