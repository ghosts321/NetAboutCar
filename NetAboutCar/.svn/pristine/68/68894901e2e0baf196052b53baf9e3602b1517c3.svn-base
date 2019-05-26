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
            url: 'notOperateCarList.action',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            pageSize:8,							//每页显示数据条数
            sortable: false,                     //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'right',
            toolbar:'#toolbar',
            sortOrder: "asc",                   //排序方式
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			region_code:$("#region_code").val(),
            			company_id:$("#company_id").val()
              	};
              	return param;
            },
            //toolbar: '#toolbar',
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
                field: 'region_code',
                align: 'center',
                title: '行政区划代码'
            },{
                field: 'region_name',
                align: 'center',
                title: '行政区划名称'
            },{
                field: 'company_id',
                align: 'center',
                title: '网约车公司标识'
            },{
                field: 'company_name',
                align: 'center',
                title: '网约车公司名称'
            },{
                field: 'license_id',
                align: 'center',
                title: '车主身份证'
            },{
                field: 'driver_name',
                align: 'center',
                title: '车主姓名'
            },{
                field: 'vehicle_no',
                align: 'center',
                title: '车辆牌号'
            },{
                field: 'begin_time',
                align: 'center',
                title: '监测开始时间'/* ,
                formatter:function(value, row, index){
                	if (value.length == 22 || value.length == 21) {
                        var reg = /\/Date\(([-]?\d+)\)\//gi;
                        if (reg.test(value)) {
                            var msec = value.toString().replace(reg, "$1");
                            value = new Date(parseInt(msec)).Format('yyyy-MM-dd hh:mm:ss');
                        }
                    }
                } */
            },{
                field: 'end_time',
                align: 'center',
                title: '监测结束时间'/* ,
                formatter:function(value, row, index){
                	if (value.length == 22 || value.length == 21) {
                        var reg = /\/Date\(([-]?\d+)\)\//gi;
                        if (reg.test(value)) {
                            var msec = value.toString().replace(reg, "$1");
                            value = new Date(parseInt(msec)).Format('yyyy-MM-dd hh:mm:ss');
                        }
                    }
                } */
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
				<i class="icon-double-angle-right"></i>长期未运营车辆情况
				</small>
			</h1>
		</div>
        <div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">行政区划代码</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                            <input class="form-control" type="text" id="region_code" placeholder="请输入行政区划代码"/>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">网约车公司标识</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                            <input class="form-control" type="text"  id="company_id" placeholder="请输入网约车公司标识"  />
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