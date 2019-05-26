<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(function(){
	var shengHtml="<select id='sheng' name='sheng' onchange='getShiCode(this.value)' style='width:100px'>";
	//省下拉框赋值
	$.ajax({
        type: "post",
        url: "getAreaCode.action",
        data: "codeParam=0",
        success: function (data) {
        	var codeJson = eval(data);
    		if(codeJson != null){
    			shengHtml+="<option value='-1'>--请选择--</option>";
    			for(var i=0;i<codeJson.length;i++){
    				shengHtml += "<option value='"+codeJson[i].areaCode+"'>"+codeJson[i].areaName+"</option>";
    			}
    			shengHtml+="</select>";
				$("#shengSpan").html(shengHtml);
    		}
        }
    });
})
function getShiCode(parentCode){
	$("#shiSpan").html("");
	$("#quSpan").html("");
	if(true){
		$.ajax({
            type: "post",
            url: "getAreaCode.action",
            data: "codeParam=" + parentCode,
            success: function (data) {
            	var codeJson = eval(data);
        		if(codeJson != null){
        			var shiHtml="<select id='shi' name='shi' onchange='getQuCode(this.value)' style='width:100px'>";
        			shiHtml+="<option value='-1'>--请选择--</option>";
        			for(var i=0;i<codeJson.length;i++){
        				shiHtml += "<option value='"+codeJson[i].areaCode+"'>"+codeJson[i].areaName+"</option>";
        			}
        			shiHtml+="</select>";
					$("#shiSpan").html(shiHtml);
        		}
            }
        });
	}
}
function getQuCode(parentCode){
	$("#quSpan").html("");
	if(true){
		$.ajax({
            type: "post",
            url: "getAreaCode.action",
            data: "codeParam=" + parentCode,
            success: function (data) {
            	var quHtml="<select id='areaCode' name='areaCode' style='width:100px'>";
            	quHtml+="<option value='-1'>--请选择--</option>";
            	var codeJson = eval(data);
        		if(codeJson != null){
        			for(var i=0;i<codeJson.length;i++){
        				quHtml += "<option value='"+codeJson[i].areaCode+"'>"+codeJson[i].areaName+"</option>";
        			}
        			quHtml+="</select>";
					$("#quSpan").html(quHtml);
        		}
            }
        });
		getInst("");
	}
}
function getInst(code){
    var pCode=$("#shi").val();
	if(true){
		$.ajax({
            type: "post",
            url: "getInstByAreaCode.action",
            data: "codeParam=" + pCode,
            success: function (data) {
            	var instHtml="<select id='pinstCode' name='pinstCode'>";
            	var codeJson = eval(data);
        		if(codeJson != null){
        			for(var i=0;i<codeJson.length;i++){
        				instHtml += "<option value='"+codeJson[i].instId+"'>"+codeJson[i].instName+"</option>";
        			}
        			instHtml+="</select>";
					$("#instSpan").html(instHtml);
        		}
            }
        });
	}
}
//保存校验
function save(){
	if($("#instName").val()==""){
		$("#instName").tips({
			side:3,
            msg:'请输入机构名称',
            bg:'#AE81FF',
            time:2
        });
		$("#instName").focus();
		return false;
	}
	$("#instInfoForm").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}
 
</script>
<style>
select,textarea{
	margin-top: 4px;
	margin-bottom: 4px;
}
textarea{
  width: 157px;
}
</style>
</head>
<body>
<div class="container">
<form action="update.action" name="instInfoForm" id="instInfoForm" method="post" >
		<div id="zhongxin" align="center" style="padding-top:30px">
		<table>
			<tr>
				<td style="text-align: right;">机构代码：</td>
				<td align="left"><input type="text" name="instId" id="instId" value="${instInfo.instId}" title="名称" readonly="true"/></td>
			</tr>
			<tr>
			    <td style="text-align: right;">机构名称：</td>
				<td align="left"><input type="text" name="instName" id="instName" value="${instInfo.instName}" title="地址"/></td>
			</tr>
			<tr>
			    <td style="text-align: right;">机构简称：</td>
				<td align="left"><input type="text" name="sinstName" id="sinstName" value="${instInfo.sinstName}" title="地址"/></td>
			</tr>
			<tr>
			    <td style="text-align: right;">所属行政区划：</td>
			    <td align="left">
					 <span id="shengSpan" name="shengSpan"></span>
					 <span id="shiSpan" name="shiSpan"></span>
					 <span id="quSpan" name="quSpan"></span>
				</td>
			</tr>
			<tr>
			    <td style="text-align: right;">上级机构：</td>
				<td align="left">
				   <span id="instSpan" name="instSpan"></span>
				</td>
			</tr>
			<tr>
			    <td style="text-align: right;">机构电话：</td>
				<td align="left"><input type="text" name="telNo" id="telNo" value="${instInfo.telNo}" title="地址"/></td>
			</tr>
			<tr>
			    <td style="text-align: right;">机构地址：</td>
				<td align="left"><textarea rows="1" cols="1" name="address" id="address" title="地址">${instInfo.address}</textarea></td>
			</tr>
			<tr>
			    <td style="text-align: right;">联系人：</td>
				<td align="left"><input type="text" name="contractName" id="contractName" value="${instInfo.contractName}" title="地址"/></td>
			</tr>
			<tr>
			    <td style="text-align: right;">联系电话：</td>
				<td align="left"><input type="text" name="contractTelNo" id="contractTelNo"  value="${instInfo.contractTelNo}" title="地址"/></td>
			</tr>
			<tr>
			    <td style="text-align: right;">说明：</td>
				<td align="left"><textarea rows="1" cols="1" name="description" id="description" title="地址" size="30">${instInfo.description}</textarea></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center; padding-top: 30px;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
</body>
</html>