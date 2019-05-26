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

	//var regMobile=/^1[3,5,8]\d{9}$/;
	  var regIdCard=/^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
	  
	  //var phoneNum=$("#compn_tel").val();
	  var carId = $("#certno").val();
	  
		if($("#name").val()==""){
			$("#name").tips({
				side:3,
	            msg:'请输入违章人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#name").focus();
			return false;
		}
		if(regIdCard.test(carId)==false){
			$("#certno").tips({
				side:3,
	            msg:'请输入正确的身份证号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#certno").focus();
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
	
		if($("#action_time").val()==""){
			$("#action_time").tips({
				side:3,
	            msg:'请输入执法时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#action_time").focus();
			return false;
		}
		if($("#action_result").val()==""){
			$("#action_result").tips({
				side:3,
	            msg:'请输入执法结果',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#action_result").focus();
			return false;
		}
	$("#driverlawInsert").submit();
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
<form action="driverlawInsert.action" name="driverlawInsert" id="driverlawInsert" method="post" >
		<div id="zhongxin">
		<table border="1" class="table">
		    
			<tr>
				<th style="text-align: right;">违章人：</th>
				<td colspan="3" style="text-align: left;">
				<input style="width:200px;" type="text" name="name" id="name" value=""/></td>
			</tr>
			<tr>
				<th style="text-align: right;">身份证号：</th>
				<td colspan="3" style="text-align: left;">
				<input style="width:200px;" type="text" name="certno" id="certno" value=""/></td>
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
				<input style="width:200px;" type="text" class="ui_timepicker" id="action_time" name="action_time" readonly="readonly"  value=""  data-date-format="yyyy-mm-dd" />			
				</tr>
			<tr>
				<th style="text-align: right;">执法结果：</th>
				<td colspan="3" style="text-align: left;">
				<!-- <textarea style="width:200px;height:50px;" type="text" id="action_result" name="action_result" value="">
				</textarea>  -->
				<input style="width:200px;height:50px;" type="text" name="action_result" id="action_result" value=""/> 
			    </td>
			</tr>
			<tr>
			<th colspan="4" style="text-align: center">
					<input type="hidden" id="drv_illegal_id" name="drv_illegal_id" value="${drvIllegalInfo.drv_illegal_id}" />
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