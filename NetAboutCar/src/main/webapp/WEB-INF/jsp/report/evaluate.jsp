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
					乘客评价分析
				</small>
			</h1>
		</div>
		
		<!-- <table border='0' style="margin-top: 0px">
			<tbody>
				<tr>
					<td><p id="fontStyle">根据条件查询：</p></td>
					<td>
						<span class="input-icon">
							<select name="logType" placeholder="所属区域">
	               				<option value="">&nbsp;&nbsp;&nbsp;所属区域</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;北京</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;上海</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;广州</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;深圳</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;河北</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;重庆</option>
	                        </select>
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
				</tr>
			</tbody>
		</table> -->
			<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">所属区域</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                          <span class="input-icon">
							<select name="logType" placeholder="所属区域">
	               				<option value="">&nbsp;&nbsp;&nbsp;所属区域</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;北京</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;上海</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;广州</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;深圳</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;河北</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;重庆</option>
	                        </select>
                        </div>
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
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
          'echarts/chart/pie',  
          'echarts/chart/funnel'
      ],  
      //创建ECharts图表方法  
      function (ec) {  
          // --- 地图 ---  
              //基于准备好的dom,初始化echart图表  
          var myChart = ec.init(document.getElementById('mainMap'));  
          //定义图表option  
          option = {
		    title : {
		        text: '乘客评价分析',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient : 'vertical',
		        x : 'left',
		        data:['非常满意','满意','一般','不满意']
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            dataView : {show: true, readOnly: false},
		            magicType : {
		                show: true, 
		                type: ['pie', 'funnel'],
		                option: {
		                    funnel: {
		                        x: '25%',
		                        width: '50%',
		                        funnelAlign: 'left',
		                        max: 1548
		                    }
		                }
		            },
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    series : [
		        {
		            name:'乘客评价',
		            type:'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:[
		                {value:335, name:'非常满意'},
		                {value:1310, name:'满意'},
		                {value:234, name:'一般'},
		                {value:48, name:'不满意'}
		            ]
		        }
		    ]
		};
          myChart.setOption(option, true);
      }  
  );  
  </script>  
  </body>  
</html>  