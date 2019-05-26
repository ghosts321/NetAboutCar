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
	<div class="panel-body">
		<div class="page-header">
			<h1 style="font-size:15px;">
				身份验证系统
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					平台资质信息
				</small>
			</h1>
		</div>
		
		<!-- <table border='0' style="margin-top: 0px">
			<tbody>
				<tr>
					<td><p id="fontStyle">根据条件查询：</p></td>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="平台名称" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
				</tr>
			</tbody>
		</table> -->
		<div class="panel panel-default">
			<div class="panel-body">
				<span class="title">查询条件</span>
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top:15px">
						<label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">平台名称</label>
						<div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" class="form-control"  id="nav-search-input" name="USERNAME" value=""/>
                        </div>
                         <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
                        </div>
					</div>
				</form>
			</div>
		</div>
		<table id="table_report" class="table table-striped table-bordered table-hover" >
			<thead>
				<tr align="center"> 
					<td class="center"  style="width: 50px;">序号</th>
					<td class='center'>企业名称</th>
					<td class='center'>社会信用代码号</th>
					<td class='center'>法人代表姓名</th>
					<td class='center'>法人身份证</th>
					<td class='center'>手机号</th>
					<td class='center'>状态</th>
					<td class='center'>注册地</th>
				</tr>
			</thead>
			<tr align="center">
				<td class="center">1</td>
				<td class="center">和平旅游客车服务有限公司</td>
				<td class="center">127810WDBGP57B6PB</td>
				<td class="center">张久远</td>
				<td class="center">130421199003292342</td>
				<td class="center">13408453929</td>
				<td id="validate1" class="center">正常</td>
				<td class="center">本地</td>
			</tr>
			<tr align="center">
				<td class="center">2</td>
				<td class="center">中国六建天津项目部</td>
				<td class="center">WDBG127810P57B6PB</td>
				<td class="center">王亚云</td>
				<td class="center">421199003291302342</td>
				<td class="center">18453929340</td>
				<td id="validate" class="center">吊销</td>
				<td class="center">外地</td>
			</tr>
   		</table>
	</div>
	
</body>
</html>