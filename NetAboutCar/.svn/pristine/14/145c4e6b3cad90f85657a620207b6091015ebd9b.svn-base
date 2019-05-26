<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html ng-app="wyc">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path }/css/policyAnalysis/queryData.css" />
<script src="${path }/echarts3/master/dist/echarts.min.js"></script>
<script src="${path }/echarts3/master/theme/vintage.js"></script> 
<script src="${path }/js/report/queryData.js" type="text/javascript"></script>
<style type="text/css">
	
</style>
<script type="text/javascript">
var jdc={dataCode:'${jdc.dataCode}'};
var path='${path}';

$(function() {
    $("#dataType").change(function(){
    	var dataType = $(this).children('option:selected').val();
    	$("#excel").attr("href","exportExcel.action?dataType="+dataType);
    	if("platform" == dataType){
    		$("#table_platform").show();
    		$("#table_vehicle").hide();
    		$("#table_pilot").hide();
    	}else if("vehicle" == dataType){
    		$("#table_platform").hide();
    		$("#table_vehicle").show();
    		$("#table_pilot").hide();
    	}else if("pilot" == dataType){
    		$("#table_platform").hide();
    		$("#table_vehicle").hide();
    		$("#table_pilot").show();
    	}
    });
});
$(function() {
	//日期控件
	$('.date-picker').datepicker();
    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
    $('#btn_query').click(function () {
    	$('#tradeList').bootstrapTable('refresh');
    });
});
</script>
</head>
<body ng-controller="WycController">
	<div class="panel-body" >
		<div class="page-header">
			<h1 style="font-size:15px;">
				统计数据展示
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					<b>{{sjzl.dataTitle}}</b>
				</small>
			</h1>
		</div>
		
		   <div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal" >
                	<table class="search-table">
                	
						
						<tr class="search-row"><td class='row-title'><div class='row-col row-title'>对比方式：</div></td>
                		<td class='search-options search-options-compare-type'><ul><li ng-repeat='a in compare_types' on-finish-render="doChangeCompareType(compare_types[0])">
									<a class='search-option compare-type-{{a}}' data='{{a}}' ng-click='doChangeCompareType(a)'><span>{{a}}</span></a>							    
							<li></ul>
						</td></tr>					
						
						
						<tr class="search-row"><td class='row-title'><div class='row-col row-title'>汇总方式：</div></td>
                		<td class='search-options search-options-stat-type'><ul><li ng-repeat='a in stat_types' on-finish-render="doChangeStatType(stat_types[0])">
									<a class='search-option stat-type-{{a}}' data='{{a}}' ng-click='doChangeStatType(a)'><span>{{a}}</span></a>							    
							<li></ul>
						</td></tr>
						                	
                		<tr class="search-row" ng-show='hasDimDate'><td class='row-title'><div class='row-col'>选择周期：</div></td>
                		<td><div  class='row-col'><input type="text" ng-model='period.startDate' class="date-picker data-date-start" id="beginTime" data-date-format="yyyy-mm-dd" placeholder="请选择开始时间" />
                			<select class='quarter quarter-start' ng-options='aa for aa in quarters'  ng-model='period.startQuarter'
                				ng-show="select.stat_type=='季度' && select.compare_type=='环比'">
                			</select>
							 ～    <input type="text" class="date-picker data-date-end" ng-model='period.endDate' id="endTime" placeholder="请选择结束时间" data-date-format="yyyy-mm-dd" /></div>		
							<select class='quarter quarter-end' ng-model='period.endQuarter' ng-options='aa for aa in quarters' 
								 ng-show="select.stat_type=='季度'">           				
                			</select>				
						</td></tr>
						
                		<tr class="search-row" ng-show='hasDimProvince'><td class='row-title'><div class='row-col row-title'>选择省份：</div></td>
                		<td class='search-options search-options-provinces'><ul><li ng-repeat='a in provinces' on-finish-render="doChangeArea(provinces[0])">
									<a class='search-option areacode-{{a.areaCode}}' data='{{a.areaCode}}' ng-click='doChangeArea(a)'><span>{{a.areaName}}</span></a>							    
							<li></ul>
						</td></tr>
						
						<tr class="search-row" ng-show='hasDimCity'><td class='row-title'><div class='row-col row-title'>选择城市：</div></td>
                		<td class='search-options search-options-cities'><ul><li ng-repeat='a in cities'>
									<a class='search-option areacode-{{a.areaCode}}' data='{{a.areaCode}}' ng-click='doChangeArea(a)'><span>{{a.areaName}}</span></a>							    
							<li></ul>
						</td></tr>
						
						<tr class="search-row" ng-show='hasDimCountry'><td class='row-title'><div class='row-col row-title'>选择区县：</div></td>
                		<td class='search-options search-options-countries'><ul><li ng-repeat='a in countries'>
									<a class='search-option areacode-{{a.areaCode}}' data='{{a.areaCode}}' ng-click='doChangeArea(a)'><span>{{a.areaName}}</span></a>							    
							<li></ul>
						</td></tr>
						
						<tr class="search-row" ng-repeat='d in dims_'><td><div class='row-col row-title'>{{d.dimName}}：</div></td>
						<td class='search-options search-options-{{d.dimCode}}'>
							<ul><li ng-repeat='data in d.data'>
									<a class='search-option dim-{{d.dimCode}}-{{data.code}}' data='{{data.code}}' ng-click='doChangeDim(data,d,$index)'><span>{{data.name}}</span></a>							    
							<li></ul>
						</td></tr>
						
						<tr class="search-row"><td class='row-title'><div class='row-col row-title'>查看维度：</div></td>
                		<td class='search-options search-options-draw'><ul><li ng-repeat='a in dims' ng-show='a.canDraw'
                		 on-finish-render="doDrawDim(dims[0])">
							<a class='search-option draw-{{a.dimCode}}' data='{{a.dimCode}}' ng-click='doDrawDim(a)'><span>{{a.dimName}}</span></a>							    
							<li></ul>
						</td></tr>

						<tr class="search-row"><td class='row-title'><div class='row-col row-title'>对比值：</div></td>
                		<td class='search-options search-options-values'><ul><li ng-repeat='a in values' on-finish-render="doSelectValue(values[0])">
									<a class='search-option value-{{a.dimCode}}' data='{{a.dimCode}}' ng-click='doSelectValue(a)' ><span>{{a.dimName}}</span></a>							    
							<li></ul>
						</td></tr> 
						
						<tr class="button-row"><td><div class='row-col row-title'></div></td>
                		<td>
                		<button type="button" id="btn_query" class="btn btn-primary btn-query" ng-click="doStatistics()">查询</button>
						</td></tr>
                	</table>
                
                </form>
            </div>
        </div>
        
        <div class='info-statistics'><span>{{infoStatistics}}</span>
                		<button type="button" id="btn_query" class="btn btn-info btn-query" ng-click="doExport()">导出</button></div>
        
		<table id="table_result"  style="width:100%" class="table table-striped table-bordered table-hover">
			<thead>
			<tr align="center">
				<th class="center" style="width: 50px;">序号</th>
				<th class="center" style="width: 50px;" ng-repeat='t in result_title track by $index'>{{t}}</th>				
			</tr>
			</thead>

			<tr align="center" ng-repeat="r in result track by $index">
				<th class="center" style="width: 50px;">{{$index+1}}</th>
				<td class="center" ng-repeat='f in r track by $index'>{{f}}</td>
			</tr>
   		</table>
   		
   		<div class="charts">
   		</div>
	</div>
	
</body>
</html>