<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en"> 
<head> 
	<meta charset="utf-8" /> 
	<title>违规查询</title> 
	<style type="text/css">
		body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
		#map_canvas{width:100%;height:100%;}
		#result {width:100%}
		#controller{width:100%; border-bottom:3px outset; height:30px; filter:alpha(Opacity=100); -moz-opacity:1; opacity:1; z-index:10000; background-color:lightblue;}
	</style>
	<script src="<%=request.getContextPath() %>/bootstrap/js/jquery-1.12.0.min.js" type="text/javascript"></script>
	<script src="http://api.map.baidu.com/api?v=2.0&ak=VKXUs38QIm3FTFxM4SkHBEl86c4RdaMC"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/LuShu/1.2/src/LuShu_min.js"></script>
</head> 
<body> 
    <div id="controller" align="center">
           车牌号：<input id="num" type="text" value="车辆京AK88881"></input>
    <input id="play" type="button" value="查找"  onclick="find();" />
	违规行为：
	<select>
	   <option>违规停车</option>
	   <option>超速行驶</option>
	   <option>闯红灯</option>
	</select>
	<button id="stop" onclick="deletePoint()">查询</button> 
    </div>
	<div id="map_canvas"></div> 
	 
	<!-- <form action="http://api.map.baidu.com/trace/v2/track/addpoint" method="post">
	  <input type="text" value="VKXUs38QIm3FTFxM4SkHBEl86c4RdaMC" name="ak"/>
	  <input type="text" value="125898" name="service_id">
	  <input type="text" value="39.975" name="latitude">
	  <input type="text" value="116.424" name="longitude">
	  <input type="text" value="3" name="coord_type">
	  <input type="text" value="1474869509" name="loc_time">
	  <input type="text" value="测试1" name="entity_name">
	  <button type="submit" value="提交">提交
	</form> -->
	 
	 <!-- <form action="http://api.map.baidu.com/trace/v2/fence/create" method="post">
	  <input type="text" value="VKXUs38QIm3FTFxM4SkHBEl86c4RdaMC" name="ak"/>
	  <input type="text" value="125898" name="service_id">
	  
	  <input type="text" value="电子围栏1" name="name">
	  
	  <input type="text" value="没有描述" name="desc">
	  
	  <input type="text" value="测试1" name="creator">
	  <input type="text" value="测试1" name="monitored_persons">
	   
	   <input type="text" value="测试1" name="observers">
      <input type="text" value="1030,1130" name="valid_times">
      <input type="text" value="1" name="valid_cycle">
      <input type="text" value="20160927" name="valid_date">
      <input type="text" value="2" name="valid_days">
	    
	     <input type="text" value="1" name="shape">
	     <input type="text" value="3" name="coord_type">
	     <input type="text" value="116.424,39.914" name="center">
	     
	     
	  <input type="text" value="116.424,39.914" name="longitude">
	  <input type="text" value="1000" name="radius">
	  <input type="text" value="3" name="alarm_condition">
	  <button type="submit" value="提交">提交
	</form> -->
	 
	<script> 
	var map = new BMap.Map('map_canvas');
	map.setMapStyle({style:'googlelite'});
	map.enableScrollWheelZoom();
	// 实例化一个驾车导航用来生成路线
    var point = new BMap.Point(116.404, 39.914);
	map.centerAndZoom(point, 13);
	map.disableDoubleClickZoom(true);
	var myIcon = new BMap.Icon('http://developer.baidu.com/map/jsdemo/img/car.png', new BMap.Size(52,26),{anchor : new BMap.Size(27, 13)});
	 
	 
	
	 
	
	//页面定时刷新
	//setTimeout('show()',20000); 
	show();
	function stop(){
		clearTimeout(t);
	}
	
	function myrefresh(){
		 window.location.reload();
	}
	function show(){
		var time=$("#time").val();
		var bounds = map.getBounds();
		var sw = bounds.getSouthWest();
		var ne = bounds.getNorthEast();
		var lngSpan = Math.abs(sw.lng - ne.lng);
		var latSpan = Math.abs(ne.lat - sw.lat);
		for (var i = 0; i < 8; i++) {
			var point = new BMap.Point(sw.lng + lngSpan * (Math.random() * 0.7), ne.lat - latSpan * (Math.random() * 0.7));
			var label = new BMap.Label("京A·K8888"+i+" (违规停车) ",{offset:new BMap.Size(20,-10)});
			label.setStyle({ 
				color : "white", 
				fontSize : "16px", 
				backgroundColor :"blue",
				fontWeight :"bold",
			    borderColor:"white"
				});
			var infoWindow = new BMap.InfoWindow("<h4 style='margin:0 0 5px 0;padding:0.2em 0'>张师傅(男)</h4><img  id='imgDemo' src='<%=request.getContextPath()%>/static/images/zp.jpg' width='121' height='140' /><br>车牌：京AK8888"+i+"<br>电话：18611122231<BR><font color='red'>违法行为：违规停车</font>");
			addMarker(point,label,infoWindow);
		}
		deletePoint();
		//setTimeout('show()',10000); 
		
	}
	function deletePoint(){
		var allOverlay = map.getOverlays();
		for (var i = 0; i < allOverlay.length -2; i++){
				map.removeOverlay(allOverlay[i]);
		}
	}
	function addMarker(point,label,infoWindow){
		var marker = new BMap.Marker(point,{icon: myIcon,title:"111"});
		marker.addEventListener("click", function(){          
			   this.openInfoWindow(infoWindow);
			   //图片加载完毕重绘infowindow
			});
		map.addOverlay(marker);
		marker.setLabel(label);
	}
	
	function find(){
		var num=$("#num").val();
		alert("查找车牌号:"+num);
		var allOverlay = map.getOverlays();
		for (var i = 0; i < allOverlay.length -1; i++){
			 console.log(allOverlay[i].toString())
			 if (allOverlay[i].toString() == "[object Marker]") {
				 /* alert("11"); */
				if(allOverlay[i].getLabel().content != num){
					//map.removeOverlay(allOverlay[i]);
					map.removeOverlay(allOverlay[i]);
				} 
			}
		}
	}
	/* function deletePoint(){
		var allOverlay = map.getOverlays();
		for (var i = 0; i < allOverlay.length -1; i++){
			if(allOverlay[i].getLabel().content == "我是id=1"){
				map.removeOverlay(allOverlay[i]);
				return false;
			}
		}
	} */
</script>
</body> 

</html> 