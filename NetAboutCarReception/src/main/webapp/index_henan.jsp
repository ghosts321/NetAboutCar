<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>网络预约出租车服务管理平台</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="viewport" content="width=device-width,initial-scale=1.0">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${basePath}css/core.css" />
		<script type="text/javascript" src="build/dist/echarts.js"></script>
		<script type="text/javascript" src="build/dist/jquery.min.js"></script>
		<style type="text/css">
			.body_area {
			}
			
			.body_area .main_area {
				width: 1000px;
				min-width: 1000px;
				margin: 0 auto;
			}
			
			.body_area .main_area .map_tip {
				height: 24px;
				line-height: 24px;
				color: #555555;
			}
		</style>
	</head>
	<body>
		<jsp:include page="/WEB-INF/jsp/system/head.jsp" />
		
		<div class="body_area">
			<div id="main" class="main_area">
				<div class="map_tip">请从地图中选择您要访问的互联网服务管理平台<a style="margin: 0px 10px;" href='index.jsp'>返回</a></div>
				<div id="mapmain" style="height:450px;"></div>
			</div>
		</div>
		
		<jsp:include page="/WEB-INF/jsp/system/foot.jsp" />
	</body>
	
	
		<script type="text/javascript">
		    var str="";
		
	        require.config({
	            paths: {
	                echarts: 'build/dist'
	            }
	        });
			// 使用
	        require(
	            [
	                'echarts',
					'echarts/chart/map'
	            ],
	            function (ec) {
					// --- 地图 ---
					var myChart = ec.init(document.getElementById('mapmain'));
					var cityMap = {
						"郑州市": "410100",
						"开封市": "410200",
						"洛阳市": "410300",
						"平顶山市": "410400",
						"安阳市": "410500",
						"鹤壁市": "410600",
						"新乡市": "410700",
						"焦作市": "410800",
						"濮阳市": "410900",
						"许昌市": "411000",
						"漯河市": "411100",
						"三门峡市": "411200",
						"南阳市": "411300",
						"商丘市": "411400",
						"信阳市": "411500",
						"周口市": "411600",
						"驻马店市": "411700",
					};
	
					var level =0;
					var curIndx = 0;
					var isZhiXiaShi=false; //是否是直辖市
					var mapType = [
						'china',
						// 23个省
						'广东', '青海', '四川', '海南', '陕西', 
						'甘肃', '云南', '湖南', '湖北', '黑龙江',
						'贵州', '山东', '江西', '河南', '河北',
						'山西', '安徽', '福建', '浙江', '江苏', 
						'吉林', '辽宁', '台湾',
						// 5个自治区
						'新疆', '广西', '宁夏', '内蒙古', '西藏', 
						// 4个直辖市
						'北京', '天津', '上海', '重庆',
						// 2个特别行政区
						'香港', '澳门'
					];
					var mapGeoData = require('echarts/util/mapData/params');
					for (var city in cityMap) {
						mapType.push(city);
						// 自定义扩展图表类型
						mapGeoData.params[city] = {
							getGeoJson: (function (c) {
								var geoJsonName = cityMap[c];
								/* return function (callback) {
									$.getJSON('geoJson/china-main-city/' + geoJsonName + '.json', callback);
								} */
							})(city)
						}
					}
					
					var ecConfig = require('echarts/config');
					var zrEvent = require('zrender/tool/event');
					
					myChart.on(ecConfig.EVENT.MAP_SELECTED, function (param){
						
						var len = mapType.length;
						var mt = mapType[curIndx % len];
						var dl;
						if(level!==1){
							if (mt == 'china') {
								// 全国选择时指定到选中的省份
								var selected = param.selected;
								for (var i in selected) {
									if (selected[i]) {
										str+=i+",";
										if(i=="北京" || i=="上海" || i=="重庆" || i=="天津"){
											isZhiXiaShi=true;
										}
										mt = i;
										while (len--) {
											if (mapType[len] == mt) {
												curIndx = len;
												 str+=i;
												 var val=encodeURI(encodeURI(i));
										         window.location.href="system/openMain.action?areaName="+val;
											}
										}
										break;
									}
								}
								//level=1;
							}
							option.series[0].mapType = mt;
						}else{
							 var selected = param.selected;
							 //console.log(selected);
							 for (var i in selected) {
								 if (selected[i]) {
									 str+=i;
									 var val=encodeURI(encodeURI(i));
							         window.location.href="system/openMain.action?areaName="+val;
								 }
							 }
						}
						myChart.setOption(option, true);
					});
					option = {
						title: {
							 
						},
						tooltip : {
							trigger: 'item',
							formatter: function (param){
									var selected = param.selected;
									var is_repeat=0;
									var ls=0;
									for (var j in option.series[0].data) {
										if(option.series[0].data[j].name == param[1])
										{
											ls =j;
											is_repeat=1;
										}
									}
									if(is_repeat==0)
									{
										return param[1];
									}else {
										return param[1]+'<br/>'+option.series[0].data[ls].value;;
									}
	
								}
						},
						series : [
							{
								name: '河南省地图',
								type: 'map',
								mapType: '河南',
								selectedMode : 'single',
								itemStyle:{
									normal:{
										label:{
									        show:true,
											textStyle:{color: '#DCE7FC' }},
											areaStyle:{color:'#114EC9'},
											fontStyle:{color:'white'}
										},
									emphasis:{label:{show:true}}
								},
								data:[
									 
								]
							}
						]
					};
					myChart.setOption(option, true);
				}
	        );
			
	                    
			
	    </script>
</html>
