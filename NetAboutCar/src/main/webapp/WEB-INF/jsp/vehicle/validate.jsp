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
					车辆资质信息
				</small>
			</h1>
		</div>
		
		<!-- <table border='0' style="margin-top: 0px">
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
		</table> -->
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">车牌号</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input class="form-control" type="text" id="userName" name="userName" value="" />
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
					<td class='center'>网约车驾驶员证号</th>
					<td class='center'>车牌号</th>
					<td class='center'>发动机号</th>
					<td class='center'>行驶证初次登记</th>
					<td class='center'>车主姓名</th>
					<td class='center'>身份证号</th>
					<td class='center'>状态</th>
					<td class='center'>来源</th>
				</tr>
			</thead>
			<tr align="center">
				<td class="center">1</td>
				<td class="center">127810WDBGP57B6PB</td>
				<td class="center">沪KR9888</td>
				<td class="center">C198C8998</td>
				<td class="center">2011-03-29</td>
				<td class="center">张久远</td>
				<td class="center">130421199003292342</td>
				<td id="validate1" class="center">正常</td>
				<td class="center">个人</td>
			</tr>
			<tr align="center">
				<td class="center">2</td>
				<td class="center">BGP57B6PB127810WD</td>
				<td class="center">京AH8888</td>
				<td class="center">C659F7359</td>
				<td class="center">2013-11-09</td>
				<td class="center">刘海科 	</td>
				<td class="center">421199003292342130</td>
				<td class="center">吊销</td>
				<td class="center">个人</td>
			</tr>
   		</table>
	</div>
	
</body>
</html>