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
					考试成绩分析
				</small>
			</h1>
		</div>
		
		<table border='0' style="margin-top: 0px;width:100%">
			<tbody>
				<tr>
					<td width="10%"><p id="fontStyle">查询条件：</p></td>
					<td width="10%">
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="考试科目" />
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
				<th class='center'>考试科目</th>
				<th class='center'>考试人数</th>
				<th class='center'>合格人数</th>
				<th class='center'>不合格人数</th>
				<th class='center'>合格率</th>
			</tr>
			</thead>
			<tr>
				<td class="center">1</td>
				<td class="center">科目一</td>
				<td class="center">3478</td>
				<td class="center">2768</td>
				<td class="center">710</td>
				<td class="center">79.6%</td>
			</tr>
			<tr>
				<td class="center">2</td>
				<td class="center">科目二</td>
				<td class="center">5268</td>
				<td class="center">3379</td>
				<td class="center">1889</td>
				<td class="center">64.1%</td>
				
			</tr>
			<tr>
				<td class="center">3</td>
				<td class="center">科目三</td>
				<td class="center">4789</td>
				<td class="center">3997</td>
				<td class="center">792</td>
				<td class="center">83.5%</td>
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
						考试信息统计图：
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
        		        text: '考试信息统计',
        		        x:'center'
        		    },
        		    tooltip : {
        		        trigger: 'item',
        		        formatter: "{a} <br/>{b} : {c} ({d}%)"
        		    },
        		    legend: {
        		        orient : 'vertical',
        		        x : 'left',
        		        data: ['科目一','科目二','科目三']
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
        		            name:'合格人数',
        		            type:'pie',
        		            radius : '55%',
        		            center: ['50%', '60%'],
        		            data:[
        		                {value:1335, name:'科目一'},
        		                {value:310, name:'科目二'},
        		                {value:548, name:'科目三'}
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