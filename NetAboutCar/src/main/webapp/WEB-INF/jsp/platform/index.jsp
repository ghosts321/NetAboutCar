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
	$("#handleBtn").css('display','none');
	$('#details').modal();
}
function validate1(){
	$("#validate1").html('验证中'); 
}
function certificate(){
	alert("通知已发出");
}
</script>
</head>
<body>
	<div class="page-content">
		<div class="page-header">
			<h1 style="font-size:25px;font-weight: lighter;color: #2679b5">
				业务审批
				<small style="font-size: 19px">
					<i class="icon-double-angle-right"></i>
					<span>平台业务</span>
				</small>
			</h1>
		</div>
		
		<table border='0' style="margin-top: 0px">
			<tbody>
				<tr>
					<td><p id="fontStyle">根据条件查询：</p></td>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="姓名" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="手机号" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					
					<td style="vertical-align:top;"> 
					 	<select class="chzn-select" name="STATUS" id="STATUS" data-placeholder="状态" style="vertical-align:top;width: 79px;">
						<option value=""></option>
						<option value="">全部</option>
						<option value="1" <c:if test="${pd.STATUS == '1' }">selected</c:if> >正常</option>
						<option value="0" <c:if test="${pd.STATUS == '0' }">selected</c:if> >冻结</option>
						</select>
					</td>
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
				</tr>
			</tbody>
		</table>
		
		<table id="tradeList" class="table table-striped table-bordered table-hover">
			<thead>
				<tr> 
					<th class="center"  style="width: 50px;">序号</th>
					<th class='center'>企业名称</th>
					<th class='center'>社会信用代码号</th>
					<th class='center'>法人代表姓名</th>
					<th class='center'>法人身份证</th>
					<th class='center'>手机号</th>
					<th class='center'>审核状态</th>
					<th class='center'>注册地</th>
					<th class='center'>操作</th>
				</tr>
			</thead>
			<tr>
				<td class="center">1</td>
				<td class="center">和平旅游客车服务有限公司</td>
				<td class="center">127810WDBGP57B6PB</td>
				<td class="center">张久远</td>
				<td class="center">130421199003292342</td>
				<td class="center">13408453929</td>
				<td id="validate1" class="center">未验证</td>
				<td class="center">本地</td>
				<td class="center">
					<button type="button" class='btn btn-mini btn-warning' onclick='showDetail()'>查看</button>&nbsp;
					<button type="button" class='btn btn-mini btn-danger' onclick='validate1()'>验证</button>&nbsp;
					<button type="button" class='btn btn-mini btn-info' onclick='certificate()' disabled>发证</button>
				</td>
			</tr>
			<tr>
				<td class="center">2</td>
				<td class="center">中国六建天津项目部</td>
				<td class="center">WDBG127810P57B6PB</td>
				<td class="center">王亚云</td>
				<td class="center">421199003291302342</td>
				<td class="center">18453929340</td>
				<td id="validate" class="center">已通过</td>
				<td class="center">外地</td>
				<td class="center">
					<button type="button" class='btn btn-mini btn-warning' onclick='showDetail()'>查看</button>&nbsp;
					<button type="button" class='btn btn-mini btn-danger' onclick='validate()'>验证</button>&nbsp;
					<button type="button" class='btn btn-mini btn-info' onclick='certificate()'>发证</button>
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
						详细信息：
					</h4>
				</div>
				<div class="modal-body" style="height:300px">
					<table id="detailList" class="table table-striped table-bordered table-hover">
						<thead><p style="font-size:18px;font-weight: lighter;color: #2679b5">基本信息：</p></thead>
						<tbody>
							<tr>
								<td><p id="fontStyle">统一社会信用代码：tjsqy001</p></td>
								<td><p id="fontStyle">企业申请编码：101</p></td>
								<td><p id="fontStyle">企业名称：中国六建天津项目部</p></td>
							</tr>
							<tr>
								<td><p id="fontStyle">网约车平台名称：六建约车平台</p></td>
								<td><p id="fontStyle">企业营业执照：sffdzgffhaf</p></td>
								<td><p id="fontStyle">公司注册地：天津祥云大道</p></td>
							</tr>
							<tr>
								<td><p id="fontStyle">通信地址：天津祥云大道</p></td>
								<td><p id="fontStyle">邮编：10650</p></td>
								<td><p id="fontStyle">联系电话：13128372218</p></td>
							</tr>
							<tr>	
								<td><p id="fontStyle">公司法人：王亚云</p></td>
								<td><p id="fontStyle">法人电话：18691902983</p></td>
								<td><p id="fontStyle">公司负责人：芈淑</p></td>
							</tr>
							<tr>
								<td><p id="fontStyle">负责人电话：13829382938</p></td>
								<td><p id="fontStyle">创建时间：2013-12-07</p></td>
								<td><p id="fontStyle">网络预约出租汽车经营许可证有效期：2023-12-07</p></td>
							</tr>
						</tbody>
   					</table>
   					<table class="table table-striped table-bordered table-hover">
   						<thead><p style="font-size:18px;font-weight: lighter;color: #2679b5">线上服务能力：</p></thead>
						<tbody>
							<tr>	
								<td><p id="fontStyle">网络承受能力：</p></td>
							</tr>
						</tbody>
   					</table>
   					<table class="table table-striped table-bordered table-hover">
   						<thead><p style="font-size:18px;font-weight: lighter;color: #2679b5">本地化服务能力：</p></thead>
						<tbody>
							<tr>	
								<td><p id="fontStyle">本地化服务能力：</p></td>
							</tr>
						</tbody>
   					</table>
				</div>
				<div class="modal-footer">
					<button id="handleBtn" type="button" class="btn btn-primary">通知</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	
</body>
</html>