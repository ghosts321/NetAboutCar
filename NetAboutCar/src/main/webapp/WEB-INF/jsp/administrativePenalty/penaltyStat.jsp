<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function search(){
	//alert("search");
}
$(function(){
	var tabtype = "${tabType}";
	if("2" == tabtype){
		$("#tabType").val("2");
		$("#addressInfo").css('display','none');
    	$("#companyInfo").css('display','');
		$("#companyId").val("${m.companyId}");
		$('#myTab a:last').tab('show');
	}else{
		$("#tabType").val("1");
		$("#addressInfo").css('display','');
    	$("#companyInfo").css('display','none');
		$("#address").val("${m.address}");
	}
	$("#beginTime").val("${m.beginTime}");
	$("#endTime").val("${m.endTime}");
	//日期控件
   	$('.date-picker').datepicker();
   	$('#search').click(function () {  
    	$("#form1").submit();
    });
   	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        // 获取已激活的标签页的名称
        var activeTab = $(e.target).text();
        if("全市订单分析" == activeTab){
        	$("#companyId").val("");
        	$("#tabType").val("1");
        	$("#addressInfo").css('display','');
        	$("#companyInfo").css('display','none');
        }else if("平台经营者分析" == activeTab){
        	$("#address").val("");
        	$("#tabType").val("2");
        	$("#addressInfo").css('display','none');
        	$("#companyInfo").css('display','');
        }
        $("#beginTime").val("");
    	$("#endTime").val("");
    	$("#form1").submit();
    });
});
</script>
</head>
<body>
	<div class="panel-body" style="padding-bottom:0px;">
		<div class="page-header">
			<h1 style="font-size:15px;font-weight: lighter">
				查询统计
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					处罚案件统计
				</small>
			</h1>
		</div>
		<div>
		  	<div style="padding-top:10px;" class="tab-content">
		  		<div class="panel panel-default">
		            <div class="panel-body">
		            	<span class="title">查询条件</span>
		                <form action="" method="post" name="form1" id="form1" class="form-horizontal">
		                    <div class="form-group" style="margin-top:15px">
				                    	<label class="control-label col-sm-1" style="font-weight: normal;" for="region_code">行政区划</label>
		                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
									<input type="text" class="form-control" id="region_code"/>
		                        </div>
		                        <label class="control-label col-sm-1" style="font-weight: normal;" for="fare_type">处罚类型</label>
		                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
									<select class="form-control">
										<option>警告</option>
										<option>罚款</option>
										<option>没收违法所得，没收非法财物</option>
										<option>责令停产停业</option>
										<option>暂扣或吊销许可证</option>
										<option>行政拘留</option>
									</select>
		                        </div>
		                        <label class="control-label col-sm-1" style="font-weight: normal;" for="company_id">案发时间</label>
		                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px; width:352px">
									从<input type="text" class="date-picker" id="begin_time" data-date-format="yyyy-mm-dd" onchange="changeDateValue();"/>
									到<input type="text" class="date-picker" id="end_time" data-date-format="yyyy-mm-dd" onchange="changeDateValue1();"/>
		                        </div>
		                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
		                            <button type="button" style="margin-left:10px" id="search" class="btn btn-primary">查询</button>
		                        </div>
		                    </div>
		                </form>
		            </div>
		        </div>
				<div class="container-fluid">
				  <div style="padding-top:10px;" class="row">
				  	<div class="col-md-6"><div id="mainMap" style="height:400px;border:1px solid #ccc;padding:10px;"></div></div>
					<div class="col-md-6"><div id="barMap" style="height:400px;border:1px solid #ccc;padding:10px;"></div></div>
				  </div>
				</div>
			</div>
		</div>
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
          'echarts/chart/line'
      ],  
      function (ec) {  
          var myChart = ec.init(document.getElementById('mainMap'));  
          option = {
		    title : {
		        text: '处罚案件统计分析',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient : 'vertical',
		        x : 'left',
		        data:['1分钟','2分钟','3分钟','4分钟','5分钟','其它']
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
		            name:'车辆接单时长',
		            type:'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:[
		                {value:'${map.one}', name:'1分钟'},
		                {value:'${map.two}', name:'2分钟'},
		                {value:'${map.three}', name:'3分钟'},
		                {value:'${map.four}', name:'4分钟'},
		                {value:'${map.five}', name:'5分钟'},
		                {value:'${map.other}', name:'其它'}
		            ]
		        }
		    ]
		};
          myChart.setOption(option, true);
          
          
          var barChart = ec.init(document.getElementById('barMap'));  
          //定义图表option  
          barOption = {
       		    title : {
      		        text: '处罚案件统计分析',
      		        x:'center'
   		        },
			    tooltip : {
			        trigger: 'axis'
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    xAxis : [
			        {
			            type : 'category',
			            boundaryGap : false,
			            data:['1分钟','2分钟','3分钟','4分钟','5分钟','其它']
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value'
			        }
			    ],
			    series : [
			        {
			            name:'总量',
			            type:'line',
			            data:['${map.one}', '${map.two}', '${map.three}', '${map.four}', '${map.five}', '${map.other}']
			        }
			    ]
			};
          barChart.setOption(barOption, true);
          
      }  
  );  
  </script>  
</body>
</html>