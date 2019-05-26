<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://api.map.baidu.com/library/GeoUtils/1.2/src/GeoUtils_min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=VKXUs38QIm3FTFxM4SkHBEl86c4RdaMC"></script>
<script type="text/javascript">
var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tradeList').bootstrapTable({
            url: 'illegalCarList.action',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: true,                     //是否启用排序
            buttonsAlign:'right',
            pageSize:8,
            sortOrder: "asc",                   //排序方式
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			vehicle_region_code:$("#vehicle_region_code").val(),
            			company_id:$("#company_id").val()
              	};
              	return param;
            },
            clickToSelect: true,                //是否启用点击选中行
            height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            columns: [{
                field: 'userId',
                align: 'center',
                title: '序号',
                formatter:function(value, row, index){
                	return index+1;
                }
            }, {
                field: 'company_id',
                align: 'center',
                title: '网约车公司社会信用代码'
            }, {
                field: 'vehicle_no',
                align: 'center',
                title: '车辆号牌'
            },{
                field: 'vehicle_region_code',
                align: 'center',
                title: '行政区划代码'
            },{
                field: 'longitude',
                align: 'center',
                title: '车辆经度'
            }, {
                field: 'latitude',
                align: 'center',
                title: '车辆纬度'
            }, {
                field: 'mileage',
                align: 'center',
                title: '行驶里程'
            }, {
                field: 'veh_status',
                align: 'center',
                title: '车辆状态'
            }, {
                field: 'biz_status',
                align: 'center',
                title: '营运状态'
            }, {
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
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
	                	var html = "<button type='button' class='btn btn-default' onclick='toUpdate(\""+row.id+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >明细</button>";
						return html;
                }
            }]
        });
    };
    return oTableInit;
};
$(function() {
    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
    $('#search').click(function () {  
    	$('#tradeList').bootstrapTable('refresh');
    });
});
//添加回车事件
document.onkeydown=function(event){
    var e = event || window.event || arguments.callee.caller.arguments[0];
    if(e && e.keyCode==13){ // enter 键
	    $('#tradeList').bootstrapTable('refresh');
    }
};
function toUpdate(id){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="违规车辆明细";
	 diag.URL = '<%=basePath%>supervise/illegalCarDetail.action?id='+id;
	 diag.Width = 1200;
	 diag.Height = 1000;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
		$('#tradeList').bootstrapTable('refresh');
	 };
	 diag.show();
}
</script>
</head>
<body>
	<div class="panel-body">
		<div class="page-header">
			<h1 style="font-size:15px;">
				运行监测
				<small style="font-size: 15px;">
					<i class="icon-double-angle-right"></i>
					违规车辆情况
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="vehicle_region_code">行政区划代码</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" class="form-control"  id="vehicle_region_code"/>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="company_id">网约车公司社会信用代码</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" class="form-control"  id="company_id"/>
                        </div>
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
		<table id="tradeList" >
   		</table>
	</div>
</body>
</html>