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
<script type="text/javascript" src="jquery-1.4.2.min.js"></script>
<script type="text/javascript">
//补办
function doreissue(){
	$("#form1").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}
</script>

</head>
<body>
<div class="container">
<form action="<%=basePath %>pilotApply/doReissue.action" name="form1" id="form1" method="post" >
		<div id="zhongxin">
		<table border="1" class="table">
			<tr>
			    <th style="text-align: right;" >申请补办原因：</th>
			    <td colspan="3"><textarea style="width: 400px" cols="40" rows="2" name="reason" id="reason" >${drvMakeupapp.remark}</textarea></td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
					<input type="hidden" id="applyid" name="applyid" value="${drvMakeupapp.applyid}" />
					<input type="hidden" id="certno" name="certno" value="${drvMakeupapp.certno}" />
					<input type="hidden" id="status" name="status" value="3" />
					<button type="button" class="btn btn-mini btn-primary" onclick="doreissue();">补办</button>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="<%=basePath %>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
</body>
</html>