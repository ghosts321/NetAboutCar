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
/* 	var tabtype = "${tabType}";
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
	} */
	/* $("#beginTime").val("${m.beginTime}");
	$("#endTime").val("${m.endTime}"); */
	//日期控件
   	$('.date-picker').datepicker();
   	$('#search').click(function () {  
    	$("#form1").submit();
    });
  /* 
        $("#beginTime").val("");
    	$("#endTime").val("");
    	$("#form1").submit(); */
   
});
</script>
</head>
<body>
	<div class="panel-body" style="padding-bottom:0px;">
		<div class="page-header">
			<h1 style="font-size:15px;">
			  平台投诉信息统计
				
			</h1>
		</div>
		<div>
			
		  	<div style="padding-top:10px;" class="tab-content">
		  		<div class="panel panel-default">
		            <div class="panel-body">
		            	<span class="title">查询条件</span>
		                <form action="<%=basePath %>complaint/comComplaintStatistics.action" method="post" name="form1" id="form1" class="form-horizontal">
		                    <div class="form-group">
		                    	<div id="addressInfo">
									<label class="control-label col-sm-1" style="font-weight: normal;" for="compn_compy">平台名称</label>
			                        <div class="col-sm-1" style="padding-right: 5px;padding-left: 0px">
										<select id="compn_compy" name="compn_compy" placeholder="平台名称">
											<option value="">全部</option>
											<c:forEach items="${addressList}" var="add">
												<option value="${add.comname}">${add.comname}</option>
											</c:forEach>
				                        </select>
			                        </div>
								</div>
		                        <!-- <label class="control-label col-sm-1" style="font-weight: normal;">投诉时间</label>
		                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px; ">
									<input type="text" class="date-picker" name="beginTime" id="beginTime" placeholder="开始时间" data-date-format="yyyy-mm-dd"/>
		                        </div>
		                        
		                        <label class="control-label col-sm-1" style="font-weight: normal;">结束时间</label>
		                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px;">
									<input type="text" class="date-picker" name="endTime" id="endTime" placeholder="结束时间" data-date-format="yyyy-mm-dd"/>
		                        </div> -->
		                        
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
		        text: '平台投诉信息统计分析',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient : 'vertical',
		        x : 'left',
		        data:['待提交','待受理','待处理','待反馈','已完结']
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
		            name:'投诉统计',
		            type:'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:[
		                {value:'${map.a}', name:'待提交'},
		                {value:'${map.b}', name:'待受理'},
		                {value:'${map.c}', name:'待处理'},
		                {value:'${map.d}', name:'待反馈'},
		                {value:'${map.e}', name:'已完结'},
		               
		            ]
		        }
		    ]
		};
          myChart.setOption(option, true);
          
          
          var barChart = ec.init(document.getElementById('barMap'));  
          //定义图表option  
          barOption = {
       		    title : {
      		        text: '平台投诉信息统计',
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
			            data:['待提交','待受理','待处理','待反馈','已完结']
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
			            data:['${map.a}', '${map.b}', '${map.c}', '${map.d}', '${map.e}']
			        }
			    ]
			};
          barChart.setOption(barOption, true);
          
      }  
  );  
  </script>  
</body>
</html>