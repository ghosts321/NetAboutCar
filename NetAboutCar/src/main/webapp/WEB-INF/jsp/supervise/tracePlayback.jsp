<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String basePath2 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>

<!DOCTYPE html>
<html>
<head>
<link href="<%=basePath %>bootstrap/css/bootstrap.css" rel="stylesheet"/>
<link href="<%=basePath %>static/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="<%=basePath %>static/css/datepicker.css" rel="stylesheet" /><!-- 日期框 -->

<script src="<%=basePath %>bootstrap/js/jquery-1.12.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath %>static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
<script src="<%=basePath %>bootstrap/js/bootstrap.js" type="text/javascript"></script>
<script src="<%=basePath %>static/js/jquery.tips.js" type="text/javascript"></script>

<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
html {
	height: 100%
}

body {
	height: 100%;
	margin: 0px;
	padding: 0px
}

#controller {
	width: 100%;
	border-bottom: 3px outset;
	height: 30px;
	filter: alpha(Opacity = 100);
	-moz-opacity: 1;
	opacity: 1;
	z-index: 10000;
	background-color: lightblue;
}

#allmap {
	height: 100%
}
</style>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=1.5&ak=VKXUs38QIm3FTFxM4SkHBEl86c4RdaMC"></script>
</head>

<body>
	<div id="controller" align="center">
	<div class="container">
		车牌号：<input id="vehicle_no" type="text" size="12"/>
		定位时间：<input class="date-picker" id="begin_time" type="text"
				data-date-format="yyyy-mm-dd" onchange="changeDateValue();"/> ~ 
		<input class="date-picker" id="end_time" type="text"
				data-date-format="yyyy-mm-dd" onchange="changeDateValue1();"/>
		<input id="btn_query" type="button" value="查询"/>
	</div>
	</div>
	<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">
	var map = new BMap.Map("allmap");				// 百度地图API功能
	map.centerAndZoom("河南", 14);					// 设置地图显示的城市和地图级别
	map.enableScrollWheelZoom();					// 启用滚轮放大缩小，默认禁用
	map.enableContinuousZoom();						// 启用地图惯性拖拽，默认禁用
	map.addControl(new BMap.NavigationControl());	// 添加默认缩放平移控件
	map.addControl(new BMap.ScaleControl());		// 添加比例尺控件
	map.addControl(new BMap.MapTypeControl());		// 添加地图类型控件
	map.addControl(new BMap.OverviewMapControl({
		isOpen : true
	}));											// 添加缩略地图控件
	map.addEventListener("click", function(e) {		// 点击地图弹出该点的经纬度信息
		alert(e.point.lng + "," + e.point.lat);
	});
	$(function(){
		//日期控件
		$('.date-picker').datepicker();
	});
	// 日期校验
	function changeDateValue(){
		var beginTime = $("#begin_time").val();
		var endTime = $("#end_time").val();	
		
		var arr = beginTime.split("-");
	    var begintime = new Date(arr[0], arr[1], arr[2]);
	    var begintimes = begintime.getTime();

	    var arrs = endTime.split("-");
	    var endtime = new Date(arrs[0], arrs[1], arrs[2]);
	    var endtimes = endtime.getTime();

		if(endTime == "" || begintimes > endtimes){ //开始时间大于结束时间时，设置结束时间的值为开始时间
			$("#end_time").val(beginTime);
		}
	}
	function changeDateValue1(){
		var beginTime = $("#begin_time").val();
		var endTime = $("#end_time").val();	
		
		var arr = beginTime.split("-");
	    var begintime = new Date(arr[0], arr[1], arr[2]);
	    var begintimes = begintime.getTime();

	    var arrs = endTime.split("-");
	    var endtime = new Date(arrs[0], arrs[1], arrs[2]);
	    var endtimes = endtime.getTime();

		if(beginTime == "" || begintimes > endtimes){ //开始时间大于结束时间时，设置结束时间的值为开始时间
			$("#begin_time").val(endTime);
		}
	}

	// 添加回车事件
	document.onkeydown=function(event){
	    var e = event || window.event || arguments.callee.caller.arguments[0];
	    if(e && e.keyCode==13){ // enter 键
	    	
	    	//日期条件非空校验
	    	var result = true;
	    	if(verification() == false){
	    		result = false;
	    	}
	    	if(result){
		    	$('#tradeList').bootstrapTable('refresh');
	    	}; 
	    }
	};

	// 日期查询条件非空校验
	function verification() {
		if($("#vehicle_no").val() == ""){
			$("#vehicle_no").tips({
				side:3,
	            msg:'请输入车牌号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#vehicle_no").focus();
			return false;
		}
		if($("#begin_time").val() == "" &&  $("#end_time").val() == ""){
			$("#begin_time").tips({
				side:3,
	            msg:'请选择定位开始时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#begin_time").focus();
			return false;
		}
		if($("#begin_time").val() != "" &&  $("#end_time").val() == ""){
			$("#end_time").tips({
				side:3,
	            msg:'请选择定位结束时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#end_time").focus();
			return false;
		}
		if($("#end_time").val() != "" &&  $("#begin_time").val() == ""){
			$("#begin_time").tips({
				side:3,
	            msg:'请选择定位开始时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#begin_time").focus();
			return false;
		}
	}
	$('#btn_query').click(function () {
		var vehicle_no = $("#vehicle_no").val();
		var begintime = $("#begin_time").val();
		var endtime = $("#end_time").val();
		/* if(null==vehicle_no || vehicle_no==''){
			alert("请输入车牌号!");
			return false;
		}
		if(null==begintime || begintime==''){
			alert("请选择定位开始时间！");
			return false;
		}
		if(null==endtime || endtime==''){
			alert("请选择定位结束时间！");
			return false;
		} */
		if(verification()==false){
			return false;
		}
		$.ajax({
			url:'getLngLat.action',
			type:'post',
			dataType:'json',
			data:{
				vehicle_no:vehicle_no,
				begintime:begintime,
				endtime:endtime
			},
			success:function(data){
				if(data.length==0){
					alert('未检索到数据，请重新输入！');
					return false;
				}
				map.clearOverlays();		// 清除标注信息
			    var points = [];			// 添加折线运动轨迹
			    $.each(data,function(i,d){
			    	var owners = d.owners;				//车主
			    	var longitude = d.lng;				// 经度
			    	var latitude = d.lat;				// 纬度
				    var point = new BMap.Point(longitude, latitude);	// 填充标注点
			    	if(i==0){
			    		map.setCenter(point);							// 设置中心坐标
			    	}
			    	var tips = owners;
			    	addMarker(point, map, tips);
			    	points.push(point);
			    });
			    var polyline = new BMap.Polyline(points);
				map.addOverlay(polyline); 								//绘制曲线
			}
		});
		return false;
	});
	//编写自定义函数,创建标注
	function addMarker(point, map, tips){
		var marker = new BMap.Marker(point);
		map.addOverlay(marker);
		//为标注添加文字信息
		var label = new BMap.Label(tips,{offset:new BMap.Size(20,-10)});
		marker.setLabel(label);
	}
</script>
