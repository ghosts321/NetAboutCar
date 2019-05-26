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
function addModelGroup(){
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
					模型分类管理
				</small>
			</h1>
		</div>
		<!-- <table border='0' style="margin-top: 0px">
			<tbody>
				<tr>
					<td><p id="fontStyle">根据条件查询：</p></td>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="名称" />
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
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">名称</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" class="form-control"  id="nav-search-input" name="userName" value=""/>
                        </div>
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
		<table border='0' style="margin-top: 0px">
			<tbody>
				<tr>
					<td>
						<button type="button" class='btn btn-info' onclick='addModelGroup()'>增加</button>
						<button type="button" class='btn btn-success' onclick=''>修改</button>
						<button type="button" class='btn btn-danger' onclick=''>删除</button>
					</td>
				</tr>
			</tbody>
		</table>
		<table id="tradeList" class="table table-striped table-bordered table-hover">
			<thead>
				<tr align="center">
					<td class="center"  style="width: 50px;">序号</th>
					<td class='center'>编码</th>
					<td class='center'>分类名称</th>
					<td class='center'>描述</th>
				</tr>
			</thead>
			<tr align="center">
				<td class="center">1</td>
				<td class="center">30006</td>
				<td class="center">道路运输</td>
				<td class="center">道路运输分类</td>
			</tr>
			<tr align="center">
				<td class="center">2</td>
				<td class="center">30009</td>
				<td class="center">水路运输</td>
				<td class="center">水路运输模型分类</td>
			</tr>
			<tr align="center">
				<td class="center">3</td>
				<td class="center">300010</td>
				<td class="center">公路建设</td>
				<td class="center">公路建设模型分类</td>
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
						添加模型分类：
					</h4>
				</div>
				<div class="modal-body" style="height:300px">
					<table width="60%" class="table table-striped table-bordered table-hover">
			             <tr>
						    <td align="right">编码：</td>
						    <td><input  class="form-control" size="30" name="name" id="name" value="" type="text"/></td>
						 </tr>
			             <tr>
						    <td align="right">分类名称：</td>
						    <td><input  class="form-control" size="30" name="name" id="name"  type="text"/></td>
						 </tr>
			             <tr>
						    <td align="right">表描述：</td>
						    <td><textarea style="width:250px;height:50px;" name="mubiao"></textarea></td>
						 </tr>
						 <tr>
							<td colspan="2" style="text-align:center">
						     	<button type="button" class='btn btn-default btn-info' onclick='submit()'>确定</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						     	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						     </td>
						</tr>
					</table>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
</body>
</html>