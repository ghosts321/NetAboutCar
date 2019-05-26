<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../common-jcfx.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html ng-app='wyc'>  
<head>  
<title>网约车数据可视化分析</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<link rel="stylesheet" href="${path }/css/policyAnalysis/zhfx.css" />
 
<script src="${path }/echarts3/master/dist/echarts.min.js"></script>
<script src="${path }/echarts3/master/theme/dark.js"></script> 
<script src="${path }/echarts3/master/theme/macarons.js"></script> 
<script src="${path }/echarts3/master/theme/vintage.js"></script> 
<script src="${path }/echarts3/master/theme/shine.js"></script>
<script src="${path }/echarts3/master/theme/infographic.js"></script>
<script src="${path }/echarts3/master/theme/roma.js"></script>
<script src="${path }/js/report/wyc-charts.js"></script> 
<script src="${path }/js/report/wyc-charts-map.js"></script> 

<script type="text/javascript">


$(function(){

	$('.diag-charts').hide();
	multicharts.select_date='${date}';
	
	$('.theme').click(function(){
		$('body').attr('class',$(this).attr('theme')+'-bc');
		$('.theme-select').removeClass('theme-select');
		$(this).addClass('theme-select');
		multicharts.theme=$(this).attr('theme');
		multicharts.createMap();
		
		$('.model-title').attr('class','model-title');
		$('.model-title').addClass($(this).attr('theme'));
	});

	$('.dark').click();
});

</script>


<style type="text/css">
 .open-sjml{
display: inline-block;
width: 100%;
background-color: #4C4C4C;
}

	.open-sjml ul{
		list-style: none;
		display: inline-block;
		margin: 0;
		padding: 0;
		width: 100%;
	}
	.open-sjml ul li{	
		float: left;
		border: 1px outset  #A39797;
		padding:5px 10px;
		min-width: 80px;
		text-align: center;
		display: block;
		background-color: #5C5B5F;
		color: rgb(236, 224, 224);
		margin: 10px 10px 10px 0;
	}

	.open-sjml ul li:hover{
		background-color: #524644;
		color: rgb(250, 244, 244);
		cursor: -webkit-grab;
	}
	
	.open-sjml .close{
		color: white;
		text-decoration: none;
		float: right;
		font-size: 110%;
	}
	
	.themes{
		display: block;
	    width: 100%;
	    height: 15px;
	    text-align: center;
	    margin: 5px 0;
	}
	
	.theme{
		display: inline-block;
	    width: 45px;
	    height: 80%;
	    margin-right: 10px;
	    border: 1px solid #6AC099;
	}
	
	.theme-select{
	    border: 2px solid #cbce97;		
	}
	
	.dark,.dark-bc{
		background-color: rgb(51, 51, 51); 
	}
	
	.vintage{
		background-color: rgb(254, 248, 239); 
	}
	
	
	.shine{
		background-color: rgb(45, 155, 211); 
	}
	.roma{
		background-color: rgb(225, 59, 100); 
	}
	.macarons{
		background-color: rgb(133, 202, 244); 
	}
	.infographic{
		background-color: rgb(246, 188, 19); 
	}
	
	.vintage-bc{
		background-color:#FEF8EF;
	}
	.shine-bc,.roma-bc,.macarons-bc,.infographic-bc{
		background-color:white;
	}
	
	.model-title{    
    	font-size: 150%;
	}
	
	.model-title.dark{	
		color: #e6e0e0;
	}
	
	.model-title.shine,.model-title.roma,.model-title.macarons,.model-title.infographic{
		background-color:white;
	}
</style>


<body ng-controller="WycController">
	<div class="model-title themes">网约车数据可视化分析</div>
	<div class='themes'><a href="javascript:void();" theme='dark' class='theme dark'></a>
	<a href="javascript:void();" theme='vintage' class='theme vintage'></a>
	<a href="javascript:void();" theme='shine' class='theme shine'></a>
	<a href="javascript:void();" theme='roma' class='theme roma'></a>
	<a href="javascript:void();" theme='macarons' class='theme macarons'></a>
	<a href="javascript:void();" theme='infographic' class='theme infographic'></a></div>
	<div class="row row1">
		<div class="col row1-col1">
				<div class="grid grid1" >
					<div id='chart1' class="chart "></div>
					
					<a href="javascript:void();" opt-chart='chart1' class='change-icon' ng-click='doGetDataCatalog("chart1")'>↗</a>
										
				</div>
				
				<div class="grid grid2" >
					<div id="chart2" class="chart "></div>		
					<a href="javascript:void();" opt-chart='chart2' class='change-icon' ng-click='doGetDataCatalog("chart2")'>↗</a>			
				</div>
		</div>
		<div class="col row1-col2">
			<div class='grid grid-map'>
				<div id="map" class="chart "></div>			
			</div>
		</div>
		<div class="col row1-col3">
			<div class="grid grid3" >
				<div id="chart3" class="chart "></div>
				<a href="javascript:void();" opt-chart='chart3' class='change-icon' ng-click='doGetDataCatalog("chart3")'>↗</a>	
			</div>
			<div class="grid grid4" >
				<div id="chart4" class="chart "></div>
				<a href="javascript:void();" opt-chart='chart4' class='change-icon' ng-click='doGetDataCatalog("chart4")'>↗</a>	
			</div>
		</div>
	</div>
	<div class="row row2">
		<div class="col row2-col1">
			<div class="grid grid5" >
				<div id="chart5" class="chart"></div>	
				<a href="javascript:void();" opt-chart='chart5' class='change-icon' ng-click='doGetDataCatalog("chart5")'>↗</a>	
			</div>		
		</div>
		<div class="col row2-col2">
			<div class="grid grid6" >
				<div id="chart6" class="chart"></div>		
				<a href="javascript:void();" opt-chart='chart6' class='change-icon' ng-click='doGetDataCatalog("chart6")'>↗</a>	
			</div>			
		</div>
		<div class="col row2-col3">
			<div class="grid grid7" >
				<div id="chart7" class="chart"></div>		
				<a href="javascript:void();" opt-chart='chart7' class='change-icon' ng-click='doGetDataCatalog("chart7")'>↗</a>	
			</div>					
		</div>
	</div>


  
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">  
    <div class="modal-dialog" role="document">  
        <div class="modal-content">  
            <div class="modal-header">  
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">  
                    <span aria-hidden="true">×</span>  
                </button>  
                <h4 class="modal-title" id="myModalLabel">可选统计数据种类</h4>  
            </div>  
            <div class="modal-body">  
                <div class='sjzl-list'>
					<ul><li ng-repeat="sjzl in lists"><a class='btn' ng-click='doSelectChart(sjzl)'>{{sjzl.dataTitle}}</a></li></ul>
				</div>
            </div>  
            <div class="modal-footer">  
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button> 
            </div>  
        </div>  
    </div>  
</div>  
  
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">  
    <div class="modal-dialog" role="document">  
        <div class="modal-content">  
            <div class="modal-header">  
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">  
                    <span aria-hidden="true">×</span>  
                </button>  
                <h4 class="modal-title" id="myModalLabel">选择{{curr.sjzl.dataTitle}}展示图形</h4>  
            </div>  
            <div class="modal-body">  
				<div class='graphicType-list'>
					<div class="form-group">  
					<label  class="control-label">可选图形种类：</label>
					<ul><li ng-repeat="g in curr.graphicTypes"><input type='radio' name='radioGraphicType' ng-model='curr.graphicType' 
					value='{{g.type}}'>{{g.text}}</li></ul>
					</div>
				</div>
				<div class='graphic-set' >  
                    <div class="form-group">  
                        <label for="recipient-name" class="control-label">图形维度:</label>  
                        <select ng-model='curr.dimCode' ng-options='p.dimCode as p.dimName for p in curr.dims'></select>
                    </div>  
                    <div class="form-group">  
                        <label for="recipient-name" class="control-label">周期设置:</label>  
                        <select ng-model='curr.periodType' ng-options='p.type as p.text for p in curr.periodTypes'></select>
                        <select ng-model='curr.contrastType' ng-options='p.type as p.text for p in curr.contrastTypes'></select>
                    </div>  
                    <div class="form-group" ng-show='curr.graphicType=="bar" || curr.graphicType=="line"'>  
                        <label for="message-text" class="control-label">显示数据种类:</label>  
                        <div class='values-list'>
                        	<div   ng-repeat='v in curr.values'>
                        	<input type='checkbox' id='{{v.dimCode}}' value-name='{{v.dimName}}' value='{{v.dimCode}}' name='valueType' 
                        	index="{{$index}}" ng-click='doClickValueType(v)' /><span>{{v.dimName}}</span></div>
                        </div>
                    </div>  
                    <div class="form-group" ng-show='curr.graphicType=="pie"'>  
                        <label for="message-text" class="control-label">显示数据种类:</label>  
                        <div class='values-list'>
                        	<div   ng-repeat='v in curr.values'>
                        	<input type='radio' id='radio{{v.dimCode}}' ng-model='curr.valueType' value='{{$index}}'
                        	index="{{$index}}" name='radioValueType' /><span>{{v.dimName}}</span></div>
                        </div>
                    </div>  
                </div>  
            </div>  
            <div class="modal-footer">  
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>  
                <button type="button" class="btn btn-primary" ng-click="doChangeGraphic()">确定</button>  
            </div>  
        </div>  
    </div>  
</div>  
  
    
  </body>  
</html>  