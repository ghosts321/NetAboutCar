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
					客运量分析
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
          'echarts/chart/line',  
          'echarts/chart/bar'
      ],  
      //创建ECharts图表方法  
      function (ec) {  
          // --- 地图 ---  
              //基于准备好的dom,初始化echart图表  
          var myChart = ec.init(document.getElementById('mainMap'));  
          //定义图表option  
          option = {
       		    title : {
      		        text: '客运量分析',
      		        subtext : '客运量top5',
      		        x:'center'
   		        },
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			    	x:'left',
			        data:['北京','上海','广州','深圳','总量']
			    },
			    toolbox: {
			        show : true,
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
			            boundaryGap : false,
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
			            type:'line',
			            data:[120, 132, 101, 134, 90, 230, 210]
			        },
			        {
			            name:'上海',
			            type:'line',
			            data:[220, 182, 191, 234, 290, 330, 310]
			        },
			        {
			            name:'广州',
			            type:'line',
			            data:[150, 232, 201, 154, 190, 330, 410]
			        },
			        {
			            name:'深圳',
			            type:'line',
			            data:[320, 332, 301, 334, 390, 330, 320]
			        },
			        {
			            name:'总量',
			            type:'line',
			            data:[820, 932, 901, 934, 1290, 1330, 1320]
			        }
			    ]
			};
          myChart.setOption(option, true);
      }  
  );  
  </script>  
  </body>  
</html>  