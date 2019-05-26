<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	$('.date-picker').datepicker();
});


//获取文件名
function getFile(obj,inputName){
	var file_name = $(obj).val();
	var houzhui=file_name.split(".");
	var last=houzhui[houzhui.length-1];
	var tp ="doc,docx";
	var rs=tp.indexOf(last);
				
	//如果返回的结果大于或等于0，说明包含允许上传的文件类型
	if(rs>=0){
		$("input[name='"+inputName+"']").val(file_name);
		alert();
		return true;
		}else{
			alert("您选择的上传文件不是有效的文档文件！");
			$("input[name='"+inputName+"']").val("");
			return false;
		}
} 


//获取文件名
function getFile1(obj,inputName){
	var file_name = $(obj).val();
	var houzhui=file_name.split(".");
	var last=houzhui[houzhui.length-1];
	var tp ="doc,docx";
	var rs=tp.indexOf(last);
				
	//如果返回的结果大于或等于0，说明包含允许上传的文件类型
	if(rs>=0){
		$("input[name='"+inputName+"']").val(file_name);
		alert();
		return true;
		}else{
			alert("您选择的上传文件不是有效的文档文件！");
			$("input[name='"+inputName+"']").val("");
			return false;
		}
}
//保存
function save(){
	if($("#plateName").val()==""){
		$("#plateName").tips({
			side:3,
            msg:'请输入平台名称',
            bg:'#AE81FF',
            time:2
        });
		$("#plateName").focus();
		return false;
	  } 
	  
	  if($("#source").val()==""){
			$("#source").tips({
				side:3,
	            msg:'请选择案件来源',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#source").focus();
			return false;
		}
	
	  if($("#areaCode").val()==""){
			$("#areaCode").tips({
				side:3,
	            msg:'请输入行政区划',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#areaCode").focus();
			return false;
	  } 

	  if($("#instId").val()==""){
			$("#instId").tips({
				side:3,
	            msg:'请输入组织机构',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#instId").focus();
			return false;
	  } 
	
	

	if($("#caseStatus").val()==""){
		$("#caseStatus").tips({
			side:3,
            msg:'请选择案件状态',
            bg:'#AE81FF',
            time:2
        });
		$("#caseStatus").focus();
		return false;
	}
	
	if($("#caseReason").val()==""){
		$("#caseReason").tips({
			side:3,
            msg:'请选择案件事由',
            bg:'#AE81FF',
            time:2
        });
		return false;
	}
	
	if($("#punishType").val()==""){
		$("#punishType").tips({
			side:3,
            msg:'请选择处罚类型',
            bg:'#AE81FF',
            time:2
        });
		$("#punishType").focus();
		return false;
	}
	
	if($("#punishContent").val()==""){
		$("#punishContent").tips({
			side:3,
            msg:'请填写处罚内容',
            bg:'#AE81FF',
            time:2
        });
		$("#punishContent").focus();
		return false;
	} 
	
	$("#plantCaseInfoForm").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}
</script>
</head>
<body>
	<div class="container">
		<form action="updatePlantCaseInfo.action" method="post" name="plantCaseInfoForm" id="plantCaseInfoForm"  enctype ="multipart/form-data">
		<input type="hidden" name="caseId" value="${plantCaseInfo.caseId }" />
			<div id="zhongxin" align="center" style="padding-top: 25px">
		   	<table>
					<tr >
						<td align="right">平台名称：</td>
						<td align="left">
					<select name="plateName" id="plateName" style="width:220px;" onchange="plantB()">
			        <option value="请选择">请选择</option>
				     <c:forEach items="${comlist}" var="comlist">
				     <option value="${comlist.comname}" <c:if test="${comlist.comname==plantCaseInfo.plateName}">selected</c:if>>${comlist.comname}</option>
				     </c:forEach>     
				    </select></td>
					</tr>		
					<tr>

						<td align="right">案件来源：</td>
						<td align="left">
							<select class="form-control" name="source" id="source">
								<c:if test="${plantCaseInfo.source=='00'}">
								<option value="00" selected>手工录入</option>
								<option value="01" >稽查执法查扣违章</option>
								<option value="02" >信访投诉违章</option>
								</c:if>
								<c:if test="${plantCaseInfo.source=='01'}">
								<option value="00" >手工录入</option>
								<option value="01" selected>稽查执法查扣违章</option>
								<option value="02" >信访投诉违章</option>								
								</c:if>
								<c:if test="${plantCaseInfo.source=='02'}">
								<option value="00" >手工录入</option>
								<option value="01" >稽查执法查扣违章</option>
								<option value="02" selected>信访投诉违章</option>
								</c:if>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right">行政区划：</td>
						<td align="left"><input class="form-control"
							value ="${plantCaseInfo.areaCode }" name="areaCode" id=""areaCode"" type="text" placeholder="请输入行政区划"/></td>
					</tr>
					<tr>
						<td align="right">组织机构：</td>
						<td align="left">
						<input class="form-control"
							value ="${plantCaseInfo.instId }" name="instId" id="instId" type="text" placeholder="请输入组织机构"/>
						</td>
					</tr>
					
					<tr>
						<td align="right">案件状态：</td>
						<td align="left">
							<select class="form-control" name="isRegister" id="isRegister">
								<c:if test="${plantCaseInfo.isRegister=='00'}">
								<option value="00" selected>已结案</option>
								<option value="01" >未交罚款</option>
								</c:if>
								<c:if test="${plantCaseInfo.isRegister=='01'}">
								<option value="00" >已结案</option>
								<option value="01" selected>未交罚款</option>
								</c:if>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right">案件事由：</td>
						<td align="left"><textarea class="form-control" rows="4" cols="1" 
							 name="caseReason" id="caseReason" placeholder="请输入案件事由">${plantCaseInfo.caseReason }</textarea>
						</td>
					</tr>
					<tr>
						<td align="right">处罚类型：</td>
						<td align="left">
							<select class="form-control" name="punishType" id="punishType">
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
								</c:if>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right">处罚内容：</td>
						<td align="left"><textarea class="form-control" rows="4" cols="1" 
							 name="punishContent" id="punishContent" placeholder="请输入处罚内容">${plantCaseInfo.punishContent }</textarea>
						</td>
					</tr>
					 <tr height="40">
								<td align="right">证据上传：</td>
								<td  align="left" colspan="3">
							         <div class="box">
										<input type="text" name="compn" id="compn" class="file_textbox" />
										<a href="javascript:void(0);" class="upload_link">上传</a>
										<input type="file" multiple  class="uploadFile" name="compnfile"  id="compnfile" onchange="getFile(this,'compn')" />
									</div>         
								</td>
							</tr> 
					<tr height="40">
						<td align="right">处罚文书上传：</td>
						<td  align="left" colspan="3">
							 <div class="box">
								<input type="text" name="punish" id="punish" class="file_textbox" />
								<a href="javascript:void(1);" class="upload_link">上传</a>
								<input type="file" multiple  class="uploadFile" name="punishfile"  id="punishfile" onchange="getFile1(this,'punish')" />
							</div>         
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center; padding-top: 25px;">
							<a class='btn btn-mini btn-primary' onclick='save()'>保存</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">返回</a>
						</td>
					</tr>
				</table>
			</div>
			<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="<%=basePath%>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
        </form>     
	</div>
</body>
</html>