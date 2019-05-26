<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
table{
	table-layout:fixed;
	empty-cells:show;
	border-collapse: collapse;
	margin:0 auto;
}
.table{
border:1px solid #cad9ea;
color:#666;
margin-bottom: 10px;
margin-top: 10px;
}
.table th {
background-repeat:repeat-x;
height:30px;
}
.table td,.table th{
border:1px solid #cad9ea;
padding:5px 0.5em 0;
}
.table tr.alter{
background-color:#f5fafe;
}
img{
margin-bottom:0.5em;
width: 220px;
height: 150px;
}
</style>
<script type="text/javascript">

//保存校验
function save(){
/* 	if(appStatus==4 || appStatus==-4){
		if($("#archivenum").val()==""){
			$("#archivenum").tips({
				side:3,
	            msg:'请输入档案编号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#archivenum").focus();
			return false;
		}
		if($("#archivename").val()==""){
			$("#archivename").tips({
				side:3,
	            msg:'请输入档案名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#archivename").focus();
			return false;
		}
	}
	if(appStatus==-1 || appStatus==-2 || appStatus==-3 || appStatus==-4){
		if($("#description").val()==""){
			$("#description").tips({
				side:3,
	            msg:'请输入审核意见',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#description").focus();
			return false;
		}
	} */
	$("#carwzwfAddDetermine").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}
function showPhoto(photoPath){
	var iTop = (window.screen.availHeight - 30 - 650) / 2;
    //获得窗口的水平位置
    var iLeft = (window.screen.availWidth - 10 - 413) / 2; 
		win=window.open ('../echarts5.jsp','newWin', 'modal=yes, width=650,height=413,resizable=no, scrollbars=no,top=' + iTop + ',left=' + iLeft +' '); 
		if (win.location.href != "about:blank") {
			 win.focus();
		}
	
}
</script>

</head>
<body>
<div class="container">
<form action="carwzwfAddDetermine.action" name="carwzwfAddDetermine" id="carwzwfAddDetermine" method="post" >
		<div id="zhongxin">
		<table border="1" class="table">
		    <tr>
		      <th colspan="4">基本信息</th>
		    </tr>
			<tr>
				<th style="text-align: right;width: 80px;">车牌号：</th>
				<td style="text-align: left; width:220px;">${carIllegalInfo.car_num}</td>
			    <th style="text-align: right;width: 80px;">驾驶员姓名：</th>
				<td style="text-align: left; width:220px;">${carIllegalInfo.driver_name}</td>
			</tr>
			<tr>
				<th style="text-align: right;">所属平台：</th>
				<td style="text-align: left;">${carIllegalInfo.company_name}</td>
			    <th style="text-align: right;">身份证号：</th>
				<td style="text-align: left;">${carIllegalInfo.driver_certno}</td>
			</tr>
			<tr>
				<th style="text-align: right;">手机号：</th>
				<td style="text-align: left;">${carIllegalInfo.phone_number}</td>
			    <th style="text-align: right;">违章时间：</th>
				<td style="text-align: left;">${carIllegalInfo.illegal_time}</td>
			</tr>
			<tr>
				<th style="text-align: right;">违章来源：</th>
				<td style="text-align: left;">${carIllegalInfo.illegal_source}</td>
			    <th style="text-align: right;">状态：</th>
				<td style="text-align: left;"><c:choose>  
					    <c:when test="${carIllegalInfo.status=='1'}"> 
							     未判定
					    </c:when>  
					    <c:when test="${carIllegalInfo.status=='2'}"> 
							      已判定
					    </c:when>
					 </c:choose>	
			   </td>
			</tr>
			<tr>
				<th style="text-align: right;">违章内容：</th>
				<td colspan="3" style="text-align: left;">${carIllegalInfo.illegal_content}</td>
			</tr>
			<c:choose>  
					    <c:when test="${carIllegalInfo.illegal_source=='订单'}"> 
			<tr>
		      <th colspan="4">订单信息</th>
		    </tr>
			<tr>
				<th style="text-align: right;">订单信息：</th>
				<td colspan="3" style="text-align: left;"><a href="">跳转到订单信息查询页面</a></td>
			</tr>					   
		                </c:when>  
					    <c:when test="${carIllegalInfo.illegal_source=='运营数据'}"> 
			<tr>
		      <th colspan="4">运营信息</th>
		    </tr>
			<tr>
				<th style="text-align: right;">运营信息：</th>
				<td colspan="3" style="text-align: left;"><a href="">跳转到运营信息查询页面</a></td>
			</tr></c:when>
		    </c:choose>
			<tr>
		      <th colspan="4">违规判定</th>
		    </tr>
			<tr>
				<th style="text-align: right;">判定结果：</th>
				<td colspan="3" style="text-align: left;">
				<select id=decision_result name="decision_result">
							  <option value="0">不构成违规行为</option>
							  <option value="1">巡游</option>
							  <option value="2">非法聚集</option>
							  <option value="3">违规行驶</option>
							  <option value="4">异常运价</option>
							  <option value="5">长期未运营</option>
							  <option value="6">违法行为</option>
				</select>  
			    </td>
			</tr>
			<tr>
				<th style="text-align: right;">是否通知运营平台：</th>
				<td colspan="3" style="text-align: left;">
				<select id="notice_status" name="notice_status">
							  <option value="1">否</option>
							  <option value="2">是</option>
				</select>
				</td>
			</tr>
			<tr>
			
						<th colspan="4" style="text-align: center">
					<input type="hidden" id="car_illegal_id" name="car_illegal_id" value="${carIllegalInfo.car_illegal_id}" />
					<input type="hidden" id="status" name="status" value="2" />
					<input type="hidden" id="certno" name="certno" value="${carIllegalInfo.driver_certno}" />
							<a class='btn btn-mini btn-primary' onclick='save()'>保存</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
						</th>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="<%=basePath%>
		static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
	<script language="javascript" src="jquery-1.4.2.min.js"></script>
</body>
</html>