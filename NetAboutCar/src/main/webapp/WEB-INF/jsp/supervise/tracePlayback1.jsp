    <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Track</title>
    <style type="text/css">
    html{height:100%}
    body{height:100%;margin:0px;padding:0px}
    #controller{width:100%; border-bottom:3px outset; height:30px; filter:alpha(Opacity=100); -moz-opacity:1; opacity:1; z-index:10000; background-color:lightblue;}
    #container{height:100%}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=VKXUs38QIm3FTFxM4SkHBEl86c4RdaMC"></script>
    <script type="text/javascript">
    //获取所有点的坐标
    var points = [
    new BMap.Point(114.00100, 22.550000), new BMap.Point(114.00130, 22.550000),
    new BMap.Point(114.00160, 22.550000), new BMap.Point(114.00200, 22.550000),
    new BMap.Point(114.00300, 22.550500), new BMap.Point(114.00400, 22.550000),
    new BMap.Point(114.00500, 22.550000), new BMap.Point(114.00505, 22.549800),
    new BMap.Point(114.00510, 22.550000), new BMap.Point(114.00515, 22.550000),
    new BMap.Point(114.00525, 22.550400), new BMap.Point(114.00537, 22.549500)
    ];

    var map; //百度地图对象
    var car; //汽车图标
    var label; //信息标签
    var centerPoint;

    var timer; //定时器
    var index = 0; //记录播放到第几个point

    var followChk, playBtn, pauseBtn, resetBtn; //几个控制按钮
    var myIcon = new BMap.Icon('http://developer.baidu.com/map/jsdemo/img/car.png', new BMap.Size(52,26),{anchor : new BMap.Size(27, 13)});
	 
    function init() {
    followChk = document.getElementById("follow");
    playBtn = document.getElementById("play");
    pauseBtn = document.getElementById("pause");
    resetBtn = document.getElementById("reset");

    //初始化地图,选取第一个点为起始点
    map = new BMap.Map("container");
    map.centerAndZoom(new BMap.Point(116.342775,40.005971), 15);
    map.enableScrollWheelZoom();
    map.addControl(new BMap.NavigationControl());
    map.addControl(new BMap.ScaleControl());
    map.addControl(new BMap.OverviewMapControl({isOpen: true}));
    map.addEventListener("click",function(e){
        alert(e.point.lng + "," + e.point.lat);
	 }); 
    //通过DrivingRoute获取一条路线的point
    var driving = new BMap.DrivingRoute(map);
    driving.search(new BMap.Point(116.342775,40.005971), new BMap.Point(116.356591,40.042375));
    driving.setSearchCompleteCallback(function() {
    	
	    //得到路线上的所有point
	    points = driving.getResults().getPlan(0).getRoute(0).getPath();
	    //画面移动到起点和终点的中间
	    centerPoint = new BMap.Point((points[0].lng + points[points.length - 1].lng) / 2, (points[0].lat + points[points.length - 1].lat) / 2);
	    map.panTo(centerPoint);
	    //连接所有点
	    map.addOverlay(new BMap.Polyline(points, {strokeColor: "black", strokeWeight: 5, strokeOpacity: 1}));
	
	    //显示小车子
	    label = new BMap.Label("张师傅(京A·K88881)", {offset: new BMap.Size(20, -10)});
	    label.setStyle({ 
			color : "white", 
			fontSize : "16px", 
			backgroundColor :"blue",
			fontWeight :"bold",
		    borderColor:"white"
			});
	    car = new BMap.Marker(points[0]);
	    car.setLabel(label);
	    map.addOverlay(car);
	
	    //点亮操作按钮
	    playBtn.disabled = false;
	    resetBtn.disabled = false;
	    });
    }

    function play() {
	    playBtn.disabled = true;
	    pauseBtn.disabled = false;
	    var point = points[index];
	    if(index > 0) {
	        map.addOverlay(new BMap.Polyline([points[index - 1], point], {strokeColor: "red", strokeWeight: 1, strokeOpacity: 1}));
	    }
	    label.setContent("经度: " + point.lng + "<br>纬度: " + point.lat);
	    car.setPosition(point);
	    index++;
	    if(followChk.checked) {
	        map.panTo(point);
	    }
	    if(index < points.length) {
	    	timer = window.setTimeout("play(" + index + ")", 200);
	    } else {
		    playBtn.disabled = true;
		    pauseBtn.disabled = true;
		    map.panTo(point);
	    }
    }

    function pause() {
    playBtn.disabled = false;
    pauseBtn.disabled = true;

    if(timer) {
    window.clearTimeout(timer);
    }
    }

    function reset() {
    followChk.checked = false;
    playBtn.disabled = false;
    pauseBtn.disabled = true;

    if(timer) {
    window.clearTimeout(timer);
    }
    index = 0;
    car.setPosition(points[0]);
    map.panTo(centerPoint);
    }
    
    </script>
    </head>

    <body onload="init();">
    <div id="controller" align="center">
        车牌号：<input id="num" type="text" value="京A·K88881"></input>
    <input id="follow" type="checkbox"><span style="font-size:12px;">画面跟随</span></input>
    <input id="play" type="button" value="播放" onclick="play();" />
    <input id="pause" type="button" value="暂停" onclick="pause();" disabled />
    <input id="reset" type="button" value="重置" onclick="reset()" disabled />
    </div>
    <div id="container"></div>
    </body>
    </html>