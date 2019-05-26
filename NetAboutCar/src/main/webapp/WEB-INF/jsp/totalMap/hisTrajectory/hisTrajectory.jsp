<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../../common.jsp"%>
<!DOCTYPE html>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=basePath %>mapJs/map.js"></script>
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
//查询
function btn_query(){
	var vehicleno = $("#vehicleno").val();
	var begintime = $("#begintime").val();
	var endtime = $("#endtime").val();
	if(verification()==false){
		return false;
	}
	$.ajax({
		url:'getLngLat.action',
		type:'post',
		dataType:'json',
		data:{
			vehicleno:vehicleno,
			begintime:begintime,
			endtime:endtime
		},
		success:function(data){
			if(data.length==0){
				alert('未检索到数据，请重新输入！');
				return false;
			}
			window.parent.baiduMap.createTra(data);	//将轨迹显示到地图上
		}
	});
	return false;
}

//查询条件非空校验
function verification() {
	if($("#vehicleNo").val() == ""){
		$("#vehicleNo").tips({
			side:3,
            msg:'请输入车牌号',
            bg:'#AE81FF',
            time:3
        });
		$("#vehicleNo").focus();
		return false;
	}
	if($("#begintime").val()==""){
		$("#begintime").tips({
			side:3,
            msg:'请选择定位开始时间',
            bg:'#AE81FF',
            time:2
        });
		$("#begintime").focus();
		return false;
	}
	if($("#endtime").val()==""){
		$("#endtime").tips({
			side:3,
            msg:'请选择定位结束时间',
            bg:'#AE81FF',
            time:2
        });
		$("#endtime").focus();
		return false;
	}
}

$(function(){
	//日期控件
   	$('.date-picker').datepicker();
});

//日期校验
function changeDateValue(){
	var begin = $("#begintime").val();
	var end = $("#endtime").val();	
	
	var arr = begin.split("-");
    var begintm = new Date(arr[0], arr[1], arr[2]);
    var begintms = begintm.getTime();

    var arrs = end.split("-");
    var endtm = new Date(arrs[0], arrs[1], arrs[2]);
    var endtms = endtm.getTime();

	if(end == "" || begintms > endtms){ //开始时间大于结束时间时，设置结束时间的值为开始时间
		$("#endtime").val(begin);
	}
}
function changeDateValue1(){
	var begin = $("#begintime").val();
	var end = $("#endtime").val();	
	
	var arr = begin.split("-");
    var begintm = new Date(arr[0], arr[1], arr[2]);
    var begintms = begintm.getTime();

    var arrs = end.split("-");
    var endtm = new Date(arrs[0], arrs[1], arrs[2]);
    var endtms = endtm.getTime();

	if(begin == "" || begintms > endtms){ //开始时间大于结束时间时，设置结束时间的值为开始时间
		$("#begintime").val(end);
	}
}
</script>
</head>
<body>
	<div class="container">
	   	<table border="0" cellspacing="0" cellpadding="0" style="width:380px;padding:5px;">
			<tr>
				<td style="width:65px;">定位时间</td>
				<td>
					<input style="width:100px;" class="date-picker" name="begin_time" id="begintime" type="text" data-date-format="yyyy-mm-dd" onchange="changeDateValue();"/>
					至&nbsp;<input style="width:100px;" class="date-picker" name="end_time" id="endtime" type="text" data-date-format="yyyy-mm-dd" onchange="changeDateValue1();"/>
				</td>
            </tr>
			<tr>
				<td>车牌号</td>
				<td>
					<input class="form-control" name="vehicle_no" id="vehicleno" type="text" size="8" style="width:225px;"/>
				</td>
			</tr>
			
			<tr>
			 	<td></td>
				<td style="text-align: center; padding-top: 50px;">
					<a class="btn btn-mini btn-primary" onclick="btn_query()">查询</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>