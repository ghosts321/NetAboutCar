<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../common.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
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
</style>
<script type="text/javascript">
//获取文件名
function getFile(obj){
	var file_name = $(obj).val();
	$("input[name='annexText']").val(file_name);
}
function toAdd(){
	var annexText = $("#annexText").val();
	if(annexText == ""){
		$("#annexText").tips({
			side:3,
            msg:'请选择移除材料',
            bg:'#AE81FF',
            time:2
        });
		return false;
	}
	if($("#remove_reason").val()==""){
		$("#remove_reason").tips({
			side:3,
            msg:'请输入移除原因',
            bg:'#AE81FF',
            time:2
        });
		$("#remove_reason").focus();
		return false;
	}
	
	$("#form").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}

</script>
</head>
<body>
<div class="container">
	<form action="removeDrv.action" id="form" method="post" enctype="multipart/form-data">
		<div id="zhongxin">
		<input type="hidden" name="id" value="${drv_id }"/>
		<div style="padding-top:30px;"></div>
	                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
	                	<tr>
					    <th style="text-align: left;" colspan="2">移除处理</th>
						</tr>
						<tr>
							<th style="text-align: right;" >移除材料：</th>
							<td colspan="3">
								 <div class="box">
									<input type="text" name="annexText" id="annexText" class="file_textbox" />
									<a href="javascript:void(0);" class="upload_link">上传</a>
									<input type="file" class="uploadFile" name="annexFile"  id="annexFile" onchange="getFile(this)"/>
								</div>         
							</td>
						</tr>
						<tr>
						    <th style="text-align: right;" >移除原因：</th>
						    <td colspan="3"><textarea style="width: 300px;height:50px" cols="40" rows="5" name="remove_reason" id="remove_reason"></textarea></td>
						</tr>
	                </table>
			<table width="100%" border="0" cellpadding="5" cellspacing="2">
				<tr>
					<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
						<button type="button" class="btn btn-mini btn-primary" onclick="toAdd();">提交</button>&nbsp;&nbsp;&nbsp;
						<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					</td>
				</tr>
			</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="<%=basePath%>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
</body>
</html>