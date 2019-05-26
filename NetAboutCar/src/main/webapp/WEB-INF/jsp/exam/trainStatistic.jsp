<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
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
table.gridtable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}
table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}
table.gridtable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}
</style>
<script type="text/javascript">
function search(){
	alert("search");
}
function showExamChart(){
	//window.open("getPilotApply.action","newwindow","height=500,width=400,toolbar=no,scrollbars=no");
	$('#examChart').modal();
}
</script>
</head>
<body>
	<div class="page-content">
		<div class="page-header">
			<h1 style="font-size:25px;font-weight: lighter;color: #2679b5">
				考试培训
				<small style="font-size: 19px">
					<i class="icon-double-angle-right"></i>
					培训质量分析
				</small>
			</h1>
		</div>
		
		<table border='0' style="margin-top: 0px;width:100%">
			<tbody>
				<tr>
					<td width="10%"><p id="fontStyle">查询条件：</p></td>
					<td width="10%">
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="培训课程" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td width="10%" style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
					<td style="vertical-align:top;" align="right"><a id='chart' class='btn btn-mini btn-info' onclick="showExamChart();">统计图</a></td>
				</tr>
			</tbody>
		</table>
		<table class="gridtable" style="width:100%">
			<thead>
			<tr>
				<th class="center" style="width: 50px;">序号</th>
				<th class='center'>培训课程</th>
				<th class='center'>培训人数</th>
			</tr>
			</thead>
			<tr>
				<td class="center">1</td>
				<td class="center">课程一</td>
				<td class="center">3478</td>
			</tr>
			<tr>
				<td class="center">2</td>
				<td class="center">课程二</td>
				<td class="center">5268</td>
				
			</tr>
			<tr>
				<td class="center">3</td>
				<td class="center">课程三</td>
				<td class="center">4789</td>
			</tr>
   		</table>
	</div>
	<div class="modal fade" id="examChart" style="width:1000px;margin-left:-500px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" >
						培训信息统计图：
					</h4>
				</div>
				<div class="modal-body" style="height:300px">
					<div id="mainMap" style="height:300px;border:1px solid #ccc;padding:10px;"></div>  
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div><!-- /.modal-content --> 
		</div><!-- /.modal -->
	</div>
	<script src="<%=basePath %>echarts/echarts.js"></script>  
  <script type="text/javascript">  
  require.config({  
      paths: {  
          echarts: '<%=basePath %>echarts'  
      }  
  });  
  require(  
		  [  
	          'echarts',  
	          'echarts/chart/pie',  
	          'echarts/chart/funnel'
	      ], 
      function (ec) {  
          var myChart = ec.init(document.getElementById('mainMap'));  
          option = {
        		    title : {
        		        text: '培训信息统计',
        		        x:'center'
        		    },
        		    tooltip : {
        		        trigger: 'item',
        		        formatter: "{a} <br/>{b} : {c} ({d}%)"
        		    },
        		    legend: {
        		        orient : 'vertical',
        		        x : 'left',
        		        data: ['课程一','课程二','课程三']
        		    },
        		    toolbox: {
        		        show : true,
        		        feature : {          
        		            restore : {show: true},
        		            saveAsImage : {show: true}
        		        }
        		    },
        		    calculable : true,
        		    series : [
        		        {
        		            name:'培训人数',
        		            type:'pie',
        		            radius : '55%',
        		            center: ['50%', '60%'],
        		            data:[
        		                {value:335, name:'课程一'},
        		                {value:230, name:'课程二'},
        		                {value:1248, name:'课程三'}
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