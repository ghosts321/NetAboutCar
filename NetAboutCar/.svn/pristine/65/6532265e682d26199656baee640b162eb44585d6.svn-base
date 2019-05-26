<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
	body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
	#allmap {width: 100%; height:100%; overflow: hidden;}
	#result {width:100%;font-size:12px;}
	dl,dt,dd,ul,li{
		margin:0;
		padding:0;
		list-style:none;
	}
	p{font-size:12px;}
	dt{
		font-size:14px;
		font-family:"微软雅黑";
		font-weight:bold;
		border-bottom:1px dotted #000;
		padding:5px 0 5px 5px;
		margin:5px 0;
	}
	dd{
		padding:5px 0 0 5px;
	}
	li{
		line-height:28px;
	}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/library/GeoUtils/1.2/src/GeoUtils_min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=VKXUs38QIm3FTFxM4SkHBEl86c4RdaMC"></script>
	<!--加载鼠标绘制工具-->
	<!-- <script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
	<link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" /> -->
	<!--加载检索信息窗口-->
	<!-- <script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.js"></script>
	<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.css" /> -->
	<script type="text/javascript" src="<%=basePath %>bootstrap/js/jquery-1.12.0.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>mapJs/map.js"></script>
</head>
<body>
	<div id="allmap" style="overflow:hidden;zoom:1;position:relative;">	
		<div id="map" style="height:100%;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;"></div>
		<input type="hidden" id="basePath" name="basePath" value="<%=basePath %>" />
		<input type="hidden" id="mapSign" name="mapSign" value="${mapSign}" />
		<input type="hidden" id="vehicle_no" name="vehicle_no" value="${ctlIllegalCarMonitor.vehicle_no}" />
		<input type="hidden" id="longitude" name="longitude" value="${ctlIllegalCarMonitor.longitude}" />
		<input type="hidden" id="latitude" name="latitude" value="${ctlIllegalCarMonitor.latitude}" />
		<input type="hidden" id="timer" name="timer" value="${timer}" />
	</div>
</body>
<script type="text/javascript">
	var longitude = $('#longitude').val();
	var latitude = $('#latitude').val();
	var poi = new BMap.Point(longitude,latitude);
	var map = new BMap.Map("map");					// 百度地图API功能
	map.centerAndZoom(poi, 16);					// 设置地图显示的城市和地图级别
	map.enableScrollWheelZoom();					// 启用滚轮放大缩小，默认禁用
	map.enableContinuousZoom();						// 启用地图惯性拖拽，默认禁用
	map.addControl(new BMap.NavigationControl());	// 添加默认缩放平移控件
	map.addControl(new BMap.ScaleControl());		// 添加比例尺控件
	//map.addControl(new BMap.MapTypeControl());		// 添加地图类型控件
	map.addControl(new BMap.OverviewMapControl({
		isOpen : true
	}));											// 添加缩略地图控件
	map.addEventListener("click", function(e) {		// 点击地图弹出该点的经纬度信息
		alert(e.point.lng + "," + e.point.lat);
	});
	var vehicle_no = $('#vehicle_no').val();
	$(function() {
		//baiduMap.init("map");
		//drawingManager.addEventListener('overlaycomplete', baiduMap.overlaycomplete);
		//创建小车图标
		var myIcon = new BMap.Icon('http://developer.baidu.com/map/jsdemo/img/car.png', new BMap.Size(52,26),{anchor : new BMap.Size(27, 13)});
		var label = new BMap.Label(vehicle_no,{offset:new BMap.Size(20,-10)});
		label.setStyle({
			color : "white", 
			fontSize : "16px", 
			backgroundColor :"red",
			fontWeight :"bold",
		    borderColor:"white"
		});
		
		var pt = new BMap.Point(longitude, latitude);
		var marker = new BMap.Marker(pt,{icon:myIcon});  // 创建标注
		marker.setLabel(label);
		map.addOverlay(marker); // 将标注添加到地图中
		//请求action，获取所有图形result
		var url = "<%=basePath%>setAssemblePlace/findAssemblePlaceList.action";
		$.post(url,function(result){
			if(result != null && result.length > 0){
				for(var i=0;i<result.length;i++){
					var jsonObj = result[i];
					
					var pointJson = jsonObj.map_sign;	//经纬度
					var jsonList=eval("("+pointJson+")");
					
					if(jsonObj.map_type==1){	//圆形回显
						baiduMap.createCircle(jsonList, jsonObj.rotundity_radius);
						//map.addOverlay(new BMap.Circle(new BMap.Point(jsonList[0].lng, jsonList[0].lat),jsonObj.rotundity_radius));
					}
					if(jsonObj.map_type==2){	//多边形回显
						baiduMap.createPly(jsonList);
					}
				}
			}
		});
		//TODO 
	});
</script>
</html>
