<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
//保存
function save(){
	$("#menuInfoForm").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}
</script>
	</head>
<body>
<div class="container">
	<form class="form-horizontal" action="addMenu.action" name="menuInfoForm" id="menuInfoForm" method="post">
		<div id="zhongxin">
		<table >
			<tr>
				<td style="width:30%;text-align: right;">菜单名称:</td>
				<td><input type="text" name="menuName" id="menuName"  maxlength="32" placeholder="这里输入菜单名称" /></td>
			</tr>
			<tr>
				<td style="width:30%;text-align: right;">菜单链接:</td>
				<td><input type="text" name="menuUrl" id="menuUrl" maxlength="32" placeholder="这里输入菜单链接" title="菜单链接"/>
				</td>
			</tr>
			<tr>
				<td style="width:30%;text-align: right;">父节点:</td>
				<td><input type="text" name="parentId" id="parentId" maxlength="32" placeholder="这里输入父节点" title="父节点"/>
				</td>
			</tr>
			<tr>
				<td style="width:30%;text-align: right;">菜单级别:</td>
				<td><input type="text" name="menuLevel" id="menuLevel" maxlength="32" placeholder="这里输入菜单级别" title="菜单级别"/>
				</td>
			</tr>
			 <tr>
				<td style="width:30%;text-align: right;">是否叶节点:</td>
				<td>
					<div class="radio radio-info radio-inline" style="float:left">
					      <input type="radio" name="isLeaf" id="isLeaf" value="1" checked>
					      <label for="inlineRadio1">是</label>
					  </div>
					  <div class="radio radio-inline" style="float:left">
					      <input type="radio" name="isLeaf" id="isLeaf" value="0">
					      <label for="inlineRadio2">否</label>
					  </div>
				</td>
			</tr>
			<tr>
				<td style="width:30%;text-align: right;">菜单说明:</td>
				<td>
				
				<textarea name="description" id="description"></textarea>
				</td>
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