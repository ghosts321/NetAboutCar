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
</script>
</head>
<body>
	<div class="page-content">
		<div class="page-header">
			<h1 style="font-size:25px;font-weight: lighter;color: #2679b5">
				身份验证系统
				<small style="font-size: 19px">
					<i class="icon-double-angle-right"></i>
					车辆资格验证
				</small>
			</h1>
		</div>
		
		<table border='0' style="margin-top: 0px">
			<tbody>
				<tr>
					<td><p id="fontStyle">根据条件查询：</p></td>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="车牌号" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
				</tr>
			</tbody>
		</table>
		<table id="table_report" class="table table-striped table-bordered table-hover" >
			<thead>
				<tr>
					<th class="center"  style="width: 50px;">序号</th>
					<th class='center'>网约车驾驶员证号</th>
					<th class='center'>车牌号</th>
					<th class='center'>发动机号</th>
					<th class='center'>行驶证初次登记</th>
					<th class='center'>车主姓名</th>
					<th class='center'>身份证号</th>
					<th class='center'>审核状态</th>
					<th class='center'>来源</th>
					<th class='center'>操作</th>
				</tr>
			</thead>
			<tr>
				<td class="center">1</td>
				<td class="center">127810WDBGP57B6PB</td>
				<td class="center">沪KR9888</td>
				<td class="center">C198C8998</td>
				<td class="center">2011-03-29</td>
				<td class="center">张久远</td>
				<td class="center">130421199003292342</td>
				<td id="validate1" class="center">未验证</td>
				<td class="center">个人</td>
				<td class="center">
					<button type="button" class='btn btn-mini btn-warning' onclick='showDetail()'>查看</button>&nbsp;
					<button type="button" class='btn btn-mini btn-danger' onclick='validate()'>人工确认</button>&nbsp;
				</td>
			</tr>
			<tr>
				<td class="center">2</td>
				<td class="center">BGP57B6PB127810WD</td>
				<td class="center">京AH8888</td>
				<td class="center">C659F7359</td>
				<td class="center">2013-11-09</td>
				<td class="center">刘海科 	</td>
				<td class="center">421199003292342130</td>
				<td class="center">已通过</td>
				<td class="center">个人</td>
				<td class="center">
					<button type="button" class='btn btn-mini btn-warning' onclick='showDetail()'>查看</button>&nbsp;
					<button type="button" class='btn btn-mini btn-danger' onclick='validate()'>人工确认</button>&nbsp;
				</td>
			</tr>
   		</table>
	</div>
	
</body>
</html>