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
	$('#details').modal();
}
</script>
</head>
<body>
	<div class="panel-body">
		<div class="page-header">
			<h1 style="font-size:15px;">
				信用管理
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					驾驶员诚信管理
				</small>
			</h1>
		</div>
		
		<!-- <table border='0' style="margin-top: 0px">
			<tbody>
				<tr>
					<td><p id="fontStyle">根据条件查询：</p></td>
					<td>
						<span>姓名：</span>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="姓名" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
						<span>从业资格证号：</span>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="从业资格证号" />
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
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">姓名</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" id="userName" name="userName" value="" class="form-control" />
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">从业资格证号</label>
                       <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" id="userName" name="userName" value="" class="form-control" />
                        </div>
                        <div class="col-sm-3" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
		<table id="tradeList" class="table table-striped table-bordered table-hover" width="420">
			<thead>
				<tr align="center">
					<td class="center"  style="width: 50px;"><strong>序号</strong></th>
					<td class='center'><strong>姓名</strong></th>
					<td class='center'><strong>从业资格证号码</strong></th>
					<td class='center'><strong>服务单位名称</strong></th>
					<td class='center'><strong>发证机关</strong></th>
					<td class='center'><strong>诚信等级</strong></th>
					<td class='center'><strong>操作</strong></th>
				</tr>
			</thead>
			<tr align="center">
				<td class="center">1</td>
				<td class="center">刘扥</td>
				<td class="center">DFC3454264</td>
				<td class="center">滴滴出行</td>
				<td class="center">交警支队</td>
				<td class="center">AAAA</td>
				<td class="center">
					<!-- <button type="button" class='btn btn-mini btn-info' onclick='showDetail()'>详细</button> -->
					<button type="button" class='btn btn-mini btn-default' onclick='showDetail()'><span class='glyphicon glyphicon-list-alt'></span>详细</button>
				</td>
			</tr>
			<tr align="center">
				<td class="center">2</td>
				<td class="center">范文娇</td>
				<td class="center">SX2634544</td>
				<td class="center">滴滴出行</td>
				<td class="center">交警支队</td>
				<td class="center">AAAA</td>
				<td class="center">
					<!-- <button type="button" class='btn btn-mini btn-info' onclick='showDetail()'>详细</button> -->
					<button type="button" class='btn btn-mini btn-default' onclick='showDetail()'><span class='glyphicon glyphicon-list-alt'></span>详细</button>
				</td>
			</tr>
   		</table>
	</div>
	<div class="modal fade" id="details" style="display:none;width:1000px;margin-left:0px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						详细信息：
					</h4>
				</div>
				<div class="modal-body" style="height:320px">
					<div id="detailList">
						<table class="table table-striped table-bordered table-hover">
							<thead><p style="font-size:16px;font-weight: lighter">驾驶员基本信息：</p></thead>
							<tbody>
								<tr>
									<td><p id="fontStyle">姓名：范文娇</p></td>
									<td><p id="fontStyle">从业资格号码：SX2634544</p></td>
								</tr>
								<tr>
									<td><p id="fontStyle">服务单位名称：滴滴出行</p></td>
									<td><p id="fontStyle">发证机关：交警支队</p></td>
								</tr>
							</tbody>
	   					</table>
	   					<table class="table table-striped table-bordered table-hover">
	   						<thead><p style="font-size:16px;font-weight: lighter">历年诚信档案信息：</p></thead>
							<thead>
								<tr>
									<th class="center"  style="width: 50px;">序号</th>
									<th class='center'>评价周期</th>
									<th class='center'>累计分值</th>
									<th class='center'>评价等级</th>
								</tr>
							</thead>
							<tr>
								<td class="center"></td>
								<td class="center"></td>
								<td class="center"></td>
								<td class="center"></td>
							</tr>
	   					</table>
	   					<table class="table table-striped table-bordered table-hover">
	   						<thead><p style="font-size:16px;font-weight: lighter">本年度诚信计分明细：</p></thead>
							<thead>
								<tr align="center">
									<td class="center"  style="width: 50px;">序号</th>
									<td class='center'>季度</th>
									<td class='center'>评价指标</th>
									<td class='center'>计分分值</th>
									<td class='center'>违法时间</th>
									<td class='center'>记录单位</th>
									<td class='center'>处罚单位</th>
								</tr>
							</thead>
							<tr>
								<td class="center"></td>
								<td class="center"></td>
								<td class="center"></td>
								<td class="center"></td>
								<td class="center"></td>
								<td class="center"></td>
								<td class="center"></td>
							</tr>
	   					</table>
   					</div>
				</div>
				<div class="modal-footer">
					<p align="center"><button type="button" style="background:red;color: white" class="btn btn-default" data-dismiss="modal">关闭</button></p>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
</body>
</html>