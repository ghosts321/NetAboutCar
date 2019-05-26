var map;//地图对象
var drawingManager;//鼠标绘制工具
var overlays = [];//绘制覆盖物个数
var infoWindow;
var guiType,guiData,circleRat;
var baiduMap = {
	//初始化所有组件
	init : function(id) {
		baiduMap.initMap(id);
	},
	//初始化MAP地图
	initMap : function(id) {
		map = new BMap.Map(id);
		map.setMapStyle({
			style : 'googlelite'
		});
//		var poi = new BMap.Point(116.400, 39.914);
		map.centerAndZoom("北京", 16);	//地图打开时显示的初始位置
		map.enableScrollWheelZoom();	//启用鼠标滚轮放大	
		
		if(id == "assembleSetMap"){
			baiduMap.addDrawTool();		//添加鼠标绘制工具
		}
	},
	
	//添加鼠标绘制工具
	addDrawTool : function() {
		var styleOptions = {
			strokeColor : "red", //边线颜色。
			fillColor : "red", //填充颜色。当参数为空时，圆形将没有填充效果。
			strokeWeight : 3, //边线的宽度，以像素为单位。
			strokeOpacity : 0.8, //边线透明度，取值范围0 - 1。
			fillOpacity : 0.6, //填充的透明度，取值范围0 - 1。
			strokeStyle : 'solid' //边线的样式，solid或dashed。
		}
		//实例化鼠标绘制工具
		drawingManager = new BMapLib.DrawingManager(map, {
			isOpen : false, //是否开启绘制模式
			enableDrawingTool : true, //是否显示工具栏
			drawingToolOptions : {
				anchor : BMAP_ANCHOR_TOP_RIGHT, //位置
				offset : new BMap.Size(5, 5), //偏离值
			},
			circleOptions : styleOptions, //圆的样式
			polylineOptions : styleOptions, //线的样式
			polygonOptions : styleOptions, //多边形的样式
			rectangleOptions : styleOptions //矩形的样式
		});
	},
	
	//初始化弹出层的信息
	initInfoWindow : function(url) {
		if($("#updateMake").val() == "make"){	//打开修改窗口
			var opts = {
				width : 350, // 信息窗口宽度
				height : 270, // 信息窗口高度
				title : "聚集地点修改", // 信息窗口标题
				panel : "panel",
				enableAutoPan : true
			};
		}
		else {	//打开设置窗口
			var opts = {
				width : 350, // 信息窗口宽度
				height : 270, // 信息窗口高度
				title : "聚集地点设置", // 信息窗口标题
				panel : "panel",
				enableAutoPan : true
			};
		}
		
		var sContent = "<iframe src='" + url +"' style='width:350px;height:270px;' scrolling='no'"
		+ "frameborder='0'></iframe>";
		
		infoWindow = new BMap.InfoWindow(sContent, opts);
	},
	//鼠标绘制完成后执行的函数
	overlaycomplete : function(e) {
		overlays.push(e.overlay);
		map.addOverlay(e.overlay);
		var lng1, lat1;
		var drawMode = e.drawingMode;//获取所画图像的类型
		if (drawMode == BMAP_DRAWING_CIRCLE) {//所画的是圆形
			var ra = e.overlay.getRadius();//获取圆半径
			var lng = e.overlay.getCenter().lng;//获取圆心的经度
			var lat = e.overlay.getCenter().lat;//获取圆心的纬度
			lng1 = lng;
			lat1 = lat;
			
			guiType="circle";
			guiData="[{lng:" + lng + ",lat:" + lat+ "}]";
			circleRat=ra;
		}
		if (drawMode == BMAP_DRAWING_MARKER) {//所画的是个点        	
			var lng = e.overlay.getPosition().lng;
			var lat = e.overlay.getPosition().lat;
			lng1 = lng;
			lat1 = lat;
			
			guiType="marker";
			guiData="[{lng:" + lng + ",lat:" + lat + "}]";
			circleRat=0;
		}
		if (drawMode == BMAP_DRAWING_POLYLINE
				|| drawMode == BMAP_DRAWING_POLYGON
				|| drawMode == BMAP_DRAWING_RECTANGLE) {//所画的是折线、多边形、矩形
			var path = e.overlay.getPath();///Array<Point> 返回多边型的点数组
			lng1 = path[0].lng;
			lat1 = path[0].lat;
			var pointJson = "[";
			for (var i = 0; i < path.length; i++) {
				if (i == path.length - 1) {
					pointJson += "{lng:" + path[i].lng + ",lat:"
							+ path[i].lat + "}";
				} else {
					pointJson += "{lng:" + path[i].lng + ",lat:"
							+ path[i].lat + "},";
				}
			}
			pointJson += "]";
			
			guiType="ppr";
			guiData=pointJson;
			circleRat=0;
		}
		
		//弹出添加页面
		baiduMap.initInfoWindow($("#basePath").val()+"setAssemblePlace/assemblePlaceAdd.action?guiType="+guiType+"&guiData="+guiData+"&circleRat="+circleRat);
		map.openInfoWindow(infoWindow, new BMap.Point(lng1, lat1));
		
		e.overlay.addEventListener("click", function() {
			baiduMap.initInfoWindow($("#basePath").val()+"setAssemblePlace/assemblePlaceAdd.action?guiType="+guiType+"&guiData="+guiData+"&circleRat="+circleRat);
			map.openInfoWindow(infoWindow, new BMap.Point(lng1, lat1));
		});
		
		//清除覆盖物中的值
		guiType="";
		guiData="";
		circleRat="";
	},
	//清除所有覆盖物
	clearAll : function() {
		for ( var i = 0; i < overlays.length; i++) {
			map.removeOverlay(overlays[i]);
		}
	},
	//判断点是否在多边形内
	//pt: 点对象 
	//ply: 多边形对象
	ptInPolygon : function(pt, ply) {
		var result = BMapLib.GeoUtils.isPointInPolygon(pt, ply);
		return result;
	},
	//判断点是否在矩形内
	//pt: 点对象 
	//bounds 矩形边界对象
	ptInRect : function(pt, bounds) {
		var result = BMapLib.GeoUtils.isPointInRect(pt, bounds);
		return result;
	},
	//判断点是否在圆形内
	//pt: 点对象 
	//circle 圆形对象
	ptInCircle : function(pt, circle) {
		var result = BMapLib.GeoUtils.isPointInCircle(pt, circle);
		return result;
	},
	//判断点是否在折线上
	//pt: 点对象 
	//polyline 折线对象
	ptOnPolyline : function(pt, polyline) {
		var result = BMapLib.GeoUtils.isPointOnPolyline(pt, polyline);
		return result;
	},
	//创建圆形
	createCircle: function(jsonList, rat){
		var point = new BMap.Point(jsonList[0].lng, jsonList[0].lat);
		var circle = new BMap.Circle(point,rat);
		map.addOverlay(circle);
		return circle;
	},
	//创建矩形，多边形，折线
	createPly: function(jsonList){
		var pts = [];
		for(var i=0;i<jsonList.length;i++){
			pts.push(new BMap.Point(jsonList[i].lng,jsonList[i].lat));
		}
		var ply = new BMap.Polygon(pts);
		map.addOverlay(ply);
		return ply;
	}
}