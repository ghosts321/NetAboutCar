<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
 #fontStyle{
 	size:20px;
 	padding-left:20px
 }
 a:hover{color:white;text-decoration:none;}
 table{border-collapse:separate;}
</style>
<script type="text/javascript">
function search(){
	alert("search");
}
function planning(){
	window.location.href="<%=basePath %>exam/planningAdd.action";
}
</script>
</head>
<body>
	<div class="page-content">
		<div class="page-header">
			<h1 style="font-size:25px;font-weight: lighter;color: #2679b5">
				考试培训
				<small style="font-size: 19px">
					<i class="icon-double-angle-right"></i>
					考试计划管理
				</small>
			</h1>
		</div>
		
		<table border='0' style="margin-top: 0px;width:100%">
			<tbody>
				<tr>
					<td width="12%"><p id="fontStyle">根据条件查询：</p></td>
					<td width="10%">
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="考试科目" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td width="10%" style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
					<td align="right"><button class="btn btn-mini btn-danger" onclick="planning();">考试计划</button></td>
				</tr>
			</tbody>
		</table>
		<table id="tradeList" class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th class="center"  style="width: 50px;">序号</th>
					<th class='center'>考试科目</th>
					<th class='center'>考试地点</th>
					<th class='center'>考试时间</th>
					<th class='center'>可预约人数</th>
					<th class='center'>剩余可预约人数</th>
				</tr>
			</thead>
			<tr>
				<td class="center">1</td>
				<td class="center">科目二</td>
				<td class="center">北京市</td>
				<td class="center">2016-11-27</td>
				<td class="center">100</td>
				<td class="center">76</td>
			</tr>
   		</table>
	</div>
</body>
</html>