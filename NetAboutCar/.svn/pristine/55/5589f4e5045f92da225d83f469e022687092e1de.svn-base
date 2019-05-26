<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	#allmap {width: 100%; height:95%; overflow: hidden;}
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
	<script type="text/javascript" src="<%=basePath %>bootstrap/js/jquery-1.12.0.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>mapJs/globalMap.js"></script>
</head>
<body>
	<div id="controller" style="width:100%; border-bottom:3px outset; height:30px; filter:alpha(Opacity=100); -moz-opacity:1; opacity:1; z-index:10000; background-color:lightblue;" align="center">
   		<input id="play" type="button" value="清除所有覆盖物" onclick="baiduMap.clearAll();" />
    </div>
    
	<div id="allmap" style="overflow:hidden;zoom:1;position:relative;">	
		<div id="assembleSetMap" style="height:100%;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;"></div>
		
		<input type="hidden" id="basePath" name="basePath" value="<%=basePath %>" />
		
		<input type="hidden" id="mapType" name="mapType" value="${mapType }" />
		<input type="hidden" id="mapSign" name="mapSign" value="${mapSign }" />
		<input type="hidden" id="rotundityRadius" name="rotundityRadius" value="${rotundityRadius }" />
		<input type="hidden" id="updateMake" name="updateMake" value="${updateMake }" />
	</div>
</body>

<script type="text/javascript">
	$(function() {
		baiduMap.init("assembleSetMap");
		drawingManager.addEventListener('overlaycomplete', baiduMap.overlaycomplete);
		
		//回显要修改的图形
		if($("#updateMake").val() == "make"){
			var rat = $("#rotundityRadius").val();	//半径
			var mapSign = $("#mapSign").val();		//经纬度
			var jsonList=eval("("+mapSign+")");
			
			if($("#mapType").val()==1){		//修改图形为圆形
				var circle = baiduMap.createCircle(jsonList, rat);
				
				//点击弹出圆形修改窗口
				circle.addEventListener("click", function() {
					baiduMap.initInfoWindow($("#basePath").val()+"setAssemblePlace/assemblePlaceUpdate.action");
					map.openInfoWindow(infoWindow, new BMap.Point(jsonList[0].lng,jsonList[0].lat));
				});
			}
			else if($("#mapType").val()==2){		//修改图形为多边形
				var ply = baiduMap.createPly(jsonList);
				
				//点击弹出多边形修改窗口
				ply.addEventListener("click", function() {
					baiduMap.initInfoWindow($("#basePath").val()+"setAssemblePlace/assemblePlaceUpdate.action");
					map.openInfoWindow(infoWindow, new BMap.Point(jsonList[0].lng,jsonList[0].lat));
				});
			}
			
		}
		//新增-回显所有图形
		else {
			//请求action，获取所有图形result
			var url = $("#basePath").val()+"setAssemblePlace/findAssemblePlaceList.action";
			$.post(url,function(result){
				if(result != null && result.length > 0){
					for(var i=0;i<result.length;i++){
						var jsonObj = result[i];
						
						var pointJson = jsonObj.map_sign;	//经纬度
						var jsonList=eval("("+pointJson+")");
						
						if(jsonObj.map_type==1){	//圆形回显
							baiduMap.createCircle(jsonList, jsonObj.rotundity_radius);
						}
						if(jsonObj.map_type==2){	//多边形回显
							baiduMap.createPly(jsonList);
						}
					}
				}
			});
		}
	});
</script>
</html>
