<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=basePath %>static/css/demo.css" type="text/css">
<link rel="stylesheet" href="<%=basePath %>static/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="<%=basePath %>static/js/jquery.ztree.core.js"></script>
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
function addGroup(){
	$('#addGroup').modal();
}
function addMember(){
	$('#member').modal();
}
function showInfo(){
	$('#infoSpan').html("点击“建表”之后，分组的字段不可再编辑！");
}
function hideInfo(){
	$('#infoSpan').html("");
}
function addTable(){
	$('#addTable').hide();
	$('#ziduan').html("字段详细信息");
}
function addZiDuan(){
	var innerTD = "<tr>"+
		"<td class='center'>Add_1</td>"+
		"<td class='center'>新增字段</td>"+
		"<td class='center'>字符串</td>"+
		"<td class='center'>50</td>"+
		"<td class='center'>文本框</td>"+
	"</tr>";
	$(innerTD).appendTo("#zdtable");
	$('html').scrollTop( $('html').height() );
}
function deleteZiDuan(){
	$('#zdtable tr:last').remove();
}

var setting = {
		data: {
			key: {
				title:"t"
			},
			simpleData: {
				enable: true
			}
		},
		callback: {
			onClick: onClick
		}
	};

	var zNodes =[
		{ id:1, pId:0, name:"分组列表",open:true},
		{ id:21, pId:1, name:"车辆类型"},
		{ id:22, pId:1, name:"区域"},
	];

	function onClick(event, treeId, treeNode, clickFlag) {
		if(treeNode.pId == 1){
			$("#parentList").show();
			$("#childList").hide();
		}else if(treeNode.pId == 2){
			$("#childList").show();
			$("#parentList").hide();
		}
	}		

	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	});
</script>
</head>
<body>
	<div class="panel-body">
		<div class="page-header">
			<h1 style="font-size:15px;">
				信用管理
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					分组管理
				</small>
			</h1>
		</div>
		<div>
			<table border='0' style="margin-top: 0px">
				<tbody>
					<tr>
						<td>
							<button type="button" class='btn btn-info' onclick='addGroup()'>增加</button>
							<button type="button" class='btn btn-success' onclick=''>修改</button>
							<button type="button" class='btn btn-danger' onclick=''>删除</button>
						</td>
					</tr>
				</tbody>
			</table>
			<table border='1' width="100%" style="margin-top: 0px">
                <tbody>
					<tr>
						<td width="25%">
							<div class="zTreeDemoBackground left">
								<ul id="treeDemo" class="ztree"></ul>
							</div>
						</td>
						<td>
							<div>
								<table style="margin-bottom: 0px;" class="table table-striped table-bordered table-hover">
									<tbody>
										<tr>
											<td colspan="4">分组详细信息&nbsp;&nbsp;
												<button id="addTable" type="button" class='btn btn-info' onmouseover="showInfo()" onmouseout="hideInfo()" onclick='addTable()'>建表</button>&nbsp;
												<button type="button" class='btn btn-info' onclick=''>启用</button>&nbsp;
												<button type="button" class='btn btn-info' onclick=''>停用</button>&nbsp;
												<button type="button" class='btn btn-info' onclick='addMember()'>成员管理</button>
												<span id="infoSpan" style="color:red;"></span>
											</td>
										</tr>
										<tr>
											<td><p id="fontStyle">分组名称：</p></td>
											<td><p id="fontStyle">车辆类型</p></td>
											<td><p id="fontStyle">状态：</p></td>
											<td><p id="fontStyle">停用</p></td>
										</tr>
										<tr>
											<td><p id="fontStyle">分组编码：</p></td>
											<td><p id="fontStyle">A001</p></td>
											<td><p id="fontStyle">表描述：</p></td>
											<td><p id="fontStyle">车辆类型</p></td>
										</tr>
										<tr>	
											<td><p id="fontStyle">表名称：</p></td>
											<td><p id="fontStyle">CAR_TYPE</p></td>
											<td><p id="fontStyle">创建时间：</p></td>
											<td><p id="fontStyle">2016-06-17 13:20:22</p></td>
										</tr>
										<tr>	
											<td><p id="fontStyle">创建人：</p></td>
											<td><p id="fontStyle">admin</p></td>
											<td><p id="fontStyle"></p></td>
											<td><p id="fontStyle"></p></td>
										</tr>
									</tbody>
			   					</table>
			   					<table id="zdtable" class="table table-striped table-bordered table-hover">
									<tbody>
										<tr>
											<td id="ziduan" colspan="5">字段详细信息&nbsp;&nbsp;
												<button type="button" class='btn btn-info' onclick='addZiDuan()'>增加</button>&nbsp;
												<button type="button" class='btn btn-info' onclick=''>修改</button>&nbsp;
												<button type="button" class='btn btn-info' onclick='deleteZiDuan()'>删除</button>
											</td>
										</tr>
										<tr>
											<th class='center'>字段名称</th>
											<th class='center'>字段描述</th>
											<th class='center'>字段类型</th>
											<th class='center'>字段长度</th>
											<th class='center'>字段显示类型</th>
										</tr>
										<tr>
											<td class="center">NODE_ID</td>
											<td class="center">编码</td>
											<td class="center">字符串</td>
											<td class="center">50</td>
											<td class="center">文本框</td>
										</tr>
										<tr>
											<td class="center">PARENT_ID</td>
											<td class="center">父级编码</td>
											<td class="center">字符串</td>
											<td class="center">50</td>
											<td class="center">文本框</td>
										</tr>
										<tr>
											<td class="center">NODE_DESC</td>
											<td class="center">名称</td>
											<td class="center">字符串</td>
											<td class="center">50</td>
											<td class="center">文本框</td>
										</tr>
										<tr>
											<td class="center">CREATE_TIME</td>
											<td class="center">创建时间</td>
											<td class="center">字符串</td>
											<td class="center">50</td>
											<td class="center">文本框</td>
										</tr>
									</tbody>
			   					</table>
							</div>
						</td>
					</tr>
				</tbody>
             </table>
		</div>
	</div>
	<div class="modal fade" id="addGroup" style="display:none;width:1000px;margin-left:-500px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						添加分组：
					</h4>
				</div>
				<div class="modal-body" style="height:500px">
					<table width="60%" class="table table-striped table-bordered table-hover">
			             <tr>
						    <td align="right">分组名称：</td>
						    <td><input  class="form-control" size="30" name="name" id="name" value="" type="text"/></td>
						 </tr>
			             <tr>
						    <td align="right">表名称：</td>
						    <td><input  class="form-control" size="30" name="name" id="name"  type="text"/></td>
						 </tr>
			             <tr>
						    <td align="right">表描述：</td>
						    <td><input  class="form-control" size="30" name="name" id="name"  type="text"/></td>
						 </tr>
					</table>
   					<table class="table table-striped table-bordered table-hover">
						<tbody>
							<tr>
								<td>添加字段：</td>
								<td colspan="5" style="text-align:right">
							     	<button type="button" class='btn btn-default btn-info' onclick='submit()'>增加</button>
							     </td>
							</tr>
							<tr>
								<th class='center'>字段名称</th>
								<th class='center'>字段描述</th>
								<th class='center'>字段类型</th>
								<th class='center'>字段长度</th>
								<th class='center'>字段显示类型</th>
								<th class='center'>操作</th>
							</tr>
							<tr>
								<td class="center">NODE_ID</td>
								<td class="center">编码</td>
								<td class="center">字符串</td>
								<td class="center">50</td>
								<td class="center">文本框</td>
								<td class="center"><a>删除</a></td>
							</tr>
							<tr>
								<td class="center">PARENT_ID</td>
								<td class="center">父级编码</td>
								<td class="center">字符串</td>
								<td class="center">50</td>
								<td class="center">文本框</td>
								<td class="center"><a>删除</a></td>
							</tr>
							<tr>
								<td class="center">NODE_DESC</td>
								<td class="center">名称</td>
								<td class="center">字符串</td>
								<td class="center">50</td>
								<td class="center">文本框</td>
								<td class="center"><a>删除</a></td>
							</tr>
							<tr>
								<td class="center">CREATE_TIME</td>
								<td class="center">创建时间</td>
								<td class="center">字符串</td>
								<td class="center">50</td>
								<td class="center">文本框</td>
								<td class="center"><a>删除</a></td>
							</tr>
							<tr>
								<td colspan="6" style="text-align:center">
							     	<button type="button" class='btn btn-default btn-info' onclick='submit()'>确定</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							     	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
							     </td>
							</tr>
						</tbody>
   					</table>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	<div class="modal fade" id="member" style="display:none;width:1000px;margin-left:-500px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						成员管理：
					</h4>
				</div>
				<div class="modal-body" style="height:500px">
   					<table class="table table-striped table-bordered table-hover">
						<tbody>
							<tr>
								<td colspan="7">成员列表：</td>
							</tr>
							<tr>
								<th class='center'>编码</th>
								<th class='center'>上级编码</th>
								<th class='center'>名称</th>
								<th class='center'>创建人</th>
								<th class='center'>创建时间</th>
								<th class='center'>状态</th>
								<th class='center'>操作</th>
							</tr>
							<tr>
								<td class="center">100010</td>
								<td class="center">100000</td>
								<td class="center">小型轿车</td>
								<td class="center">admin</td>
								<td class="center">2016-06-20</td>
								<td class="center">启用</td>
								<td class="center">
									<a>修改</a>
									<a>删除</a>
								</td>
							</tr>
							<tr>
								<td class="center">100020</td>
								<td class="center">100000</td>
								<td class="center">中型车</td>
								<td class="center">admin</td>
								<td class="center">2016-06-20</td>
								<td class="center">启用</td>
								<td class="center">
									<a>修改</a>
									<a>删除</a>
								</td>
							</tr>
							<tr>
								<td class="center">100030</td>
								<td class="center">100000</td>
								<td class="center">小型货车</td>
								<td class="center">admin</td>
								<td class="center">2016-06-20</td>
								<td class="center">未启用</td>
								<td class="center">
									<a>修改</a>
									<a>删除</a>
								</td>
							</tr>
						</tbody>
   					</table>
   					<table width="60%" class="table table-striped table-bordered table-hover">
			             <tr>
						    <td align="right">编码：</td>
						    <td><input  class="form-control" size="30" name="name" id="name" value="" type="text"/></td>
						 </tr>
			             <tr>
						    <td align="right">上级编码：</td>
						    <td><input  class="form-control" size="30" name="name" id="name"  type="text"/></td>
						 </tr>
			             <tr>
						    <td align="right">名称：</td>
						    <td><input  class="form-control" size="30" name="name" id="name"  type="text"/></td>
						 </tr>
			             <tr>
						    <td align="right"></td>
						    <td><button type="button" class='btn btn-default btn-info' onclick='submit()'>添加</button></td>
						 </tr>
						 <tr>
							<td colspan="2" style="text-align:center">
						     	<button type="button" class='btn btn-default btn-info' onclick='submit()'>提交</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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