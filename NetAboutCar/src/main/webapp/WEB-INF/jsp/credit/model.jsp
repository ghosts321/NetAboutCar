<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <link rel="stylesheet" href="<%=basePath %>static/css/demo.css" type="text/css"> --%>
<link rel="stylesheet" href="<%=basePath %>static/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="<%=basePath %>static/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="<%=basePath %>static/js/jquery.ztree.excheck.js"></script>
<style type="text/css">
 #fontStyle{
 	size:20px;
 	padding-left:20px
 }
/*  a:hover{color:white;text-decoration:none;}
 table{border-collapse:separate;} */
</style>
<script type="text/javascript">
function search(){
	alert("search");
}
function firstNext(){
	$("#firstStep").hide();
	$("#secondStep").show();
	$("#thirdStep").hide();
}
function secondPre(){
	$("#firstStep").show();
	$("#secondStep").hide();
	$("#thirdStep").hide();
}
function secondNext(){
	$("#firstStep").hide();
	$("#secondStep").hide();
	$("#thirdStep").show();
}
function thirdPre(){
	$("#firstStep").hide();
	$("#secondStep").show();
	$("#thirdStep").hide();
}
function addModelGroup(){
	//window.open("getPilotApply.action","newwindow","height=500,width=400,toolbar=no,scrollbars=no");
	$('#details').modal();
}

var setting = {
		check: {
			enable: true
		},
		data: {
			simpleData: {
				enable: true
			}
		}
	};
	
	var zNodes =[
     		{ id:1, pId:0, name:"道路运输",open:true},
     		{ id:2, pId:1, name:"旅客运输",open:true},
     		{ id:21, pId:2, name:"驾驶员取得从业资格证的比例"},
     		{ id:22, pId:2, name:"经营违章违法率"},
     		{ id:3, pId:1, name:"货物运输"},
   	];
	
	function setCheck() {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
		type = { "Y":"ps", "N":"ps"};
		zTree.setting.check.chkboxType = type;
		showCode('setting.check.chkboxType = { "Y" : "' + type.Y + '", "N" : "' + type.N + '" };');
	}
	
	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		setCheck();
	});

</script>
</head>
<body>
	<div class="panel-body" style="padding-bottom:0px;">
		<div class="page-header">
			<h1 style="font-size:15px;">
				信用管理
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					模型管理
				</small>
			</h1>
		</div>
		<!-- <table border='0' style="margin-top: 0px">
			<tbody>
				<tr>
					<td><p id="fontStyle">根据条件查询：</p></td>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="模型名称" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
						<span>模型分类：</span>
						<span class="input-icon">
							<select name="areaType" style="width:120px">
	               				<option value="">&nbsp;&nbsp;&nbsp;道路运输</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;水路运输</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;公路建设</option>
	                        </select>
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
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">模型名称</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" class="form-control"  id="nav-search-input" name="userName" value="" />
                        </div>
                          <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">模型分类</label>
                        <div class="col-sm-1">
                            <select id="applyType" name="applyType">
					            <option value="">&nbsp;&nbsp;&nbsp;道路运输</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;水路运输</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;公路建设</option>
				        	</select>
                        </div>
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
		<!-- <table border='0' style="margin-top: 0px" >
			<tbody>
				<tr>
					<td>
						<button type="button" class='btn btn-default' onclick=''>查看</button>
						<button type="button" class='btn btn-info' onclick='addModelGroup()'>增加</button>
						<button type="button" class='btn btn-success' onclick=''>修改</button>
						<button type="button" class='btn btn-danger' onclick=''>删除</button>
						<button type="button" class='btn btn-default' onclick=''>
							<span class='glyphicon glyphicon-list-alt' aria-hidden="true"></span>查看
						</button>
						<button type="button" class='btn btn-default' onclick=''>
							 <span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>修改
						</button>
						<button type="button" class='btn btn-default' onclick='addModelGroup()'>
							<span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>增加
						</button>
						<button type="button" class='btn btn-default' onclick=''>
							<span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>删除
						</button>
					</td>
				</tr>
			</tbody>
		</table> -->
		<div align="right">
			<button type="button" class='btn btn-default' onclick='addModelGroup()'>
					<span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>增加
			</button>
			<button type="button" class='btn btn-default' onclick=''>
					<span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>删除
			</button>
		</div>
		<table id="tradeList" class="table table-striped table-bordered table-hover">
			<thead>
				<tr align="center">
					<td class="center"  style="width: 50px;"><strong>编号</strong></th>
					<td class='center'><strong>模型名称</strong></th>
					<td class='center'><strong>模型分类</strong></th>
					<td class='center'><strong>指标</strong></th>
					<td class='center'><strong>分值</strong></th>
					<td class='center'><strong>描述</strong></th>
					<td class='center' style="width: 160px;"><strong>操作</strong></th>
				</tr>
			</thead>
			<tr align="center">
				<td class="center">501</td>
				<td class="center">道路旅客运输评价模型1</td>
				<td class="center">道路运输</td>
				<td>
					<span style="font-size:16px">（1）经营管理</span><br>
					1.驾驶员取得从业资格证的比例<br>
					2.经营违章违法率<br>
					3.车辆管理<br>
					<span style="font-size:16px">（2）安全生产</span>
				</td>
				<td class="center">1000</td>
				<td class="center">......</td>
				<td class="center">
					<button type="button" class='btn btn-default' onclick=''>
							<span class='glyphicon glyphicon-list-alt' aria-hidden="true"></span>查看
					</button>
					<button type="button" class='btn btn-default' onclick=''>
							 <span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>修改
					</button>
				</td>
			</tr>
			<tr align="center">
				<td class="center">502</td>
				<td class="center">道路旅客运输评价模型2</td>
				<td class="center">道路运输</td>
				<td>
					<span style="font-size:16px">（1）服务质量</span><br>
					1.有效投诉率<br>
					2.媒体报关率<br>
					3.满意度调查<br>
					<span style="font-size:16px">（2）社会责任</span>
				</td>
				<td class="center">1500</td>
				<td class="center">......</td>
				<td class="center">
					<button type="button" class='btn btn-default' onclick=''>
							<span class='glyphicon glyphicon-list-alt' aria-hidden="true"></span>查看
					</button>
					<button type="button" class='btn btn-default' onclick=''>
							 <span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>修改
					</button>
				</td>
			</tr>
   		</table>
	</div>
	<div class="modal fade bs-example-modal-lg" id="details" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						添加模型：
					</h4>
				</div>
				<div class="modal-body">
					<table id="firstStep" width="60%" class="table table-striped table-bordered table-hover">
			             <tr>
						    <td colspan="2">第一步：添加模型基本信息</td>
						 </tr>
			             <tr>
						    <td align="right">编号：</td>
						    <td><input  class="form-control" size="30" name="name" id="name" value="" type="text"/></td>
						 </tr>
			             <tr>
						    <td align="right">模型名称：</td>
						    <td><input  class="form-control" size="30" name="name" id="name"  type="text"/></td>
						 </tr>
			             <tr>
						    <td align="right">模型分类：</td>
						    <td>
						    	<select id="educationlbg" name="educationlbg">
								  <option value="0">道路运输</option>
								  <option value="1">水路运输</option>
								  <option value="2">公路建设</option>
								</select>
						    </td>
						 </tr>
			             <tr>
						    <td align="right">描述：</td>
						    <td><textarea style="width:250px;height:50px;" name="mubiao"></textarea></td>
						 </tr>
						 <tr>
							<td colspan="2" style="text-align:center">
						     	<button type="button" class='btn btn-default btn-info' onclick='submit()'>提交</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						     	<button type="button" class="btn btn-default" onclick='firstNext()'>下一步</button>
						     </td>
						</tr>
					</table>
					<table id="secondStep" width="60%" style="display:none;" class="table table-striped table-bordered">
			             <tr>
						    <td colspan="2">第二步：添加指标</td>
						 </tr>
			             <tr>
						    <td style="color:blue" colspan="5">模型基本信息</td>
						 </tr>
			             <tr>
						    <td align="right">模型名称：</td>
						    <td colspan="4">道路旅客运输评价模型1</td>
						 </tr>
			             <tr>
						    <td align="right">分类：</td>
						    <td colspan="4">道路运输</td>
						 </tr>
			             <tr>
						    <td align="right">描述：</td>
						    <td colspan="4">道路运输。。。</td>
						 </tr>
						 
						 <tr>
						    <td style="color:blue" colspan="5">添加指标</td>
						 </tr>
						 <tr>
						    <td align="right">一级指标：</td>
						    <td colspan="4"><input  class="form-control" size="30" name="name" id="name" value="" type="text"/></td>
						 </tr>
			             <tr>
						    <td align="right">分值：</td>
						    <td colspan="4"><input  class="form-control" size="30" name="name" id="name"  type="text"/></td>
						 </tr>
			             <tr>
						    <td align="right">二级指标：</td>
						    <td colspan="3">
						    	<div style="height:100px;" class="zTreeDemoBackground left">
									<ul style="height:100px;" id="treeDemo" class="ztree"></ul>
								</div>
								<div style="text-align:right"><button type="button" class="btn btn-info" onclick=''>添加</button></div>
						    </td>
						 </tr>
						 <tr>
						    <td colspan="5">
						    	<table class="table table-striped table-bordered table-hover" >
									<thead>
										<tr>
											<th class="center" style="text-align: center">一级指标</th>
											<th class='center' style="text-align: center">分值</th>
											<th class='center' style="text-align: center">二级指标</th>
											<th class='center' style="text-align: center">分值</th>
											<th class='center' style="text-align: center">操作</th>
										</tr>
									</thead>
									<tr>
										<td rowspan="3" class="center">经营管理</td>
										<td rowspan="3" class="center">300</td>
										<td class="center">驾驶员取得从业资格证的比例</td>
										<td class="center"><input  class="form-control" size="30" name="name" id="name" value="" type="text"/></td>
									<!-- 	<td rowspan="3" class="center"><a>删除</a></td> -->
										<td rowspan="3" class="center">
											<button type="button" class='btn btn-default' onclick=''>
												<span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>删除
											</button>
										</td>
									</tr>
									<tr>
										<td class="center">经营违章违法率</td>
										<td class="center"><input  class="form-control" size="30" name="name" id="name" value="" type="text"/></td>
									</tr>
									<tr>
										<td class="center">车辆管理</td>
										<td class="center"><input  class="form-control" size="30" name="name" id="name" value="" type="text"/></td>
									</tr>
						   		</table>
						    </td>
						 </tr>
						 
						 <tr>
							<td colspan="5" style="text-align:center">
								<button type="button" class="btn btn-default" onclick='secondPre()'>上一步</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						     	<button type="button" class='btn btn-default btn-info' onclick='submit()'>提交</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						     	<button type="button" class="btn btn-default" onclick='secondNext()'>下一步</button>
						     </td>
						</tr>
					</table>
					<table id="thirdStep" width="60%" style="display:none;" class="table table-striped table-bordered">
			             <tr>
						    <td colspan="2">第三步：设置分组、规则 </td>
						 </tr>
			             <tr>
						    <td style="color:blue" colspan="5">模型基本信息</td>
						 </tr>
			             <tr>
						    <td align="right">模型名称：</td>
						    <td>道路旅客运输评价模型1</td>
						 </tr>
			             <tr>
						    <td align="right">分类：</td>
						    <td>道路运输</td>
						 </tr>
			             <tr>
						    <td align="right">描述：</td>
						    <td>道路运输。。。</td>
						 </tr>
						 
						 <tr>
						    <td colspan="2" style="color:blue">设置分组规则</td>
						 </tr>
						 <tr>
						    <td colspan="2">
						    	<table class="table table-bordered">
									<thead>
										<tr>
											<th class="center" style="text-align: center">一级指标</th>
											<th class='center' style="text-align: center">分值</th>
											<th class='center' style="text-align: center">序号</th>
											<th class='center' style="text-align: center">二级指标</th>
											<th class='center' style="text-align: center">分组</th>
											<th class='center' style="text-align: center">规则</th>
										</tr>
									</thead>
									<tr>
										<td width="10%" rowspan="2" class="center">经营管理(300分)</td>
										<td  width="5%" class="center"><input style="width:30px;" class="form-control" name="name" id="name" value="" type="text"/></td>
										<td width="6%" class="center">1</td>
										<td class="center" width="10%">驾驶员取得从业资格证的比例</td>
										<td class="center" width="20%">
											<div class="checkbox">
											    <input type="checkbox" value="" checked>车辆类型
										    </div>
										    <div class="checkbox">
											    <input type="checkbox" value="" checked>区域
											</div>
										</td>
										<td width="50%">
											<!-- <a>添加</a> -->
											<div style="text-align:right"><button type="button" class="btn btn-info" onclick=''>添加</button></div>
											<table width="100%">
												<thead>
													<tr>
														<th style="text-align: center">描述</th>
														<th style="text-align: center">符号</th>
														<th style="text-align: center">值</th>
														<th style="text-align: center">得分</th>
														<th style="text-align: center">操作</th>
													</tr>
												</thead>
												<tr>
													<td>驾驶员取得从业资格证的比例</td>
													<td>
														<select name="areaType" style="width:50px">
								               				<option value=""> > </option>
								               				<option value=""> < </option>
								               				<option value=""> = </option>
								               				<option value=""> >= </option>
								               				<option value=""> <= </option>
								                        </select>
													</td>
													<td><input  class="form-control" style="width:30px;" name="name" id="name" value="" type="text"/></td>
													<td><input  class="form-control" style="width:30px;" name="name" id="name" value="" type="text"/></td>
													<td><!-- <a>删除</a> -->
														<button type="button" class='btn btn-default' onclick=''>
															<span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>删除
														</button>
													</td>
												</tr>
												<tr>
													<td>驾驶员取得从业资格证的比例</td>
													<td>
														<select name="areaType" style="width:50px">
								               				<option value=""> > </option>
								               				<option value=""> < </option>
								               				<option value=""> = </option>
								               				<option value=""> >= </option>
								               				<option value=""> <= </option>
								                        </select>
													</td>
													<td><input  class="form-control" style="width:30px;" name="name" id="name" value="" type="text"/></td>
													<td><input  class="form-control" style="width:30px;" name="name" id="name" value="" type="text"/></td>
													<td><!-- <a>删除</a> -->
														<button type="button" class='btn btn-default' onclick=''>
															<span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>删除
														</button>
													</td>
												</tr>
									   		</table>
										</td>
									</tr>
									<tr>
										<td class="center"><input  class="form-control" style="width:30px;" name="name" id="name" value="" type="text"/></td>
										<td class="center">2</td>
										<td class="center">经营违章违法率</td>
										<td class="center">
											<div class="checkbox">
											    <input type="checkbox" value="" checked>车辆类型
										    </div>
										    <div class="checkbox">
											    <input type="checkbox" value="" checked>区域
											</div>
										</td>
										<td>
											<!-- <a>添加</a> -->
											<div style="text-align:right"><button type="button" class="btn btn-info" onclick=''>添加</button></div>
											<table width="100%">
												<thead>
													<tr>
														<th>描述</th>
														<th>符号</th>
														<th>值</th>
														<th>得分</th>
														<th>操作</th>
													</tr>
												</thead>
												<tr>
													<td>经营违章违法率</td>
													<td>
														<select name="areaType" style="width:50px">
								               				<option value=""> > </option>
								               				<option value=""> < </option>
								               				<option value=""> = </option>
								               				<option value=""> >= </option>
								               				<option value=""> <= </option>
								                        </select>
													</td>
													<td><input  class="form-control" style="width:30px;" name="name" id="name" value="" type="text"/></td>
													<td><input  class="form-control" style="width:30px;" name="name" id="name" value="" type="text"/></td>
													<td><!-- <a>删除</a> -->
														<button type="button" class='btn btn-default' onclick=''>
															<span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>删除
														</button>
													</td>
												</tr>
												<tr>
													<td>经营违章违法率</td>
													<td>
														<select name="areaType" style="width:50px">
								               				<option value=""> > </option>
								               				<option value=""> < </option>
								               				<option value=""> = </option>
								               				<option value=""> >= </option>
								               				<option value=""> <= </option>
								                        </select>
													</td>
													<td><input  class="form-control" style="width:30px;" name="name" id="name" value="" type="text"/></td>
													<td><input  class="form-control" style="width:30px;" name="name" id="name" value="" type="text"/></td>
													<td><!-- <a>删除</a> -->
														<button type="button" class='btn btn-default' onclick=''>
															<span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>删除
														</button>
													</td>
												</tr>
									   		</table>
										</td>
									</tr>
						   		</table>
						    </td>
						 </tr>
						 
						 <tr>
							<td colspan="2" style="text-align:center">
								<button type="button" class="btn btn-default" onclick='thirdPre()'>上一步</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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