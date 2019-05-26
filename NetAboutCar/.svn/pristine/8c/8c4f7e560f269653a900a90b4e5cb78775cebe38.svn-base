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
					质量分析
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
          'echarts/chart/gauge'
      ],  
      //创建ECharts图表方法  
      function (ec) {  
          // --- 地图 ---  
              //基于准备好的dom,初始化echart图表  
          var myChart = ec.init(document.getElementById('mainMap'));  
          //定义图表option  
          option = {
  		    title : {
      		    text: '质量分析',
      		    x:'center'
   		    },
		    tooltip : {
		        formatter: "{a} <br/>{b} : {c}%"
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    series : [
		        {
		            name:'质量分析',
		            type:'gauge',
		            center : ['50%', '50%'],    // 默认全局居中
		            radius : [0, '75%'],
		            startAngle: 140,
		            endAngle : -140,
		            min: 0,                     // 最小值
		            max: 100,                   // 最大值
		            precision: 0,               // 小数精度，默认为0，无小数点
		            splitNumber: 10,             // 分割段数，默认为5
		            axisLine: {            // 坐标轴线
		                show: true,        // 默认显示，属性show控制显示与否
		                lineStyle: {       // 属性lineStyle控制线条样式
		                    color: [[0.2, 'lightgreen'],[0.4, 'orange'],[0.8, 'skyblue'],[1, '#ff4500']], 
		                    width: 30
		                }
		            },
		            axisTick: {            // 坐标轴小标记
		                show: true,        // 属性show控制显示与否，默认不显示
		                splitNumber: 5,    // 每份split细分多少段
		                length :8,         // 属性length控制线长
		                lineStyle: {       // 属性lineStyle控制线条样式
		                    color: '#eee',
		                    width: 1,
		                    type: 'solid'
		                }
		            },
		            axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
		                show: true,
		                formatter: function(v){
		                    switch (v+''){
		                        case '10': return '弱';
		                        case '30': return '低';
		                        case '60': return '中';
		                        case '90': return '高';
		                        default: return '';
		                    }
		                },
		                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
		                    color: '#333'
		                }
		            },
		            splitLine: {           // 分隔线
		                show: true,        // 默认显示，属性show控制显示与否
		                length :30,         // 属性length控制线长
		                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
		                    color: '#eee',
		                    width: 2,
		                    type: 'solid'
		                }
		            },
		            pointer : {
		                length : '80%',
		                width : 8,
		                color : 'auto'
		            },
		            title : {
		                show : true,
		                offsetCenter: ['-65%', -10],       // x, y，单位px
		                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
		                    color: '#333',
		                    fontSize : 15
		                }
		            },
		            detail : {
		                show : true,
		                backgroundColor: 'rgba(0,0,0,0)',
		                borderWidth: 0,
		                borderColor: '#ccc',
		                width: 100,
		                height: 40,
		                offsetCenter: ['-60%', 10],       // x, y，单位px
		                formatter:'{value}%',
		                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
		                    color: 'auto',
		                    fontSize : 30
		                }
		            },
		            data:[{value: 87, name: '质量合格率'}]
		        }
		    ]
		};
          myChart.setOption(option, true);
      }  
  );  
  </script>  
  </body>  
</html>  