<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../../common.jsp"%>
<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragrma","no-cache");
response.setDateHeader("Expires",0);
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
	body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
	.anchorBL{display:none;}
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
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=VKXUs38QIm3FTFxM4SkHBEl86c4RdaMC"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.js"></script>
	<script type="text/javascript" src="http://developer.baidu.com/map/custom/stylelist.js"></script>
	<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.css" />
	
	<!--加载路书-->
	<!-- <script src="http://api.map.baidu.com/api?v=2.0&ak=MuCvlxAuTALUj28BePkGUK22vywzAuaE"></script> -->
	<!-- <script type="text/javascript" src="http://api.map.baidu.com/library/LuShu/1.2/src/LuShu_min.js"></script> -->
	<script type="text/javascript" src="<%=basePath %>mapJs/LuShu_min.js"></script>
	
	<!--加载鼠标绘制工具-->
	<script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
	<link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" />
	
	<!--加载检索信息窗口-->
	<script type="text/javascript" src="<%=basePath %>bootstrap/js/jquery-1.12.0.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>plugins/attention/zDialog/js/zDialog.js"></script>
	<script type="text/javascript" src="<%=basePath %>mapJs/map.js"></script>
	<script type="text/javascript" src="<%=basePath %>mapJs/layer/layer.js"></script>
</head>
<body>
	<div id="allmap" style="overflow:hidden;zoom:1;position:relative;">	
		<div id="map" style="height:100%;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;"></div>
		
		<input type="hidden" id="basePath" name="basePath" value="<%=basePath %>" />
	</div>
</body>

<script type="text/javascript">
	$(function() {
		baiduMap.init("map");
	});
</script>
</html>
