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
					营收分析
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
          'echarts/chart/bar',  
          'echarts/chart/line'
      ],  
      //创建ECharts图表方法  
      function (ec) {  
          // --- 地图 ---  
              //基于准备好的dom,初始化echart图表  
          var myChart = ec.init(document.getElementById('mainMap'));  
          var te = require('echarts/theme/macarons');
          myChart.setTheme(te);
          //定义图表option  
          option = {
		    tooltip : {
		        trigger: 'axis'
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            dataView : {show: true, readOnly: false},
		            magicType: {show: true, type: ['line', 'bar']},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    legend: {
		        data:['总营收（亿元）','环比增长率（%）','同比增长率（%）']
		    },
		    xAxis : [
		        {
		            type : 'category',
		            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            name : '总营收（亿元）',
		            axisLabel : {
		                formatter: '{value}'
		            }
		        }
		    ],
		    series : [
		
		        {
		            name:'总营收（亿元）',
		            type:'bar',
		            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 35.6, 62.2, 32.6, 20.0, 6.4, 3.3]
		        },       
		        {
		            name:'环比增长率（%）',
		            itemStyle: {
		                 normal: {
		                     label: {
		                         show: true,
		                         formatter: '{c}%',
		                         textStyle: {
		                             color: '#800080'
		                         }
		                     }
		                 }
		             },
		            type:'line',
		            data:[12.0, 12.2, 13.3, 14.5, 16.3, 20.2, 30.3, 33.4, 33.0, 26.5, 22.0, 16.2]
		        },       
		        {
		            name:'同比增长率（%）',
		            itemStyle: {
		                 normal: {
		                     label: {
		                         show: true,
		                         formatter: '{c}%',
		                         textStyle: {
		                             color: '#808080'
		                         }
		                     }
		                 }
		             },
		            type:'line',
		            data:[2.0, 5.2, 13.3, 14.5, 16.3, 30.2, 50.3, 43.4, 23.0, 16.5, 27.0, 6.2]
		        }
		    ]
		};
          myChart.setOption(option, true);
      }  
  );  
  </script>  
  </body>  
</html>  