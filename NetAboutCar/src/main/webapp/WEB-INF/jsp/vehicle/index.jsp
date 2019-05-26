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
					车辆业务
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
					<th class='center'>网约车驾驶员证号</th>
					<th class='center'>车牌号</th>
					<th class='center'>发动机号</th>
					<th class='center'>行驶证初次登记</th>
					<th class='center'>车主姓名</th>
					<th class='center'>身份证号</th>
					<th class='center'>审核状态</th>
					<th class='center'>来源</th>
					<th class='center'>操作</th>
				</tr>
			</thead>
			<tr>
				<td class="center">1</td>
				<td class="center">127810WDBGP57B6PB</td>
				<td class="center">沪KR9888</td>
				<td class="center">C198C8998</td>
				<td class="center">2011-03-29</td>
				<td class="center">张久远</td>
				<td class="center">130421199003292342</td>
				<td id="validate1" class="center">未验证</td>
				<td class="center">个人</td>
				<td class="center">
					<button type="button" class='btn btn-mini btn-warning' onclick='showDetail()'>查看</button>&nbsp;
					<button type="button" class='btn btn-mini btn-danger' onclick='validate1()'>车辆验证</button>&nbsp;
					<button type="button" class='btn btn-mini btn-info' onclick='certificate()' disabled>发证</button>
				</td>
			</tr>
			<tr>
				<td class="center">2</td>
				<td class="center">BGP57B6PB127810WD</td>
				<td class="center">京AH8888</td>
				<td class="center">C659F7359</td>
				<td class="center">2013-11-09</td>
				<td class="center">刘海科 	</td>
				<td class="center">421199003292342130</td>
				<td class="center">已通过</td>
				<td class="center">个人</td>
				<td class="center">
					<button type="button" class='btn btn-mini btn-warning' onclick='showDetail()'>查看</button>&nbsp;
					<button type="button" class='btn btn-mini btn-danger' onclick='validate()'>车辆验证</button>&nbsp;
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
								<td><p id="fontStyle">车牌号：沪KR9888</p></td>
								<td><p id="fontStyle">车牌颜色：蓝色</p></td>
								<td><p id="fontStyle">车身颜色：黑色</p></td>
							</tr>
							<tr>
								<td><p id="fontStyle">车主编号：AD78</p></td>
								<td><p id="fontStyle">车主名称/公司名称：张久远</p></td>
								<td><p id="fontStyle">联系地址：北京市海淀区</p></td>
							</tr>
							<tr>
								<td><p id="fontStyle">联系电话：13945879032</p></td>
								<td><p id="fontStyle">车辆类别：轿车</p></td>
								<td><p id="fontStyle">车辆类型：小型汽车</p></td>
							</tr>
							<tr>
								<td><p id="fontStyle">发动机号：C198C8998</p></td>
								<td><p id="fontStyle">车架号/VIN：WDBGP57B6PB127810</p></td>
								<td><p id="fontStyle">厂牌：SC7162XD</p></td>
							</tr>
							<tr>
								<td><p id="fontStyle">型号：帕萨特2.0GL</p></td>
								<td><p id="fontStyle">车长：4605</p></td>
								<td><p id="fontStyle">车宽：1720</p></td>
							</tr>
							<tr>
								<td><p id="fontStyle">车高：1430</p></td>
								<td><p id="fontStyle">总质量：1290</p></td>
								<td><p id="fontStyle">出厂日期：2013-03-12</p></td>
							</tr>
							<tr>
								<td><p id="fontStyle">购车时间：2014-01-13</p></td>
								<td><p id="fontStyle">经济类型：有限公司</p></td>
								<td><p id="fontStyle">区域编码：601234</p></td>
							</tr>
							<tr>
								<td><p id="fontStyle">基层交管部门：公安局交通警察支队</p></td>
								<td><p id="fontStyle">车辆登记证编码：127810WDBGP57B6PB</p></td>
								<td><p id="fontStyle">车辆登记时间：2014-01-17</p></td>
							</tr>
							<tr>
								<td><p id="fontStyle">行驶证初领时间：2011-03-29</p></td>
								<td><p id="fontStyle">网约车运输证有效期：2025-02-23</p></td>
								<td><p id="fontStyle">车辆状态：正常</p></td>
							</tr>
							<tr>
								<td><p id="fontStyle">创建时间：2016-09-20</p></td>
								<td><p id="fontStyle">创建人：张久远</p></td>
								<td><p id="fontStyle"></p></td>
							</tr>
						</tbody>
   					</table>
   					<table class="table table-striped table-bordered table-hover">
   						<thead><p style="font-size:18px;font-weight: lighter;color: #2679b5">车辆认证信息：</p></thead>
						<tbody>
							<tr>	
								<td><p id="fontStyle">是否为本人车辆：是</p></td>
							</tr>
						</tbody>
   					</table>
   					<table class="table table-striped table-bordered table-hover">
   						<thead><p style="font-size:18px;font-weight: lighter;color: #2679b5">车况信息：</p></thead>
						<tbody>
							<tr>	
								<td><p id="fontStyle">车龄：</p></td>
								<td><p id="fontStyle">定期检查：</p></td>
								<td><p id="fontStyle">保险：</p></td>
							</tr>
						</tbody>
   					</table>
				</div>
				<div class="modal-footer">
					<button id="handleBtn" type="button" class="btn btn-primary">通知</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	
</body>
</html>