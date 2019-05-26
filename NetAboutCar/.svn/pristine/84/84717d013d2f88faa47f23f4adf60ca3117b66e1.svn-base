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
	 /* if($("#check_result").val()==""){
			$("#check_result").tips({
				side:3,
	            msg:'请输入审核结果',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#check_result").focus();
			return false;
		} */

		
	$("#carwzwfAddExamine").submit();
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
<form action="carwzwfAddExamine.action" name="carwzwfAddExamine" id="carwzwfAddExamine" method="post" >
		<div id="zhongxin">
		<table border="1" class="table">
		<input type="hidden" value="${carIllegalInfo.driver_name}"  id="driver_name">
		    <tr>
		      <th colspan="4">基本信息</th>
		    </tr>
			<tr>
				<th style="text-align: right;width: 80px;">车牌号：</th>
				<td style="width:220px;">${carIllegalInfo.car_num}</td>
			    <th style="text-align: right;width: 80px;">驾驶员姓名：</th>
				<td style="width:220px;">${carIllegalInfo.driver_name}</td>
			</tr>
			<tr>
				<th style="text-align: right;">所属平台：</th>
				<td>${carIllegalInfo.company_name}</td>
			    <th style="text-align: right;">身份证号：</th>
				<td>${carIllegalInfo.driver_certno}</td>
			</tr>
			<tr>
				<th style="text-align: right;">手机号：</th>
				<td>${carIllegalInfo.phone_number}</td>
			    <th style="text-align: right;">违章时间：</th>
				<td>${carIllegalInfo.illegal_time}</td>
			</tr>
			<tr>
				<th style="text-align: right;">违章来源：</th>
				<td>${carIllegalInfo.illegal_source}</td>
			    <th style="text-align: right;">状态：</th>
				<td><c:choose>  
					    <c:when test="${carIllegalInfo.status=='2'}"> 
							     未审核
					    </c:when>  
					    <c:when test="${carIllegalInfo.status=='3'}"> 
							      已审核
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
				<td colspan="3" style="text-align: letf;"><a href="">跳转到订单信息查询页面</a></td>
			</tr>					   
		                </c:when>  
					    <c:when test="${carIllegalInfo.illegal_source=='运营数据'}"> 
			<tr>
		      <th colspan="4">运营信息</th>
		    </tr>
			<tr>
				<th style="text-align: right;">运营信息：</th>
				<td colspan="3" style="text-align: left;"><a href = "">跳转到运营信息查询页面</a></td>
			</tr></c:when>
		    </c:choose>
			<tr>
		      <th colspan="4">违规判定</th>
		    </tr>
			<tr>
				<th style="text-align: right;">判定结果：</th>
				<td colspan="3" style="text-align: left;">
				<c:choose>  
					    <c:when test="${carIllegalInfo.decision_result=='0'}"> 
							     不构成违规行为
					    </c:when>  
					    <c:when test="${carIllegalInfo.decision_result=='1'}"> 
							      巡游
					    </c:when>
					    <c:when test="${carIllegalInfo.decision_result=='2'}"> 
							     非法聚集
					    </c:when>  
					    <c:when test="${carIllegalInfo.decision_result=='3'}"> 
							      违规行驶
					    </c:when><c:when test="${carIllegalInfo.decision_result=='4'}"> 
							     异常运价
					    </c:when>  
					    <c:when test="${carIllegalInfo.decision_result=='5'}"> 
							     长期未运营
					    </c:when><c:when test="${carIllegalInfo.decision_result=='6'}"> 
							     违法行为
					    </c:when>  
					 </c:choose>	
			    </td>
			</tr>
			<tr>
				<th style="text-align: right;">审核结果：</th>
				<td colspan="3" style="text-align: left;">
				<input style="width:200px;height:50px;" type="text" name="check_result" id="check_result" value=""/>
				</td>
			</tr>
			<tr>
			
						<th colspan="4" style="text-align: center">
					<input type="hidden" id="car_illegal_id" name="car_illegal_id" value="${carIllegalInfo.car_illegal_id}" />
					<input type="hidden" id="status" name="status" value="2" />
					<input type="hidden" id="company_name" name="company_name" value="${carIllegalInfo.company_name}" />
					<input type="hidden" id="car_num" name="car_num" value="${carIllegalInfo.car_num}" />
					<input type="hidden" id="driver_certno" name="driver_certno" value="${carIllegalInfo.driver_certno}" />
					<input type="hidden" id="areacode" name="areacode" value="${carIllegalInfo.areacode}" />
					<input type="hidden" id="illegal_time" name="illegal_time" value="${carIllegalInfo.illegal_time}" />
					<input type="hidden" id="illegal_content" name="illegal_content" value="${carIllegalInfo.illegal_content}" />
					<input type="hidden" id="driver_name" name="driver_name" value="${carIllegalInfo.driver_name}" />
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