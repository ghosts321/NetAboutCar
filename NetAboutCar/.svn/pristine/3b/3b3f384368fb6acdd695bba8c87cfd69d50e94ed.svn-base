<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../../common.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.col-sm-3{
 width: 14%;
}
.col-sm-1 {
    width: 11.333333%;
}
.panel{
 margin-bottom: 0px;
}

#alginLeft{
 float: right !important;
}
.pagination{
 padding-right: 5px;
}
</style>
<script type="text/javascript">
var TableInit = function () {
	var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tradeList').bootstrapTable({
            url: 'getSpecificCarList.action', 	//请求后台的URL（*）
            method: 'post',                     //请求方式（*）
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
            			vehicleNo:$("#vehicleNo").val()
              	};
              	return param;
            },
            toolbar: '#toolbar',
            clickToSelect: true,                //是否启用点击选中行
            //height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            columns: [{
            	checkbox:true,
            },{
                field: 'comname',
                align: 'center',
                title: '网约车公司名称'
            }, {
                field: 'vehicle_no',
                align: 'center',
                title: '车牌号'
            },{
                field: 'order_id',
                align: 'center',
                title: '接单状态',
                formatter:function(value, row, index){
                   	if(value == "" || value == null){
                   		return "空闲";
                   	}else{
                   		var html = "<font color='green'>已接单，订单号：</font>";
                   		return html+""+value;
                   	}
                }
            },{
                field: 'warnStatus',
                align: 'center',
                title: '预警状态',
                formatter:function(value, row, index){
                   	if(value == 1){
                   		return "<font color='red'>'报警'</font>";;
                   	}else{
                   		return "正常";
                   	}
                }
            }]
        });
    };
     //得到查询的参数
	return oTableInit;
};

$(function(){
	//初始化Table
    var oTable = new TableInit();
    oTable.Init();
});

//删除左右两端的空格
function trim(str){
    return str.replace(/(^\s*)|(\s*$)/g, "");
}

// 追踪车辆验证
function trace(){
	//获取输入的车牌号并验证
	var vehicleNo = trim($("#vehicleNo").val());
	$("#vehicleNo").val(vehicleNo);
	if(vehicleNo==""){
		$("#vehicleNo").tips({
			side:3,							//提示窗显示位置  1，2，3，4 分别代表 上右下左 默认为1（上） 可选
            msg:'请输入要追踪的车牌号',		//提示消息  必填
            bg:'#AE81FF',					//提示窗背景色 默认为红色 可选
            time:2							//自动关闭时间 默认2秒 设置0则不自动关闭 可选
        });
		$("#vehicleNo").focus();
		return false;
	}
	
	var url = "<%=basePath%>supervise/vftionVehicleNo.action";
	$.post(url, {vehicleNo: vehicleNo} ,function(result){
		if(result == "1"){
			alert("此车牌号正在追踪！");
			
		} else if(result == "3"){
			alert("追踪车牌号不存在！");
			
		} else if(result == "2"){
			$('#tradeList').bootstrapTable('refresh');			//重新加载列表
			window.parent.baiduMap.toMapAddTrace();				//地图上添加此车辆运行轨迹
		}
	});
}

// 取消追踪车辆
function cancelTrace(){
	var selections =  $('#tradeList').bootstrapTable('getSelections');
	if(selections.length<1){
		alert("请选择要取消追踪的车辆！");
		return false;
	}
	var operatingids = [];
	$.each(selections,function(i,d){
		operatingids.push(d.vehicle_no);
	});
	var url = "<%=basePath%>supervise/deleteCarList.action";
	$.post(url,{operatingids:operatingids.join(',')},function(result){
		if(result=="success"){
			alert("取消追踪成功！");
			$('#tradeList').bootstrapTable('refresh');				//重新加载列表
			window.parent.baiduMap.toMapRemTrace(operatingids);		//地图上取消此车辆运行轨迹
		}else{
			alert("取消追踪失败！");
		}
	});
}
</script>
</head>
<body>
	<div class="panel-body" style="padding-bottom:0px;">
       <div class="panel panel-default"  style="height:70px;">
            <div class="panel-body"  style="height:60px;">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:6px;"> 
                        <label class="control-label col-sm-1" style="font-weight: normal;width: 80px;float: left;margin-top: 8px;" for="vehicleNo">车牌号</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px;width: 150px;float: left;">
							<input type="text" class="form-control" id="vehicleNo" placeholder="请输入要追踪车牌号"/>
                        </div>
                        
                        <div class="col-sm-4" style="text-align:left; padding-left:30px;float: left;">
                            <button type="button" style="margin-left:10px" id="search" class="btn btn-primary" onclick="trace();">追踪</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        
        <div id="toolbar" class="btn-group">
			<div>
	            <button id="btn_delete" type="button" class="btn btn-default" onclick="cancelTrace();">
					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>取消追踪
				</button>
			</div>
   	    </div>
        
		<table id="tradeList">
		</table>
	</div>
</body>
</html>