<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
select,textarea{
	margin-top: 4px;
	margin-bottom: 4px;
}
textarea{
  width: 222px;
}
</style>
<script type="text/javascript">


	//保存
	function save(){
		$("#userInfoForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
</script>
</head>
<body>
<div class="container">
	<form action="updateUser.action" name="userInfoForm" id="userInfoForm" method="post">
		<input type="hidden"  id="certno" name="certno" value="${certno}">
		<div id="zhongxin" align="center" style="padding-top: 30px">
		<table>
			<tr>
				<td style="width:30%;text-align: right;">原始密码:</td>
				<td align="left"><input type="password" class="form-control" name="password" id="password" value="" minlength="6" /></td>
			</tr>
			<tr>
				<td style="width:30%;text-align: right;">新密码:</td>
				<td align="left"><input class="form-control" type="password" name="newPwd" id="newPwd" value="" maxlength="32" title="新密码"/></td>
			</tr>
			<tr>
				<td style="width:30%;text-align: right;">确认密码:</td>
				<td align="left"><input class="form-control" type="password" name="comfirmPwd" id="comfirmPwd" value="" maxlength="32" placeholder="这里输确认密码" title="真实姓名"/></td>
			</tr>
		
			<tr>
				<td colspan="2" style="text-align: center; padding-top: 25px;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="<%=basePath %>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
</div>
</body>
</html>