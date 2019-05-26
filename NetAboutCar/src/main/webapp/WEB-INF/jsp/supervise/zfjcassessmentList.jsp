<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<title>诚信考核查询</title>
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
function add(){
	/* //window.open("getPilotApply.action","newwindow","height=500,width=400,toolbar=no,scrollbars=no");
	$('#details').modal();
	$('#examInfo').show(); */
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="诚信考核查询";
	 diag.URL = '<%=basePath%>supervise/enforceLawAdd.action';
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
				违规信息查询
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					诚信考核查询
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
                <!-- <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top: 15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="vehicle_no">车牌号</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="vehicle_no" placeholder="请输入车牌号"/>
                        </div>
                        <div class="col-sm-2" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:10px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form> -->
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">驾驶员姓名</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input class="form-control"  type="text" id="driverName" name="driverName" value=""/>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">行政区域</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input class="form-control"  type="text" id="regionName" name="regionName" value=""/>
                        </div>
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
                        </div>
                        
                    </div>
                </form>
            </div>
        </div>
		<div id="toolbar" style="padding-left: 15px" align="right">
			&nbsp;<!-- <a class="btn btn-small btn-success" onclick="add();">录入</a> -->
   					<button type="button" class="btn btn-default" onclick="add()"><span class="glyphicon glyphicon-edit"></span>录入</button>
   			</div>
   		<!-- <br> -->
		<table id="tradeList" class="table table-striped table-bordered table-hover">
			<thead>
				<tr align="center">
					<th class="center"  style="width: 50px;">序号</th>
					<th class='center'>车牌号</th>
					<th class='center'>违规行为</th>
					<th class='center'>违规时间</th>
					<th class='center'>操作人</th>
					<th class='center'>操作时间</th>
					<th class='center'>操作</th>
				</tr>
			</thead>
			<tr align="center">
				<td class="center">1</td>
				<td class="center">京AF·U4620</td>
				<td class="center">违规停车</td>
				<td class="center">2016-11-02 08:48:20</td>
				<td class="center">赵凯</td>
				<td class="center">2016-11-02 12:14:35</td>
				<td class="center">
					<button type="button" class='btn btn-default' onclick='del()'><span class='glyphicon glyphicon-remove'></span>删除</button>&nbsp;
				</td>
			</tr>
			<tr align="center">
				<td class="center">2</td>
				<td class="center">津KA·N7011</td>
				<td class="center">违规停车</td>
				<td class="center">2016-11-02 08:48:20</td>
				<td class="center">赵</td>
				<td class="center">2016-11-02 12:14:35</td>
				<td class="center">
					<button type="button" class='btn btn-default' onclick='del()'><span class='glyphicon glyphicon-remove'></span>删除</button>&nbsp;
				</td>
			</tr>
			<tr align="center">
				<td class="center">3</td>
				<td class="center">京UF·C5650</td>
				<td class="center">违规停车</td>
				<td class="center">2016-11-02 08:48:20</td>
				<td class="center">赵凯</td>
				<td class="center">2016-11-02 12:14:35</td>
				<td class="center">
					<button type="button" class='btn btn-default' onclick='del()'><span class='glyphicon glyphicon-remove'></span>删除</button>&nbsp;
				</td>
			</tr>
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
						执法信息录入
					</h4>
				</div>
				<div class="modal-body" style="height:300px">
   					<table id="examInfo" class="table table-striped table-bordered table-hover hidden">
						<tbody>
							<tr>	
								<td>车牌号：</td>
								<td><input type="text" value="" placeholder="车牌号" /></td>
							</tr>
							<tr>	
								<td>违规行为：</td>
								<td><select placeholder="违规行为">
			               				<option value="">&nbsp;违章停车</option>
			               				<option value="">&nbsp;非法聚集</option>
			                        </select></td>
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