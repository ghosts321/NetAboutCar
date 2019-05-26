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
function showEvaluate(){
	$('#evaluates').modal();
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
					经营者诚信管理
				</small>
			</h1>
		</div>
		
<!-- 		<table border='0' style="margin-top: 0px">
			<tbody>
				<tr>
					<td><p id="fontStyle">根据条件查询：</p></td>
					<td>
						<span>企业名称：</span>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="企业名称" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
						<span>辖 区 县：</span>
						<span class="input-icon">
							<select name="areaType" placeholder="辖 区 县" style="width:120px">
	               				<option value="">&nbsp;&nbsp;&nbsp;全部</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;北京</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;上海</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;广州</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;深圳</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;河北</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;重庆</option>
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
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">企业名称</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" id="userName" name="userName" value="" class="form-control" />
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">辖 区 县</label>
                        <div class="col-sm-1">
                            <select id="applyType" name="applyType">
					            	<option value="">&nbsp;&nbsp;&nbsp;全部</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;北京</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;上海</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;广州</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;深圳</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;河北</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;重庆</option>
				        	</select>
                        </div>
                        <div class="col-sm-3" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
		<table id="tradeList" class="table table-striped table-bordered table-hover">
			<thead>
				<tr align="center">
					<td class="center"  style="width: 50px;"><strong>序号</strong></th>
					<td class='center'><strong>企业名称</strong></th>
					<td class='center'><strong>所属地市</strong></th>
					<td class='center'><strong>所属区县</strong></th>
					<td class='center'><strong>诚信分数</strong></th>
					<td class='center'><strong>诚信等级</strong></th>
					<td class='center'><strong>操作</strong></th>
				</tr>
			</thead>
			<tr align="center">
				<td class="center">1</td>
				<td class="center">滴滴出行</td>
				<td class="center">天津</td>
				<td class="center">河北</td>
				<td class="center">1060</td>
				<td class="center">AAAA</td>
				<td class="center">
					<!-- <button type="button" class='btn btn-mini btn-info' onclick='showDetail()'>详细</button> -->
                    <!-- <button type="button" class='btn btn-mini btn-success' onclick='showEvaluate()'>评价</button> -->
					<button type="button" class='btn btn-mini btn-default' onclick='showDetail()'><span class='glyphicon glyphicon-list-alt'></span>详细</button>
					<button type="button" class='btn btn-mini btn-default' onclick='showEvaluate()'><span class='glyphicon glyphicon-edit'></span>评价</button>
				</td>
			</tr>
			<tr align="center">
				<td class="center">2</td>
				<td class="center">滴滴出行</td>
				<td class="center">天津</td>
				<td class="center">南开</td>
				<td class="center">1044.6</td>
				<td class="center">AAAA</td>
				<td class="center">
					<!-- <button type="button" class='btn btn-mini btn-info' onclick='showDetail()'>详细</button> -->
					<!-- <button type="button" class='btn btn-mini btn-success' onclick='showEvaluate()'>评价</button> -->
					<button type="button" class='btn btn-mini btn-default' onclick='showDetail()'><span class='glyphicon glyphicon-list-alt'></span>详细</button>
					<button type="button" class='btn btn-mini btn-default' onclick='showEvaluate()'><span class='glyphicon glyphicon-edit'></span>评价</button>
				</td>
			</tr>
			<tr align="center">
				<td class="center">3</td>
				<td class="center">滴滴出行</td>
				<td class="center">天津</td>
				<td class="center">河西</td>
				<td class="center">1031.64</td>
				<td class="center">AAAA</td>
				<td class="center">
					<!-- <button type="button" class='btn btn-mini btn-info' onclick='showDetail()'>详细</button> -->
					<!-- <button type="button" class='btn btn-mini btn-success' onclick='showEvaluate()'>评价</button> -->
					<button type="button" class='btn btn-mini btn-default' onclick='showDetail()'><span class='glyphicon glyphicon-list-alt'></span>详细</button>
					<button type="button" class='btn btn-mini btn-default' onclick='showEvaluate()'><span class='glyphicon glyphicon-edit'></span>评价</button>
				</td>
			</tr>
			<tr align="center">
				<td class="center">4</td>
				<td class="center">滴滴出行</td>
				<td class="center">天津</td>
				<td class="center">和平</td>
				<td class="center">1026.35</td>
				<td class="center">AAAA</td>
				<td class="center">
					<!-- <button type="button" class='btn btn-mini btn-info' onclick='showDetail()'>详细</button> -->
					<!-- <button type="button" class='btn btn-mini btn-success' onclick='showEvaluate()'>评价</button> -->
					<button type="button" class='btn btn-mini btn-default' onclick='showDetail()'><span class='glyphicon glyphicon-list-alt'></span>详细</button>
					<button type="button" class='btn btn-mini btn-default' onclick='showEvaluate()'><span class='glyphicon glyphicon-edit'></span>评价</button>
				</td>
			</tr>
			<tr align="center">
				<td class="center">5</td>
				<td class="center">滴滴出行</td>
				<td class="center">天津</td>
				<td class="center">河东</td>
				<td class="center">1020.97</td>
				<td class="center">AAA</td>
				<td class="center">
					<!-- <button type="button" class='btn btn-mini btn-info' onclick='showDetail()'>详细</button> -->
					<!-- <button type="button" class='btn btn-mini btn-success' onclick='showEvaluate()'>评价</button> -->
					<button type="button" class='btn btn-mini btn-default' onclick='showDetail()'><span class='glyphicon glyphicon-list-alt'></span>详细</button>
					<button type="button" class='btn btn-mini btn-default' onclick='showEvaluate()'><span class='glyphicon glyphicon-edit'></span>评价</button>
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
				<div class="modal-body" style="height:430px">
					<div id="detailList">
						<table class="table table-striped table-bordered table-hover"  width="50%">
							<thead><p style="font-size:16px;font-weight: lighter;color:black">企业基本信息：</p></thead>
							<tbody>
								<tr>
									<td><p id="fontStyle">企业姓名：xxxxxxxxxxxxxxx</p></td>
									<td><p id="fontStyle">联系电话：13242060728</p></td>
								</tr>
								<tr>
									<td colspan="2"><p id="fontStyle">经营范围：xxxxxxxxxxxxxxx</p></td>
								</tr>
								<tr>
									<td><p id="fontStyle">经济类型：</p></td>
									<td><p id="fontStyle">法定代表人：哈飞</p></td>
								</tr>
								<tr>
									<td><p id="fontStyle">辖区市：420621199107152759</p></td>
									<td><p id="fontStyle">辖区县：420621199107152759</p></td>
								</tr>
								<tr>	
									<td><p id="fontStyle">辖区镇：</p></td>
									<td><p id="fontStyle">是否三资企业：是</p></td>
								</tr>
							</tbody>
	   					</table>
	   					<table class="table table-striped table-bordered table-hover">
	   						<thead><p style="font-size:16px;font-weight: lighter">企业诚信信息：</p></thead>
							<tbody>
								<thead>
									<tr>
										<th class="center"  style="width: 50px;">序号</th>
										<th class='center' style="width: 60px;">指标项</th>
										<th class='center' style="width: 50px;">满分</th>
										<th class='center'>指标说明</th>
										<th class='center' style="width: 80px;">评分依据</th>
										<th class='center' style="width: 80px;">初评得分</th>
										<th class='center'></th>
									</tr>
								</thead>
								<tr><td colspan="7">经营管理（300分）</td></tr>
								<tr>
									<td class="center">1</td>
									<td class="center">车辆管理</td>
									<td class="center">50</td>
									<td class="center">
										未按时进行车辆年审的或车辆年审不合格的，每辆次扣10分。本项最多扣50分。
									</td>
									<td class="center">无</td>
									<td class="center">50</td>
									<td class="center"></td>
								</tr>
							</tbody>
	   					</table>
   					</div>
				</div>
				<div class="modal-footer" >
					<p align="center"><button  type="button" style="background:red;color: white" class="btn btn-default" data-dismiss="modal" >关闭</button></p>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	<div class="modal fade" id="evaluates" style="display:none;width:1000px;margin-left:0px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" >
						诚信评价信息：
					</h4>
				</div>
				<div class="modal-body" style="height:430px">
					<div id="detailList">
						<table class="table table-striped table-bordered table-hover">
							<thead><p style="font-size:16px;font-weight: lighter">评价企业：</p></thead>
							<tbody>
								<tr>
									<td><p id="fontStyle">企业姓名：<br/>xxxxxxxxxxxxxxx</p></td>
									<td><p id="fontStyle">经营许可证：<br/>HKL13242060728</p></td>
									<td><p id="fontStyle">企业类型：<br/>道路货物运输</p></td>
								</tr>
								<tr>
									<td><p id="fontStyle">评分周期：</p></td>
									<td><p id="fontStyle">初评得分：</p></td>
									<td><p id="fontStyle">初评等级：</p></td>
								</tr>
							</tbody>
	   					</table>
	   					<table class="table table-striped table-bordered table-hover">
	   						<thead><p style="font-size:16px;font-weight: lighter">评价明细：</p></thead>
							<tbody>
								<thead>
									<tr>
										<th class="center" style="width: 50px;">序号</th>
										<th class='center' style="width:80px;">指标项</th>
										<th class='center' style="width:50px;">满分</th>
										<th class='center'>指标说明</th>
										<th class='center' style="width:80px;">评分依据</th>
										<th class='center' style="width:80px;">初评得分</th>
										<th class='center' style="width: 50px;"></th>
									</tr>
								</thead>
								<tr><td colspan="7">-经营管理（300分）</td></tr>
								<tr>
									<td class="center">1</td>
									<td class="center">车辆管理</td>
									<td class="center">50</td>
									<td class="center">
										未按时进行车辆年审的或车辆年审不合格的，每辆次扣10分。本项最多扣50分。
									</td>
									<td class="center">无</td>
									<td class="center">50</td>
									<td class="center"></td>
								</tr>
								<tr>
									<td class="center">2</td>
									<td class="center">驾驶员取得从业资格证的比例</td>
									<td class="center">50</td>
									<td class="center">
										主管部门每半年进行一次现场检查，抽查驾驶员的从业资格情况，凡发现驾驶员未取得相应从业资格的，每人次扣25分，本项最多扣50分。
									</td>
									<td class="center">无</td>
									<td class="center">50</td>
									<td class="center">申述</td>
								</tr>
								<tr>
									<td class="center">3</td>
									<td class="center">经营违章违法率</td>
									<td class="center">200</td>
									<td class="center">
										XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
									</td>
									<td class="center">无</td>
									<td class="center">200</td>
									<td class="center"></td>
								</tr>
								<tr><td colspan="7">-安全生产（200分）</td></tr>
								<tr>
									<td class="center">4</td>
									<td class="center">交通责任事故死亡率</td>
									<td class="center">100</td>
									<td class="center">
										XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
									</td>
									<td class="center">无</td>
									<td class="center">100</td>
									<td class="center"></td>
								</tr>
								<tr>
									<td class="center">5</td>
									<td class="center">安全管理</td>
									<td class="center">100</td>
									<td class="center">
										主管部门每半年进行一次现场检查，以抽查的方式，发现车辆未备齐相关安全告知及安全防范措施或未对驾驶员定期进行安全培训学习的，每车次扣10分。本项最多扣150分。
									</td>
									<td class="center">无</td>
									<td class="center">100</td>
									<td class="center">申述</td>
								</tr>
								<tr><td colspan="7">-服务质量（350分）</td></tr>
								<tr>
									<td class="center">6</td>
									<td class="center">货损货差赔付率</td>
									<td class="center">100</td>
									<td class="center">
										取两种方式获取的赔付值的较大者作为企业的年度赔付额，该项指标得分计算按照“100-年度赔付额/100”。
									</td>
									<td class="center">无</td>
									<td class="center">100</td>
									<td class="center">申述</td>
								</tr>
							</tbody>
	   					</table>
   					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div><!-- /.modal-content --> 
		</div><!-- /.modal -->
	</div>
</body>
</html>