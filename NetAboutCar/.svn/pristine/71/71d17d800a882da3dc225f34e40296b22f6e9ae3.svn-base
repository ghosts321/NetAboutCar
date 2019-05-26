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

//受理立案
function toRegister(id){
	document.drvcaseAppealPage.action="drvcaseAppealPage.action?id="+id;
	$("#drvcaseAppealPage").submit();
  
}
</script>

</head>
<body>
<div class="container">
<form name="drvcaseAppealPage" id="drvcaseAppealPage" method="post" >
<input type="hidden" id="caseid" name="caseid" value="${drvcaseappeal.caseid}" />

		<div id="zhongxin">
		<table border="1" class="table">
		    <tr>
		      <th colspan="4">申诉信息</th>
		    </tr>
			<tr>
				<th style="text-align: right;width: 100px;">申诉人：</th>
				<td style="width:200px;" colspan="3">${drvcaseappeal.appealuserid }</td>
			</tr>
			<tr>
				<th style="text-align: right;width: 100px;">申诉文件下载：</th>
				<td style="width:200px;" colspan="3"><button type="button" class="btn btn-mini btn-primary" >下载</button></td>
			</tr>
			<tr>
				<th style="text-align: right;width: 100px;">申诉内容：</th>
				<td style="width:200px;" colspan="3">${drvcaseappeal.appealcontent }</td>
			</tr>
			<tr>
				<th colspan="4">处罚决定</th>
			</tr>
			
			<tr height="30px">
				<th style="text-align: right;">处罚类型：</th>
				<td colspan="3" style="text-align: left;">
					<select name="punishtype" id="punishtype">
						<option value="0001" >口头警告</option>
						<option value="0002" >200元以下罚款</option>
						<option value="0003" >暂扣或吊销驾驶证</option>
					</select>				
				</td>
			</tr>
			<tr height="30px">
				<th style="text-align: right;">处罚内容：</th>
				<td colspan="3"><textarea name="punishcontent" id="punishcontent"></textarea></td>
			</tr>
			
			<tr>
				<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
					<button type="button" class="btn btn-mini btn-primary" value="1" onclick="toRegister('1');">申诉通过</button>
					<button type="button" class="btn btn-mini btn-primary" value="2" onclick="toRegister('2')">申诉不通过</button>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
				</td>
			</tr>
			
			<tr style="display:none;">
				<td>
					<%-- <input type="hidden" id=""caseId"" name="caseId" value="${plantCaseInfo.caseId}" /> --%>
					
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
</body>
</html>