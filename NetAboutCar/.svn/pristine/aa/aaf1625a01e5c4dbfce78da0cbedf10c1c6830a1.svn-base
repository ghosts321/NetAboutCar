<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
//保存
function save(){
	var roleName = $("#roleName").val();
	if(roleName == null || roleName == ""){
		alert("请输入角色名称!");
		return ;
	}
	var remark = $("#remark").val();
	if(remark == null || remark == ""){
		alert("请输入角色描述!");
		return ;
	}
	$("#roleInfoForm").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}
</script>
</head>
<body>
   <div class="container" style="margin-top:30px;">
    <form action="addRole.action" name="roleInfoForm" id="roleInfoForm" method="post">
    	<div id="zhongxin">
    	<table>
			<tr>
				<td style="width:30%;text-align: right;"><font color="red">*  </font>角色名称:</td>
				<td><input type="text" name="roleName" id="roleName" maxlength="32" placeholder="这里输入角色描述" title="角色名称"/></td>
			</tr>
			<tr>
				<td style="width:30%;text-align: right;"><font color="red">*  </font>角色描述:</td>
				<td><input type="text" name="remark" id="remark" maxlength="32" placeholder="这里输入角色描述" title="角色描述"/></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: left; padding-left:50px; padding-top: 10px;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="<%=basePath %>static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
    </form>
   </div>
</body>
</html>