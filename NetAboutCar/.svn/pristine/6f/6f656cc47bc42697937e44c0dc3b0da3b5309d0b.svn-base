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
					网约车订单分析
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
        		title : {
          		    text: '网约车订单分析',
          		    x:'center'
       		    },
			    tooltip : {
			        trigger: 'axis',
			        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
			            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
			        }
			    },
			    grid:{
					x:150
				},
			    legend: {
			    	orient : 'vertical',
			    	x:'left',
			        data:['北京','上海','广州','深圳','全部']
			    },
			    toolbox: {
			        show : true,
			        orient: 'vertical',
			        x: 'right',
			        y: 'center',
			        feature : {
			            dataView : {show: true, readOnly: false},
			            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    xAxis : [
			        {
			            type : 'category',
			            data : ['周一','周二','周三','周四','周五','周六','周日']
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value'
			        }
			    ],
			    series : [
			        {
			            name:'北京',
			            type:'bar',
			            stack: '地区',
			            data:[220, 232, 201, 234, 290, 230, 220],
			        },
			        {
			            name:'上海',
			            type:'bar',
			            stack: '地区',
			            data:[120, 132, 101, 134, 90, 230, 210]
			        },
			        {
			            name:'广州',
			            type:'bar',
			            stack: '地区',
			            data:[220, 182, 191, 234, 290, 330, 310]
			        },
			        {
			            name:'深圳',
			            type:'bar',
			            stack: '地区',
			            data:[150, 232, 201, 154, 190, 330, 410]
			        },
			        {
			            name:'全部',
			            type:'bar',
			            stack: '全部',
			            data:[1062, 2082, 1091, 1084, 1209, 1510, 1320]
			        }
			    ]
			};
          myChart.setOption(option, true);
      }  
  );  
  </script>  
  </body>  
</html>  