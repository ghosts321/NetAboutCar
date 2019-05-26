<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
	body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
	#allmap {width: 100%; height:500px; overflow: hidden;}
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
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=VKXUs38QIm3FTFxM4SkHBEl86c4RdaMC"></script>
	<!--加载鼠标绘制工具-->
	<script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
	<link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" />
	<!--加载检索信息窗口-->
	<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.js"></script>
	<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.css" />
	<title>电子围栏</title>
</head>
<body>
	<div id="allmap" style="overflow:hidden;zoom:1;position:relative;">	
		<div id="map" style="height:100%;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;"></div>
	</div>
	<div id="result">
		<input type="button" value="获取绘制的覆盖物个数" onclick="alert(overlays.length)"/>
		<input type="button" value="清除所有覆盖物" onclick="clearAll()"/>
		<input type="button" value="是否在多边形内" onclick="aa()"/>
		<input type="button" value="是否在多边形内2" onclick="ptInPolygon()"/>
	</div>
	<script type="text/javascript">
	// 百度地图API功能
    var map = new BMap.Map('map');
    map.setMapStyle({style:'googlelite'});
    var poi = new BMap.Point(116.400, 39.914);
    var points = [];
    var bPoints = [];
    map.centerAndZoom(poi, 16);
    map.enableScrollWheelZoom();  
    var overlays = [];
	var overlaycomplete = function(e){
        overlays.push(e.overlay);
    };
    var styleOptions = {
        strokeColor:"red",    //边线颜色。
        fillColor:"red",      //填充颜色。当参数为空时，圆形将没有填充效果。
        strokeWeight: 3,       //边线的宽度，以像素为单位。
        strokeOpacity: 0.8,	   //边线透明度，取值范围0 - 1。
        fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
        strokeStyle: 'solid' //边线的样式，solid或dashed。
    }
    //实例化鼠标绘制工具
    var drawingManager = new BMapLib.DrawingManager(map, {
        isOpen: false, //是否开启绘制模式
        enableDrawingTool: true, //是否显示工具栏
        drawingToolOptions: {
            anchor: BMAP_ANCHOR_TOP_RIGHT, //位置
            offset: new BMap.Size(5, 5) //偏离值
        },
        circleOptions: styleOptions, //圆的样式
        polylineOptions: styleOptions, //线的样式
        polygonOptions: styleOptions, //多边形的样式
        rectangleOptions: styleOptions //矩形的样式
    });  
	 //添加鼠标绘制工具监听事件，用于获取绘制结果
    drawingManager.addEventListener('overlaycomplete', overlaycomplete);
    function clearAll() {
		for(var i = 0; i < overlays.length; i++){
            map.removeOverlay(overlays[i]);
        }
        overlays.length = 0   
    }
    
    
    
    
      var pts = [];
      var pt1 = new BMap.Point(116.395, 39.910);
      var pt2 = new BMap.Point(116.394, 39.914);
      var pt3 = new BMap.Point(116.403, 39.920);
      var pt4 = new BMap.Point(116.402, 39.914);
      var pt5 = new BMap.Point(116.410, 39.913);    
      
      pts.push(pt1);
      pts.push(pt2);
      pts.push(pt3);
      pts.push(pt4);
      pts.push(pt5);  
      var ply = new BMap.Polygon(pts);
      
      var pt =new BMap.Point(116.400, 39.914);
      //演示：将面添加到地图上    
      map.clearOverlays();
      var mkr = new BMap.Marker(pt);
      map.addOverlay(mkr);
      map.addOverlay(ply);  
      //setTimeout(dynamicLine, 1000);
      function ptInPolygon(pt){
		      var result = BMapLib.GeoUtils.isPointInPolygon(pt, ply);
		      if(result == false){
		          alert("小车不在电子围栏内");
		      } 
		         
      }
      
      //添加线  
      function addLine(points){  
        
          var linePoints = [],pointsLen = points.length,i,polyline;  
          if(pointsLen == 0){  
              return;  
          }  
          // 创建标注对象并添加到地图     
          for(i = 0;i <pointsLen;i++){  
              linePoints.push(new BMap.Point(points[i].lng,points[i].lat));  
          }  
        
          polyline = new BMap.Polyline(linePoints, {strokeColor:"red", strokeWeight:2, strokeOpacity:0.5});   //创建折线  
          map.addOverlay(polyline);   //增加折线  
      }  
      
      function aa(){
    	  
	      var pointJson="[{lng:'116.394664',lat:'39.913806'},{lng:'116.396101',lat:'39.913806'},{lng:'116.398509',lat:'39.913862'},{lng:'116.399731',lat:'39.912893'},{lng:'116.401958',lat:'39.914028'},{lng:'116.40548',lat:'39.914028'}]";
	      var jsonList=eval("("+pointJson+")");
		      for(var i=0; i<jsonList.length; i++)  
		      {  
		         var lng=jsonList[i].lng;
		         var lat=jsonList[i].lat;
		         var point={"lng":lng,"lat":lat};
		         var makerPoints = [];  
		    	 var newLinePoints = [];  
		    	 var len;  
		    	 
		    	 makerPoints.push(point);              
	    	     addMarker(makerPoints);//增加对应该的轨迹点  
	    	     points.push(point);  
	    	     bPoints.push(new BMap.Point(lng,lat));  
	    	     len = points.length;  
	    	     newLinePoints = points.slice(len-2, len);//最后两个点用来画线。  
	    	  
	    	     addLine(newLinePoints);//增加轨迹线  
	    	     ptInPolygon(new BMap.Point(lng,lat));
		      }  
      }
      
      //随机生成新的点，加入到轨迹中。 
       function dynamicLine(){  
    	    var lng = 116+getRandom(40);  
    	    var lat = 39+getRandom(30);  
    	    var id = getRandom(1000);  
    	    var point = {"lng":lng,"lat":lat,"status":1,"id":id}  
    	    var makerPoints = [];  
    	    var newLinePoints = [];  
    	    var len;  
    	  
    	    makerPoints.push(point);              
    	    addMarker(makerPoints);//增加对应该的轨迹点  
    	    points.push(point);  
    	    bPoints.push(new BMap.Point(lng,lat));  
    	    len = points.length;  
    	    newLinePoints = points.slice(len-2, len);//最后两个点用来画线。  
    	  
    	    addLine(newLinePoints);//增加轨迹线  
    	    setZoom(bPoints);  
    	    setTimeout(dynamicLine, 1000);  
    	}  
      function setZoom(bPoints){  
    	    var view = map.getViewport(eval(bPoints));  
    	    var mapZoom = view.zoom;   
    	    var centerPoint = view.center;   
    	    map.centerAndZoom(centerPoint,mapZoom);  
    	} 
    //在轨迹点上创建图标，并添加点击事件，显示轨迹点信息。points,数组。
		function addMarker(points){
			var pointsLen = points.length;
			if(pointsLen == 0){
				return;
			}
			var myIcon = new BMap.Icon('http://developer.baidu.com/map/jsdemo/img/car.png', new BMap.Size(52,26),{anchor : new BMap.Size(27, 13)});

			// 创建标注对象并添加到地图   
			for(var i = 0;i <pointsLen;i++){
				var point = new BMap.Point(points[i].lng,points[i].lat);
				var marker = new BMap.Marker(point, {icon: myIcon});
				map.addOverlay(marker); 
			}
		}    
      // 获取随机数  
      function getRandom(n){  
          return Math.floor(Math.random()*n+1)  
      }  
</script>
</body>
</html>
