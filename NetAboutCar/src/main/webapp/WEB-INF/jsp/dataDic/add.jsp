<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function save(){
	if($("#dataName").val()==""){
		$("#dataName").tips({
			side:3,
            msg:'请输入字典名称',
            bg:'#AE81FF',
            time:2
        });
		$("#dataName").focus();
		return false;
	}
	if($("#dataName").val().length>5){
		$("#dataName").tips({
			side:3,
            msg:'字典名称过长',
            bg:'#AE81FF',
            time:2
        });
		$("#dataName").focus();
		return false;
	}
	$("#dataDicForm").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}

</script>
</head>
<body>
<div class="container">
<form  action="add.action" name="dataDicForm" id="dataDicForm" method="post" >
		<div id="zhongxin" align="center" style="padding-top:50px">
		<table>
			<tr>
				<td style="text-align: right;">字典编码：</td>
				<td>
				<input type="text" name="dataCode" id="dataCode"   value="${nowDataCode }" title="字典编码" readonly="true"/></td>
			</tr>
			<tr>
			    <td style="text-align: right;">字典名称：</td>
				<td><input type="text" name="dataName" id="dataName"  value="" title="字典名称"/></td>
			</tr>
			<tr>
			    <td style="text-align: right;">备注：</td>
				<td><input type="text" name="remark" id="remark"  value="" title="备注"/></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center; padding-top: 20px;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>&nbsp;&nbsp;
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