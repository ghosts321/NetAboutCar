<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../../common.jsp" %>
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
.pagination{
 	padding-right: 5px;
}
</style>
<script type="text/javascript">
var timeID;
var timeActID;

$(function(){
	 //1.初始化Table
    var oTable = new TableInit();
    
 	$('#search').click(function () {  
		$('#tradeList').bootstrapTable('refresh');
    });

	var tabtype = "${tabType}";
	if("3" == tabtype){			//聚集区域
    	clearTimeout(timeID);
    	timeActive();
    	
		oTable.globalArea();	//获取聚集区域列表
		$("#tabType").val("3");
		$("#alertCar").css('display','none');
    	$("#violationCar").css('display','none');
    	$("#globalArea").css('display','');
		$('#myTab a:last').tab('show');
	}else if("2" == tabtype){	//违规车辆
		clearTimeout(timeID);
		clearTimeout(timeActID);
    	time();
    	
		oTable.violationCar();	//获取违规车辆列表
		$("#tabType").val("2");
		$("#alertCar").css('display','none');
    	$("#violationCar").css('display','');
    	$("#globalArea").css('display','none');
		$('#myTab li:eq(1) a').tab('show');
	}else{						//报警车辆
		clearTimeout(timeID);
		clearTimeout(timeActID);
    	time();
    	
		oTable.alertCar();		//获取报警车辆列表
		$("#tabType").val("1");
		$("#alertCar").css('display','');
    	$("#violationCar").css('display','none');
    	$("#globalArea").css('display','none');
	}
   	
   	//标签点击时触发事件
   	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
         // 获取已激活的标签页的名称
        var activeTab = $(e.target).text();
        if("报警车辆" == activeTab){
        	$("#tabType").val("1");
        }else if("违规车辆" == activeTab){
        	$("#tabType").val("2");
        }else if("聚集区域" == activeTab){
        	$("#tabType").val("3");
        }
    	$("#formSearch").submit();
    });
});

// 违规车辆处理
function dispose(id){
	var flag = false;
	if(confirm("处理后将删除此条记录，确定处理吗？")){
		flag = true;
	}
	if(flag){
		var url = "<%=basePath%>supervise/disposeDel.action";
		$.post(url,{id:id},function(result){
			if(result=="success"){
				alert("处理成功！");
			}else{
				alert("处理失败！");
			}
		});
	}
}

//报警车辆、违规车辆 页面定时刷新
function time(){
	$('#tradeList').bootstrapTable('refresh');
	timeID = setTimeout('time()',3000);
}

//聚集区域 页面定时刷新
function timeActive(){
	var areaIds = window.parent.baiduMap.getAreaIds();	//获取聚集区域的id集合，以及每个区域内当前车辆个数
	$("#areas").val(areaIds);
	
	$('#tradeList').bootstrapTable('refresh');

	timeActID = setTimeout('timeActive()',2000);
}

//添加回车事件
document.onkeydown=function(event){
    var e = event || window.event || arguments.callee.caller.arguments[0];
    if(e && e.keyCode==13){ // enter 键
	    $('#tradeList').bootstrapTable('refresh');
    }
};

var TableInit = function () {
	var oTableInit = new Object();
    //报警车辆列表
    oTableInit.alertCar = function () {
    	window.parent.baiduMap.getAlertCar();				//调用地图js，在地图上实时加载全部车辆
    	
        $('#tradeList').bootstrapTable({
            url: 'getAlertMessage.action?type='+1,         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            pageSize: 10,						//每页显示数据条数
            sortable: false,                    //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'right',
            sortOrder: "asc",                   //排序方式
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			vehicle_no:$("#vehicle_no").val()
              	};
              	return param;
            },
            toolbar: '#toolbar',
            clickToSelect: true,                //是否启用点击选中行
            //height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            columns: [{
                field: 'index',
                align: 'center',
                width:'3%',
                title: '序号',
                formatter:function(value, row, index){
                	return index+1;
                }
            },{
                field: 'comname',
                align: 'center',
                title: '网约车公司名称'
            },{
                field: 'vehicle_no',
                align: 'center',
                title: '车牌号'
            },{
                field: 'position_time',
                align: 'center',
                title: '报警时间'
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
	                	var html = "<button type='button' class='btn btn-default' onclick='toUpdate(\""+row.id+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >处理</button>";
						return html;
                }
            }]
        });
    };
  	//违规车辆列表
    oTableInit.violationCar = function () {
    	window.parent.baiduMap.getViolationCar();	//调用地图js，在地图上显示违规车辆
    	alert("违规车辆已在地图上实时显示");
    	
        $('#tradeList').bootstrapTable({
            url: 'getAlertMessage.action?type='+2,         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            pageSize: 10,						//每页显示数据条数
            sortable: false,                    //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'right',
            sortOrder: "asc",                   //排序方式
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			vehicle_no:$("#vehicleNo").val(),
            			illegal_type:$("#illegal_type").val()
              	};
              	return param;
            },
            toolbar: '#toolbar',
            clickToSelect: true,                //是否启用点击选中行
            //height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            columns: [{
                field: 'index',
                align: 'center',
                width:'3%',
                title: '序号',
                formatter:function(value, row, index){
                	return index+1;
                }
            },{
                field: 'comname',
                align: 'center',
                title: '网约车公司名称'
            },{
                field: 'vehicle_no',
                align: 'center',
                title: '车牌号'
            },{
                field: 'illegal_type',
                align: 'center',
                title: '违规类型',
               	formatter:function(value, row, index){
                   	if(value==0){
                   		return "禁止驶入";
                   	}else if(value==1){
                   		return "禁止驶出";
                   	}else{
                   		return "人车不对应";
                   	}
                 }
            },{
                field: 'remark',
                align: 'center',
                title: '备注'
            },{
                field: 'position_time',
                align: 'center',
                title: '违规时间'
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
	                	var html = "<button type='button' class='btn btn-default' onclick='dispose(\""+row.id+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >处理</button>";
						return html;
                }
            }]
        });
    };
  	//聚集区域列表
    oTableInit.globalArea = function () {
    	window.parent.baiduMap.getGlobalCar();				//调用地图js，在地图上显示聚集区域
    	alert("聚集区域已在地图上实时显示");
    	
        $('#tradeList').bootstrapTable({
            url: 'getAlertMessage.action?type='+3,         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            pageSize: 10,						//每页显示数据条数
            sortable: false,                    //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'right',
            sortOrder: "asc",                   //排序方式
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			place_name:$("#place_name").val(),
            			areaIds:$("#areas").val()
              	};
              	return param;
            },
            toolbar: '#toolbar',
            clickToSelect: true,                //是否启用点击选中行
            //height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            columns: [{
                field: 'index',
                align: 'center',
                width:'3%',
                title: '序号',
                formatter:function(value, row, index){
                	return index+1;
                }
            },{
                field: 'place_name',
                align: 'center',
                title: '聚集区域名称'
            },{
                field: 'time_rate',
                align: 'center',
                title: '时间频率'
            },{
                field: 'car_warning_val',
                align: 'center',
                title: '预警阈值'
            },{
                field: 'car_alarm_val',
                align: 'center',
                title: '报警阈值',
            },{
                field: 'count',
                align: 'center',
                title: '当前区域车辆数',
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
	                	var html = "<button type='button' class='btn btn-default' onclick='toUpdate(\""+row.id+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >处理</button>";
						return html;
                }
            }]
        });
    };
    
    //得到查询的参数
	return oTableInit;
};
</script>
</head>
<body>
	<div class="panel-body" style="padding-bottom:0px;">
		<div>
			<ul class="nav nav-tabs" role="tablist" id="myTab">
			  <li role="presentation" class="active"><a href="#alertCar" aria-controls="alertCar" role="tab" data-toggle="tab" onfocus="this.blur();">报警车辆</a></li>
			  <li role="presentation"><a href="#violationCar" aria-controls="violationCar" role="tab" data-toggle="tab" onfocus="this.blur();">违规车辆</a></li>
			  <li role="presentation"><a href="#globalArea" aria-controls="globalArea" role="tab" data-toggle="tab" onfocus="this.blur();">聚集区域</a></li>
		  	</ul>
		  	<div style="padding-top:10px;" class="tab-content">
		  		<div class="panel panel-default">
		            <div class="panel-body">
		            	<span class="title">查询条件</span>
		                <form id="formSearch" class="form-horizontal">
		                    <div class="form-group">
		                    	<div id="alertCar">
									<label class="control-label col-sm-1" style="font-weight: normal;width: 110px;float: left;margin-top: 8px;" for="vehicle_no">报警车牌号</label>
			                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px;width: 150px;float: left;">
										<input type="text" class="form-control" id="vehicle_no" placeholder="请输入报警车牌号"/>
			                        </div>
								</div>
								
								<div id="violationCar">
									<label class="control-label col-sm-1" style="font-weight: normal;width: 110px;float: left;margin-top: 8px;" for="vehicleNo">违规车牌号</label>
			                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px;width: 130px;float: left;">
										<input type="text" class="form-control" id="vehicleNo" placeholder="请输入违规车牌号"/>
			                        </div>
			                        <label class="control-label col-sm-1" style="font-weight: normal;float: left;margin-top: 8px;" for="illegal_type">违规类型</label>
			                        <div class="col-sm-1" style="padding-right: 5px;padding-left: 0px;float: left;">
				                      	<select style="width:110px;margin-top:1px;" name=illegal_type id="illegal_type" class="form-control" >
								         <option value="" >全部</option>
								         <option value="0">禁止驶入</option>  
								         <option value="1">禁止驶出</option>
								         <option value="2">人车不对应</option>
								        </select>
							        </div> 
								</div>
								
								<div id="globalArea">
									<label class="control-label col-sm-1" style="font-weight: normal;width: 125px;float: left;margin-top: 8px;" for="place_name">聚集区域名称</label>
			                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px;width: 150px;float: left;">
										<input type="text" class="form-control" id="place_name" placeholder="请输入聚集区域名称"/>
			                        </div>
									<input type="hidden" name="areas" id="areas"/>
								</div>
		                        
		                        <div class="col-sm-4" style="text-align:left; padding-left:10px;float: left;">
		                        	<input type="hidden" name="tabType" id="tabType" value="1"/>
		                            <button type="button" style="margin-left:30px" id="search" class="btn btn-primary">查询</button>
		                        </div>
		                    </div>
		                </form>
		            </div>
		        </div>
			</div>
		</div>
		
		<table id="tradeList">
		</table>
	</div>
</body>
</html>