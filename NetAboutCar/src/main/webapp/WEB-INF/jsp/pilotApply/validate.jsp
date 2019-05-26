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
					驾驶员资质信息
				</small>
			</h1>
		</div>
		
		<!-- <table border='0' style="margin-top: 0px">
			<tbody>
				<tr>
					<td><p id="fontStyle">根据条件查询：</p></td>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="驾驶员姓名" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="资格证号" />
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
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">驾驶员姓名</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input class="form-control" type="text" id="userName" name="userName" value="" />
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">资格证号</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input class="form-control" type="text" id="comName" name="userName" value="" />
                        </div>
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
		<table id="tradeList" class="table table-striped table-bordered table-hover" >
			<thead>
				<tr>
					<td align="center"  style="width: 50px;" >序号</td>
					<td align='center'>姓名</td>
					<td align='center'>性别</td>
					<td align='center'>驾驶员资格证号</td>
					<td align='center'>手机号</td>
					<td align='center'>身份证号</td>
					<td align='center'>状态</td>
				</tr>
			</thead>
			<tr align="center">
				<td class="center">1</td>
				<td class="center">刘海科</td>
				<td class="center">男</td>
				<td class="center">127810WDBGP57B6PB</td>
				<td class="center">13923409845</td>
				<td class="center">130421199003292342</td>
				<td class="center">正常</td>
			</tr>
			<tr align="center">
				<td class="center">2</td>
				<td class="center">齐小燕</td>
				<td class="center">女</td>
				<td class="center">W127810DBGP57B6PB</td>
				<td class="center">18453923409</td>
				<td class="center">413021198902302329</td>
				<td class="center">正常</td>
			</tr>
			<tr align="center">
				<td class="center">3</td>
				<td class="center">赵凯</td>
				<td class="center">男</td>
				<td class="center">DBGP127810W57B6PB</td>
				<td class="center">13408453929</td>
				<td class="center">304121198309234232</td>
				<td class="center">吊销</td>
			</tr>
   		</table>
	</div>
	
</body>
</html>