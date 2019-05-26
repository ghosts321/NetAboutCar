<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../common.jsp" %> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
 #fontStyle{
 	size:20px;
 	padding-left:20px
 }
 a:hover{color:white;text-decoration:none;}
 table{border-collapse:separate;}
</style>
<script type="text/javascript">
function search(){
	alert("search");
}
</script>  
</head>  
<body>  
	<div class="panel-body">
		<div class="page-header">
			<h1 style="font-size:15px;">
				统计分析
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					驾驶员违章分析
				</small>
			</h1>
		</div>
		<!--Step:1 为ECharts准备一个具备大小（宽高）的Dom-->  
  		<div id="mainMap" style="height:400px;border:1px solid #ccc;padding:10px;"></div>  
	</div>
  <!--Step:2 引入echarts.js-->  
  <script src="<%=basePath %>echarts/echarts.js"></script>  
    
  <script type="text/javascript">  
  // Step:3 为模块加载器配置echarts的路径，从当前页面链接到echarts.js，定义所需图表路径  
  require.config({  
      paths: {  
          echarts: '<%=basePath %>echarts'  
      }  
  });  
    
  // Step:4 动态加载echarts然后在回调函数中开始使用，注意保持按需加载结构定义图表路径  
  require(  
      [  
          'echarts',  
          'echarts/chart/map'  
      ],  
      //创建ECharts图表方法  
      function (ec) {  
          // --- 地图 ---  
              //基于准备好的dom,初始化echart图表  
          var myChart = ec.init(document.getElementById('mainMap'));  
          //定义图表option  
          var option = {
      		  title : {
      		      text: '驾驶员违章分析',
      		      subtext : '全国34个省市自治区',
      		      x:'center'
   		      },
              tooltip : {
                  trigger: 'item',
                  formatter: '点击进入该省<br/>{b} : {c}'
              },
              legend: {
            	  orient: 'vertical',
                  x:'left',
                  data:['违章次数']
              },
              dataRange: {
                  min: 0,
                  max: 1000,
                  color:['orange','yellow'],
                  text:['高','低'],           // 文本，默认为数值文本
                  calculable : true
              },
              toolbox: {
                  show: true,
                  orient : 'vertical',
                  x: 'right',
                  y: 'center',
                  feature : {
                      dataView : {show: true, readOnly: false},
                      restore : {show: true},
                      saveAsImage : {show: true}
                  }
              },
              series : [
                  {
                      name: '违章次数',
                      type: 'map',
                      mapType: 'china',
                      selectedMode : 'single',
                      itemStyle:{
                          normal:{label:{show:true}},
                          emphasis:{label:{show:true}}
                      },
                      data:[
                          {name: '重庆市',value: Math.round(Math.random()*1000)},
                          {name: '北京市',value: Math.round(Math.random()*1000)},
                          {name: '天津市',value: Math.round(Math.random()*1000)},
                          {name: '上海市',value: Math.round(Math.random()*1000)},
                          {name: '香港',value: Math.round(Math.random()*1000)},
                          {name: '澳门',value: Math.round(Math.random()*1000)},
                          {name: '巴音郭楞蒙古自治州',value: Math.round(Math.random()*1000)},
                          {name: '和田地区',value: Math.round(Math.random()*1000)},
                          {name: '哈密地区',value: Math.round(Math.random()*1000)},
                          {name: '阿克苏地区',value: Math.round(Math.random()*1000)},
                          {name: '阿勒泰地区',value: Math.round(Math.random()*1000)},
                          {name: '喀什地区',value: Math.round(Math.random()*1000)},
                          {name: '塔城地区',value: Math.round(Math.random()*1000)},
                          {name: '昌吉回族自治州',value: Math.round(Math.random()*1000)},
                          {name: '克孜勒苏柯尔克孜自治州',value: Math.round(Math.random()*1000)},
                          {name: '吐鲁番地区',value: Math.round(Math.random()*1000)},
                          {name: '伊犁哈萨克自治州',value: Math.round(Math.random()*1000)},
                          {name: '博尔塔拉蒙古自治州',value: Math.round(Math.random()*1000)},
                          {name: '乌鲁木齐市',value: Math.round(Math.random()*1000)},
                          {name: '克拉玛依市',value: Math.round(Math.random()*1000)},
                          {name: '阿拉尔市',value: Math.round(Math.random()*1000)},
                          {name: '图木舒克市',value: Math.round(Math.random()*1000)},
                          {name: '五家渠市',value: Math.round(Math.random()*1000)},
                          {name: '石河子市',value: Math.round(Math.random()*1000)},
                          {name: '那曲地区',value: Math.round(Math.random()*1000)},
                          {name: '阿里地区',value: Math.round(Math.random()*1000)},
                          {name: '日喀则地区',value: Math.round(Math.random()*1000)},
                          {name: '林芝地区',value: Math.round(Math.random()*1000)},
                          {name: '昌都地区',value: Math.round(Math.random()*1000)},
                          {name: '山南地区',value: Math.round(Math.random()*1000)},
                          {name: '拉萨市',value: Math.round(Math.random()*1000)},
                          {name: '呼伦贝尔市',value: Math.round(Math.random()*1000)},
                          {name: '阿拉善盟',value: Math.round(Math.random()*1000)},
                          {name: '锡林郭勒盟',value: Math.round(Math.random()*1000)},
                          {name: '鄂尔多斯市',value: Math.round(Math.random()*1000)},
                          {name: '赤峰市',value: Math.round(Math.random()*1000)},
                          {name: '巴彦淖尔市',value: Math.round(Math.random()*1000)},
                          {name: '通辽市',value: Math.round(Math.random()*1000)},
                          {name: '乌兰察布市',value: Math.round(Math.random()*1000)},
                          {name: '兴安盟',value: Math.round(Math.random()*1000)},
                          {name: '包头市',value: Math.round(Math.random()*1000)},
                          {name: '呼和浩特市',value: Math.round(Math.random()*1000)},
                          {name: '乌海市',value: Math.round(Math.random()*1000)},
                          {name: '绵阳市',value: Math.round(Math.random()*1000)},
                          {name: '达州市',value: Math.round(Math.random()*1000)},
                          {name: '广元市',value: Math.round(Math.random()*1000)},
                          {name: '雅安市',value: Math.round(Math.random()*1000)},
                          {name: '宜宾市',value: Math.round(Math.random()*1000)},
                          {name: '乐山市',value: Math.round(Math.random()*1000)},
                          {name: '南充市',value: Math.round(Math.random()*1000)},
                          {name: '巴中市',value: Math.round(Math.random()*1000)},
                          {name: '泸州市',value: Math.round(Math.random()*1000)},
                          {name: '成都市',value: Math.round(Math.random()*1000)},
                          {name: '资阳市',value: Math.round(Math.random()*1000)},
                          {name: '攀枝花市',value: Math.round(Math.random()*1000)},
                          {name: '眉山市',value: Math.round(Math.random()*1000)},
                          {name: '广安市',value: Math.round(Math.random()*1000)},
                          {name: '德阳市',value: Math.round(Math.random()*1000)},
                          {name: '内江市',value: Math.round(Math.random()*1000)},
                          {name: '遂宁市',value: Math.round(Math.random()*1000)},
                          {name: '自贡市',value: Math.round(Math.random()*1000)},
                          {name: '黑河市',value: Math.round(Math.random()*1000)},
                          {name: '大兴安岭地区',value: Math.round(Math.random()*1000)},
                          {name: '定西市',value: Math.round(Math.random()*1000)},
                          {name: '天水市',value: Math.round(Math.random()*1000)},
                          {name: '兰州市',value: Math.round(Math.random()*1000)},
                          {name: '平凉市',value: Math.round(Math.random()*1000)},
                          {name: '临夏回族自治州',value: Math.round(Math.random()*1000)},
                          {name: '金昌市',value: Math.round(Math.random()*1000)},
                          {name: '嘉峪关市',value: Math.round(Math.random()*1000)},
                          {name: '普洱市',value: Math.round(Math.random()*1000)},
                          {name: '红河哈尼族彝族自治州',value: Math.round(Math.random()*1000)},
                          {name: '文山壮族苗族自治州',value: Math.round(Math.random()*1000)},
                          {name: '曲靖市',value: Math.round(Math.random()*1000)},
                          {name: '楚雄彝族自治州',value: Math.round(Math.random()*1000)},
                          {name: '大理白族自治州',value: Math.round(Math.random()*1000)},
                          {name: '临沧市',value: Math.round(Math.random()*1000)},
                          {name: '迪庆藏族自治州',value: Math.round(Math.random()*1000)},
                          {name: '昭通市',value: Math.round(Math.random()*1000)},
                          {name: '昆明市',value: Math.round(Math.random()*1000)},
                          {name: '丽江市',value: Math.round(Math.random()*1000)},
                          {name: '西双版纳傣族自治州',value: Math.round(Math.random()*1000)},
                          {name: '保山市',value: Math.round(Math.random()*1000)},
                          {name: '玉溪市',value: Math.round(Math.random()*1000)},
                          {name: '怒江傈僳族自治州',value: Math.round(Math.random()*1000)},
                          {name: '德宏傣族景颇族自治州',value: Math.round(Math.random()*1000)},
                          {name: '百色市',value: Math.round(Math.random()*1000)},
                          {name: '河池市',value: Math.round(Math.random()*1000)},
                          {name: '桂林市',value: Math.round(Math.random()*1000)},
                          {name: '南宁市',value: Math.round(Math.random()*1000)},
                          {name: '柳州市',value: Math.round(Math.random()*1000)},
                          {name: '崇左市',value: Math.round(Math.random()*1000)},
                          {name: '来宾市',value: Math.round(Math.random()*1000)},
                          {name: '玉林市',value: Math.round(Math.random()*1000)},
                          {name: '梧州市',value: Math.round(Math.random()*1000)},
                          {name: '贺州市',value: Math.round(Math.random()*1000)},
                          {name: '钦州市',value: Math.round(Math.random()*1000)},
                          {name: '贵港市',value: Math.round(Math.random()*1000)},
                          {name: '防城港市',value: Math.round(Math.random()*1000)},
                          {name: '北海市',value: Math.round(Math.random()*1000)},
                          {name: '怀化市',value: Math.round(Math.random()*1000)},
                          {name: '永州市',value: Math.round(Math.random()*1000)},
                          {name: '邵阳市',value: Math.round(Math.random()*1000)},
                          {name: '郴州市',value: Math.round(Math.random()*1000)},
                          {name: '常德市',value: Math.round(Math.random()*1000)},
                          {name: '湘西土家族苗族自治州',value: Math.round(Math.random()*1000)},
                          {name: '衡阳市',value: Math.round(Math.random()*1000)},
                          {name: '岳阳市',value: Math.round(Math.random()*1000)},
                          {name: '益阳市',value: Math.round(Math.random()*1000)},
                          {name: '长沙市',value: Math.round(Math.random()*1000)},
                          {name: '株洲市',value: Math.round(Math.random()*1000)},
                          {name: '张家界市',value: Math.round(Math.random()*1000)},
                          {name: '娄底市',value: Math.round(Math.random()*1000)},
                          {name: '湘潭市',value: Math.round(Math.random()*1000)},
                          {name: '榆林市',value: Math.round(Math.random()*1000)},
                          {name: '延安市',value: Math.round(Math.random()*1000)},
                          {name: '汉中市',value: Math.round(Math.random()*1000)},
                          {name: '安康市',value: Math.round(Math.random()*1000)},
                          {name: '商洛市',value: Math.round(Math.random()*1000)},
                          {name: '宝鸡市',value: Math.round(Math.random()*1000)},
                          {name: '渭南市',value: Math.round(Math.random()*1000)},
                          {name: '咸阳市',value: Math.round(Math.random()*1000)},
                          {name: '西安市',value: Math.round(Math.random()*1000)},
                          {name: '铜川市',value: Math.round(Math.random()*1000)},
                          {name: '清远市',value: Math.round(Math.random()*1000)},
                          {name: '韶关市',value: Math.round(Math.random()*1000)},
                          {name: '北京',value: Math.round(Math.random()*1000)},
                          {name: '天津',value: Math.round(Math.random()*1000)},
                          {name: '河北',value: Math.round(Math.random()*1000)},
                          {name: '新疆',value: Math.round(Math.random()*1000)},
                          {name: '陕西',value: Math.round(Math.random()*1000)},
                          {name: '内蒙古',value: Math.round(Math.random()*1000)},
                          {name: '黑龙江',value: Math.round(Math.random()*1000)},
                          {name: '湖南',value: Math.round(Math.random()*1000)},
                          {name: '广东',value: Math.round(Math.random()*1000)},
                          {name: '西藏',value: Math.round(Math.random()*1000)},
                          {name: '四川',value: Math.round(Math.random()*1000)},
                          {name: '云南',value: Math.round(Math.random()*1000)},
                          {name: '广西',value: Math.round(Math.random()*1000)},
                          {name: '甘肃',value: Math.round(Math.random()*1000)}
                      ]
                  }
              ]
          };
          var ecConfig = require('echarts/config');
          var zrEvent = require('zrender/tool/event');
          var curIndx = 0;
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
          	document.getElementById('mainMap').onmousewheel = function (e){
	       	    var event = e || window.event;
	       	    curIndx += zrEvent.getDelta(event) > 0 ? (-1) : 1;
	       	    if (curIndx < 0) {
	       	        curIndx = mapType.length - 1;
	       	    }
	       	    var mt = mapType[curIndx % mapType.length];
	       	    if (mt == 'china') {
	       	        option.tooltip.formatter = '点击进入该省<br/>{b} : {c}';
	       	    }
	       	    else{
	       	        option.tooltip.formatter = '点击返回全国<br/>{b} : {c}';
	       	    }
	       	    option.series[0].mapType = mt;
	       	    option.title.subtext = mt + ' （点击切换）';
	       	    myChart.setOption(option, true);
	       	    
	       	    zrEvent.stop(event);
	       	};
	       	myChart.on(ecConfig.EVENT.MAP_SELECTED, function (param){
	       	    var len = mapType.length;
	       	    var mt = mapType[curIndx % len];
	       	    if (mt == 'china') {
	       	        // 全国选择时指定到选中的省份
	       	        var selected = param.selected;
	       	        for (var i in selected) {
	       	            if (selected[i]) {
	       	                mt = i;
	       	                while (len--) {
	       	                    if (mapType[len] == mt) {
	       	                        curIndx = len;
	       	                    }
	       	                }
	       	                break;
	       	            }
	       	        }
	       	        option.tooltip.formatter = '点击返回全国<br/>{b} : {c}';
	       	    }
	       	    else {
	       	        curIndx = 0;
	       	        mt = 'china';
	       	        option.tooltip.formatter = '点击进入该省<br/>{b} : {c}';
	       	    }
	       	    option.series[0].mapType = mt;
	       	    option.title.subtext = mt + ' （点击切换）';
	       	    myChart.setOption(option, true);
	       	});
          	myChart.setOption(option, true);
      }  
  );  
  </script>  
  </body>  
</html>  