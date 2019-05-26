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
<%-- <link rel="stylesheet" href="<%=basePath %>static/css/jqtree.css" type="text/css">
<script type="text/javascript" src="<%=basePath %>static/js/tree.jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>static/js/jquery.cookie.js"></script> --%>
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
function addIndicator(){
	//window.open("getPilotApply.action","newwindow","height=500,width=400,toolbar=no,scrollbars=no");
	$('#addIndicator').modal();
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
		{ id:1, pId:0, name:"道路运输",open:true},
		{ id:2, pId:1, name:"旅客运输",open:true},
		{ id:21, pId:2, name:"驾驶员取得从业资格证的比例"},
		{ id:22, pId:2, name:"经营违章违法率"},
		{ id:3, pId:1, name:"货物运输"},
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
		$.fn.zTree.init($("#treepoilt"), setting, zNodes);
		
		$("#indicatorType").change(function(){
			if($(this).val() == 0){
				$("#typeTable").show();
				$("#indicatorTable").hide();
			}else if($(this).val() == 1){
				$("#typeTable").hide();
				$("#indicatorTable").show();
			}
		});
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
					指标体系管理
				</small>
			</h1>
		</div>
		<div>
			<ul class="nav nav-tabs" role="tablist" id="myTab">
			  <li role="presentation" class="active"><a href="#platformInfo" aria-controls="platformInfo" role="tab" data-toggle="tab" onfocus="this.blur();">从业企业</a></li>
			  <li role="presentation"><a href="#pilotInfo" aria-controls="pilotInfo" role="tab" data-toggle="tab" onfocus="this.blur();">从业人员</a></li>
		  	</ul>
		  	<div class="tab-content">
				<div role="tabpanel" class="tab-pane fade in active" id="platformInfo">
					<table border='0' style="margin-top: 0px">
						<tbody>
							<tr>
								<td>
									<button type="button" class='btn btn-info' onclick='addIndicator()'>增加</button>
									<button type="button" class='btn btn-success' onclick=''>修改</button>
									<button type="button" class='btn btn-danger' onclick=''>删除</button>
								</td>
							</tr>
						</tbody>
					</table>
					<table border='1' width="100%" style="margin-top: 10px">
                        <tbody>
							<tr>
								<td width="25%">
									<div class="zTreeDemoBackground left">
										<ul id="treeDemo" class="ztree"></ul>
									</div>
								</td>
								<td>
									<table id="parentList" class="table table-striped table-bordered table-hover">
										<tbody>
											<tr>
												<td><p id="fontStyle">指标编码：</p></td>
												<td><p id="fontStyle">09001200</p></td>
											</tr>
											<tr>
												<td><p id="fontStyle">指标名称：</p></td>
												<td><p id="fontStyle">旅客运输</p></td>
											</tr>
											<tr>
												<td><p id="fontStyle">指标别名：</p></td>
												<td><p id="fontStyle">别名1</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">指标类型：</p></td>
												<td><p id="fontStyle">类型1</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">状态：</p></td>
												<td><p id="fontStyle">未启用</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">创建时间：</p></td>
												<td><p id="fontStyle">2016-06-15 10:50:30</p></td>
											</tr>
										</tbody>
							   		</table>
									<table id="childList" class="hidden table table-striped table-bordered table-hover">
										<tbody>
											<tr>
												<td><p id="fontStyle">上级指标：</p></td>
												<td><p id="fontStyle">旅客运输</p></td>
											</tr>
											<tr>
												<td><p id="fontStyle">指标名称：</p></td>
												<td><p id="fontStyle">驾驶员取得从业资格证的比例</p></td>
											</tr>
											<tr>
												<td><p id="fontStyle">类型：</p></td>
												<td><p id="fontStyle">指标</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">别名：</p></td>
												<td><p id="fontStyle">别名1</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">指标编码：</p></td>
												<td><p id="fontStyle">09001211</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">创建时间：</p></td>
												<td><p id="fontStyle">2016-06-15 10:50:30</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">适用于：</p></td>
												<td><p id="fontStyle"></p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">状态：</p></td>
												<td><p id="fontStyle">未启用</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">开始时间：</p></td>
												<td><p id="fontStyle">2016-06-15 10:50:30</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">结束时间：</p></td>
												<td><p id="fontStyle">2016-06-15 10:50:30</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">来源：</p></td>
												<td><p id="fontStyle">未知</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">指标属性：</p></td>
												<td><p id="fontStyle">基本指标</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">备注：</p></td>
												<td><p id="fontStyle">没有备注</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">关联分组：</p></td>
												<td><p style="color:blue;" id="fontStyle">区域，车辆类型</p></td>
											</tr>
										</tbody>
							   		</table>
								</td>
							</tr>
						</tbody>
                    </table>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="pilotInfo">
					<table border='0' style="margin-top: 0px">
						<tbody>
							<tr>
								<td>
									<button type="button" class='btn btn-info' onclick='addIndicator()'>增加</button>
									<button type="button" class='btn btn-success' onclick=''>修改</button>
									<button type="button" class='btn btn-danger' onclick=''>删除</button>
								</td>
							</tr>
						</tbody>
					</table>
					<table border='1' width="100%" style="margin-top: 10px">
                        <tbody>
							<tr>
								<td width="25%">
									<div class="zTreeDemoBackground left">
										<ul id="treepoilt" class="ztree"></ul>
									</div>
								</td>
								<td>
									<table id="parentList" class="table table-striped table-bordered table-hover">
										<tbody>
											<tr>
												<td><p id="fontStyle">指标编码：</p></td>
												<td><p id="fontStyle">09001200</p></td>
											</tr>
											<tr>
												<td><p id="fontStyle">指标名称：</p></td>
												<td><p id="fontStyle">旅客运输</p></td>
											</tr>
											<tr>
												<td><p id="fontStyle">指标别名：</p></td>
												<td><p id="fontStyle">别名1</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">指标类型：</p></td>
												<td><p id="fontStyle">类型1</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">状态：</p></td>
												<td><p id="fontStyle">未启用</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">创建时间：</p></td>
												<td><p id="fontStyle">2016-06-15 10:50:30</p></td>
											</tr>
										</tbody>
							   		</table>
									<table id="childList" class="hidden table table-striped table-bordered table-hover">
										<tbody>
											<tr>
												<td><p id="fontStyle">上级指标：</p></td>
												<td><p id="fontStyle">旅客运输</p></td>
											</tr>
											<tr>
												<td><p id="fontStyle">指标名称：</p></td>
												<td><p id="fontStyle">驾驶员取得从业资格证的比例</p></td>
											</tr>
											<tr>
												<td><p id="fontStyle">类型：</p></td>
												<td><p id="fontStyle">指标</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">别名：</p></td>
												<td><p id="fontStyle">别名1</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">指标编码：</p></td>
												<td><p id="fontStyle">09001211</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">创建时间：</p></td>
												<td><p id="fontStyle">2016-06-15 10:50:30</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">适用于：</p></td>
												<td><p id="fontStyle"></p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">状态：</p></td>
												<td><p id="fontStyle">未启用</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">开始时间：</p></td>
												<td><p id="fontStyle">2016-06-15 10:50:30</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">结束时间：</p></td>
												<td><p id="fontStyle">2016-06-15 10:50:30</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">来源：</p></td>
												<td><p id="fontStyle">未知</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">指标属性：</p></td>
												<td><p id="fontStyle">基本指标</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">备注：</p></td>
												<td><p id="fontStyle">没有备注</p></td>
											</tr>
											<tr>	
												<td><p id="fontStyle">关联分组：</p></td>
												<td><p id="fontStyle">区域，车辆类型</p></td>
											</tr>
										</tbody>
							   		</table>
								</td>
							</tr>
						</tbody>
                    </table>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="addIndicator" style="display:none;width:1000px;margin-left:-500px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						添加指标：
					</h4>
				</div>
				<div class="modal-body" style="height:500px">
					请选择新建类型：<select id="indicatorType" name="indicatorType">
					  <option value="0">指标分类</option>
					  <option value="1">指标</option>
					</select>
					<table id="typeTable" width="60%" class="table table-striped table-bordered table-hover">
			             <tr>
						    <td align="right">指标编码：</td>
						    <td><input  class="form-control" size="30" name="name" id="name" value="旅客运输" type="text"/></td>
						 </tr>
			             <tr>
						    <td align="right">指标名称：</td>
						    <td><input  class="form-control" size="30" name="name" id="name"  type="text"/></td>
						 </tr>
			             <tr>
						    <td align="right">指标别名：</td>
						    <td><input  class="form-control" size="30" name="name" id="name"  type="text"/></td>
						 </tr>
			             <tr>
						    <td align="right">指标类型：</td>
						    <td>
						    	<select id="educationlbg" name="educationlbg">
								  <option value="0">道路运输</option>
								  <option value="1">水路运输</option>
								  <option value="1">公共运输</option>
								</select>
						    </td>
						 </tr>
						  <tr>
						     <td colspan="2" style="text-align:center">
						     	<button type="button" class='btn btn-default btn-info' onclick='submit()'>确定</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						     	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						     </td>
					      </tr>
					</table>
					<table id="indicatorTable" width="60%" class="hidden table table-striped table-bordered table-hover">
			             <tr>
						    <td align="right">上级指标：</td>
						    <td><input  class="form-control" size="30" name="name" id="name" value="旅客运输" type="text"/></td>
						 </tr>
			             <tr>
						    <td align="right">指标名称：</td>
						    <td><input  class="form-control" size="30" name="name" id="name"  type="text"/></td>
						 </tr>
			             <tr>
						    <td align="right">类型：</td>
						    <td>
						    	<select id="educationlbg" name="educationlbg">
								  <option value="0">道路运输</option>
								  <option value="1">水路运输</option>
								  <option value="2">公共运输</option>
								</select>
						    </td>
						 </tr>
			             <tr>
						    <td align="right">别名：</td>
						    <td><input  class="form-control" size="30" name="name" id="name"  type="text"/></td>
						 </tr>
			             <tr>
						    <td align="right">适用于：</td>
						    <td><input  class="form-control" size="30" name="name" id="name"  type="text"/></td>
						 </tr>
			             <tr>
						    <td align="right">创建时间：</td>
						    <td><input  class="form-control" size="30" name="name" id="name"  type="text"/></td>
						 </tr>
			             <tr>
						    <td align="right">状态：</td>
						    <td><input  class="form-control" size="30" name="name" id="name"  type="text"/></td>
						 </tr>
			             <tr>
						    <td align="right">关联分组：</td>
						    <td>
						    	<div class="checkbox">
								    <input type="checkbox" value="">车辆类型
							    </div>
							    <div class="checkbox">
								    <input type="checkbox" value="">区域
								</div>
						    </td>
						 </tr>
			             <tr>
						    <td align="right">备注：</td>
						    <td><textarea style="width:250px;height:50px;" name="mubiao"></textarea></td>
						 </tr>
						  <tr>
						     <td colspan="2" style="text-align:center">
						     	<button type="button" class='btn btn-default btn-info' onclick='submit()'>确定</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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