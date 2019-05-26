<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../../common.jsp" %>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/echarts/js/echarts.js"></script>
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
$(function(){
	var tabtype = "${tabType}";
	if("2" == tabtype){	//人员统计
		$("#tabType").val("2");
		$("#countAuditCar").css('display','none');
    	$("#countPeople").css('display','');
		$('#myTab a:last').tab('show');
	}else{						//车辆统计
		$("#tabType").val("1");
		$("#countAuditCar").css('display','');
    	$("#countPeople").css('display','none');
	}
   	
   	//标签点击时触发事件
   	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
         // 获取已激活的标签页的名称
        var activeTab = $(e.target).text();
        if("车辆统计" == activeTab){
        	$("#tabType").val("1");
        }else if("人员统计" == activeTab){
        	$("#tabType").val("2");
        }
   		$("#formSearch").submit();
    });
});

</script>
</head>
<body>
	<div class="panel-body" style="padding-bottom:0px;">
		<div>
			<ul class="nav nav-tabs" role="tablist" id="myTab">
			  <li role="presentation" class="active"><a href="#countAuditCar" aria-controls="countAuditCar" role="tab" data-toggle="tab" onfocus="this.blur();">车辆统计</a></li>
			  <li role="presentation"><a href="#countPeople" aria-controls="countPeople" role="tab" data-toggle="tab" onfocus="this.blur();">人员统计</a></li>
		  	</ul>
		  	<form id="formSearch" class="form-horizontal">
				<input type="hidden" name="tabType" id="tabType" value="1"/>
		  	</form>
		</div>
		<div id="showData" style="float:left; height:400px; width:600px;margin-left: -25px;margin-top: 10px;">
		</div>
	</div>
	<script type="text/javascript">
	 require.config({
        paths: {
            echarts: '${pageContext.request.contextPath}/echarts/js'
        }
     });
     require(
        [
            'echarts',
            'echarts/chart/bar'
        ],
         function (ec) {
            //--- 折柱 ---
            var xData=[];
			var yOneData=[];
			var yTwoData=[];
			var tabtype = "${tabType}";
            $.ajaxSetup({   
	            async : false  
	        }); 
            
            if("2" == tabtype){
            	perpleCount(ec, xData, yOneData);
            }
            else{
            	carCount(ec, xData, yOneData, yTwoData);
            }
         }
     );
	 
     /**
      * 车辆统计
      */
	 function carCount(ec, xData, yOneData, yTwoData){
		 var url = "<%=basePath%>totalMap/countAuditCar.action";
         $.post(url,function(data){
         if(data != null){
         	for(var i=0;i<data.length;i++){
				xData.push(data[i].comname);
         		yOneData.push(data[i].auditPassCount);
         		yTwoData.push(data[i].onlineCount);
 			};
         	 var myChart = ec.init(document.getElementById('showData'));
         	 myChart.setOption({
         		 	tooltip : {
         		        trigger: 'axis'
         		    },
         		    legend: {
         		        data:['全部车辆','在线车辆']
         		    },
         		    calculable : true,
         		    xAxis : [
         		        {
         		            type : 'category',
         		            data : xData
         		        }
         		    ],
         		    yAxis : [
         		        {
         		            type : 'value'
         		        }
         		    ],
         		    series : [
         		        {
         		            name:'全部车辆',
         		            type:'bar',
         		            data:yOneData
         		        },
         		        {
         		            name:'在线车辆',
         		            type:'bar',
         		            data:yTwoData
         		        }
         		    ] 
         	 });
         	}
         }); 
	 }  
	 
	 /**
      * 人员统计
      */
	 function perpleCount(ec, xData, yData){
		 var url = "<%=basePath%>totalMap/countPeople.action";
         $.post(url,function(data){
         if(data != null){
         	for(var i=0;i<data.length;i++){
				xData.push(data[i].comname);
         		yData.push(data[i].peopleCount);
 			};
         	 var myChart = ec.init(document.getElementById('showData'));
         	 myChart.setOption({
         		    color: ['#3398DB'],
	       		    tooltip : {
	       		        trigger: 'axis',
	       		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	       		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	       		        }
	       		    },
	       		    grid: {
	       		        left: '3%',
	       		        right: '4%',
	       		        bottom: '3%',
	       		        containLabel: true
	       		    },
	       		    xAxis : [
	       		        {
	       		            type : 'category',
	       		            data : xData,
	       		            axisTick: {
	       		                alignWithLabel: true
	       		            }
	       		        }
	       		    ],
	       		    yAxis : [
	       		        {
	       		            type : 'value'
	       		        }
	       		    ],
	       		    series : [
	       		        {
	       		            name:'人员统计',
	       		            type:'bar',
// 	       		            barWidth: '30%',
	       		            data: yData
	       		        }
	       		    ]
         	 });
         	}
         }); 
	 }
	</script>
</body>
</html>