<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	
		<title>服务导航首页</title>
		<link rel="stylesheet" href="${basePath}css/userReg.css" />
		<link rel="stylesheet" type="text/css"
			href="${basePath}css/jquery.selectlist.css" />
		<script type="text/javascript" src="${basePath}js/jquery.selectlist.js"></script>
		<style type="text/css">
			.buss_area .map_search {
				padding-bottom: 10px;
			}
			
			.buss_area .map_search .search_title {
				font-weight: bold;
				display: inline-block;
				margin: 0px 10px;
			}
			
			.buss_area .nav_block {
				border-top: 2px solid #114ec9;
			}
			
			.buss_area .nav_block .map_area {
				height: 550px;
			}
			
			.buss_area .nav_block .map_area .area_left {
				width: 30%;
				float: left;
			}
			
			.buss_area .nav_block .map_area .area_left .area_list {
				padding: 0 10px 0 0;
				border-left: 1px solid #cccccc;
			}
			
			.buss_area .nav_block .map_area .area_left .area_list li {
				border-bottom: 1px solid #ddd;
				cursor: pointer;
				padding: 20px 10px 10px 40px;
			}
			
			.buss_area .nav_block .map_area .area_left .area_list li:hover {
				background-color: #f5f5f5;
			}
			
			.buss_area .nav_block .map_area .area_left .area_list li dt {
				font-weight: bold;
				ine-height: 20px;
			}
			
			.buss_area .nav_block .map_area .area_left .area_list li dd {
				ine-height: 20px;
			}
			
			.buss_area .nav_block .map_area .area_left .area_filp {
				padding-right: 3px;
				padding-left: 3px;
				padding-bottom: 3px;
				margin: 10px 3px;
				padding-top: 3px;
				TEXT-ALIGN: center
			}
			
			.buss_area .nav_block .map_area .area_left .area_filp a {
				border-right: #fff 1px solid;
				padding-right: 5px;
				border-top: #fff 1px solid;
				padding-left: 5px;
				padding-bottom: 2px;
				margin: 2px;
				border-left: #fff 1px solid;
				color: #000099;
				padding-top: 2px;
				border-bottom: #fff 1px solid;
				TEXT-DECORATION: underline
			}
			
			.buss_area .nav_block .map_area .area_left .area_filp a:hover {
				border-right: #000099 1px solid;
				border-top: #000099 1px solid;
				border-left: #000099 1px solid;
				color: #000;
				border-bottom: #000099 1px solid
			}
			
			.buss_area .nav_block .map_area .area_left .area_filp a:active {
				border-right: #000099 1px solid;
				border-top: #000099 1px solid;
				border-left: #000099 1px solid;
				color: #f00;
				border-bottom: #000099 1px solid
			}
			
			.buss_area .nav_block .map_area .area_left .area_filp span.current {
				border-right: #fff 1px solid;
				padding-right: 5px;
				border-top: #fff 1px solid;
				padding-left: 5px;
				FONT-WEIGHT: bold;
				padding-bottom: 2px;
				margin: 2px;
				border-left: #fff 1px solid;
				color: #000;
				padding-top: 2px;
				border-bottom: #fff 1px solid;
				background-color: #fff
			}
			
			.buss_area .nav_block .map_area .area_left .area_filp span.disabled {
				border-right: #eee 1px solid;
				padding-right: 5px;
				border-top: #eee 1px solid;
				padding-left: 5px;
				padding-bottom: 2px;
				margin: 2px;
				border-left: #eee 1px solid;
				color: #ddd;
				padding-top: 2px;
				border-bottom: #eee 1px solid
			}
			
			.buss_area .nav_block .map_area .map_block {
				float: right;
				width: 70%;
			}
			
			.buss_area .nav_block .map_area .map_block .map_bmap {
				height: 550px;
				font-size: 12px;
			}
			
			.buss_area .nav_block .nav_list {
				display: none;
			}
			
			.buss_area .nav_block .nav_list table {
				width: 100%;
				font-size: 12px;
				margin-bottom: 20px;
			}
			
			.buss_area .nav_block .nav_list table thead {
				background-color: #e6e6e6;
				color: #555;
				font-weight: bold;
			}
			
			.buss_area .nav_block .nav_list table thead th {
				vertical-align: bottom;
				line-height: 20px;
				padding: 8px;
				text-align: left;
			}
			
			.buss_area .nav_block .nav_list table tbody tr:hover {
				background-color: #ffffd6;
			}
			
			.buss_area .nav_block .nav_list table tbody td {
				border-top: 1px solid #e5e5e5;
				overflow: hidden;
				text-overflow: ellipsis;
				white-space: nowrap;
				word-break: keep-all;
				padding: 8px;
			}
			
			.buss_area .nav_block .nav_list table tbody td a {
				border-radius: 3px;
				cursor: pointer;
				font-size: 12px;
				line-height: 20px;
				margin: 0 10px 0 0;
				overflow: visible;
				display: inline-block;
				text-transform: uppercase;
				background-color: #f3f3f3;
				background-image: linear-gradient(to bottom, #f5f5f5, #f1f1f1);
				background-repeat: repeat-x;
				border: 1px solid #dcdcdc;
				box-shadow: none;
				color: #333;
				font-weight: bold;
				padding: 4px 12px;
				position: relative;
				text-align: center;
				text-shadow: 0 1px 0 #fff;
				vertical-align: middle;
				white-space: nowrap;
			}
			
			.buss_area .nav_block .nav_list .data_sum {
				background-color: #efefef;
				margin-top: 10px;
				padding: 10px;
				text-align: right;
			}
			
			.buss_area .nav_block .nav_list .data_sum span {
				color: #dd4b39;
				font-weight: bold;
			}
			
			.pagination {
				margin: 20px 0 10px;
				text-align: center;
			}
			
			.pagination ul {
			 	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
				display: inline-block;
				margin-bottom: 0;
				margin-left: 0;
			}
			
			.pagination ul > li {
				display: inline;
			}
			
			.pagination ul > li:first-child > a {
				border-left-width: 1px;
				border-radius: 2px 0 0 2px;
				margin-left: 0;
			}
			
			.pagination ul > li:last-child > a {
				border-radius: 0 2px 2px 0;
			}
			
			.pagination ul > li > a {
				float: left;
				line-height: 20px;
				padding: 4px 12px;
				text-decoration: none;
				background-color: #f3f3f3;
				background-image: linear-gradient(to bottom, #f5f5f5, #f1f1f1);
				background-repeat: repeat-x;
				border-style: solid;
				border-width: 1px 1px 1px 0;
				border-color: #dddddd;
				box-shadow: none;
				color: #333333;
				text-shadow: none;
			}
			
			.pagination ul > li > a:hover {
				background-color: #f5f5f5;
				border-color: #c6c6c6;
				box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
			}
			
			.pagination ul > .active > a {
				box-shadow: none;
				color: #4d90fe;
				background-color: #f5f5f5;
				border-color: #c6c6c6;
				cursor: default;
			}
			
			.pagination ul > .disabled > a, .pagination ul > .disabled > a:hover {
				background-color: #f3f3f3;
				background-image: linear-gradient(to bottom, #f5f5f5, #f1f1f1);
				background-repeat: repeat-x;
				border-color: #d9d9d9;
				box-shadow: none;
				color: #b3b3b3;
				text-shadow: none;
				cursor: default;
			}
		</style>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#btnHighLight').click(function() {
					$('#txtBox').highlight({
						lightColor : 'red',
						lightTime : 1000
					});
					$('#txtPwd').highlight({
						lightTime : 1000
					});
				});
				
				$('#btnHighLight').click(function() {
					$('#txtBox').highlight({
						lightColor : 'red',
						lightTime : 1000
					});
					$('#txtPwd').highlight({
						lightTime : 1000
					});
				});
		
				$("select").selectlist({
					zIndex : 10,
					width : 80,
					height : 25,
					onChange : function() {
						var mode = $(document.getElementsByName("mode")).val();
						
						if (mode == "0") {
							$("#navmap").show();
							$("#navlist").hide();
						} else {
							$("#navlist").show();
							$("#navmap").hide();
						}
					}
				});
			});
			
			function abc() {
				alert("123");
			};
		</script>
	</head>

	<body>
		<div class="buss_area">
			<div class="map_search">
				<form id="searchnode" class="map-search form-inline cb ">
					<span class="search_title">显示模式</span>
					<select id="mode" name="mode">
						<option value="0">地图</option>
						<option value="1">列表</option>
					</select>
				</form>
			</div>
			<div class="nav_block">
				<div id="navmap" class="map_area">
					<div class="area_left">
						<ul id="nodelist" class="area_list">
							<li data-idx="1" data-wddm="1100010000009" data-latlng="116.361631,39.936541" data-wdlxdm="10" class="">
								<i></i>
								<dl class="">
									<dt>
										<strong>北京市无线神谷管理局</strong>
									</dt>
									<dd>
										<strong>地址：</strong>  北京市海淀区王庄路东王庄小区32号 。
									</dd>
								</dl>
							</li>
							<li data-idx="2" data-wddm="1100010000057" data-latlng="116.26355,40.22797" data-wdlxdm="10" class="" onclick="abc();">
								<i class="bmap-marker bmap-marker-2"></i>
								<dl>
									<dt>
										<strong>北京大学科技园</strong>
									</dt>
									<dd>
										<strong>地址：</strong> 北京市海淀区中关村北大街127-1。
									</dd>
								</dl>
							</li>
							<li data-idx="3" data-wddm="1100010000057" data-latlng="116.238304,40.189289" data-wdlxdm="10" class="">
								<i class="bmap-marker bmap-marker-3"></i>
								<dl>
									<dt>
										<strong>中国医药科技出版社</strong>
									</dt>
									<dd>
										<strong>地址：</strong> 三环以内文慧园北路甲22号。
									</dd>
								</dl>
							</li>
							<li data-idx="4" data-wddm="1100010000009" data-latlng="116.468919,39.905302" data-wdlxdm="10" class="">
								<i></i>
								<dl class="">
									<dt>
										<strong>北京市市政工程设计研究总院</strong>
									</dt>
									<dd>
										<strong>地址：</strong> 西直门北大街32。
									</dd>
								</dl>
							</li>
							<li data-idx="5" data-wddm="1100010000057"
								data-latlng="116.238304,40.189289" data-wdlxdm="10" class=""><i
								class="bmap-marker bmap-marker-3"></i>
								<dl>
									<dt>
										<strong>北京111文化产业园</strong>
									</dt>
									<dd>
										<strong>地址：</strong> 南三环西路67号附近。
									</dd>
								</dl>
							</li>
							<li data-idx="5" data-wddm="1100010000057" data-latlng="116.238304,40.189289" data-wdlxdm="10" class="">
								<i class="bmap-marker bmap-marker-3"></i>
								<dl>
									<dt>
										<strong>北京首农食品经营中心</strong>
									</dt>
									<dd>
										<strong>地址：</strong> 北京市丰台区草桥东路2号8幢。
									</dd>
								</dl>
							</li>
						</ul>
						<div class="area_filp">
							<span class="disabled">上一页 </span> 
							<span class="current" data-page="1">1</span>
							<a href="#page=2" data-page="2">2</a> 
							<a href="#page=3" data-page="3">3</a>
							...<a href="#page=10">10</a>
							<a href="#page=2"> 下一页 </a>
						</div>
					</div>
					
					<!--百度地图容器-->
					<div class="map_block">
						<div id="map" class="map_bmap"></div>
					</div>
				</div>
				<div id="navlist" class="nav_list">
					<table>
						<thead>
							<tr>
								<th width="30" align="center">序号</th>
								<th>单位名称</th>
								<th>地址</th>
								<th width="120">联系电话</th>
								<th width="140"> </th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td align="center">1</td>
								<td>北京市无线神谷管理局</td>
								<td>北京市海淀区王庄路东王庄小区32号</td>
								<td>12345678</td>
								<td>
									<a>查看详情</a>
									<a><i class="fa fa-map-marker"></i>&nbsp;</a>
								</td>
							</tr>
							<tr>
								<td align="center">2</td>
								<td>北京市市政工程设计研究总院</td>
								<td>西直门北大街32</td>
								<td>12345678</td>
								<td>
									<a>查看详情</a>
									<a><i class="fa fa-map-marker"></i>&nbsp;</a>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="data_sum">共 <span>255</span> 条数据</div>
					<div class="pagination">
						<ul>
							<li class="disabled">
								<a href="#" data-page="0">首页</a>
							</li>
							<li class="disabled">
								<a href="#" data-page="0">上一页</a>
							</li>
							<li class="active">
								<a href="#page1" data-page="1">1</a>
							</li>
							<li>
								<a href="#page2" data-page="2">2</a>
							</li>
							<li>
								<a href="#page3" data-page="3">3</a>
							</li>
							<li>
								<a href="#page4" data-page="4">4</a>
							</li>
							<li>
								<a href="#page4" data-page="5">5</a>
							</li>
							<li>
								<a href="#page4" data-page="6">6</a>
							</li>
							<li>
								<a href="#" data-page="2">下一页</a>
							</li>
							<li>
								<a href="#" data-page="26">末页</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</body>
<script type="text/javascript">
	//创建和初始化地图函数：
	function initMap() {
		createMap();//创建地图
		setMapEvent();//设置地图事件
		addMapControl();//向地图添加控件
		addMapOverlay();//向地图添加覆盖物
	}
	function createMap() {
		map = new BMap.Map("map");
		map.centerAndZoom(new BMap.Point(116.403874, 39.914889), 12);
	}
	function setMapEvent() {
		map.enableScrollWheelZoom();
		map.enableKeyboard();
		map.enableDragging();
		map.enableDoubleClickZoom();
	}
	function addClickHandler(target, window) {
		target.addEventListener("click", function() {
			target.openInfoWindow(window);
		});
	}

	function addMapOverlay() {
		var markers = [ {
			content : "地址： 北京市海淀区王庄路东王庄小区32号    电话：(010)31768341  ",
			title : "北京市无线神谷管理局",
			imageOffset : {
				width : -46,
				height : -21
			},
			position : {
				lat : 39.904263,
				lng : 116.373978
			}
		}, {
			content : " 北京市海淀区中关村北大街127-1",
			title : "北京大学科技园",
			imageOffset : {
				width : -46,
				height : -21
			},
			position : {
				lat : 39.895406,
				lng : 116.365355
			}
		}, {
			content : " 三环以内文慧园北路甲22号",
			title : "中国医药科技出版社",
			imageOffset : {
				width : -46,
				height : -21
			},
			position : {
				lat : 39.905302,
				lng : 116.468919
			}
		}, {
			content : "西直门北大街32",
			title : "北京市市政工程设计研究总院",
			imageOffset : {
				width : -46,
				height : -21
			},
			position : {
				lat : 40.030099,
				lng : 116.419618
			}
		}, {
			content : " 南三环西路67号附近",
			title : "北京111文化产业园",
			imageOffset : {
				width : -46,
				height : -21
			},
			position : {
				lat : 39.863158,
				lng : 116.468714
			}
		}, {
			content : "北京市丰台区玉泉营111号西边14幢1021室",
			title : "八米科技",
			imageOffset : {
				width : -46,
				height : -21
			},
			position : {
				lat : 39.926617,
				lng : 116.464412
			}
		}, {
			content : "北京市丰台区草桥东路2号8幢",
			title : "北京首农食品经营中心",
			imageOffset : {
				width : -46,
				height : -21
			},
			position : {
				lat : 39.898788,
				lng : 116.446802
			}
		}, {
			content : " 海户西里30号综合楼3层 ",
			title : "北京市曲剧团 ",
			imageOffset : {
				width : -46,
				height : -21
			},
			position : {
				lat : 39.990522,
				lng : 116.417056
			}
		}, {
			content : "北京市海淀区知春路25号 ",
			title : "北京城市开发集团有限责任公司",
			imageOffset : {
				width : -46,
				height : -21
			},
			position : {
				lat : 39.919637,
				lng : 116.582802
			}
		} ];
		for ( var index = 0; index < markers.length; index++) {
			var point = new BMap.Point(markers[index].position.lng,
					markers[index].position.lat);
			var marker = new BMap.Marker(
						point,
					{
						icon : new BMap.Icon(
								"http://api.map.baidu.com/lbsapi/createmap/images/icon.png",
								new BMap.Size(20, 25), {
									imageOffset : new BMap.Size(
											markers[index].imageOffset.width,
											markers[index].imageOffset.height)
								})
					});
			var label = new BMap.Label(markers[index].title, {
				offset : new BMap.Size(25, 5)
			});
			var opts = {
				width : 200,
				title : markers[index].title,
				enableMessage : false
			};
			var infoWindow = new BMap.InfoWindow(markers[index].content, opts);
			marker.setLabel(label);
			addClickHandler(marker, infoWindow);
			map.addOverlay(marker);
		}
		;
	}
	//向地图添加控件
	function addMapControl() {
		var scaleControl = new BMap.ScaleControl({
			anchor : BMAP_ANCHOR_BOTTOM_LEFT
		});
		scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
		map.addControl(scaleControl);
		var navControl = new BMap.NavigationControl({
			anchor : BMAP_ANCHOR_TOP_LEFT,
			type : BMAP_NAVIGATION_CONTROL_LARGE
		});
		map.addControl(navControl);
		var overviewControl = new BMap.OverviewMapControl({
			anchor : BMAP_ANCHOR_BOTTOM_RIGHT,
			isOpen : true
		});
		map.addControl(overviewControl);
	}
	var map;
	initMap();
</script>
</html>
