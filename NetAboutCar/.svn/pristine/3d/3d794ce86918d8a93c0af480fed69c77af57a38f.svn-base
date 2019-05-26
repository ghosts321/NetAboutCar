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
</style>
<script type="text/javascript">
function search(){
	alert("search");
}
$(function(){
	var tabtype = "${tabType}";
	if("2" == tabtype){
		$("#tabType").val("2");
		$("#drvInfo").css('display','none');
    	$("#carInfo").css('display','');
		$("#car_num").val("${m.car_num}");
		$('#myTab a:last').tab('show');
	}else{
		$("#tabType").val("1");
		$("#drvInfo").css('display','');
    	$("#carInfo").css('display','none');
		$("#certno").val("${m.certno}");
	}
	$("#beginTime").val("${m.beginTime}");
	$("#endTime").val("${m.endTime}");
	//日期控件
   	$('.date-picker').datepicker();
   /* 	$(function(){ 
   	    $("#beginTime").datepicker(); 
   	});  */
   	$('#search').click(function () {  
    	$("#form1").submit();
    });
   	
   	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        // 获取已激活的标签页的名称
        var activeTab = $(e.target).text();
        if("驾驶员" == activeTab){
        	$("#certno").val("");
        	$("#tabType").val("1");
        	$("#drvInfo").css('display','');
        	$("#carInfo").css('display','none');
        }else if("车辆" == activeTab){
        	$("#car_num").val("");
        	$("#tabType").val("2");
        	$("#drvInfo").css('display','none');
        	$("#carInfo").css('display','');
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
			<h1 style="font-size:15px;">
				违规信息统计分析
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					违规信息统计分析
				</small>
			</h1>
		</div>
		<div>
			<ul class="nav nav-tabs" role="tablist" id="myTab">
			  <li role="presentation" class="active"><a href="#drvInfo" aria-controls="drvInfo" role="tab" data-toggle="tab" onfocus="this.blur();">驾驶员</a></li>
			  <li role="presentation"><a href="#carInfo" aria-controls="carInfo" role="tab" data-toggle="tab" onfocus="this.blur();">车辆</a></li>
		  	</ul>
		  	<div style="padding-top:10px;" class="tab-content">
		  		<div class="panel panel-default">
		            <div class="panel-body">
		            	<span class="title">查询条件</span>
		                <form action="<%=basePath %>supervise/zfjcanalysisList.action" method="post" name="form1" id="form1" class="form-horizontal">
		                    <div class="form-group">
		                    	<div id="drvInfo">
									<label class="control-label col-sm-1" style="font-weight: normal;" for="certno">驾驶员身份证</label>
			                        <div class="col-sm-1" style="padding-right: 5px;padding-left: 0px">
			                        <input type="text" class="form-control" id="certno" name="certno"  value=""/>
			                        </div>
								</div>
								
								<div id="carInfo" style="display:none;">
									<label class="control-label col-sm-1" style="font-weight: normal;" for="car_num">车牌号</label>
			                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
			                        <input type="text" class="form-control" id="car_num" name="car_num"  value=""/>
			                        </div>
								</div>
		                        
		                        <label class="control-label col-sm-1" style="font-weight: normal;">开始时间</label>
		                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px; ">
									<input type="text" class="date-picker" name="beginTime" id="beginTime"  data-date-format="yyyy-mm-dd"/>
		                        </div>
		                        
		                        <label class="control-label col-sm-1" style="font-weight: normal;">结束时间</label>
		                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px;">
									<input type="text" class="date-picker" name="endTime" id="endTime" data-date-format="yyyy-mm-dd"/>
		                        </div>
		                        
		                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
		                        	<input type="hidden" name="tabType" id="tabType" value="1"/>
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
          'echarts/chart/bar'
      ],  
      function (ec) {  
          var myChart = ec.init(document.getElementById('mainMap'));  
          option = {
		    title : {
		        text: '违规信息统计分析',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient : 'vertical',
		        x : 'left',
		        data:['违章人总数','违规车辆总数','违章数']
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
		            name:'违规信息统计',
		            type:'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:[
		                {value:'${map.certno}', name:'违章人总数'},
		                {value:'${map.car_num}', name:'违规车辆总数'},
		                {value:'${map.illegal_content}', name:'违章数'}
		            ]
		        }
		    ]
		};
          myChart.setOption(option, true);
          
          
          var barChart = ec.init(document.getElementById('barMap'));  
          //定义图表option  
          barOption = {
       		    title : {
      		        text: '违规信息统计分析',
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
			            data:['','违章人总数','违规车辆总数','违章数','']
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
			            type:'bar',
			            data:['','${map.certno}', '${map.car_num}', '${map.illegal_content}','']
			        }
			    ]
			};
          barChart.setOption(barOption, true);
          
      }  
  );  
  </script>  
</body>
</html>