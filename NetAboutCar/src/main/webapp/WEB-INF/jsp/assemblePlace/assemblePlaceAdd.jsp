<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
select,textarea{
	margin-top: 4px;
	margin-bottom: 4px;
}
textarea{
  width: 222px;
}
</style>
<script type="text/javascript">
//保存
function save(){
	if($("#placeName").val()==""){
		$("#placeName").tips({
			side:3,							//提示窗显示位置  1，2，3，4 分别代表 上右下左 默认为1（上） 可选
            msg:'请输入聚集地点名称',		//提示消息  必填
            bg:'#AE81FF',					//提示窗背景色 默认为红色 可选
            time:2							//自动关闭时间 默认2秒 设置0则不自动关闭 可选
        });
		$("#placeName").focus();
		return false;
	}
	if($("#timeRate").val()==""){
		$("#timeRate").tips({
			side:3,
            msg:'请输入时间频率',
            bg:'#AE81FF',
            time:2
        });
		$("#timeRate").focus();
		return false;
	}
	if($("#carWarningVal").val()==""){
		$("#carWarningVal").tips({
			side:3,
            msg:'请输入车辆数预警阈值',
            bg:'#AE81FF',
            time:2
        });
		$("#carWarningVal").focus();
		return false;
	}
	if($("#carAlarmVal").val()==""){
		$("#carAlarmVal").tips({
			side:3,
            msg:'请输入车辆数报警阈值',
            bg:'#AE81FF',
            time:2
        });
		$("#carAlarmVal").focus();
		return false;
	}
	
	$("#form").submit();
	
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}

</script>
</head>
<body>
	<div class="container">
		<form action="addAssemblePlaceSet.action" method="post" name="form" id="form">
			<div id="zhongxin" align="center" style="padding-top: 30px">
		   	<table>
					<tr>
						<td align="right">聚集地点名称：</td>
						<td align="left"><input class="form-control"
							name="place_name" id="placeName" type="text" /></td>
					</tr>
					<tr>
						<td align="right">时间频率：</td>
						<td align="left"><input class="form-control"
							name="time_rate" id="timeRate" type="text" /></td>
					</tr>
					<tr>
						<td align="right">车辆数预警阈值：</td>
						<td align="left"><input class="form-control"
							name="car_warning_val" id="carWarningVal" type="text" ></input>
						</td>
					</tr>
					<tr>
						<td align="right">车辆数报警阈值：</td>
						<td align="left"><input class="form-control"
							name="car_alarm_val" id="carAlarmVal" type="text" />
						</td>
					</tr>
					
					<tr>
						<td colspan="2" style="text-align: center; padding-top: 10px;">
							<a class="btn btn-mini btn-primary" onclick="save()">保存</a>&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
				</table>
			</div>
			<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="<%=basePath%>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
        </form>     
	</div>
</body>
</html>