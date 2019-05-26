<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en"> 
<head> 
	<meta charset="utf-8" /> 
	<title>实时监控</title> 
	<style type="text/css">
		body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
		/* #map_canvas{width:100%;height:500px;} */
		#result {width:20%;font-size:12px;float:left;}
		#controller{width:100%; border-bottom:3px outset; height:30px; filter:alpha(Opacity=100); -moz-opacity:1; opacity:1; z-index:10000; background-color:lightblue;}
		p{font-size:12px;}
		dt{
		font-size:14px;
		font-family:"微软雅黑";
		font-weight:bold;
		border-bottom:1px dotted #000;
		padding:5px 0 5px 5px;
		margin:5px 0;
		}
	</style>
	<script src="<%=request.getContextPath() %>/bootstrap/js/jquery-1.12.0.min.js" type="text/javascript"></script>
	<script src="http://api.map.baidu.com/api?v=2.0&ak=VKXUs38QIm3FTFxM4SkHBEl86c4RdaMC" type="text/javascript"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/LuShu/1.2/src/LuShu_min.js"></script>
</head> 
<body> 
   <div id="controller" align="center">
           车牌号：<input id="num" type="text" value=""></input>
    <input id="play" type="button" value="查找"  onclick="find();" />
	<!-- 设置页面刷新间隔（单位：秒）<input type="text" id="time" value="30000">
	<button id="stop" onclick="deletePoint()">停止</button>  -->
    </div>
	<div id="map_canvas" style="height:100%;width:80%;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;float:left"></div> 
	<div id="result"></div>
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
</body>
	<script type="text/javascript"> 
	var map = new BMap.Map('map_canvas');
	map.setMapStyle({style:'googlelite'});
	map.enableScrollWheelZoom();
	// 实例化一个驾车导航用来生成路线
    // var point = new BMap.Point(116.404, 39.914);
	//map.centerAndZoom(point, 13);
	map.centerAndZoom("北京",16);
	map.disableDoubleClickZoom(true);
	var myIcon = new BMap.Icon('<%=basePath %>mapJs/image/car.png', new BMap.Size(52,26),{anchor : new BMap.Size(27, 13)});
	
	//页面定时刷新
	//setTimeout('show()',20000); 
	show();
	//获取报警车辆显示到地图右侧
	changeStatus();
	function stop(){
		clearTimeout(t);
	}
	
	function myrefresh(){
		 window.location.reload();
	}
	function show(){
		//var time=$("#time").val();
		$.ajax({
			type: "POST",
			url: '<%=basePath %>supervise/getCarPosition.action',
			dataType:'json',
			cache: false,
			success: function(data){
				var codeJson = eval(data);
				for (var i = 0; i < codeJson.length; i++) {
					var point = new BMap.Point(codeJson[i].longitude, codeJson[i].latitude);
					var label = new BMap.Label(codeJson[i].vehicle_no,{offset:new BMap.Size(20,-10)});
					label.setStyle({
						color : "white", 
						fontSize : "16px", 
						backgroundColor :"blue",
						fontWeight :"bold",
					    borderColor:"white"
					});
					if(codeJson[i].warnStatus == '1'){//车辆预警状态
						label.setStyle({backgroundColor :"red"});
					}
					
					var info = "<h4>车牌："+codeJson[i].vehicle_no+"</h4>网约车公司："+codeJson[i].comname;
					if("" == codeJson[i].order_id || null == codeJson[i].order_id){
						info += "<br>接单状态：空闲";
					}else{
						info += "<br>接单状态：已接单<br>订单号："+codeJson[i].order_id;
					}
					var infoWindow = new BMap.InfoWindow(info);
					addMarker(point,label,infoWindow);
				}
			}
		});

		deletePoint();
		setTimeout('show()',30000); //30秒刷新
	}
	
	function deletePoint(){
		var allOverlay = map.getOverlays();
		for (var i = 0; i < allOverlay.length -9; i++){
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
		var allOverlay = map.getOverlays();
		for (var i = 0; i < allOverlay.length -1; i++){
			 console.log(allOverlay[i].toString())
			 if (allOverlay[i].toString() == "[object Marker]") {
				if(allOverlay[i].getLabel().content == num){
					 var point = allOverlay[i].getPosition(); //获取marker的位置
					 map.centerAndZoom(point, 13);
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
	
	function changeStatus(){
		$("#result").html("");
		$("#result").html("<h2 style=\"text-align: center;\">报警车辆</h2>");
		var date=getNowFormatDate();
		/* var html=document.getElementById("result").innerHTML;
		if(html == null){
			html = "";
		} */
		var resultHtml="";
		//获取报警车辆
		$.getJSON("<%=basePath%>supervise/getAlarmCar.action",function(data){
			$.each(data,function(i,d){
				resultHtml=$("#result").html()+"\<dt\>"+date+"\<br\>"+d.vehicle_no+"("+d.longitude+"，"+d.latitude+")\<\/dt\>";
				$("#result").html(resultHtml);
			});
		});
		setTimeout('changeStatus()',600000); //10分钟刷新
	}
	/* 获取当前时间 yyyy-MM-dd HH:mm:ss格式 */
	function getNowFormatDate() {
	    var date = new Date();
	    var seperator1 = "-";
	    var seperator2 = ":";
	    var month = date.getMonth() + 1;
	    var strDate = date.getDate();
	    if (month >= 1 && month <= 9) {
	        month = "0" + month;
	    }
	    if (strDate >= 0 && strDate <= 9) {
	        strDate = "0" + strDate;
	    }
	    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
	            + " " + date.getHours() + seperator2 + date.getMinutes()
	            + seperator2 + date.getSeconds();
	    return currentdate;
	}
</script>

</html> 