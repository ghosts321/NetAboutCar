<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
var TableInit = function () {
	var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tradeList').bootstrapTable({
            url: 'operationOrderList.action',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sidePagination: 'server',            //服务器端分页
            pageSize:8,					        //每页显示数据个数
            sortable: false,                     //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'right',
            toolbar:'#toolbar',
            sortOrder: "asc",                   //排序方式
            queryParams: function queryParams(params) {   //设置查询参数  
            	console.log(params);
            	var param = {
            			vehicle_no:$("#vehicle_no").val(),
            			company_id:$("#company_id").val(),
            			limit:params.limit,
            			offset:params.offset
              	};
              	return param;
            },
            clickToSelect: true,                //是否启用点击选中行
            //height: 420,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "unoperating_car_id",                     //每一行的唯一标识，一般为主键列
            columns: [{
                field: 'index',
                align: 'center',
                width:'3%',
                title: '序号',
                formatter:function(value, row, index){
                	return index+1;
                }
            }, {
                field: 'companyId',
                align: 'center',
                title: '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;网约车公司标识&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
            },{
                field: 'orderId',
                align: 'center',
                title: '&nbsp;&nbsp;&nbsp;&nbsp;订单编号&nbsp;&nbsp;&nbsp;&nbsp;'
            },{
                field: 'onArea',
                align: 'center',
                title: '上车位置行政区划编号'
            },{
                field: 'driverName',
                align: 'center',
                title: '机动车驾驶员姓名'
            },{
                field: 'licenseiId',
                align: 'center',
                title: '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机动车驾驶证号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
            },{
                field: 'fareType',
                align: 'center',
                title: '运价类型编号'
            },{
                field: 'vehicleNo',
                align: 'center',
                title: '&nbsp;&nbsp;车辆号牌&nbsp;&nbsp;'
            },{
                field: 'book_dep_time',
                align: 'center',
                title: '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;预计上车时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
            },{
                field: 'driveMile',
                align: 'center',
                title: '载客里程'
            },{
                field: 'drive_time',
                align: 'center',
                title: '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;载客时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
            },{
                field: 'waitMile',
                align: 'center',
                title: '空驶里程'
            },{
                field: 'factPrice',
                align: 'center',
                title: '实收金额'
            },{
                field: 'price',
                align: 'center',
                title: '应收金额'
            },{
                field: 'cashPrice',
                align: 'center',
                title: '现金支付'
            },{
                field: 'payState',
                align: 'center',
                title: '结算状态'
            },{
                field: 'pay_time',
                align: 'center',
                title: '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;乘客结算时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
            },{
                field: 'order_match_time',
                align: 'center',
                title: '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单完成时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
            },{
                field: 'invoiceStatus',
                align: 'center',
                title: '发票状态'
            }]
        });
    };
    //得到查询的参数
	return oTableInit;
};
$(function(){
	 //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
    $('#search').click(function () {  
    	$('#tradeList').bootstrapTable('refresh');
    });
});
</script>
</head>
<body>
	<div class="panel-body">
		<div class="page-header" >
			<h1 style="font-size: 15px;">
				运营监管<small style="font-size: 15px">
				<i class="icon-double-angle-right"></i>网约车订单查询
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top: 15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="vehicle_no">车辆号牌</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="vehicle_no" placeholder="请输入车辆号牌"/>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="company_id">网约车公司标识</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="company_id" placeholder="请输入网约车公司标识" />
                        </div>
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:10px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
		<table id="tradeList">
		</table>
	</div>
</body>
</html>