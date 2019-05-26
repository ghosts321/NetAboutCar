<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../../common.jsp" %>
<link type="text/css" href="<%=basePath%>datetime/css/jquery-ui-1.8.17.custom.css" rel="stylesheet" />
     <link type="text/css" href="<%=basePath%>datetime/css/jquery-ui-timepicker-addon.css" rel="stylesheet" />
    <script type="text/javascript" src="<%=basePath%>datetime/js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>datetime/js/jquery-ui-1.8.17.custom.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>datetime/js/jquery-ui-timepicker-addon.js"></script>
    <script type="text/javascript" src="<%=basePath%>datetime/js/jquery-ui-timepicker-zh-CN.js"></script> 
	<script src="<%=basePath %>static/js/jquery.tips.js" type="text/javascript"></script>    
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
	  var regCarNum=/^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$/;
	  var regIdCard=/^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
	  var carId = $("#certno").val();
	  var car_num = $("#car_num").val();
	
	if(regCarNum.test(car_num)==false){
		$("#car_num").tips({
			side:3,
            msg:'请输入正确的违章车牌号',
            bg:'#AE81FF',
            time:2
        });
		$("#car_num").focus();
		return false;
	}
	if($("#engine_number").val()==""){
		$("#engine_number").tips({
			side:3,
            msg:'请输入发动机号',
            bg:'#AE81FF',
            time:2
        });
		$("#engine_number").focus();
		return false;
	}if($("#illegal_content").val()==""){
		$("#illegal_content").tips({
			side:3,
            msg:'请输入违章事件',
            bg:'#AE81FF',
            time:2
        });
		$("#illegal_content").focus();
		return false;
	}if($("#enforcer").val()==""){
		$("#enforcer").tips({
			side:3,
            msg:'请输入执法人',
            bg:'#AE81FF',
            time:2
        });
		$("#enforcer").focus();
		return false;
	}

	if($("#enforcement_time").val()==""){
		$("#enforcement_time").tips({
			side:3,
            msg:'请输入执法时间',
            bg:'#AE81FF',
            time:2
        });
		$("#enforcement_time").focus();
		return false;
	}
	if($("#enforcement_result").val()==""){
		$("#enforcement_result").tips({
			side:3,
            msg:'请输入执法结果',
            bg:'#AE81FF',
            time:2
        });
		$("#enforcement_result").focus();
		return false;
	}
	$("#carlawInsert").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}

$(function(){
    
    $(".ui_timepicker").datetimepicker({
        //showOn: "button",
        //buttonImage: "./css/images/icon_calendar.gif",
       // buttonImageOnly: true,
        showSecond: true,
        timeFormat: 'hh:mm:ss',
        stepHour: 1,
        stepMinute: 1,
        stepSecond: 1
    }); 
    


});
</script>

</head>
<body>
<div class="container">
<form action="carlawInsert.action" name="carlawInsert" id="carlawInsert" method="post" >
		<div id="zhongxin">
		<table border="1" class="table">
		    
			<tr>
				<th style="text-align: right;">车牌号：</th>
				<td colspan="3" style="text-align: left;">
				<input style="width:200px;" type="text" name="car_num" id="car_num" value=""/></td>
			</tr>
			<tr>
				<th style="text-align: right;">发动机号：</th>
				<td colspan="3" style="text-align: left;">
				<input style="width:200px;" type="text" name="engine_number" id="engine_number" value=""/></td>
			</tr>
			<tr>
				<th style="text-align: right;">违章事件：</th>
				<td colspan="3" style="text-align: left;">
				<input style="width:200px;" type="text" name="illegal_content" id="illegal_content" value=""/></td>
			</tr>
			<tr>
				<th style="text-align: right;">执法人：</th>
				<td colspan="3" style="text-align: left;">
				<input style="width:200px;" type="text" name="enforcer" id="enforcer" value=""/></td>
			</tr>
			<tr>
				<th style="text-align: right;">执法时间：</th>
				<td colspan="3" style="text-align: left;">
				<input style="width:200px;" type="text" class="ui_timepicker" id="enforcement_time" name="enforcement_time" readonly="readonly"  value=""  data-date-format="yyyy-mm-dd" />			
				</tr>
			<tr>
				<th style="text-align: right;">执法结果：</th>
				<td colspan="3" style="text-align: left;">
				<input style="width:200px;height:50px;" type="text" name="enforcement_result" id="enforcement_result" value=""/>
			    </td>
			</tr>
			<tr>
			<th colspan="4" style="text-align: center">
					<input type="hidden" id="car_illegal_id" name="car_illegal_id" value="${carIllegalInfo.car_illegal_id}" />
					<input type="hidden" id="status" name="status" value="2" />
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