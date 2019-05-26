<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<title>违规行为判定</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
 #fontStyle{
 	size:20px;
 	padding-left:20px
 	
 }
 /* a:hover{color:white;text-decoration:none;}
 table{border-collapse:separate;} */
</style>
<script type="text/javascript">
function search(){
	alert("search");
}
function add(){
	/* //window.open("getPilotApply.action","newwindow","height=500,width=400,toolbar=no,scrollbars=no");
	$('#details').modal();
	$('#examInfo').show(); */
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="新增违规信息";
	 diag.URL = '<%=basePath%>supervise/illegalBehaviorAdd.action';
	 diag.Width = 450;
	 diag.Height = 500;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
function dispose(){
	$("#handleBtn").css('display','');
	$('#examInfo').show();
	$('#detailList').hide();
	$('#details').modal();
}
function test(){
	$("#validate1").html('已通过'); 
}
function validate1(){
	$("#validate1").html('验证中'); 
	setTimeout(test,6000);
}
function validate2(){
	$("#validate2").html('验证中'); 
}
function del(){
	alert("删除信息");
}
</script>
</head>
<body>
	<div class="panel-body">
		<div class="page-header">
			<h1 style="font-size:15px;">
				营运稽查
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					违规行为判定
				</small>
			</h1>
		</div>
		
	<!-- 	<table border='0' style="margin-top: 0px">
			<tbody>
				<tr>
					<td><p id="fontStyle">根据条件查询：</p></td>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="违规名称" />
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
                    <div class="form-group" style="margin-top: 15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">违规名称</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="vehicle_no" placeholder="违规名称"/>
                        </div>
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:10px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
		<div id="toolbar" style="padding-left: 15px" align="right">
			&nbsp;<!-- <a class="btn btn-small btn-success" onclick="add();">新增</a> -->
					<button type="button" class="btn btn-default" onclick="add()"><span class="glyphicon glyphicon-plus"></span>新增</button>
   		</div>
   		<!-- <br> -->
		<table id="tradeList" class="table table-striped table-bordered table-hover">
			<thead>
				<tr align="center">
					<th class="center"  style="width: 50px;">序号</th>
					<th class='center'>名称</th>
					<th class='center'>违规行为</th>
					<th class='center'>违规量</th>
					<th class='center'>添加人</th>
					<th class='center'>添加时间</th>
					<th class='center'>操作</th>
				</tr>
			</thead>
			<tr align="center" style="width:20px;">
				<td class="center">1</td>
				<td class="center">天安门聚集车辆</td>
				<td class="center">非法聚集</td>
				<td class="center">30</td>
				<td class="center">赵凯</td>
				<td class="center">2016-11-02 12:14:35</td>
				<td class="center">
				<!--     <button type="button" class='btn btn-mini btn-info' onclick='update()'>修改</button>&nbsp;
					<button type="button" class='btn btn-mini btn-warning' onclick='del()'>删除</button>&nbsp; -->
					<button type="button" class="btn btn-default" onclick='update()'><span class="glyphicon glyphicon-edit"></span>修改</button>&nbsp;
					<button type="button" class="btn btn-default" onclick='del()'><span class="glyphicon glyphicon-remove"></span>删除</button>
				</td>
			</tr>
			<tr align="center">
				<td class="center">2</td>
				<td class="center">周投诉量</td>
				<td class="center">投诉量</td>
				<td class="center">5</td>
				<td class="center">李峰</td>
				<td class="center">2016-11-02 12:14:35</td>
				<td class="center">
					<!-- <button type="button" class='btn btn-mini btn-info' onclick='update()'>修改</button>&nbsp;
					<button type="button" class='btn btn-mini btn-warning' onclick='del()'>删除</button>&nbsp; -->
					<button type="button" class='btn btn-default' onclick='update()'><span class='glyphicon glyphicon-edit'></span>修改</button>&nbsp;
					<button type="button" class='btn btn-default' onclick='del()'><span class='glyphicon glyphicon-remove'></span>删除</button>
				</td>
   		</table>
	</div>
	
	<div class="modal fade" id="details" style="display:none;width:1000px;margin-left:-500px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						违规行为判定添加
					</h4>
				</div>
				<div class="modal-body" style="height:300px">
   					<table id="examInfo" class="table table-striped table-bordered table-hover hidden">
						<tbody>
							<tr>	
								<td>名称：</td>
								<td><input type="text" value="" placeholder="名称" /></td>
							</tr>
							<tr>	
								<td>违规行为：</td>
								<td><select placeholder="违规行为">
			               				<option value="">&nbsp;非法聚集</option>
			               				<option value="">&nbsp;投诉量</option>
			                        </select></td>
							</tr>
								<tr>	
								<td>违规量：</td>
								<td><input type="text" value="" placeholder="违规量" /></td>
							</tr>
						</tbody>
   					</table>
				</div>
				<div class="modal-footer">
					<button id="handleBtn" type="button" class="btn btn-primary">添加</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	
</body>
</html>