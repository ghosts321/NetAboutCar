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
	/* var tabtype = "${tabType}";
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
	$("#endTime").val("${m.endTime}"); */
	//日期控件
   	$('#beginTime').datepicker();
   	$('#endTime').datepicker();
   /* 	$(function(){ 
   	    $("#beginTime").datepicker(); 
   	});  */
   	$('#search').click(function () {  
    	$("#form1").submit();
    });
   	
   /* 	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
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
        $("#areacode").val("");
        $("#punishType").val("");
        $("#instid").val("");
        $("#beginTime").val("");
    	$("#endTime").val("");
    	$("#form1").submit();
    });  */
});
</script>
</head>
<body>
	<div class="panel-body" style="padding-bottom:0px;">
		<div class="page-header">
			<h1 style="font-size:15px;">
				查询统计
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					平台处罚案件统计
				</small>
			</h1>
		</div>
		<!-- <div>
			<ul class="nav nav-tabs" role="tablist" id="myTab">
			  <li role="presentation" class="active"><a href="#drvInfo" aria-controls="drvInfo" role="tab" data-toggle="tab" onfocus="this.blur();">驾驶员</a></li>
			  <li role="presentation"><a href="#carInfo" aria-controls="carInfo" role="tab" data-toggle="tab" onfocus="this.blur();">车辆</a></li>
		  	</ul> -->
		  	<div style="padding-top:10px;" class="tab-content">
		  		<div class="panel panel-default">
		            <div class="panel-body">
		            	<span class="title">查询条件</span>
		                <form action="<%=basePath %>plantcaseappeal/plantanalysisList.action" method="post" name="form1" id="form1" class="form-horizontal">
		                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="areacode">行政区划</label>
                        <div class="col-sm-1" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="areacode" name="areacode"/>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="punishType">处罚类型</label>
                       <div class="col-sm-1" style="padding-right: 5px;padding-left: 0px">
                         <select name=punishType id="punishType" class="form-control">
				         <option value="" >请选择</option>
				         <option value="0001">口头警告</option>  
				         <option value="0002">两百元一下罚款</option>
				         <option value="0003">暂扣或吊销驾驶证&nbsp;&nbsp;&nbsp;</option>   
				        </select>
				        </div> 
				         <label class="control-label col-sm-1" style="font-weight: normal;" for="instid">组织机构</label>
                         <div class="col-sm-1" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="instid" name="instid"/>
                        </div>
                   </div>

				        <div class="form-group" style="margin-top:15px">
				       
				       <label class="control-label col-sm-1" style="font-weight: normal;">开始时间</label>
		                        <div class="col-sm-1" style="padding-right: 5px;padding-left: 0px; ">
									<input type="text" class="col-sm-1" name="beginTime" id="beginTime"  data-date-format="yyyy-mm-dd"/>
		                        </div>
		                        
		                        <label class="control-label col-sm-1" style="font-weight: normal;">至&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		                        <div class="col-sm-1" style="padding-right: 5px;padding-left: 0px;">
									<input type="text" class="col-sm-1" name="endTime" id="endTime" data-date-format="yyyy-mm-dd"/>
		                        </div>
                        <div class="col-sm-2" style="text-align:left; padding-left:200px">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
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
	<!-- </div> -->
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
		        text: '平台处罚案件统计分析',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient : 'vertical',
		        x : 'left',
		        data:['滴滴','易道','神州','优步']
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
		            name:'平台处罚案件统计分析',
		            type:'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:[
		                {value:'${map.one}', name:'滴滴'},
		                {value:'${map.two}', name:'易道'},
		                {value:'${map.three}', name:'神州'},
		                {value:'${map.four}', name:'优步'}
		            ]
		        }
		    ]
		};
          myChart.setOption(option, true);
          
          
          var barChart = ec.init(document.getElementById('barMap'));  
          //定义图表option  
          barOption = {
       		    title : {
      		        text: '平台处罚案件统计分析',
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
			            data:['','滴滴','易道','神州','优步','']
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
			            data:['','${map.one}', '${map.two}', '${map.three}','${map.four}','']
			        }
			    ]
			};
          barChart.setOption(barOption, true);
          
      }  
  );  
  </script>  
</body>
</html>