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
function showDetail(){
	//window.open("getPilotApply.action","newwindow","height=500,width=400,toolbar=no,scrollbars=no");
	$('#peixun').modal();
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
					培训人员管理
				</small>
			</h1>
		</div>
		
		<table border='0' style="margin-top: 0px">
			<tbody>
				<tr>
					<td><p id="fontStyle">根据条件查询：</p></td>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="姓名" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
				</tr>
			</tbody>
		</table>
		<table id="tradeList" class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th class="center"  style="width: 50px;">序号</th>
					<th class='center'>姓名</th>
					<th class='center'>从业资格证号码</th>
					<th class='center'>服务单位名称</th>
					<th class='center'>发证机关</th>
					<th class='center'>诚信等级</th>
					<th class='center'>状态</th>
				</tr>
			</thead>
			<tr>
				<td class="center">1</td>
				<td class="center">方虎可</td>
				<td class="center">DFC3454264</td>
				<td class="center">北京交通集团有限公司</td>
				<td class="center">交警支队</td>
				<td class="center">AAAA</td>
				<td class="center">待培训</td>
			</tr>
			<tr>
				<td class="center">2</td>
				<td class="center">屈荡</td>
				<td class="center">SX2634544</td>
				<td class="center">北京市第二公共汽车公司</td>
				<td class="center">交警支队</td>
				<td class="center">AAAA</td>
				<td class="center">待培训</td>
			</tr>
			<tr>
				<td class="center">3</td>
				<td class="center">刘健</td>
				<td class="center">BH2546344</td>
				<td class="center">北京市第二公共汽车公司</td>
				<td class="center">交警支队</td>
				<td class="center">AAA</td>
				<td class="center">待培训</td>
			</tr>
			<tr>
				<td class="center">4</td>
				<td class="center">孙志浩</td>
				<td class="center">NJ3424654</td>
				<td class="center">北京市第二公共汽车公司</td>
				<td class="center">交警支队</td>
				<td class="center">AAAA</td>
				<td class="center">待培训</td>
			</tr>
   		</table>
	</div>
</body>
</html>