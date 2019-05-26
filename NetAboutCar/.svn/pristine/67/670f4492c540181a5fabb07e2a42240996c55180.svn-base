var map;							//地图对象
var drawingManager;					//鼠标绘制工具
var overlays = [];					//绘制覆盖物个数
var infoWindow;						//打开信息窗口
var guiType,guiData,circleRat;
var timeID;							//全局定时器返回id
var timeTraceID;					//特定车辆定时器返回id
var timeIllID;						//违规车辆定时器返回id
var timeGlobalID;					//聚集车辆定时器返回id
var isTimeStart = 0;				//是否启动定时器
var carMarker = new Array();		//所有车辆封装为数组
var carMarkerTrace = new Array();	//所有追踪车辆封装为数组
var globalArea = new Array();		//所有聚集区域封装为数组
var arrTrace = new Array();			//追踪车辆，存放所有折线对象
var myIcon;
var globalAreaEcho = 1;				//聚集车辆重新定位用
var carDataMap = {};				//封装所有车辆点位
var carDataTraceMap = {};			//封装特定车辆点位
var arr = new Array();

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
		map.centerAndZoom("河南", 15);	//地图打开时显示的初始位置
		map.enableScrollWheelZoom();	//启用鼠标滚轮放大	
		map.enableContinuousZoom();		//开启连续缩放效果
		map.enableInertialDragging();	//开启惯性拖拽效果
		
		//初始化车辆图标
		myIcon = new BMap.Icon('http://developer.baidu.com/map/jsdemo/img/car.png', new BMap.Size(52,26),{anchor : new BMap.Size(27, 13)});
		
		baiduMap.isCarIllegal();		//定时判断违规车辆 并保存
		
		baiduMap.addMapType();			//添加地图类型和缩略图
		
		baiduMap.addMapControl();		//添加控件和比例尺
		
		baiduMap.addMapButtons();		//添加按钮工具条
		
		baiduMap.addMapSubject();		//主题模板样式添加
		
		baiduMap.globalRunTrend();		//初始化动态显示所有车辆
		
		/*
		// 点击地图弹出该点的经纬度信息
		map.addEventListener("click", function(e) {		
			alert(e.point.lng + "," + e.point.lat);
		});
		*/
	},
	
	globalRunTrend1: function(){
		 var marker;
		 var lushu;
		    // 实例化一个驾车导航用来生成路线
		  //  var drv = new BMap.DrivingRoute('北京', {
		   //     onSearchComplete: function(res) {
		    //        if (drv.getStatus() == BMAP_STATUS_SUCCESS) {
		              //  var plan = res.getPlan(0);
		               // var arrPois =[];
//		                for(var j=0;j<plan.getNumRoutes();j++){
		                 //   var route = plan.getRoute(j);
		                 //   arrPois= arrPois.concat(route.getPath());
		               // }
		      var arrPois=[new BMap.Point(116.403984,39.914004),new BMap.Point(116.402116,39.913938),new BMap.Point(116.402116,39.913938),new BMap.Point(116.402046,39.913928),new BMap.Point(116.401856,39.913927),new BMap.Point(116.401547,39.913926),new BMap.Point(116.401008,39.913923),new BMap.Point(116.400599,39.913921),new BMap.Point(116.39999,39.913908),new BMap.Point(116.399471,39.913875),new BMap.Point(116.399042,39.913852),new BMap.Point(116.398035,39.913835),new BMap.Point(116.395593,39.913683),new BMap.Point(116.395383,39.913681),new BMap.Point(116.395114,39.913658),new BMap.Point(116.394666,39.913664),new BMap.Point(116.390265,39.91349),new BMap.Point(116.38925,39.913456),new BMap.Point(116.388931,39.913461),new BMap.Point(116.388643,39.913457),new BMap.Point(116.388335,39.913463),new BMap.Point(116.386455,39.913424),new BMap.Point(116.386166,39.913429),new BMap.Point(116.385898,39.913425),new BMap.Point(116.384327,39.913399),new BMap.Point(116.384168,39.913396),new BMap.Point(116.38384,39.913391),new BMap.Point(116.383472,39.913395),new BMap.Point(116.383323,39.913402),new BMap.Point(116.382796,39.913403),new BMap.Point(116.382747,39.913402),new BMap.Point(116.38227,39.913394),new BMap.Point(116.381594,39.913372),new BMap.Point(116.381465,39.91337),new BMap.Point(116.381445,39.913369),new BMap.Point(116.381197,39.913365),new BMap.Point(116.380779,39.913348),new BMap.Point(116.38066,39.913346),new BMap.Point(116.380491,39.913343),new BMap.Point(116.380488,39.913341),new BMap.Point(116.38014,39.913344),new BMap.Point(116.379435,39.913342),new BMap.Point(116.378848,39.913331),new BMap.Point(116.378103,39.913307),new BMap.Point(116.376722,39.913282),new BMap.Point(116.374238,39.913227),new BMap.Point(116.373105,39.913226),new BMap.Point(116.37221,39.91321),new BMap.Point(116.370004,39.913171),new BMap.Point(116.369865,39.913169),new BMap.Point(116.369706,39.913166),new BMap.Point(116.369616,39.913175),new BMap.Point(116.366474,39.913103),new BMap.Point(116.366276,39.913109),new BMap.Point(116.365997,39.913105),new BMap.Point(116.365898,39.913104),new BMap.Point(116.365639,39.91312),new BMap.Point(116.364605,39.913094),new BMap.Point(116.364127,39.913087),new BMap.Point(116.364126,39.913086),new BMap.Point(116.363917,39.913193),new BMap.Point(116.363827,39.913262),new BMap.Point(116.363797,39.913311),new BMap.Point(116.363767,39.913391),new BMap.Point(116.363767,39.913541),new BMap.Point(116.363757,39.913771),new BMap.Point(116.363757,39.913821),new BMap.Point(116.363737,39.91432),new BMap.Point(116.363687,39.914809),new BMap.Point(116.363647,39.915039),new BMap.Point(116.363617,39.915198),new BMap.Point(116.363567,39.915377),new BMap.Point(116.363527,39.915527),new BMap.Point(116.363487,39.915676),new BMap.Point(116.363438,39.915905),new BMap.Point(116.363436,39.915905),new BMap.Point(116.363327,39.916154),new BMap.Point(116.363327,39.916154),new BMap.Point(116.363356,39.916444),new BMap.Point(116.363376,39.916694),new BMap.Point(116.363504,39.917936),new BMap.Point(116.363404,39.918974),new BMap.Point(116.363384,39.919494),new BMap.Point(116.363374,39.919673),new BMap.Point(116.363374,39.919723),new BMap.Point(116.363374,39.919763),new BMap.Point(116.363374,39.919813),new BMap.Point(116.363364,39.920293),new BMap.Point(116.363364,39.920393),new BMap.Point(116.363273,39.922131),new BMap.Point(116.363263,39.922441),new BMap.Point(116.363192,39.92405),new BMap.Point(116.363183,39.92422),new BMap.Point(116.363183,39.9243),new BMap.Point(116.363173,39.92446),new BMap.Point(116.363122,39.925599),new BMap.Point(116.363112,39.925818),new BMap.Point(116.363072,39.926798),new BMap.Point(116.363052,39.927057),new BMap.Point(116.363042,39.927277),new BMap.Point(116.363002,39.928407),new BMap.Point(116.362952,39.929326),new BMap.Point(116.362952,39.929466),new BMap.Point(116.362942,39.929486),new BMap.Point(116.362842,39.931454),new BMap.Point(116.362822,39.931694),new BMap.Point(116.362822,39.931834),new BMap.Point(116.362802,39.932393),new BMap.Point(116.362772,39.933293),new BMap.Point(116.362763,39.933313),new BMap.Point(116.362683,39.934892),new BMap.Point(116.362603,39.936531),new BMap.Point(116.362544,39.93769),new BMap.Point(116.362524,39.93804),new BMap.Point(116.362514,39.938159),new BMap.Point(116.362514,39.938209),new BMap.Point(116.362514,39.938259),new BMap.Point(116.362504,39.938509),new BMap.Point(116.362465,39.939329),new BMap.Point(116.362405,39.940878),new BMap.Point(116.362376,39.941888),new BMap.Point(116.362366,39.942108),new BMap.Point(116.362366,39.942138),new BMap.Point(116.362356,39.942398),new BMap.Point(116.362337,39.942597),new BMap.Point(116.362307,39.943287),new BMap.Point(116.362277,39.943637),new BMap.Point(116.362218,39.944746),new BMap.Point(116.362219,39.946046),new BMap.Point(116.362219,39.946196),new BMap.Point(116.362219,39.946226),new BMap.Point(116.362209,39.946276),new BMap.Point(116.362209,39.946326),new BMap.Point(116.362199,39.946436),new BMap.Point(116.36218,39.946876),new BMap.Point(116.36213,39.947595),new BMap.Point(116.36227,39.948167),new BMap.Point(116.36235,39.948339),new BMap.Point(116.362509,39.948611),new BMap.Point(116.362738,39.948914),new BMap.Point(116.362928,39.949197),new BMap.Point(116.363167,39.94943),new BMap.Point(116.363416,39.949604),new BMap.Point(116.363913,39.949851),new BMap.Point(116.36469,39.950052),new BMap.Point(116.365595,39.950366),new BMap.Point(116.365794,39.950429),new BMap.Point(116.366093,39.950524),new BMap.Point(116.366242,39.950556),new BMap.Point(116.367266,39.950863),new BMap.Point(116.368162,39.951127),new BMap.Point(116.371174,39.952029),new BMap.Point(116.371324,39.952072),new BMap.Point(116.372029,39.952315),new BMap.Point(116.372417,39.952482),new BMap.Point(116.37365,39.953024),new BMap.Point(116.374435,39.953378),new BMap.Point(116.374833,39.953536),new BMap.Point(116.374962,39.953598),new BMap.Point(116.375588,39.95386),new BMap.Point(116.375585,39.95386),new BMap.Point(116.375903,39.953895),new BMap.Point(116.376171,39.95396),new BMap.Point(116.376399,39.954035),new BMap.Point(116.376648,39.954099),new BMap.Point(116.376727,39.954131),new BMap.Point(116.377026,39.954216),new BMap.Point(116.377085,39.954237),new BMap.Point(116.377354,39.954312),new BMap.Point(116.377642,39.954358),new BMap.Point(116.377821,39.954391),new BMap.Point(116.378198,39.954458),new BMap.Point(116.378377,39.954491),new BMap.Point(116.378536,39.954504),new BMap.Point(116.378586,39.954505),new BMap.Point(116.378715,39.954517),new BMap.Point(116.378924,39.954531),new BMap.Point(116.379311,39.954558),new BMap.Point(116.379848,39.954598),new BMap.Point(116.379898,39.954599),new BMap.Point(116.380037,39.954611),new BMap.Point(116.380723,39.954664),new BMap.Point(116.381458,39.954697),new BMap.Point(116.381736,39.954712),new BMap.Point(116.382432,39.954744),new BMap.Point(116.38273,39.954759),new BMap.Point(116.38279,39.95476),new BMap.Point(116.383098,39.954795),new BMap.Point(116.383456,39.954882),new BMap.Point(116.383536,39.954903),new BMap.Point(116.383576,39.954914),new BMap.Point(116.383655,39.954935),new BMap.Point(116.383695,39.954946),new BMap.Point(116.383795,39.954987),new BMap.Point(116.383854,39.955019),new BMap.Point(116.383884,39.955029),new BMap.Point(116.383954,39.95507),new BMap.Point(116.384013,39.955121),new BMap.Point(116.384063,39.955162),new BMap.Point(116.384093,39.955183),new BMap.Point(116.384153,39.955244),new BMap.Point(116.384212,39.955315),new BMap.Point(116.384242,39.955345),new BMap.Point(116.384382,39.955518),new BMap.Point(116.384441,39.955609),new BMap.Point(116.384501,39.95568),new BMap.Point(116.384581,39.955811),new BMap.Point(116.38468,39.955953),new BMap.Point(116.384849,39.956206),new BMap.Point(116.384919,39.956317),new BMap.Point(116.385059,39.956529),new BMap.Point(116.385079,39.95657),new BMap.Point(116.385347,39.956974),new BMap.Point(116.385527,39.957267),new BMap.Point(116.385576,39.957358),new BMap.Point(116.385626,39.957459),new BMap.Point(116.385676,39.95757),new BMap.Point(116.385716,39.95768),new BMap.Point(116.385776,39.957841),new BMap.Point(116.385806,39.958002),new BMap.Point(116.385836,39.958162),new BMap.Point(116.385846,39.958293),new BMap.Point(116.385846,39.958473),new BMap.Point(116.385856,39.958623),new BMap.Point(116.385856,39.958623),new BMap.Point(116.385897,39.960014),new BMap.Point(116.385898,39.960984),new BMap.Point(116.385908,39.961295),new BMap.Point(116.385929,39.961865),new BMap.Point(116.385909,39.962295),new BMap.Point(116.38588,39.963275),new BMap.Point(116.385831,39.963644),new BMap.Point(116.385782,39.964123),new BMap.Point(116.385782,39.964143),new BMap.Point(116.385842,39.964715),new BMap.Point(116.385903,39.965356),new BMap.Point(116.385983,39.966067),new BMap.Point(116.386043,39.966538),new BMap.Point(116.386053,39.966629),new BMap.Point(116.386133,39.96726),new BMap.Point(116.386414,39.969935),new BMap.Point(116.386474,39.970407),new BMap.Point(116.386685,39.9718),new BMap.Point(116.386805,39.972673),new BMap.Point(116.386935,39.973505),new BMap.Point(116.386985,39.973796),new BMap.Point(116.386984,39.973796),new BMap.Point(116.387035,39.974166),new BMap.Point(116.387055,39.974317),new BMap.Point(116.387075,39.974427),new BMap.Point(116.387095,39.974608),new BMap.Point(116.387175,39.975129),new BMap.Point(116.387185,39.975199),new BMap.Point(116.387195,39.975309),new BMap.Point(116.387285,39.975931),new BMap.Point(116.387385,39.976803),new BMap.Point(116.387626,39.978957),new BMap.Point(116.387646,39.979127),new BMap.Point(116.387656,39.979228),new BMap.Point(116.387736,39.979829),new BMap.Point(116.387866,39.981111),new BMap.Point(116.387926,39.981592),new BMap.Point(116.388026,39.982294),new BMap.Point(116.388016,39.982684),new BMap.Point(116.388007,39.982864),new BMap.Point(116.387997,39.982953),new BMap.Point(116.387997,39.983003),new BMap.Point(116.387997,39.983054),new BMap.Point(116.387987,39.983333),new BMap.Point(116.387918,39.983782),new BMap.Point(116.387819,39.984381),new BMap.Point(116.3877,39.984779),new BMap.Point(116.386975,39.987338),new BMap.Point(116.386806,39.987906),new BMap.Point(116.386776,39.988015),new BMap.Point(116.386727,39.988195),new BMap.Point(116.386518,39.988971),new BMap.Point(116.386379,39.989529),new BMap.Point(116.386221,39.990087),new BMap.Point(116.386012,39.990823),new BMap.Point(116.385943,39.991072),new BMap.Point(116.385724,39.991819),new BMap.Point(116.385376,39.992993),new BMap.Point(116.385347,39.993123),new BMap.Point(116.385237,39.993471),new BMap.Point(116.385208,39.993591),new BMap.Point(116.385168,39.99374),new BMap.Point(116.385128,39.993889),new BMap.Point(116.385109,39.993939),new BMap.Point(116.385079,39.994048),new BMap.Point(116.384622,39.995631),new BMap.Point(116.384552,39.99591),new BMap.Point(116.384254,39.996995),new BMap.Point(116.384244,39.997034),new BMap.Point(116.383936,39.997829),new BMap.Point(116.383906,39.997919),new BMap.Point(116.383687,39.998425),new BMap.Point(116.383469,39.998841),new BMap.Point(116.38327,39.999118),new BMap.Point(116.382982,39.999513),new BMap.Point(116.382534,40.000135),new BMap.Point(116.382455,40.000253),new BMap.Point(116.382157,40.000658),new BMap.Point(116.382067,40.000777),new BMap.Point(116.381491,40.001506),new BMap.Point(116.381023,40.002088),new BMap.Point(116.380516,40.002739),new BMap.Point(116.380188,40.003163),new BMap.Point(116.379612,40.003902),new BMap.Point(116.379234,40.004385),new BMap.Point(116.378578,40.005213),new BMap.Point(116.377942,40.006032),new BMap.Point(116.377524,40.006564),new BMap.Point(116.376937,40.007333),new BMap.Point(116.376848,40.007431),new BMap.Point(116.376789,40.00752),new BMap.Point(116.376749,40.007559),new BMap.Point(116.376739,40.007589),new BMap.Point(116.376431,40.007983),new BMap.Point(116.376043,40.008486),new BMap.Point(116.374452,40.010616),new BMap.Point(116.373895,40.011406),new BMap.Point(116.373606,40.011791),new BMap.Point(116.372303,40.013577),new BMap.Point(116.371706,40.014386),new BMap.Point(116.371617,40.014514),new BMap.Point(116.37106,40.015244),new BMap.Point(116.37097,40.015373),new BMap.Point(116.370542,40.015935),new BMap.Point(116.369577,40.017208),new BMap.Point(116.369259,40.017652),new BMap.Point(116.368711,40.018443),new BMap.Point(116.368303,40.018946),new BMap.Point(116.367557,40.019883),new BMap.Point(116.36687,40.020752),new BMap.Point(116.366183,40.02162),new BMap.Point(116.364589,40.023695),new BMap.Point(116.363912,40.024585),new BMap.Point(116.363334,40.025317),new BMap.Point(116.362975,40.025762),new BMap.Point(116.362816,40.025959),new BMap.Point(116.362228,40.026711),new BMap.Point(116.361869,40.027156),new BMap.Point(116.36164,40.027463),new BMap.Point(116.361421,40.02776),new BMap.Point(116.361401,40.02779),new BMap.Point(116.361311,40.027899),new BMap.Point(116.361304,40.027899),new BMap.Point(116.361274,40.027948),new BMap.Point(116.361175,40.028107),new BMap.Point(116.361085,40.028236),new BMap.Point(116.360995,40.028385),new BMap.Point(116.360945,40.028474),new BMap.Point(116.360916,40.028524),new BMap.Point(116.360806,40.028712),new BMap.Point(116.360706,40.028881),new BMap.Point(116.360677,40.028941),new BMap.Point(116.360667,40.028961),new BMap.Point(116.360637,40.02903),new BMap.Point(116.360597,40.02912),new BMap.Point(116.360557,40.029199),new BMap.Point(116.360547,40.029219),new BMap.Point(116.360538,40.029259),new BMap.Point(116.360518,40.029299),new BMap.Point(116.360508,40.029338),new BMap.Point(116.360508,40.029388),new BMap.Point(116.360508,40.029438),new BMap.Point(116.360508,40.029488),new BMap.Point(116.360518,40.029539),new BMap.Point(116.360528,40.029589),new BMap.Point(116.360547,40.029639),new BMap.Point(116.360577,40.029679),new BMap.Point(116.360607,40.02972),new BMap.Point(116.360647,40.02976),new BMap.Point(116.360687,40.029791),new BMap.Point(116.360726,40.029821),new BMap.Point(116.360766,40.029841),new BMap.Point(116.360806,40.029862),new BMap.Point(116.360846,40.029872),new BMap.Point(116.360896,40.029883),new BMap.Point(116.360945,40.029894),new BMap.Point(116.360995,40.029904),new BMap.Point(116.361055,40.029905),new BMap.Point(116.361115,40.029906),new BMap.Point(116.361174,40.029907),new BMap.Point(116.361234,40.029887),new BMap.Point(116.361294,40.029878),new BMap.Point(116.361354,40.029859),new BMap.Point(116.361393,40.02984),new BMap.Point(116.361453,40.029811),new BMap.Point(116.361493,40.029781),new BMap.Point(116.361533,40.029742),new BMap.Point(116.361573,40.029692),new BMap.Point(116.361603,40.029643),new BMap.Point(116.361633,40.029593),new BMap.Point(116.361643,40.029544),new BMap.Point(116.361643,40.029504),new BMap.Point(116.361643,40.029464),new BMap.Point(116.361633,40.029424),new BMap.Point(116.361623,40.029374),new BMap.Point(116.361603,40.029323),new BMap.Point(116.361574,40.029273),new BMap.Point(116.361544,40.029233),new BMap.Point(116.361504,40.029202),new BMap.Point(116.361474,40.029172),new BMap.Point(116.361425,40.029141),new BMap.Point(116.361385,40.029101),new BMap.Point(116.361325,40.02906),new BMap.Point(116.361266,40.02904),new BMap.Point(116.361226,40.029009),new BMap.Point(116.361186,40.028989),new BMap.Point(116.361147,40.028968),new BMap.Point(116.361107,40.028948),new BMap.Point(116.361104,40.028946),new BMap.Point(116.360765,40.028942),new BMap.Point(116.360676,40.028941),new BMap.Point(116.360477,40.028939),new BMap.Point(116.360228,40.028936),new BMap.Point(116.359521,40.028937),new BMap.Point(116.359292,40.028945),new BMap.Point(116.358943,40.028951),new BMap.Point(116.358515,40.028946),new BMap.Point(116.358495,40.028946),new BMap.Point(116.357638,40.028947),new BMap.Point(116.357499,40.028946),new BMap.Point(116.357011,40.028931),new BMap.Point(116.356801,40.028929),new BMap.Point(116.356792,40.028929),new BMap.Point(116.356632,40.028928),new BMap.Point(116.355356,40.028937),new BMap.Point(116.355037,40.028934),new BMap.Point(116.354628,40.028941),new BMap.Point(116.354219,40.028938),new BMap.Point(116.353571,40.028934),new BMap.Point(116.353062,40.028941),new BMap.Point(116.352872,40.02894),new BMap.Point(116.351874,40.028934),new BMap.Point(116.350277,40.028937),new BMap.Point(116.347059,40.028961),new BMap.Point(116.346519,40.028971),new BMap.Point(116.343748,40.028925),new BMap.Point(116.343718,40.028925),new BMap.Point(116.343608,40.028925),new BMap.Point(116.342968,40.028888),new BMap.Point(116.341516,40.028704),new BMap.Point(116.340915,40.028537),new BMap.Point(116.340184,40.028331),new BMap.Point(116.337588,40.02754),new BMap.Point(116.337585,40.027539),new BMap.Point(116.337244,40.027532),new BMap.Point(116.336974,40.027464),new BMap.Point(116.336522,40.027388),new BMap.Point(116.336201,40.027321),new BMap.Point(116.33576,40.027336),new BMap.Point(116.335309,40.02738),new BMap.Point(116.334907,40.027494),new BMap.Point(116.334445,40.027659),new BMap.Point(116.334405,40.027679),new BMap.Point(116.333823,40.027946),new BMap.Point(116.333311,40.028252),new BMap.Point(116.332839,40.028617),new BMap.Point(116.331713,40.029801),new BMap.Point(116.331711,40.0298),new BMap.Point(116.330726,40.031463),new BMap.Point(116.330585,40.031744),new BMap.Point(116.330071,40.032911),new BMap.Point(116.330021,40.033112),new BMap.Point(116.329437,40.035059),new BMap.Point(116.329245,40.035672),new BMap.Point(116.329165,40.035913),new BMap.Point(116.329084,40.036174),new BMap.Point(116.328984,40.036465),new BMap.Point(116.328943,40.036576),new BMap.Point(116.328802,40.037018),new BMap.Point(116.328209,40.038366),new BMap.Point(116.327716,40.039103),new BMap.Point(116.32685,40.040136),new BMap.Point(116.326659,40.040299),new BMap.Point(116.325231,40.041552),new BMap.Point(116.323168,40.043356),new BMap.Point(116.323047,40.043468),new BMap.Point(116.323017,40.043489),new BMap.Point(116.322937,40.04357),new BMap.Point(116.322806,40.043682),new BMap.Point(116.322756,40.043733),new BMap.Point(116.322715,40.043764),new BMap.Point(116.322243,40.044202),new BMap.Point(116.322233,40.044222),new BMap.Point(116.321719,40.044821),new BMap.Point(116.321578,40.044983),new BMap.Point(116.320773,40.046077),new BMap.Point(116.320451,40.046673),new BMap.Point(116.319867,40.047743),new BMap.Point(116.319122,40.049116),new BMap.Point(116.31878,40.049552),new BMap.Point(116.317048,40.051744),new BMap.Point(116.316032,40.053022),new BMap.Point(116.315639,40.053519),new BMap.Point(116.313536,40.056347),new BMap.Point(116.313365,40.05658),new BMap.Point(116.313265,40.056712),new BMap.Point(116.313215,40.056783),new BMap.Point(116.313064,40.056985),new BMap.Point(116.31242,40.058037),new BMap.Point(116.311555,40.059442),new BMap.Point(116.311535,40.059473),new BMap.Point(116.311123,40.06015),new BMap.Point(116.311118,40.06015),new BMap.Point(116.311119,40.06048),new BMap.Point(116.310968,40.060772),new BMap.Point(116.310385,40.061943),new BMap.Point(116.310334,40.062044),new BMap.Point(116.310103,40.062488),new BMap.Point(116.310063,40.062568),new BMap.Point(116.310033,40.062629),new BMap.Point(116.309309,40.064021),new BMap.Point(116.308897,40.064488),new BMap.Point(116.308555,40.064634),new BMap.Point(116.308375,40.064707),new BMap.Point(116.308244,40.064759),new BMap.Point(116.307963,40.064834),new BMap.Point(116.30756,40.064791),new BMap.Point(116.306866,40.064622),new BMap.Point(116.304856,40.064163),new BMap.Point(116.303499,40.063863),new BMap.Point(116.302966,40.06374),new BMap.Point(116.302856,40.063682),new BMap.Point(116.302854,40.063681),new BMap.Point(116.302995,40.063199),new BMap.Point(116.303979,40.060475),new BMap.Point(116.303989,40.060395),new BMap.Point(116.304079,40.060064),new BMap.Point(116.30432,40.05918),new BMap.Point(116.304501,40.058558),new BMap.Point(116.304521,40.058518),new BMap.Point(116.304662,40.058015),new BMap.Point(116.304933,40.057151),new BMap.Point(116.305194,40.056358),new BMap.Point(116.305235,40.056207),new BMap.Point(116.305325,40.055946),new BMap.Point(116.305566,40.055212),new BMap.Point(116.305647,40.054951),new BMap.Point(116.305747,40.05494),new BMap.Point(116.305717,40.05502),new BMap.Point(116.305717,40.055019),new BMap.Point(116.305647,40.05523),new BMap.Point(116.305416,40.055964),new BMap.Point(116.305295,40.056375),new BMap.Point(116.305034,40.057169),new BMap.Point(116.304773,40.058033),new BMap.Point(116.304772,40.058033),new BMap.Point(116.306491,40.058347),new BMap.Point(116.306492,40.058347),new BMap.Point(116.306914,40.05729),new BMap.Point(116.306954,40.05717),new BMap.Point(116.306954,40.05717),new BMap.Point(116.306974,40.057169)];
		                map.addOverlay(new BMap.Polyline(arrPois, {strokeColor: '#111'})); //不画线
		                map.setViewport(arrPois);
		                   marker=new BMap.Marker(arrPois[0],{
		                      icon  : new BMap.Icon('http://developer.baidu.com/map/jsdemo/img/car.png', new BMap.Size(52,26),{anchor : new BMap.Size(27, 13)})
		                   });
		      var label = new BMap.Label("粤A30780",{offset:new BMap.Size(0,-30)});
		      label.setStyle({border:"1px solid rgb(204, 204, 204)",color: "rgb(0, 0, 0)",borderRadius:"10px",padding:"5px",background:"rgb(255, 255, 255)",});
		                marker.setLabel(label);
		                 
		      map.addOverlay(marker);
//		     BMapLib.LuShu.prototype._move=function(initPos,targetPos,effect) {
//		            var pointsArr=[initPos,targetPos];  //点数组
//		            var me = this,
//		                //当前的帧数
//		                currentCount = 0,
//		                //步长，米/秒
//		                timer = 10,
//		                step = this._opts.speed / (1000 / timer),
//		                //初始坐标
//		                init_pos = this._projection.lngLatToPoint(initPos),
//		                //获取结束点的(x,y)坐标
//		                target_pos = this._projection.lngLatToPoint(targetPos),
//		                //总的步长
//		                count = Math.round(me._getDistance(init_pos, target_pos) / step);
//		                 //显示折线 syj201607191107
//		            this._map.addOverlay(new BMap.Polyline(pointsArr, { 
//		                strokeColor : "#111", 
//		                strokeWeight : 5, 
//		                strokeOpacity : 0.5 
//		            })); // 画线 
//		            //如果小于1直接移动到下一点
//		            if (count < 1) {
//		                me._moveNext(++me.i);
//		                return;
//		            }
//		            me._intervalFlag = setInterval(function() {
//		            //两点之间当前帧数大于总帧数的时候，则说明已经完成移动
//		                if (currentCount >= count) {
//		                    clearInterval(me._intervalFlag);
//		                    //移动的点已经超过总的长度
//		                    if(me.i > me._path.length){
//		                        return;
//		                    }
//		                    //运行下一个点
//		                    me._moveNext(++me.i);
//		                }else {
//		                        currentCount++;
//		                        var x = effect(init_pos.x, target_pos.x, currentCount, count),
//		                            y = effect(init_pos.y, target_pos.y, currentCount, count),
//		                            pos = me._projection.pointToLngLat(new BMap.Pixel(x, y));
//		                        //设置marker
//		                        if(currentCount == 1){
//		                            var proPos = null;
//		                            if(me.i - 1 >= 0){
//		                                proPos = me._path[me.i - 1];
//		                            }
//		                            if(me._opts.enableRotation == true){
//		                                 me.setRotation(proPos,initPos,targetPos);
//		                            }
//		                            if(me._opts.autoView){
//		                                if(!me._map.getBounds().containsPoint(pos)){
//		                                    me._map.setCenter(pos);
//		                                }  
//		                            }
//		                        }
//		                        //正在移动
//		                        me._marker.setPosition(pos);
//		                        //设置自定义overlay的位置
//		                        me._setInfoWin(pos);  
//		                    }
//		            },timer);
//		        };
		                lushu = new BMapLib.LuShu(map,arrPois,{
		                defaultContent:"粤A30780",//"从天安门到百度大厦"
		                autoView:true,//是否开启自动视野调整，如果开启那么路书在运动过程中会根据视野自动调整
		                icon  : new BMap.Icon('http://developer.baidu.com/map/jsdemo/img/car.png', new BMap.Size(52,26),{anchor : new BMap.Size(27, 13)}),
		                speed: 2000,
		                enableRotation:true,//是否设置marker随着道路的走向进行旋转
		                   landmarkPois:[
		                   {lng:116.306954,lat:40.05718,html:'加油站',pauseTime:2}
		                  ]
		                    
		                }); 
		         
//		      marker.addEventListener("click",function(){
//		        marker.enableMassClear();   //设置后可以隐藏改点的覆盖物
//		        marker.hide();
//		        lushu.start();
//		        //map.clearOverlays();  //清除所有覆盖物
//		      });
		            //}
//		        }
		  //  });
		    //drv.search('天安门', '百度大厦');
		     // lushu.start();
		     // lushu.pause();
		    //绑定事件
		   // $("run").onclick = function(){
		      marker.enableMassClear(); //设置后可以隐藏该点的覆盖物
		      marker.hide();
		      lushu.start();
		      
		     // map.clearOverlays();    //清除所有覆盖物
		 //   }
//		    function $(element){
//		        return document.getElementById(element);
//		    }
	},
	
	//主题模板样式添加
	addMapSubject : function(){
		// 定义一个控件类,即function
		function ZoomControl(){
			// 默认停靠位置和偏移量
			this.defaultAnchor = BMAP_ANCHOR_TOP_RIGHT;
			this.defaultOffset = new BMap.Size(150,10);
		}
		
		// 通过JavaScript的prototype属性继承于BMap.Control
		ZoomControl.prototype = new BMap.Control();
		
		// 自定义控件必须实现自己的initialize方法,并且将控件的DOM元素返回
		// 在本方法中创建个div元素作为控件的容器,并将其添加到地图容器中
		ZoomControl.prototype.initialize = function(map){
			// 创建一个DOM元素
			var div = document.createElement("div");
			// 添加label标签
			var label = document.createElement("label");
			var label_text = document.createTextNode("选择主题");
			label.appendChild(label_text);
			div.appendChild(label);
			// 添加select标签
			var sel = document.createElement("select");
			sel.id = "stylelist"; 
			sel.style.marginLeft = "5px";
		    sel.style.marginTop = "2px";
	        div.appendChild(sel); 
	        // 初始化模板选择的下拉框
	    	for(var key in mapstyles){
	    		var style = mapstyles[key];
	    		var item = new  Option(style.title,key);
	    		sel.options.add(item);
	    	}
	    	// 下拉框点击事件
	    	sel.onchange = function(){
				map.setMapStyle({style:this.value});
			};
	    	
			// 设置样式
			div.style.textAlign="center";
			div.style.border = "1px solid gray";
		    div.style.backgroundColor = "white";
		    div.style.borderRadius="10px";
		    div.style.paddingTop="2.3px";
			div.style.width="210px";
			div.style.height="40px";
		    
		    // 添加DOM元素到地图中
			map.getContainer().appendChild(div);
			// 将DOM元素返回
			return div;
		}
		// 创建控件
		var myZoomCtrl = new ZoomControl();
		// 添加到地图当中
		map.addControl(myZoomCtrl);
	},
	
	//添加地图类型和缩略图
	addMapType : function() {
		var mapType = new BMap.MapTypeControl({anchor: BMAP_ANCHOR_TOP_RIGHT, offset:new BMap.Size(10, 17)});
		var overView = new BMap.OverviewMapControl({isOpen:true, anchor: BMAP_ANCHOR_BOTTOM_RIGHT});
		map.addControl(mapType);            //右上角，默认地图控件
		map.addControl(overView);      		//右下角，打开
	},
	
	//添加控件和比例尺
	addMapControl : function() {
		var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT, offset:new BMap.Size(55, 20)});// 左上角，添加比例尺
		var top_left_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_LEFT, offset:new BMap.Size(10, 0)});  //左上角，添加默认缩放平移控件
		map.addControl(top_left_control);        
		map.addControl(top_left_navigation);    
	},
	
	//添加鼠标绘制工具
	addDrawTool : function() {
		var styleOptions = {
			strokeColor : "red", 	//边线颜色。
			fillColor : "red", 		//填充颜色。当参数为空时，圆形将没有填充效果。
			strokeWeight : 3, 		//边线的宽度，以像素为单位。
			strokeOpacity : 0.8, 	//边线透明度，取值范围0 - 1。
			fillOpacity : 0.3, 		//填充的透明度，取值范围0 - 1。
			strokeStyle : 'solid' 	//边线的样式，solid或dashed。
		}
		//实例化鼠标绘制工具
		drawingManager = new BMapLib.DrawingManager(map, {
			isOpen : false, 				//是否开启绘制模式
			enableDrawingTool : true, 	//是否显示工具栏
			drawingToolOptions : {
				anchor : BMAP_ANCHOR_TOP_RIGHT, //位置
				offset : new BMap.Size(10, 55), //偏离值
			},
			circleOptions : styleOptions, 		//圆的样式
			polylineOptions : styleOptions, 	//线的样式
			polygonOptions : styleOptions, 		//多边形的样式
			rectangleOptions : styleOptions	 	//矩形的样式
		});
	},
	
	//添加按钮工具条
	addMapButtons : function() {
		// 定义一个控件类,即function
		function ZoomControl(){
			// 默认停靠位置和偏移量
			this.defaultAnchor = BMAP_ANCHOR_BOTTOM_RIGHT;
			this.defaultOffset = new BMap.Size(460, 30);
		}
		
		// 通过JavaScript的prototype属性继承于BMap.Control
		ZoomControl.prototype = new BMap.Control();
		
		// 自定义控件必须实现自己的initialize方法,并且将控件的DOM元素返回
		// 在本方法中创建个div元素作为控件的容器,并将其添加到地图容器中
		ZoomControl.prototype.initialize = function(map){
			// 创建一个DOM元素
			var divs = document.createElement("div");
			divs.style.textAlign="center";
			divs.style.backgroundColor = "white";
			divs.style.width="510px";
			divs.style.height="50px";
			divs.style.borderRadius="10px";				//边角弧度
			divs.style.border = "2px solid gray";		//div边框粗细
			
			//工具条中添加按钮
			baiduMap.addMapButton(divs,"全局态势", "mapJs/image/img1.png");
			baiduMap.addMapButton(divs,"聚集车辆", "mapJs/image/img2.png");	
			baiduMap.addMapButton(divs,"违规车辆", "mapJs/image/img3.png");
			baiduMap.addMapButton(divs,"特定车辆追踪", "mapJs/image/img4.png");
			baiduMap.addMapButton(divs,"历史轨迹回放", "mapJs/image/img5.png");
			baiduMap.addMapButton(divs,"聚集地点设置", "mapJs/image/img6.png");
			baiduMap.addMapButton(divs,"网约车数据统计", "mapJs/image/img7.png");
			baiduMap.addMapButton(divs,"报警信息", "mapJs/image/img8.png");
			
			// 添加DOM元素到地图中
			map.getContainer().appendChild(divs);
			// 将DOM元素返回
			return divs;
		}
		// 创建控件
		var myZoomCtrl = new ZoomControl();
		// 添加到地图当中
		map.addControl(myZoomCtrl);
	},
	
	//工具条中添加按钮
	addMapButton : function(divs,textStr,imger) {
		// 创建一个DOM元素
		var div = document.createElement("div");
		// 添加图片
		var e1 = document.createElement("img");
		e1.src=$("#basePath").val()+imger;
		e1.title=textStr;
		e1.style.maxWidth="20px";
		e1.style.maxHeight="20px";
		div.appendChild(e1);
		// 设置样式
		div.style.textAlign="center";				//图片水平居中
	    div.style.paddingTop="4px";					//图片上边距
		div.style.cursor = "pointer";				//鼠标移入是手的形状
	    div.style.border = "1px solid gray";		//div边框粗细
	    if(textStr == "全局态势"){
	    	div.style.backgroundColor = "yellow";		//按钮背景颜色
	    }
	    else {
	    	div.style.backgroundColor = "white";		//按钮背景颜色
	    }
	    div.style.borderRadius="50%";				//边角弧度
	    div.style.width="30px";
	    div.style.height="30px";
	    div.style.float="left";						//div保持在一行显示
	    div.style.marginLeft="29px";				//div左边距
	    div.style.marginTop="6px";					//div上边距
	    div.style.boxShadow="2px 4px 5px #660";		//div阴影效果
		// 按钮点击事件
		div.onclick = function(e){
			$.each($("div"),function(index,value){
				if(value.style.backgroundColor=="yellow"){
					value.style.backgroundColor="white";
					return false;
				}
			});
			div.style.backgroundColor="yellow";
			baiduMap.optionExe(textStr);
		}
		
		divs.appendChild(div);
	},
	
	//按钮点击判断function
	optionExe : function(textStr) {
		clearTimeout(timeTraceID);				//停止特定车辆追踪定时器
		clearTimeout(timeIllID);				//停止违规车辆定时器
		clearTimeout(timeGlobalID);				//停止聚集车辆定时器
		$(".BMapLib_Drawing_panel").hide();		//隐藏绘图工具条
		layer.closeAll('iframe');				//关闭页面中所有iframe弹窗
		baiduMap.clearAll();					//清除所有覆盖物
		
		if(textStr == "全局态势"){
			if(isTimeStart != 0){	//定时器是停止状态，点击启动
				baiduMap.globalRunTrend();
				isTimeStart = 0;
			}
		}
		if(textStr == "聚集车辆"){
			//启动定时器，加载车辆
			if(isTimeStart != 0){
				baiduMap.globalRunTrend();
				isTimeStart = 0;
			}
			baiduMap.globalCar();
		}
		if(textStr == "违规车辆"){
			clearTimeout(timeID);	//停止定时器
			isTimeStart=1;
			baiduMap.clearAll();
			baiduMap.violationCar();
		}
		if(textStr == "特定车辆追踪"){
			clearTimeout(timeID);	//停止定时器
			isTimeStart=1;
			baiduMap.clearAll();
			baiduMap.specificCar();
		}
		if(textStr == "历史轨迹回放"){
			clearTimeout(timeID);	//停止定时器
			isTimeStart=1;
			baiduMap.clearAll();
			baiduMap.hisTrajectory();
		}
		if(textStr == "聚集地点设置"){
			//启动定时器，加载车辆
			if(isTimeStart != 0){
				baiduMap.globalRunTrend();
				isTimeStart = 0;
			}
			baiduMap.assemblePlaceSet();
		}
		if(textStr == "网约车数据统计"){
			//启动定时器，加载车辆
			if(isTimeStart != 0){
				baiduMap.globalRunTrend();
				isTimeStart = 0;
			}
			baiduMap.netAppointCarList();
		}
		if(textStr == "报警信息"){
			//启动定时器，加载车辆
			if(isTimeStart != 0){
				baiduMap.globalRunTrend();
				isTimeStart = 0;
			}
			baiduMap.alertMessage();
		}
	},
	//全局态势
	globalRunTrend: function(){
		$.ajax({
			type: "POST",
			url: $("#basePath").val()+'supervise/getCarPosition.action',
			dataType:'json',
			cache: false,
			success: function(data){
				var codeJson = eval(data);
				for (var i = 0; i < codeJson.length; i++) {
					var point = new BMap.Point(codeJson[i].longitude, codeJson[i].latitude);
					var label = new BMap.Label(codeJson[i].vehicle_no,{offset:new BMap.Size(20,-10)});
					label.setStyle({
						position: "relative",		//相对定位
						display: "inline-table",	//规定元素应该生成的框的类型
						borderRadius: "5px",		//设置矩形边角弧度
						color : "white", 
						fontSize : "12px", 
						backgroundColor :"blue",
						fontWeight :"bold",
					    borderColor:"white"
					});
					if(codeJson[i].warnStatus == '1'){//车辆预警状态
						label.setStyle({backgroundColor :"red"});
					}
					
					//封装车辆平滑移动所需参数：vehicleNo，arrPoint，marker
					var vehicleNo = codeJson[i].vehicle_no;	//车牌号
					var arrPoint = new Array();		//存放两个点：上一个点，当前点
					if(carDataMap[vehicleNo] == null || carDataMap[vehicleNo]  == ""){	//说明第一次执行循环，arrPoint数组中存放两个点都为起始点
						arrPoint[0] = point;
					}else{
						arrPoint[0] = carDataMap[vehicleNo];
					}
					arrPoint[1] = point;
					carDataMap[vehicleNo] = point;		//封装map数组carDataMap，key：当前车牌号；value：当前点位
					
					var marker = new BMap.Marker(point,{icon:new BMap.Icon('http://developer.baidu.com/map/jsdemo/img/car.png', new BMap.Size(52,26),{anchor : new BMap.Size(27, 13)}), title:codeJson[i].comname});
					marker.setLabel(label);	//将label标签绑定到marker标签上
					map.addOverlay(marker);
					
					//车辆平滑移动
					baiduMap.carMove(vehicleNo, arrPoint, marker, codeJson[i].warnStatus, "", "");
//					map.removeOverlay(marker);		//删除路过的marker标记
					
					var info = "<h4>车牌号："+codeJson[i].vehicle_no+"</h4>网约车公司："+codeJson[i].comname;
					if("" == codeJson[i].order_id || null == codeJson[i].order_id){
						info += "<br>接单状态：空闲";
					}else{
						info += "<br>接单状态：已接单<br>订单号："+codeJson[i].order_id;
					}
					var infoWindowGlobal = new BMap.InfoWindow(info);
					baiduMap.addMarkerGlobal(infoWindowGlobal,marker);//弹窗
					
					carMarker[i]=marker;			//将所有车辆封装成carMarker数组
				}
//				marker.hide();
			}
		});

		//清除所有车辆
		for(var i=0;i<carMarker.length;i++){
			map.removeOverlay(carMarker[i]);
		}
//		map.clearOverlays();
//		baiduMap.clearAll();
		
		timeID = setTimeout('baiduMap.globalRunTrend()',1000); //1秒刷新
	},
	addMarkerGlobal : function(infoWindowGlobal,marker){
		marker.addEventListener("onmouseover", function(){         
		    this.openInfoWindow(infoWindowGlobal);
		    //图片加载完毕重绘infowindow
		});
	},
	
	/**
	 * 小车平滑移动
	 * vehicleNo：车牌号
	 * arrPoint：移动经过的点（每次都从上一个点移动到当前点）
	 * marker：车的图标
	 * 
	 */
	carMove: function(vehicleNo, arrPoint, marker, warnStatus, trace, binPoint){
		var lushu;
		var speeds = 2000;			// 运行速度
		
//		var arrPoint=[new BMap.Point(116.403984,39.914004),new BMap.Point(116.402116,39.913938),new BMap.Point(116.402116,39.913938),new BMap.Point(116.402046,39.913928),new BMap.Point(116.401856,39.913927),new BMap.Point(116.401547,39.913926),new BMap.Point(116.401008,39.913923),new BMap.Point(116.400599,39.913921),new BMap.Point(116.39999,39.913908),new BMap.Point(116.399471,39.913875),new BMap.Point(116.399042,39.913852),new BMap.Point(116.398035,39.913835),new BMap.Point(116.395593,39.913683),new BMap.Point(116.395383,39.913681),new BMap.Point(116.395114,39.913658),new BMap.Point(116.394666,39.913664),new BMap.Point(116.390265,39.91349),new BMap.Point(116.38925,39.913456),new BMap.Point(116.388931,39.913461),new BMap.Point(116.388643,39.913457),new BMap.Point(116.388335,39.913463),new BMap.Point(116.386455,39.913424),new BMap.Point(116.386166,39.913429),new BMap.Point(116.385898,39.913425),new BMap.Point(116.384327,39.913399),new BMap.Point(116.384168,39.913396),new BMap.Point(116.38384,39.913391),new BMap.Point(116.383472,39.913395),new BMap.Point(116.383323,39.913402),new BMap.Point(116.382796,39.913403),new BMap.Point(116.382747,39.913402),new BMap.Point(116.38227,39.913394),new BMap.Point(116.381594,39.913372),new BMap.Point(116.381465,39.91337),new BMap.Point(116.381445,39.913369),new BMap.Point(116.381197,39.913365),new BMap.Point(116.380779,39.913348),new BMap.Point(116.38066,39.913346),new BMap.Point(116.380491,39.913343),new BMap.Point(116.380488,39.913341),new BMap.Point(116.38014,39.913344),new BMap.Point(116.379435,39.913342),new BMap.Point(116.378848,39.913331),new BMap.Point(116.378103,39.913307),new BMap.Point(116.376722,39.913282),new BMap.Point(116.374238,39.913227),new BMap.Point(116.373105,39.913226),new BMap.Point(116.37221,39.91321),new BMap.Point(116.370004,39.913171),new BMap.Point(116.369865,39.913169),new BMap.Point(116.369706,39.913166),new BMap.Point(116.369616,39.913175),new BMap.Point(116.366474,39.913103),new BMap.Point(116.366276,39.913109),new BMap.Point(116.365997,39.913105),new BMap.Point(116.365898,39.913104),new BMap.Point(116.365639,39.91312),new BMap.Point(116.364605,39.913094),new BMap.Point(116.364127,39.913087),new BMap.Point(116.364126,39.913086),new BMap.Point(116.363917,39.913193),new BMap.Point(116.363827,39.913262),new BMap.Point(116.363797,39.913311),new BMap.Point(116.363767,39.913391),new BMap.Point(116.363767,39.913541),new BMap.Point(116.363757,39.913771),new BMap.Point(116.363757,39.913821),new BMap.Point(116.363737,39.91432),new BMap.Point(116.363687,39.914809),new BMap.Point(116.363647,39.915039),new BMap.Point(116.363617,39.915198),new BMap.Point(116.363567,39.915377),new BMap.Point(116.363527,39.915527),new BMap.Point(116.363487,39.915676),new BMap.Point(116.363438,39.915905),new BMap.Point(116.363436,39.915905),new BMap.Point(116.363327,39.916154),new BMap.Point(116.363327,39.916154),new BMap.Point(116.363356,39.916444),new BMap.Point(116.363376,39.916694),new BMap.Point(116.363504,39.917936),new BMap.Point(116.363404,39.918974),new BMap.Point(116.363384,39.919494),new BMap.Point(116.363374,39.919673),new BMap.Point(116.363374,39.919723),new BMap.Point(116.363374,39.919763),new BMap.Point(116.363374,39.919813),new BMap.Point(116.363364,39.920293),new BMap.Point(116.363364,39.920393),new BMap.Point(116.363273,39.922131),new BMap.Point(116.363263,39.922441),new BMap.Point(116.363192,39.92405),new BMap.Point(116.363183,39.92422),new BMap.Point(116.363183,39.9243),new BMap.Point(116.363173,39.92446),new BMap.Point(116.363122,39.925599),new BMap.Point(116.363112,39.925818),new BMap.Point(116.363072,39.926798),new BMap.Point(116.363052,39.927057),new BMap.Point(116.363042,39.927277),new BMap.Point(116.363002,39.928407),new BMap.Point(116.362952,39.929326),new BMap.Point(116.362952,39.929466),new BMap.Point(116.362942,39.929486),new BMap.Point(116.362842,39.931454),new BMap.Point(116.362822,39.931694),new BMap.Point(116.362822,39.931834),new BMap.Point(116.362802,39.932393),new BMap.Point(116.362772,39.933293),new BMap.Point(116.362763,39.933313),new BMap.Point(116.362683,39.934892),new BMap.Point(116.362603,39.936531),new BMap.Point(116.362544,39.93769),new BMap.Point(116.362524,39.93804),new BMap.Point(116.362514,39.938159),new BMap.Point(116.362514,39.938209),new BMap.Point(116.362514,39.938259),new BMap.Point(116.362504,39.938509),new BMap.Point(116.362465,39.939329),new BMap.Point(116.362405,39.940878),new BMap.Point(116.362376,39.941888),new BMap.Point(116.362366,39.942108),new BMap.Point(116.362366,39.942138),new BMap.Point(116.362356,39.942398),new BMap.Point(116.362337,39.942597),new BMap.Point(116.362307,39.943287),new BMap.Point(116.362277,39.943637),new BMap.Point(116.362218,39.944746),new BMap.Point(116.362219,39.946046),new BMap.Point(116.362219,39.946196),new BMap.Point(116.362219,39.946226),new BMap.Point(116.362209,39.946276),new BMap.Point(116.362209,39.946326),new BMap.Point(116.362199,39.946436),new BMap.Point(116.36218,39.946876),new BMap.Point(116.36213,39.947595),new BMap.Point(116.36227,39.948167),new BMap.Point(116.36235,39.948339),new BMap.Point(116.362509,39.948611),new BMap.Point(116.362738,39.948914),new BMap.Point(116.362928,39.949197),new BMap.Point(116.363167,39.94943),new BMap.Point(116.363416,39.949604),new BMap.Point(116.363913,39.949851),new BMap.Point(116.36469,39.950052),new BMap.Point(116.365595,39.950366),new BMap.Point(116.365794,39.950429),new BMap.Point(116.366093,39.950524),new BMap.Point(116.366242,39.950556),new BMap.Point(116.367266,39.950863),new BMap.Point(116.368162,39.951127),new BMap.Point(116.371174,39.952029),new BMap.Point(116.371324,39.952072),new BMap.Point(116.372029,39.952315),new BMap.Point(116.372417,39.952482),new BMap.Point(116.37365,39.953024),new BMap.Point(116.374435,39.953378),new BMap.Point(116.374833,39.953536),new BMap.Point(116.374962,39.953598),new BMap.Point(116.375588,39.95386),new BMap.Point(116.375585,39.95386),new BMap.Point(116.375903,39.953895),new BMap.Point(116.376171,39.95396),new BMap.Point(116.376399,39.954035),new BMap.Point(116.376648,39.954099),new BMap.Point(116.376727,39.954131),new BMap.Point(116.377026,39.954216),new BMap.Point(116.377085,39.954237),new BMap.Point(116.377354,39.954312),new BMap.Point(116.377642,39.954358),new BMap.Point(116.377821,39.954391),new BMap.Point(116.378198,39.954458),new BMap.Point(116.378377,39.954491),new BMap.Point(116.378536,39.954504),new BMap.Point(116.378586,39.954505),new BMap.Point(116.378715,39.954517),new BMap.Point(116.378924,39.954531),new BMap.Point(116.379311,39.954558),new BMap.Point(116.379848,39.954598),new BMap.Point(116.379898,39.954599),new BMap.Point(116.380037,39.954611),new BMap.Point(116.380723,39.954664),new BMap.Point(116.381458,39.954697),new BMap.Point(116.381736,39.954712),new BMap.Point(116.382432,39.954744),new BMap.Point(116.38273,39.954759),new BMap.Point(116.38279,39.95476),new BMap.Point(116.383098,39.954795),new BMap.Point(116.383456,39.954882),new BMap.Point(116.383536,39.954903),new BMap.Point(116.383576,39.954914),new BMap.Point(116.383655,39.954935),new BMap.Point(116.383695,39.954946),new BMap.Point(116.383795,39.954987),new BMap.Point(116.383854,39.955019),new BMap.Point(116.383884,39.955029),new BMap.Point(116.383954,39.95507),new BMap.Point(116.384013,39.955121),new BMap.Point(116.384063,39.955162),new BMap.Point(116.384093,39.955183),new BMap.Point(116.384153,39.955244),new BMap.Point(116.384212,39.955315),new BMap.Point(116.384242,39.955345),new BMap.Point(116.384382,39.955518),new BMap.Point(116.384441,39.955609),new BMap.Point(116.384501,39.95568),new BMap.Point(116.384581,39.955811),new BMap.Point(116.38468,39.955953),new BMap.Point(116.384849,39.956206),new BMap.Point(116.384919,39.956317),new BMap.Point(116.385059,39.956529),new BMap.Point(116.385079,39.95657),new BMap.Point(116.385347,39.956974),new BMap.Point(116.385527,39.957267),new BMap.Point(116.385576,39.957358),new BMap.Point(116.385626,39.957459),new BMap.Point(116.385676,39.95757),new BMap.Point(116.385716,39.95768),new BMap.Point(116.385776,39.957841),new BMap.Point(116.385806,39.958002),new BMap.Point(116.385836,39.958162),new BMap.Point(116.385846,39.958293),new BMap.Point(116.385846,39.958473),new BMap.Point(116.385856,39.958623),new BMap.Point(116.385856,39.958623),new BMap.Point(116.385897,39.960014),new BMap.Point(116.385898,39.960984),new BMap.Point(116.385908,39.961295),new BMap.Point(116.385929,39.961865),new BMap.Point(116.385909,39.962295),new BMap.Point(116.38588,39.963275),new BMap.Point(116.385831,39.963644),new BMap.Point(116.385782,39.964123),new BMap.Point(116.385782,39.964143),new BMap.Point(116.385842,39.964715),new BMap.Point(116.385903,39.965356),new BMap.Point(116.385983,39.966067),new BMap.Point(116.386043,39.966538),new BMap.Point(116.386053,39.966629),new BMap.Point(116.386133,39.96726),new BMap.Point(116.386414,39.969935),new BMap.Point(116.386474,39.970407),new BMap.Point(116.386685,39.9718),new BMap.Point(116.386805,39.972673),new BMap.Point(116.386935,39.973505),new BMap.Point(116.386985,39.973796),new BMap.Point(116.386984,39.973796),new BMap.Point(116.387035,39.974166),new BMap.Point(116.387055,39.974317),new BMap.Point(116.387075,39.974427),new BMap.Point(116.387095,39.974608),new BMap.Point(116.387175,39.975129),new BMap.Point(116.387185,39.975199),new BMap.Point(116.387195,39.975309),new BMap.Point(116.387285,39.975931),new BMap.Point(116.387385,39.976803),new BMap.Point(116.387626,39.978957),new BMap.Point(116.387646,39.979127),new BMap.Point(116.387656,39.979228),new BMap.Point(116.387736,39.979829),new BMap.Point(116.387866,39.981111),new BMap.Point(116.387926,39.981592),new BMap.Point(116.388026,39.982294),new BMap.Point(116.388016,39.982684),new BMap.Point(116.388007,39.982864),new BMap.Point(116.387997,39.982953),new BMap.Point(116.387997,39.983003),new BMap.Point(116.387997,39.983054),new BMap.Point(116.387987,39.983333),new BMap.Point(116.387918,39.983782),new BMap.Point(116.387819,39.984381),new BMap.Point(116.3877,39.984779),new BMap.Point(116.386975,39.987338),new BMap.Point(116.386806,39.987906),new BMap.Point(116.386776,39.988015),new BMap.Point(116.386727,39.988195),new BMap.Point(116.386518,39.988971),new BMap.Point(116.386379,39.989529),new BMap.Point(116.386221,39.990087),new BMap.Point(116.386012,39.990823),new BMap.Point(116.385943,39.991072),new BMap.Point(116.385724,39.991819),new BMap.Point(116.385376,39.992993),new BMap.Point(116.385347,39.993123),new BMap.Point(116.385237,39.993471),new BMap.Point(116.385208,39.993591),new BMap.Point(116.385168,39.99374),new BMap.Point(116.385128,39.993889),new BMap.Point(116.385109,39.993939),new BMap.Point(116.385079,39.994048),new BMap.Point(116.384622,39.995631),new BMap.Point(116.384552,39.99591),new BMap.Point(116.384254,39.996995),new BMap.Point(116.384244,39.997034),new BMap.Point(116.383936,39.997829),new BMap.Point(116.383906,39.997919),new BMap.Point(116.383687,39.998425),new BMap.Point(116.383469,39.998841),new BMap.Point(116.38327,39.999118),new BMap.Point(116.382982,39.999513),new BMap.Point(116.382534,40.000135),new BMap.Point(116.382455,40.000253),new BMap.Point(116.382157,40.000658),new BMap.Point(116.382067,40.000777),new BMap.Point(116.381491,40.001506),new BMap.Point(116.381023,40.002088),new BMap.Point(116.380516,40.002739),new BMap.Point(116.380188,40.003163),new BMap.Point(116.379612,40.003902),new BMap.Point(116.379234,40.004385),new BMap.Point(116.378578,40.005213),new BMap.Point(116.377942,40.006032),new BMap.Point(116.377524,40.006564),new BMap.Point(116.376937,40.007333),new BMap.Point(116.376848,40.007431),new BMap.Point(116.376789,40.00752),new BMap.Point(116.376749,40.007559),new BMap.Point(116.376739,40.007589),new BMap.Point(116.376431,40.007983),new BMap.Point(116.376043,40.008486),new BMap.Point(116.374452,40.010616),new BMap.Point(116.373895,40.011406),new BMap.Point(116.373606,40.011791),new BMap.Point(116.372303,40.013577),new BMap.Point(116.371706,40.014386),new BMap.Point(116.371617,40.014514),new BMap.Point(116.37106,40.015244),new BMap.Point(116.37097,40.015373),new BMap.Point(116.370542,40.015935),new BMap.Point(116.369577,40.017208),new BMap.Point(116.369259,40.017652),new BMap.Point(116.368711,40.018443),new BMap.Point(116.368303,40.018946),new BMap.Point(116.367557,40.019883),new BMap.Point(116.36687,40.020752),new BMap.Point(116.366183,40.02162),new BMap.Point(116.364589,40.023695),new BMap.Point(116.363912,40.024585),new BMap.Point(116.363334,40.025317),new BMap.Point(116.362975,40.025762),new BMap.Point(116.362816,40.025959),new BMap.Point(116.362228,40.026711),new BMap.Point(116.361869,40.027156),new BMap.Point(116.36164,40.027463),new BMap.Point(116.361421,40.02776),new BMap.Point(116.361401,40.02779),new BMap.Point(116.361311,40.027899),new BMap.Point(116.361304,40.027899),new BMap.Point(116.361274,40.027948),new BMap.Point(116.361175,40.028107),new BMap.Point(116.361085,40.028236),new BMap.Point(116.360995,40.028385),new BMap.Point(116.360945,40.028474),new BMap.Point(116.360916,40.028524),new BMap.Point(116.360806,40.028712),new BMap.Point(116.360706,40.028881),new BMap.Point(116.360677,40.028941),new BMap.Point(116.360667,40.028961),new BMap.Point(116.360637,40.02903),new BMap.Point(116.360597,40.02912),new BMap.Point(116.360557,40.029199),new BMap.Point(116.360547,40.029219),new BMap.Point(116.360538,40.029259),new BMap.Point(116.360518,40.029299),new BMap.Point(116.360508,40.029338),new BMap.Point(116.360508,40.029388),new BMap.Point(116.360508,40.029438),new BMap.Point(116.360508,40.029488),new BMap.Point(116.360518,40.029539),new BMap.Point(116.360528,40.029589),new BMap.Point(116.360547,40.029639),new BMap.Point(116.360577,40.029679),new BMap.Point(116.360607,40.02972),new BMap.Point(116.360647,40.02976),new BMap.Point(116.360687,40.029791),new BMap.Point(116.360726,40.029821),new BMap.Point(116.360766,40.029841),new BMap.Point(116.360806,40.029862),new BMap.Point(116.360846,40.029872),new BMap.Point(116.360896,40.029883),new BMap.Point(116.360945,40.029894),new BMap.Point(116.360995,40.029904),new BMap.Point(116.361055,40.029905),new BMap.Point(116.361115,40.029906),new BMap.Point(116.361174,40.029907),new BMap.Point(116.361234,40.029887),new BMap.Point(116.361294,40.029878),new BMap.Point(116.361354,40.029859),new BMap.Point(116.361393,40.02984),new BMap.Point(116.361453,40.029811),new BMap.Point(116.361493,40.029781),new BMap.Point(116.361533,40.029742),new BMap.Point(116.361573,40.029692),new BMap.Point(116.361603,40.029643),new BMap.Point(116.361633,40.029593),new BMap.Point(116.361643,40.029544),new BMap.Point(116.361643,40.029504),new BMap.Point(116.361643,40.029464),new BMap.Point(116.361633,40.029424),new BMap.Point(116.361623,40.029374),new BMap.Point(116.361603,40.029323),new BMap.Point(116.361574,40.029273),new BMap.Point(116.361544,40.029233),new BMap.Point(116.361504,40.029202),new BMap.Point(116.361474,40.029172),new BMap.Point(116.361425,40.029141),new BMap.Point(116.361385,40.029101),new BMap.Point(116.361325,40.02906),new BMap.Point(116.361266,40.02904),new BMap.Point(116.361226,40.029009),new BMap.Point(116.361186,40.028989),new BMap.Point(116.361147,40.028968),new BMap.Point(116.361107,40.028948),new BMap.Point(116.361104,40.028946),new BMap.Point(116.360765,40.028942),new BMap.Point(116.360676,40.028941),new BMap.Point(116.360477,40.028939),new BMap.Point(116.360228,40.028936),new BMap.Point(116.359521,40.028937),new BMap.Point(116.359292,40.028945),new BMap.Point(116.358943,40.028951),new BMap.Point(116.358515,40.028946),new BMap.Point(116.358495,40.028946),new BMap.Point(116.357638,40.028947),new BMap.Point(116.357499,40.028946),new BMap.Point(116.357011,40.028931),new BMap.Point(116.356801,40.028929),new BMap.Point(116.356792,40.028929),new BMap.Point(116.356632,40.028928),new BMap.Point(116.355356,40.028937),new BMap.Point(116.355037,40.028934),new BMap.Point(116.354628,40.028941),new BMap.Point(116.354219,40.028938),new BMap.Point(116.353571,40.028934),new BMap.Point(116.353062,40.028941),new BMap.Point(116.352872,40.02894),new BMap.Point(116.351874,40.028934),new BMap.Point(116.350277,40.028937),new BMap.Point(116.347059,40.028961),new BMap.Point(116.346519,40.028971),new BMap.Point(116.343748,40.028925),new BMap.Point(116.343718,40.028925),new BMap.Point(116.343608,40.028925),new BMap.Point(116.342968,40.028888),new BMap.Point(116.341516,40.028704),new BMap.Point(116.340915,40.028537),new BMap.Point(116.340184,40.028331),new BMap.Point(116.337588,40.02754),new BMap.Point(116.337585,40.027539),new BMap.Point(116.337244,40.027532),new BMap.Point(116.336974,40.027464),new BMap.Point(116.336522,40.027388),new BMap.Point(116.336201,40.027321),new BMap.Point(116.33576,40.027336),new BMap.Point(116.335309,40.02738),new BMap.Point(116.334907,40.027494),new BMap.Point(116.334445,40.027659),new BMap.Point(116.334405,40.027679),new BMap.Point(116.333823,40.027946),new BMap.Point(116.333311,40.028252),new BMap.Point(116.332839,40.028617),new BMap.Point(116.331713,40.029801),new BMap.Point(116.331711,40.0298),new BMap.Point(116.330726,40.031463),new BMap.Point(116.330585,40.031744),new BMap.Point(116.330071,40.032911),new BMap.Point(116.330021,40.033112),new BMap.Point(116.329437,40.035059),new BMap.Point(116.329245,40.035672),new BMap.Point(116.329165,40.035913),new BMap.Point(116.329084,40.036174),new BMap.Point(116.328984,40.036465),new BMap.Point(116.328943,40.036576),new BMap.Point(116.328802,40.037018),new BMap.Point(116.328209,40.038366),new BMap.Point(116.327716,40.039103),new BMap.Point(116.32685,40.040136),new BMap.Point(116.326659,40.040299),new BMap.Point(116.325231,40.041552),new BMap.Point(116.323168,40.043356),new BMap.Point(116.323047,40.043468),new BMap.Point(116.323017,40.043489),new BMap.Point(116.322937,40.04357),new BMap.Point(116.322806,40.043682),new BMap.Point(116.322756,40.043733),new BMap.Point(116.322715,40.043764),new BMap.Point(116.322243,40.044202),new BMap.Point(116.322233,40.044222),new BMap.Point(116.321719,40.044821),new BMap.Point(116.321578,40.044983),new BMap.Point(116.320773,40.046077),new BMap.Point(116.320451,40.046673),new BMap.Point(116.319867,40.047743),new BMap.Point(116.319122,40.049116),new BMap.Point(116.31878,40.049552),new BMap.Point(116.317048,40.051744),new BMap.Point(116.316032,40.053022),new BMap.Point(116.315639,40.053519),new BMap.Point(116.313536,40.056347),new BMap.Point(116.313365,40.05658),new BMap.Point(116.313265,40.056712),new BMap.Point(116.313215,40.056783),new BMap.Point(116.313064,40.056985),new BMap.Point(116.31242,40.058037),new BMap.Point(116.311555,40.059442),new BMap.Point(116.311535,40.059473),new BMap.Point(116.311123,40.06015),new BMap.Point(116.311118,40.06015),new BMap.Point(116.311119,40.06048),new BMap.Point(116.310968,40.060772),new BMap.Point(116.310385,40.061943),new BMap.Point(116.310334,40.062044),new BMap.Point(116.310103,40.062488),new BMap.Point(116.310063,40.062568),new BMap.Point(116.310033,40.062629),new BMap.Point(116.309309,40.064021),new BMap.Point(116.308897,40.064488),new BMap.Point(116.308555,40.064634),new BMap.Point(116.308375,40.064707),new BMap.Point(116.308244,40.064759),new BMap.Point(116.307963,40.064834),new BMap.Point(116.30756,40.064791),new BMap.Point(116.306866,40.064622),new BMap.Point(116.304856,40.064163),new BMap.Point(116.303499,40.063863),new BMap.Point(116.302966,40.06374),new BMap.Point(116.302856,40.063682),new BMap.Point(116.302854,40.063681),new BMap.Point(116.302995,40.063199),new BMap.Point(116.303979,40.060475),new BMap.Point(116.303989,40.060395),new BMap.Point(116.304079,40.060064),new BMap.Point(116.30432,40.05918),new BMap.Point(116.304501,40.058558),new BMap.Point(116.304521,40.058518),new BMap.Point(116.304662,40.058015),new BMap.Point(116.304933,40.057151),new BMap.Point(116.305194,40.056358),new BMap.Point(116.305235,40.056207),new BMap.Point(116.305325,40.055946),new BMap.Point(116.305566,40.055212),new BMap.Point(116.305647,40.054951),new BMap.Point(116.305747,40.05494),new BMap.Point(116.305717,40.05502),new BMap.Point(116.305717,40.055019),new BMap.Point(116.305647,40.05523),new BMap.Point(116.305416,40.055964),new BMap.Point(116.305295,40.056375),new BMap.Point(116.305034,40.057169),new BMap.Point(116.304773,40.058033),new BMap.Point(116.304772,40.058033),new BMap.Point(116.306491,40.058347),new BMap.Point(116.306492,40.058347),new BMap.Point(116.306914,40.05729),new BMap.Point(116.306954,40.05717),new BMap.Point(116.306954,40.05717),new BMap.Point(116.306974,40.057169)];
//		map.setViewport(arrPoint);	//开启视野，使整个路线都显示在视野地图中
		if(trace == "true"){	//特定车辆追踪，开启边走边画
			//封装所有折线对象map，key：车牌号；valuer：折线对象
			var traceMap = {};	
			var ply = new BMap.Polyline(arrPoint, {strokeColor: '#111'});
			map.addOverlay(ply);
			
			traceMap[vehicleNo] = ply;
			arrTrace.push(traceMap);
		}
		
		if(binPoint != null && binPoint != ""){	//特定车辆追踪，添加起点图标
//			alert("起点");
			var markerBin=new BMap.Marker(binPoint,{
				icon  : new BMap.Icon($("#basePath").val()+"mapJs/image/binPoint.png", new BMap.Size(35,35),{anchor : new BMap.Size(27, 10)})
			});
			map.addOverlay(markerBin);
		}
		
		lushu = new BMapLib.LuShu(map,arrPoint,{
			defaultContent:vehicleNo,
//			autoView:true,	//是否开启自动视野调整，如果开启那么路书在运动过程中会根据视野自动调整
			icon  : new BMap.Icon('http://developer.baidu.com/map/jsdemo/img/car.png', new BMap.Size(52,26),{anchor : new BMap.Size(27, 13)}),
			speed : speeds,	//运行速度
			enableRotation:true,//是否设置marker随着道路的走向进行旋转
			landmarkPois:[{lng:116.306954,lat:40.05718,html:'加油站',pauseTime:2}]
		}); 
			         
//		marker.addEventListener("click",function(){
//			marker.enableMassClear();   //设置后可以隐藏改点的覆盖物
//			MyLuShu.setLabelStyle(warnStatus);
//			marker.hide();
//			lushu.start();
//		});
	},
	
	//聚集车辆
	globalCar: function(){
		var points = [];		//存放车辆实时经纬度
		var isGlobalExist = 0;	//聚集区域不存在提示用
	
		$.ajaxSetup({   
            async : false		//ajax同步
        }); 
		
		//清除所有区域
		for(var i=0;i<globalArea.length;i++){
			map.removeOverlay(globalArea[i]);
		}
		
		//1.获取所有车辆实时经纬度
		var url = $("#basePath").val()+"supervise/getCarPosition.action";
		$.post(url,function(data){
			var codeJson = eval(data);
			for (var i = 0; i < codeJson.length; i++) {
				var point = new BMap.Point(codeJson[i].longitude, codeJson[i].latitude);
				points.push(point);
			}
		});
		
		//2.获取所有聚集区域
		var url = $("#basePath").val()+"setAssemblePlace/findAssemblePlaceList.action";
		$.post(url,{isUse: 1},function(result){
			if(result != null && result.length > 0){
				for(var i=0;i<result.length;i++){
					var count = 0;		//每个聚集区域内车辆的累计数
					
					var jsonObj = result[i];
					var pointJson = jsonObj.map_sign;	//经纬度
					var jsonList=eval("("+pointJson+")");
					
					//3.循环遍历points，判断每个point是否在聚集区域内，是则累计count
					if(jsonObj.map_type==1){	//判断point是否在圆形区域内
						var getCircle = baiduMap.getCreateCircle(jsonList,jsonObj.rotundity_radius);
						for(var j=0;j<points.length;j++){
							if(baiduMap.ptInCircle(points[j],getCircle)){
				  				count++;
				  			}
						}
						
						//4.比较count与区域报警阈值，超过报警阈值则显示区域
						if(count >= jsonObj.car_alarm_val){
							isGlobalExist = 1;
							//重新定位地图到第一个聚集区域所在位置
							if(globalAreaEcho == 1){
//								map.centerAndZoom(new BMap.Point(jsonList[i].lng,jsonList[i].lat), 15);	
								globalAreaEcho++;
							}
							
							var circle = baiduMap.createCircle(jsonList, jsonObj.rotundity_radius);	//添加聚集区域到map
							globalArea[i]=circle;					//将所有区域封装成globalArea数组
							
							//5.点击区域，弹窗显示聚集区域参数
							baiduMap.clickArea(jsonObj.id, circle, jsonList, count);
						}
					}
					else if(jsonObj.map_type==2){	//判断point是否在多边形区域内
						var getPly = baiduMap.getCreatePly(jsonList);
						for(var j=0;j<points.length;j++){
							if(baiduMap.ptInPolygon(points[j],getPly)){
				  				count++;
				  			}
						}
						
						//4.比较count与区域报警阈值，超过报警阈值则显示区域
						if(count >= jsonObj.car_alarm_val){
							isGlobalExist = 1;
							//重新定位地图到第一个聚集区域所在位置
							if(globalAreaEcho == 1){
//								map.centerAndZoom(new BMap.Point(jsonList[i].lng,jsonList[i].lat), 15);	
								globalAreaEcho++;
							}
							
							var ply = baiduMap.createPly(jsonList);	//添加聚集区域到map
							globalArea[i]=ply;						//将所有区域封装成globalArea数组
							
							//5.点击区域，弹窗显示聚集区域参数
							baiduMap.clickArea(jsonObj.id, ply, jsonList, count);
						}
					}
				}
			}
		});
		
		timeGlobalID = setTimeout('baiduMap.globalCar()',2100); //2秒刷新
		
//		if(isGlobalExist == 0) {
//			alert("车辆行驶一切正常，暂无聚集车辆！");
//		}
		
		$.ajaxSetup({   
            async : true		//ajax异步
        });
	},
	clickArea : function(id, area, jsonList, count){
		area.addEventListener("click", function() {
			baiduMap.initInfoWindow($("#basePath").val()+"setAssemblePlace/selectDataTotal.action?id="+id+"&count="+count, "聚集地点参数");
			map.openInfoWindow(infoWindow, new BMap.Point(jsonList[0].lng,jsonList[0].lat));
		});
	},
	
	//违规车辆
	violationCar: function(){
		$.ajax({
			type: "POST",
			url: $("#basePath").val()+'supervise/illegalCarList.action',
			dataType:'json',
			cache: false,
			success: function(data){
				var codeJson = eval(data);
				for (var i = 0; i < codeJson.length; i++) {
					var illegalType;	//违规类型
					if(codeJson[i].illegal_type==0){
						illegalType = "禁止驶入";
                	}else if(codeJson[i].illegal_type==1){
                		illegalType = "禁止驶出";
                	}else{
                		illegalType = "人车不对应";
                	}
					
					var point = new BMap.Point(codeJson[i].longitude, codeJson[i].latitude);
					var label = new BMap.Label(codeJson[i].vehicle_no,{offset:new BMap.Size(20,-10)});
					label.setStyle({
						position: "relative",		//相对定位
						display: "inline-table",	//规定元素应该生成的框的类型
						borderRadius: "5px",		//设置矩形边角弧度
						color : "white", 
						fontSize : "12px", 
						backgroundColor :"blue",
						fontWeight :"bold",
					    borderColor:"white"
					});
					if(codeJson[i].warnStatus == '1'){//车辆预警状态
						label.setStyle({backgroundColor :"red"});
					}
					
					var info = "<h4>车牌："+codeJson[i].vehicle_no+"</h4>" +
							"违规类型："+illegalType+"<br/>" +
							"说明：<font color='red'><"+codeJson[i].remark+"></font>";
					
					var infoWindowViola = new BMap.InfoWindow(info);
					
					baiduMap.addMarker(point,label,infoWindowViola,illegalType);	//鼠标悬浮事件
				}
			}
		});
		
		//回显所有禁止驶入区域
		var url = $("#basePath").val()+"outinArea/findOutinAreaList.action";
		$.post(url,{isUse: 1},function(result){
			if(result != null && result.length > 0){
				for(var i=0;i<result.length;i++){
					var jsonObj = result[i];
					
					var pointJson = jsonObj.map_sign;	//经纬度
					var jsonList=eval("("+pointJson+")");
					
					var infoWindowViola = new BMap.InfoWindow("禁止驶入区域："+jsonObj.area_name);	//区域弹窗内容
					
					if(jsonObj.map_type==1){			//圆形回显
						var circle = baiduMap.createCircle(jsonList, jsonObj.rotundity_radius);
						baiduMap.clickInArea(circle, jsonList, infoWindowViola);	//鼠标点击事件
					}
					if(jsonObj.map_type==2){			//多边形回显
						var ply = baiduMap.createPly(jsonList);
						baiduMap.clickInArea(ply, jsonList, infoWindowViola);		//鼠标点击事件
					}
				}
			}
		});
		
		baiduMap.clearAll();					//清除所有覆盖物
		timeIllID = setTimeout('baiduMap.violationCar()',5000); //5秒刷新
	},
	addMarker: function(point,label,infoWindowViola,illegalType){
		var marker = new BMap.Marker(point,{icon: myIcon,title:illegalType});
		marker.addEventListener("onmouseover", function(){ 
			this.openInfoWindow(infoWindowViola);
		});
		map.addOverlay(marker);
		marker.setLabel(label);
	},
	clickInArea : function(area, jsonList, infoWindowViola){
		area.addEventListener("click", function() {
			map.openInfoWindow(infoWindowViola, new BMap.Point(jsonList[0].lng,jsonList[0].lat));
		});
	},
	
	//特定车辆追踪
	specificCar: function(){
		 //layer弹窗
		 layer.open({
			type: 2,							//设置弹窗类型: 0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
			title: ['<b>特定车辆追踪</b>', true],	//标题
			area: ['500px', '500px'], 			//窗口大小
			skin: 'layui-layer-lan', 			//设置窗口样式
			shade: false,						//设置父窗口是否可操作，false为可操作
//			closeBtn: 0,
			anim:3, 							//0-6的动画形式，-1不开启
			maxmin: true,
			content: [$("#basePath").val()+'supervise/specificCar.action'] //iframe的url，no代表不显示滚动条
	    });
	},
	//特定车辆添加追踪轨迹
	toMapAddTrace : function(){
		$.ajax({
			type: "POST",
			url: $("#basePath").val()+'supervise/toMapAddTrace.action',
			dataType:'json',
			cache: false,
			success: function(data){
				var codeJson = eval(data);
				for (var i = 0; i < codeJson.length; i++) {
					var point = new BMap.Point(codeJson[i].longitude, codeJson[i].latitude);
					var label = new BMap.Label(codeJson[i].vehicle_no,{offset:new BMap.Size(20,-10)});
					label.setStyle({
						position: "relative",		//相对定位
						display: "inline-table",	//规定元素应该生成的框的类型
						borderRadius: "5px",		//设置矩形边角弧度
						color : "white", 
						fontSize : "12px", 
						backgroundColor :"blue",
						fontWeight :"bold",
					    borderColor:"white"
					});
					if(codeJson[i].warnStatus == '1'){//车辆预警状态
						label.setStyle({backgroundColor :"red"});
					}
					
					//封装车辆平滑移动所需参数：vehicleNo，arrPoint，marker
					var vehicleNo = codeJson[i].vehicle_no;	//车牌号
					var arrPoint = new Array();		//存放两个点：上一个点，当前点
					var binPoint;	//追踪起点
					if(carDataTraceMap[vehicleNo] == null || carDataTraceMap[vehicleNo]  == ""){	//说明第一次执行循环，arrPoint数组中存放两个点都为起始点
						arrPoint[0] = point;
						binPoint = point;
					}else{
						arrPoint[0] = carDataTraceMap[vehicleNo];
					}
					arrPoint[1] = point;
					carDataTraceMap[vehicleNo] = point;		//封装map数组carDataMap，key：当前车牌号；value：当前点位
					
					var marker = new BMap.Marker(point,{icon:new BMap.Icon('http://developer.baidu.com/map/jsdemo/img/car.png', new BMap.Size(52,26),{anchor : new BMap.Size(27, 13)}), title:data.comname});
					marker.setLabel(label);	//将label标签绑定到marker标签上
					map.addOverlay(marker);
					
					//车辆平滑移动
					baiduMap.carMove(vehicleNo, arrPoint, marker, codeJson[i].warnStatus, "true", binPoint);
//					baiduMap.Move(arrPoint[0], arrPoint[1], baiduMap.effect, baiduMap.setRotation);
//					marker.hide();
					
					var info = "<h4>车牌号："+codeJson[i].vehicle_no+"</h4>网约车公司："+codeJson[i].comname;
					if("" == codeJson[i].order_id || null == codeJson[i].order_id){
						info += "<br>接单状态：空闲";
					}else{
						info += "<br>接单状态：已接单<br>订单号："+codeJson[i].order_id;
					}
					var infoWindowTrace = new BMap.InfoWindow(info);
					baiduMap.addMarkerTrace(infoWindowTrace,marker);//弹窗
					
					carMarkerTrace[i]=marker;			//将所有车辆封装成carMarkerTrace数组
				}
			}
		});
		
		//清除所有车辆
		for(var i=0;i<carMarkerTrace.length;i++){
			map.removeOverlay(carMarkerTrace[i]);
		}
//		map.clearOverlays();
//		baiduMap.clearAll();
		
		timeTraceID = setTimeout('baiduMap.toMapAddTrace()',1000); //1秒刷新
	},
    addMarkerTrace : function(infoWindowTrace,marker){
		marker.addEventListener("onmouseover", function(){         
		    this.openInfoWindow(infoWindowTrace);
		    //图片加载完毕重绘infowindow
		});
	},
	//特定车辆移除追踪轨迹
	toMapRemTrace : function(operatingids){
		for(var j = 0; j < operatingids.length; j++){
			for(var i = 0; i < arrTrace.length; i++){
				for(var vehicleNoKey in arrTrace[i]){
					if(vehicleNoKey == operatingids[j]){
						map.removeOverlay(arrTrace[i][vehicleNoKey]);
					}
				}
			}
		}
	},
	
	//历史轨迹回放
	hisTrajectory: function(){
		 //layer弹窗
		 layer.open({
			type: 2,							//设置弹窗类型: 0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
			title: ['<b>历史轨迹回放</b>', true],	//标题
			area: ['430px', '350px'], 			//窗口大小
			skin: 'layui-layer-lan', 			//设置窗口样式
			shade: false,						//设置父窗口是否可操作，false为可操作
//			shadeClose: true,					//如果shade值不是false，可设置此属性点击外部区域是否关闭弹窗
//			closeBtn: 0, 						//不显示关闭按钮
//			shade: 0, 							//遮罩透明度
//			offset: 'r', 						//弹出位置
			anim:3, 							//0-6的动画形式，-1不开启
//			time: 2000, 						//2秒后自动关闭
			maxmin: true, 						//开启最大化最小化按钮
			content: [$("#basePath").val()+'supervise/hisTrajectory.action', 'no'] //iframe的url，no代表不显示滚动条
	    });
	},
	//创建历史轨迹曲线
	createTra: function(data){
		var marker;
		var lushu;
		var points = [];			// 添加折线运动轨迹
		var vehicleNo;
		var speeds = 2000;			// 运行速度
		
		$.each(data,function(i,d){
			vehicleNo = d.vehicleNo;			// 车牌号
			var longitude = d.lng;				// 经度
			var latitude = d.lat;				// 纬度
		    var point = new BMap.Point(longitude, latitude);// 填充标注点
			points.push(point);
		});
		
		map.addOverlay(new BMap.Polyline(points, {strokeColor: '#111'}));
		map.setViewport(points);	//开始视野，使整个路线都显示在视野地图中
		marker=new BMap.Marker(points[0],{
			icon  : new BMap.Icon('http://developer.baidu.com/map/jsdemo/img/car.png', new BMap.Size(52,26),{anchor : new BMap.Size(27, 13)})
		});
		map.addOverlay(marker);
		
		//起点图标
		var markerBin=new BMap.Marker(points[0],{
			icon  : new BMap.Icon($("#basePath").val()+"mapJs/image/binPoint.png", new BMap.Size(35,35),{anchor : new BMap.Size(27, 10)})
		});
		//终点图标
		var markerEnd=new BMap.Marker(points[points.length-1],{
			icon  : new BMap.Icon($("#basePath").val()+"mapJs/image/endPoint.png", new BMap.Size(35,35),{anchor : new BMap.Size(27, 10)})
		});
		map.addOverlay(markerBin);
		map.addOverlay(markerEnd);
		
		lushu = new BMapLib.LuShu(map,points,{
//			defaultContent:vehicleNo,
			autoView:true,	//是否开启自动视野调整，如果开启那么路书在运动过程中会根据视野自动调整
			icon  : new BMap.Icon('http://developer.baidu.com/map/jsdemo/img/car.png', new BMap.Size(52,26),{anchor : new BMap.Size(27, 13)}),
			speed: speeds,	//运行速度
			enableRotation:true,//是否设置marker随着道路的走向进行旋转
			landmarkPois:[{lng:116.306954,lat:40.05718,html:'加油站',pauseTime:2}]
		}); 
			         
		marker.addEventListener("click",function(){
//			marker.enableMassClear();   //设置后可以隐藏该点的覆盖物
			marker.hide();
			lushu.start();
		});
	},
	//开始
	run : function(){
		marker.hide();
		lushu.start();
	},
	//停止
	stop : function(){
		lushu.stop();
	},
	//暂停
	pause : function(){
		lushu.pause();
	},
	
	//聚集地点设置
	assemblePlaceSet: function(){
		 //layer弹窗
		 layer.open({
			type: 2,
			title: ['<b>聚集地点设置</b>', true],
			area: ['660px', '500px'], 
			skin: 'layui-layer-lan', 
			shade: false,
			shade: 0, 
			maxmin: true, 
			anim:3,
			content: [$("#basePath").val()+'setAssemblePlace/openAssemblePlaceTotal.action']
	    });
	},
	
	//新增聚集地点
	toMapAdd: function(){
		//1.关闭列表窗口
		layer.closeAll('iframe');
		
		//2.显示绘图工具条
		baiduMap.addDrawTool();	
		
		//3.清除所有覆盖物
		baiduMap.clearAll();
		
		//4.回显所有图形
		var url = $("#basePath").val()+"setAssemblePlace/findAssemblePlaceList.action";
		$.post(url,function(result){
			if(result != null && result.length > 0){
				for(var i=0;i<result.length;i++){
					var jsonObj = result[i];
					
					var pointJson=jsonObj.map_sign;	//经纬度
					var jsonList=eval("("+pointJson+")");
					
					var isUse="";
					if(jsonObj.is_use == 1){isUse = "启用";}else if(jsonObj.is_use == 0){isUse = "停用";}
					var info = "<h4>聚集地："+jsonObj.place_name+"</h4>" +"状态："+isUse;
					var infoWindowViola = new BMap.InfoWindow(info);
					
					if(jsonObj.map_type==1){	//圆形回显
						var circle = baiduMap.createCircle(jsonList, jsonObj.rotundity_radius);
						baiduMap.clickAreaInfo(circle, jsonList, infoWindowViola);	//点击弹窗
					}
					if(jsonObj.map_type==2){	//多边形回显
						var ply = baiduMap.createPly(jsonList);
						baiduMap.clickAreaInfo(ply, jsonList, infoWindowViola);	//点击弹窗
					}
				}
			}
		});
		
		//5.绘制完成，弹窗设置聚集参数
		drawingManager.addEventListener('overlaycomplete', baiduMap.overlaycomplete);
	},
	clickAreaInfo : function(area, jsonList, infoWindowViola){
		area.addEventListener("click", function() {
			map.openInfoWindow(infoWindowViola, new BMap.Point(jsonList[0].lng,jsonList[0].lat));
		});
	},
	
	//修改聚集地点
	toMapUpdate : function(id){
		//1.关闭列表窗口
		layer.closeAll('iframe');
		
		//2.清除所有覆盖物
		baiduMap.clearAll();
		
		//3.回显要修改的图形
		var url = $("#basePath").val()+"setAssemblePlace/mapSetUpdateTotal.action";
		$.post(url, {id: id} ,function(result){
			if(result != null){
				if((result.rotundity_radius==null || result.rotundity_radius=="") || (result.map_type==null ||result.map_type=="") || (result.map_sign==null || result.map_sign=="")){
					alert("此聚集区域存在异常，可删除后重新增加！");
					baiduMap.assemblePlaceSet();			//重新加载聚集地点列表
				}
				var rat = result.rotundity_radius;	//半径
				var type = result.map_type;			//区域类型
				var mapSignUp = result.map_sign;	//经纬度
				var jsonList=eval("("+mapSignUp+")");
				
				//地图重新定位到要修改聚集区域所在位置
				var poi = new BMap.Point(jsonList[0].lng,jsonList[0].lat);
				map.centerAndZoom(poi, 15);
				
				if(type==1){		//修改图形为圆形
					var circle = baiduMap.createCircle(jsonList, rat);
					
					//点击弹出圆形修改窗口
					circle.addEventListener("click", function() {
						baiduMap.initInfoWindow($("#basePath").val()+"setAssemblePlace/assemblePlaceUpdateTotal.action", "聚集地点修改");
						map.openInfoWindow(infoWindow, new BMap.Point(jsonList[0].lng,jsonList[0].lat));
					});
				}
				else if(type==2){		//修改图形为多边形
					var ply = baiduMap.createPly(jsonList);
					
					//点击弹出多边形修改窗口
					ply.addEventListener("click", function() {
						baiduMap.initInfoWindow($("#basePath").val()+"setAssemblePlace/assemblePlaceUpdateTotal.action", "聚集地点修改");
						map.openInfoWindow(infoWindow, new BMap.Point(jsonList[0].lng,jsonList[0].lat));
					});
				}
			}
			else {
				alert("此聚集区域存在异常，可删除后重新增加！")
			}
		});
	},
	
	//聚集地点设置之后操作
	toMapSet: function(add){
		if(add == "add"){
			$(".BMapLib_Drawing_panel").hide();	//隐藏绘图工具条
		}
		
		baiduMap.clearAll();					//清除所有覆盖物
		baiduMap.assemblePlaceSet();			//重新加载聚集地点列表
	},
	
	//网约车数据统计
	netAppointCarList: function(){
		//layer弹窗
		 layer.open({
			type: 2,
			title: ['<b>网约车数据统计</b>', true],
			area: ['600px', '500px'],
			skin: 'layui-layer-lan',
			shade: false,
			anim:3,
			maxmin: true,
			content: [$("#basePath").val()+'totalMap/openCount.action', 'no']
	    });
	},
	
	//报警信息
	alertMessage: function(){
		 //layer弹窗
		 layer.open({
			type: 2,
			title: ['<b>报警信息</b>', true],
			area: ['700px', '500px'],
			skin: 'layui-layer-lan',
			shade: false,
			anim:3,
			maxmin: true,
			content: $("#basePath").val()+"supervise/alertMessage.action"
	    });
	},
	//报警信息：聚集区域数据获取
	getAreaIds : function(){
		var areaIds = [];		//存放所有聚集区域的id集合，以及每个区域内当前车辆个数
		var points = [];		//存放车辆实时经纬度
	
		//1.获取所有车辆实时经纬度
		var url = $("#basePath").val()+"supervise/getCarPosition.action";
		$.ajaxSetup({   
            async : false		//ajax同步
        }); 
		$.post(url,function(data){
			var codeJson = eval(data);
			for (var i = 0; i < codeJson.length; i++) {
				var point = new BMap.Point(codeJson[i].longitude, codeJson[i].latitude);
				points.push(point);
			}
		});
		
		//2.获取所有聚集区域
		var url = $("#basePath").val()+"setAssemblePlace/findAssemblePlaceList.action";
		$.post(url,{isUse: 1},function(result){
			if(result != null && result.length > 0){
				for(var i=0;i<result.length;i++){
					var count = 0;		//每个聚集区域内车辆的累计数
					
					var jsonObj = result[i];
					var pointJson = jsonObj.map_sign;	//经纬度
					var jsonList=eval("("+pointJson+")");
					
					//3.循环遍历points，判断每个point是否在聚集区域内，是则累计count
					if(jsonObj.map_type==1){	//判断point是否在圆形区域内
						var circle = baiduMap.getCreateCircle(jsonList,jsonObj.rotundity_radius);
						for(var j=0;j<points.length;j++){
							if(baiduMap.ptInCircle(points[j],circle)){
				  				count++;
				  			}
						}
						
						//4.比较count与区域报警阈值，超过报警阈值则将区域id添加到areaIds数组
						if(count >= jsonObj.car_alarm_val){
							areaIds.push(jsonObj.id+":"+count);
						}
					}
					else if(jsonObj.map_type==2){	//判断point是否在多边形区域内
						var ply = baiduMap.getCreatePly(jsonList);
						for(var j=0;j<points.length;j++){
							if(baiduMap.ptInPolygon(points[j],ply)){
				  				count++;
				  			}
						}
						
						//4.比较count与区域报警阈值，超过报警阈值则将区域id添加到areaIds数组
						if(count >= jsonObj.car_alarm_val){
							areaIds.push(jsonObj.id+":"+count);
						}
					}
				}
			}
		});
		$.ajaxSetup({   
            async : true		//ajax异步
        }); 
		return areaIds;
	},
	
	//清除所有覆盖物
	clearAll : function() {
		var allOverlay = map.getOverlays();
		for ( var i = 0; i < allOverlay.length; i++) {
			map.removeOverlay(allOverlay[i]);
		}
	},
	
	//初始化信息窗口
	initInfoWindow : function(url,title) {
		var opts = {
			width : 350, // 信息窗口宽度
			height : 270, // 信息窗口高度
			title : "<b>"+title+"</b>", // 信息窗口标题
			panel : "panel",
			enableAutoPan : true
		};
		
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
		
//		alert(guiType+"--"+guiData+"--"+circleRat);
		
		//绘制完成自动弹出信息页面
		baiduMap.initInfoWindow($("#basePath").val()+"setAssemblePlace/assemblePlaceAddTotal.action?guiType="+guiType+"&guiData="+guiData+"&circleRat="+circleRat, "聚集地点设置");
		map.openInfoWindow(infoWindow, new BMap.Point(lng1, lat1));
		
		//点击区域弹出信息页面
		e.overlay.addEventListener("click", function() {
			baiduMap.initInfoWindow($("#basePath").val()+"setAssemblePlace/assemblePlaceAddTotal.action?guiType="+guiType+"&guiData="+guiData+"&circleRat="+circleRat, "聚集地点设置");
			map.openInfoWindow(infoWindow, new BMap.Point(lng1, lat1));
		});
		
		//清除覆盖物中的值
		guiType="";
		guiData="";
		circleRat="";
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
	//创建圆形，并显示到map地图
	createCircle: function(jsonList, rat){
		var point = new BMap.Point(jsonList[0].lng, jsonList[0].lat);
		var circle = new BMap.Circle(point,rat);
		map.addOverlay(circle);
		return circle;
	},
	//创建矩形，多边形，折线，并显示到map地图
	createPly: function(jsonList){
		var pts = [];
		for(var i=0;i<jsonList.length;i++){
			pts.push(new BMap.Point(jsonList[i].lng,jsonList[i].lat));
		}
		var ply = new BMap.Polygon(pts);
		map.addOverlay(ply);
		return ply;
	},
	//创建圆形，获取对象
	getCreateCircle: function(jsonList, rat){
		var point = new BMap.Point(jsonList[0].lng, jsonList[0].lat);
		var circle = new BMap.Circle(point,rat);
		return circle;
	},
	//创建矩形，多边形，折线，获取对象
	getCreatePly: function(jsonList){
		var pts = [];
		for(var i=0;i<jsonList.length;i++){
			pts.push(new BMap.Point(jsonList[i].lng,jsonList[i].lat));
		}
		var ply = new BMap.Polygon(pts);
		return ply;
	},
	
	//报警信息（报警车辆）：地图实时加载全部车辆
	getAlertCar : function(){
		clearTimeout(timeTraceID);				//停止特定车辆追踪定时器
		clearTimeout(timeIllID);				//停止违规车辆定时器
		clearTimeout(timeGlobalID);				//停止聚集车辆定时器
		
		if(isTimeStart != 0){					//定时器是停止状态，点击启动
			baiduMap.globalRunTrend();
			isTimeStart = 0;
		}
		
		baiduMap.clearAll();					//清除所有覆盖物
	},
	
	//报警信息（违规车辆）：将违规车辆在地图显示
	getViolationCar : function(){
		clearTimeout(timeID);					//停止全局态势定时器
		isTimeStart=1;
		clearTimeout(timeTraceID);				//停止特定车辆追踪定时器
		clearTimeout(timeGlobalID);				//停止聚集车辆定时器
		
		baiduMap.violationCar();
		
		baiduMap.clearAll();					//清除所有覆盖物
	},
	
	//报警信息（聚集车辆）：将聚集区域在地图显示
	getGlobalCar : function(){
		//启动全局态势定时器
		if(isTimeStart != 0){
			baiduMap.globalRunTrend();
			isTimeStart = 0;
		}
		clearTimeout(timeTraceID);				//停止特定车辆追踪定时器
		clearTimeout(timeIllID);				//停止违规车辆定时器
		clearTimeout(timeGlobalID);				//停止聚集车辆定时器
		
		baiduMap.globalCar();					//启动聚集车辆定时器
		
		baiduMap.clearAll();					//清除所有覆盖物
	},
	
	/**
	 * 定时判断出违规车辆，并保存到数据库
	 */
	isCarIllegal : function(){
		var url = $("#basePath").val()+"supervise/getIllCar.action";
		$.post(url,{isUse: 1},function(illCarData){
//			var codeJson = eval(illCarData);
			var carList = illCarData[0];	//车辆最新GPS list
			var inAreaList = illCarData[1];	//禁止驶入区域list
			
			for (var i = 0; i < carList.length; i++) {
				var point = new BMap.Point(carList[i].longitude, carList[i].latitude);
				
				//1、判断车辆是否违规：人车不对应(违规车辆：carList[i].id，应该驾驶员：，当前驾驶员：，违规类型：2)
				
				//2、判断车辆是否违规：禁止驶出(违规车辆：carList[i].id，应在经营区域：carList[i].areaname，违规类型：1)
				if(carList[i].areaname != null && carList[i].areaname != ""){
					baiduMap.getBoundary(carList[i].longitude, carList[i].latitude, carList[i].areaname, carList[i].id);
				}
				
				//3、判断车辆是否违规：禁止驶入
				for (var j = 0; j < inAreaList.length; j++) {
					var mapType = inAreaList[j].map_type;
					var radius = inAreaList[j].rotundity_radius;
					var mapSign = inAreaList[j].map_sign;
					var jsonList=eval(mapSign);
					
					if(mapType==1){			//判断point是否在圆形区域内
						var circle = baiduMap.getCreateCircle(jsonList,radius);
						if(baiduMap.ptInCircle(point,circle)){
							//保存：禁止驶入车辆  (违规车辆：carList[i].id，禁止驶入的区域：inAreaList[j].id，违规类型：0)
							var illUrl = $("#basePath").val()+"supervise/saveIllCar.action";
							$.post(illUrl, {illegalType:"0", carGpsId:carList[i].id, areaId:inAreaList[j].id}, function(data){return 1;});
						}
					}
					else if(mapType==2){	//判断point是否在多边形区域内
						var ply = baiduMap.getCreatePly(jsonList);
						if(baiduMap.ptInPolygon(point,ply)){
							//保存：禁止驶入车辆  (违规车辆：carList[i].id，禁止驶入的区域：inAreaList[j].id，违规类型：0)
							var illUrl = $("#basePath").val()+"supervise/saveIllCar.action";
							$.post(illUrl, {illegalType:"0", carGpsId:carList[i].id, areaId:inAreaList[j].id}, function(data){return 1;});
						}
					}
				}
			}
		});
		
		setTimeout('baiduMap.isCarIllegal()',500); 		//违规车辆0.5秒检测一次
	},
	//判断点是否在某个行政区域
	getBoundary : function (lon, lat, areaName, id){
	    var bdary = new BMap.Boundary();
	    bdary.get(areaName, function(rs){       //获取行政区域
	    	var ply;
	        var count = rs.boundaries.length;	//行政区域的点有多少个
	        for(var i = 0; i < count; i++){
	            ply = new BMap.Polygon(rs.boundaries[i], {strokeWeight: 2, strokeColor: "#ff0000"}); //建立多边形覆盖物
//	            map.addOverlay(ply);  //添加覆盖物
//	            map.setViewport(ply.getPath());    //调整视野       
	        }       
	        
        	//判断
	        var point = new BMap.Point(lon, lat);
//	        alert(baiduMap.ptInPolygon(point, ply));
	        if(!baiduMap.ptInPolygon(point, ply)){
//	        	alert("保存："+baiduMap.ptInPolygon(point, ply));
	        	//保存：禁止驶出车辆  (违规车辆：carList[i].id，违规类型：1)
				var illUrl = $("#basePath").val()+"supervise/saveIllCar.action";
				$.post(illUrl, {illegalType1:"1", carGpsId:id}, function(data){return 1;});
	        }
//	        arr.push("区域["+areaName+"]ply["+ply+"]point["+lon+","+lat+"]=判断["+baiduMap.ptInPolygon(point, ply)+"]");
//	        alert(arr);
	    });   
	}
}
