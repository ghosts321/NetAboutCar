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

</script>

</head>
<body>
<div class="container">
<form action="<%=basePath %>pilotApply/authentication.action" name="form1" id="form1" method="post" >
		<div id="zhongxin">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>修改时间</th>
					<th>修改人</th>
					<th>修改字段</th>
					<th>修改内容（修改之前）</th>
					<th>修改内容（修改之后）</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>2017-3-11 12:23:10</td>
					<td>张三</td>
					<td>案件承办人</td>
					<td>张三</td>
					<td>李四</td>
				</tr>
				<tr>
					<td>2017-3-12 12:23:10</td>
					<td>李四</td>
					<td>案件状态</td>
					<td>调查取证</td>
					<td>受理</td>
				</tr>
				<tr>
					<td>2017-3-12 15:30:18</td>
					<td>李四</td>
					<td>处罚决定</td>
					<td>罚款款1000元</td>
					<td>罚款10000元</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5" style="text-align: center; padding-top: 15px;padding-bottom: 5px;">
						<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
					</td>
				</tr>
			</tfoot>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
</body>
</html>