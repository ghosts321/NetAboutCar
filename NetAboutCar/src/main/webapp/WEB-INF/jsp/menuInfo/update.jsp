<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<script type="text/javascript">
function update(){
	$("#menuInfoForm").submit();
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
<body>
<div class="container">
	<form action="updateMenu.action" name="menuInfoForm" id="menuInfoForm" method="post">
		<input type="hidden" id="menuId" name="menuId" value="${menuInfo.menuId}">
		<div id="zhongxin">
		<table>
			<tr>
				<td style="width:30%;text-align: right;">菜单名称:</td>
				<td><input type="text" name="menuName" id="menuName" value="${menuInfo.menuName}" maxlength="32" title="用户名不可修改"/></td>
			</tr>
			<tr>
				<td style="width:30%;text-align: right;">菜单链接:</td>
				<td><input type="text" name="menuUrl" id="menuUrl" value="${menuInfo.menuUrl}" maxlength="32" placeholder="这里输入真实姓名" title="真实姓名"/></td>
			</tr>
			<tr>
				<td style="width:30%;text-align: right;">父节点:</td>
				<td><input type="text" name="parentId" id="parentId" value="${menuInfo.parentId}" maxlength="32" placeholder="这里输入父节点" title="父节点"/>
				</td>
			</tr>
			<tr>
				<td style="width:30%;text-align: right;">菜单级别:</td>
				<td><input type="text" name="menuLevel" id="menuLevel" value="${menuInfo.menuLevel}" maxlength="32" placeholder="这里输入父节点" title="父节点"/>
				</td>
			</tr>
			 <tr>
				<td style="width:30%;text-align: right;">否叶节点:</td>
				<td>
					<div class="radio radio-info radio-inline" style="float:left">
					      <input type="radio" name="isLeaf" id="isLeaf" value="1">
					      <label for="inlineRadio1">是</label>
					  </div>
					  <div class="radio radio-inline" style="float:left">
					      <input type="radio" name="isLeaf" id="isLeaf" value="2">
					      <label for="inlineRadio2">否</label>
					  </div>
				</td>
			</tr>
			<tr>
				<td style="width:30%;text-align: right;">菜单说明:</td>
				<td><textarea name="description" id="description">${menuInfo.description}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: left; padding-left:50px; padding-top: 10px;">
					<a class="btn btn-mini btn-primary" onclick="update();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="<%=basePath %>static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
	</form>
</div>
<script type="text/javascript">
//初始化节点
var leaf = ${menuInfo.isLeaf};
if(leaf == 1){
	$('input[name=isLeaf]').get(0).checked = true;
}else{
	$('input[name=isLeaf]').get(1).checked = true;
}
</script>
</body>
</html>