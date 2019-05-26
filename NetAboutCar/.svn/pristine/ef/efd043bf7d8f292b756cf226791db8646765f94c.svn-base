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
	#allmap {width: 100%; height:500px; overflow: hidden;}
	#result {width:20%;font-size:12px;float:left;}
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
	<script type="text/javascript" src="<%=basePath %>mapJs/map.js"></script>
	<script type="text/javascript" src="<%=basePath %>bootstrap/js/jquery-1.12.0.min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/GeoUtils/1.2/src/GeoUtils_min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=VKXUs38QIm3FTFxM4SkHBEl86c4RdaMC"></script>
	<!--加载鼠标绘制工具-->
	<script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
	<link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" />
	<!--加载检索信息窗口-->
	<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.js"></script>
	<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.css" />
	<title>聚集车辆</title>
</head>
<body>
     <div style="display:inline"> 
		<div id="map" style="height:100%;width:80%;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;float:left"></div>
	    <div id="result">
			<!-- <input type="button" value="聚集车辆检测" onclick="check2()"/> -->
			<!-- <dt>2016-10-19 09:27:30<br>（天安门）附近有8辆</dt>
			<dt>2016-10-19 10:27:30<br>（天安门）附近有8辆</dt> -->
			<h2 style="text-align: center;">聚集车辆情况</h2>
		</div>
	</div>
	<script type="text/javascript">
	    var points = [];
	    var vehs = [];
	    var ids = [];
	    var idArray = [];//存放报警车辆id
		// 百度地图API功能
	    var map = new BMap.Map('map');
	    addPoint();
		var centerLng = 0;
		var centerLat = 0;
	    var poi = new BMap.Point(centerLng, centerLat);
	    map.centerAndZoom("北京", 16);
	    map.enableScrollWheelZoom();  
	    var myIcon = new BMap.Icon('http://developer.baidu.com/map/jsdemo/img/car.png', new BMap.Size(52,26),{anchor : new BMap.Size(27, 13)});
	    <%-- var infoWindow = new BMap.InfoWindow("<h4 style='margin:0 0 5px 0;padding:0.2em 0'>张师傅(男)</h4><img  id='imgDemo' src='<%=request.getContextPath()%>/static/images/zp.jpg' width='121' height='140' /><br>车牌：京A·KF1234<br>电话：18611122231<BR><button>短信通知</button> <button>APP提醒</button>"); --%>
	    $(function() {
	    	//请求action，获取所有图形result
			var url = "<%=basePath%>setAssemblePlace/findAssemblePlaceList.action";
			$.post(url,function(result){
				if(result != null && result.length > 0){
					for(var i=0;i<result.length;i++){
						var jsonObj = result[i];
						
						var pointJson = jsonObj.map_sign;	//经纬度
						var jsonList=eval("("+pointJson+")");
						
						if(jsonObj.map_type==1){
							if(centerLng===0){
								centerLng = jsonList[0].lng;
								centerLat = jsonList[0].lat;
							}
							//圆形回显
							//baiduMap.createCircle(jsonList, jsonObj.rotundity_radius);
							var circle = new BMap.Circle(new BMap.Point(jsonList[0].lng, jsonList[0].lat),jsonObj.rotundity_radius);
							map.addOverlay(circle,{strokeColor:"blue", strokeWeight:1, strokeOpacity:0.5});
							//获取该圆的报警阀值
							var alarm = jsonObj.car_alarm_val;
							//定义累计变量
							var count = 0;
							//存放车辆id
							var idArr = [];
							//遍历车辆坐标点
							for(var a=0;a<points.length;a++){
					  			if(baiduMap.ptInCircle(points[a],circle)){
					  				count++;
					  				//记录id
					  				idArr.push(ids[a]);
					  			}
					  		}
							if(count<alarm){//不超过则清空
								idArr.length=0;
							}else{
								idArray = idArray.concat(idArr);
								//记录聚集地点和聚集数量
								var addr = jsonObj.place_name;
								var con = count;
								changeStatus(addr,con);//显示在页面右侧
							}
							
						}
						if(jsonObj.map_type==2){	//多边形回显
							var polygon = baiduMap.createPly(jsonList);
							//获取报警阀值
							var alarm = jsonObj.car_alarm_val;
							//定义累计变量
							var count = 0;
							//存放车牌号
							var idArr = [];
							//遍历车辆坐标点
							for(var b=0;b<points.length;b++){
					  			if(baiduMap.ptInPolygon(points[b],polygon)){
					  				count++;
					  				//记录id
					  				idArr.push(ids[b]);
					  			}
					  		}
							if(count<alarm){//不超过则清空车牌号
								idArr.length=0;
							}else{
								idArray = idArray.concat(idArr);
								//记录聚集地点和聚集数量
								var addr = jsonObj.place_name;
								var con = count;
								changeStatus(addr,con);//显示在页面右侧
							}
							
						}
					}
					check();
				}
			});
	    });
      /* var pts = [];
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
      var ply = new BMap.Polygon(pts); */
      
      //演示：将面添加到地图上    
      
      /* var mkr = new BMap.Marker(poi);
      map.addOverlay(mkr); */
    
      
      /* var circle = new BMap.Circle(poi,400,{strokeColor:"blue", strokeWeight:1, strokeOpacity:0.5}); 
      map.addOverlay(circle);  */
      
      //map.addOverlay(ply);  
      //setTimeout(dynamicLine, 1000);
      function addPoint(){
	      /* var pointJson="[{lng:'116.394664',lat:'39.913806'},{lng:'116.396101',lat:'39.913806'},"+
	                      "{lng:'116.398509',lat:'39.913862'},{lng:'116.399731',lat:'39.912893'},"+
	                      "{lng:'116.401958',lat:'39.914028'},{lng:'116.40548',lat:'39.914028'},"+
	                      "{lng:'116.399048',lat:'39.912949'},{lng:'116.397611',lat:'39.912118'},"+
	            	      "{lng:'116.398509',lat:'39.91566'},"+
	            	      "{lng:'116.40221',lat:'39.913308'}]"; */
	      $.ajax({
	    	 url:'findNewPositionInfo.action',
	    	 type:'post',
	    	 success:function(data){
			     var jsonList=eval("("+data+")");
			     for(var i=0; i<jsonList.length; i++){  
			        var lng=jsonList[i].lng;
			        var lat=jsonList[i].lat;
			        var veh=jsonList[i].veh;
			        var id=jsonList[i].id;
		    	    points.push(new BMap.Point(lng,lat));
		    	    vehs.push(veh);
		    	    ids.push(id);
		    	    addMarker(points,vehs);
			     }
	    	 }
	      });
      }
      /* var count=0;
      var inCount=0; */
      	function check(){
  		/* var allOverlay = map.getOverlays();
	  		 for (var i = 0; i < allOverlay.length -1; i++){
	  			
	  			      if(allOverlay[i].toString() == "[object Marker]"){
	  			    	if (allOverlay[i].getTitle() == "111") {
		  			      if(allOverlay[i].getLabel().content == "车辆京AK8888"){
		  				   
		  		              count++;
				  			  var point = allOverlay[i].getPosition();
				  			
				  		      var result = BMapLib.GeoUtils.isPointInPolygon(point, circle);
				  		      if(result == true){
				  		    	inCount++;
				  		      } 
			  		      }
	  			        }
	  			   }
	  		}
	  		alert("一共"+count+"量车");
	  		alert("电子围栏内一共"+inCount+"量车"); */
	  		//将聚集车辆id传入后台
	  		$.post('andGatherCar.action',{ids:idArray.join(',')},function(result){
	  			return false;
	  		})
  		}
		/* function check2(){
			for(var i = 0;i <points.length;i++){
				var point = new BMap.Point(points[i].lng,points[i].lat);
				var result = BMapLib.GeoUtils.isPointInPolygon(point, circle);
	  		      if(result == true){
	  		    	inCount++;
	  		      } 
			}
			alert("一共"+points.length+"量车");
	  		alert("电子围栏内一共"+inCount+"量车");
		} */
    //在轨迹点上创建图标，并添加点击事件，显示轨迹点信息。points,数组。
		function addMarker(points,vehs){
    	
			var pointsLen = points.length;
			if(pointsLen == 0){
				return;
			}
			//var myIcon = new BMap.Icon('http://developer.baidu.com/map/jsdemo/img/car.png', new BMap.Size(52,26),{anchor : new BMap.Size(27, 13)});

			// 创建标注对象并添加到地图   
			for(var i = 0;i <pointsLen;i++){
				var point = new BMap.Point(points[i].lng,points[i].lat);
				var label = new BMap.Label(vehs[i],{offset:new BMap.Size(20,-10)});
				label.setStyle({ 
					color : "white", 
					fontSize : "16px", 
					backgroundColor :"blue",
					fontWeight :"bold",
				    borderColor:"white"
				});
				var marker = new BMap.Marker(point, {icon: myIcon});
				//var marker = new BMap.Marker(point,{title:"111",icon: myIcon});
				/* marker.addEventListener("click", function(){          
					   this.openInfoWindow(infoWindow);
					   //图片加载完毕重绘infowindow
					}); */
				map.addOverlay(marker); 
				marker.setLabel(label);
			}
		}    
		/*  map.addEventListener("click",function(e){
			alert(e.point.lng + "," + e.point.lat);
		}); */ 
		//changeStatus();
		function changeStatus(addr,count){
			
			var date=getNowFormatDate();
			var html=document.getElementById("result").innerHTML;
			document.getElementById("result").innerHTML=html+"\<dt\>"+date+"\<br\>（"+addr+"）附近有"+count+"辆\<\/dt\>";
		    //setTimeout("changeStatus()",10000);
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
</body>
</html>
