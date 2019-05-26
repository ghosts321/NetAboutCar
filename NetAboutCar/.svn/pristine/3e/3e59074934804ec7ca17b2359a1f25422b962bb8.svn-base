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
			<h1 style="font-size:15px;">
				运营监管
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					接单时长分析
				</small>
			</h1>
		</div>
		<div>
			<ul class="nav nav-tabs" role="tablist" id="myTab">
			  <li role="presentation" class="active"><a href="#addressInfo" aria-controls="addressInfo" role="tab" data-toggle="tab" onfocus="this.blur();">全市订单分析</a></li>
			  <li role="presentation"><a href="#companyInfo" aria-controls="companyInfo" role="tab" data-toggle="tab" onfocus="this.blur();">平台经营者分析</a></li>
		  	</ul>
		  	<div style="padding-top:10px;" class="tab-content">
		  		<div class="panel panel-default">
		            <div class="panel-body">
		            	<span class="title">查询条件</span>
		                <form action="<%=basePath %>supervise/orderReceivingTime.action" method="post" name="form1" id="form1" class="form-horizontal">
		                    <div class="form-group">
		                    	<div id="addressInfo">
									<label class="control-label col-sm-1" style="font-weight: normal;" for="company_name">区域</label>
			                        <div class="col-sm-1" style="padding-right: 5px;padding-left: 0px">
										<select id="address" name="address" placeholder="区域">
											<option value="">全部</option>
											<c:forEach items="${addressList}" var="add">
												<option value="${add.address}">${add.areaname}</option>
											</c:forEach>
				                        </select>
			                        </div>
								</div>
								
								<div id="companyInfo" style="display:none;">
									<label class="control-label col-sm-1" style="font-weight: normal;" for="company_name">平台</label>
			                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
										<select id="companyId" name="companyId" placeholder="平台">
											<option value="">全部</option>
											<c:forEach items="${companyList}" var="com">
												<option value="${com.company_id}">${com.comname}</option>
											</c:forEach>
				                        </select>
			                        </div>
								</div>
		                        
		                        <label class="control-label col-sm-1" style="font-weight: normal;">开始时间</label>
		                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px; ">
									<input type="text" class="date-picker" name="beginTime" id="beginTime" placeholder="开始时间" data-date-format="yyyy-mm-dd"/>
		                        </div>
		                        
		                        <label class="control-label col-sm-1" style="font-weight: normal;">结束时间</label>
		                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px;">
									<input type="text" class="date-picker" name="endTime" id="endTime" placeholder="结束时间" data-date-format="yyyy-mm-dd"/>
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
          'echarts/chart/line'
      ],  
      function (ec) {  
          var myChart = ec.init(document.getElementById('mainMap'));  
          option = {
		    title : {
		        text: '车辆接单时长分析',
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
      		        text: '车辆接单时长分析',
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