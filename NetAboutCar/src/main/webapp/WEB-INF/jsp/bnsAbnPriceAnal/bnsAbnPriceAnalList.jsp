<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp"%>
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
            url: 'getBnsAbnPriceAnalList.action',         //请求后台的URL（*）
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
            toolbar:"#toolbar",
            sortOrder: "asc",                   //排序方式
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			comname:$("#comname").val(),
            			onArea:$("#onArea").val(),
            			beginTime:$("#beginTime").val(),
            			endTime:$("#endTime").val()
              	};
              	return param;
            },
            toolbar: '#toolbar',
            clickToSelect: true,                //是否启用点击选中行
            //height: 420,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "comname",                     //每一行的唯一标识，一般为主键列
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
                title: '公司名称'
            }, {
                field: 'orderTotal',
                align: 'center',
                title: '订单总数'
            },{
                field: 'exceptionTotal',
                align: 'center',
                title: '运价异常订单数'
            },{
                field: 'abnormalRate',
                align: 'center',
                title: '异常率(%)'
            }]
        });
    };
    //得到查询的参数
	return oTableInit;
};

$(function(){
	//日期控件
   	$('.date-picker').datepicker();
	 //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
    $('#search').click(function () {  
    	//日期条件非空校验
    	var result = true;
    	if(verification() == false){
    		result = false;
    	}
    	if(result){
	    	$('#tradeList').bootstrapTable('refresh');
    	}; 
    });
});

// 日期选择校验
function changeDateValue(){
	var beginTime = $("#beginTime").val();
	var endTime = $("#endTime").val();	
	
	var arr = beginTime.split("-");
    var begintime = new Date(arr[0], arr[1], arr[2]);
    var begintimes = begintime.getTime();

    var arrs = endTime.split("-");
    var endtime = new Date(arrs[0], arrs[1], arrs[2]);
    var endtimes = endtime.getTime();

	if(endTime == "" || begintimes > endtimes){ //开始时间大于结束时间时，设置结束时间的值为开始时间
		$("#endTime").val(beginTime);
	}
}
function changeDateValue1(){
	var beginTime = $("#beginTime").val();
	var endTime = $("#endTime").val();	
	
	var arr = beginTime.split("-");
    var begintime = new Date(arr[0], arr[1], arr[2]);
    var begintimes = begintime.getTime();

    var arrs = endTime.split("-");
    var endtime = new Date(arrs[0], arrs[1], arrs[2]);
    var endtimes = endtime.getTime();

	if(beginTime == "" || begintimes > endtimes){ //开始时间大于结束时间时，设置结束时间的值为开始时间
		$("#beginTime").val(endTime);
	}
}

// 添加回车事件
document.onkeydown=function(event){
    var e = event || window.event || arguments.callee.caller.arguments[0];
    if(e && e.keyCode==13){ // enter 键
    	
    	//日期条件非空校验
    	var result = true;
    	if(verification() == false){
    		result = false;
    	}
    	if(result){
	    	$('#tradeList').bootstrapTable('refresh');
    	}; 
    }
};

// 日期查询条件非空校验
function verification() {
	if($("#beginTime").val() != "" &&  $("#endTime").val() == ""){
		$("#endTime").tips({
			side:3,
            msg:'请选择订单结束时间',
            bg:'#AE81FF',
            time:2
        });
		$("#endTime").focus();
		return false;
	}
	if($("#endTime").val() != "" &&  $("#beginTime").val() == ""){
		$("#beginTime").tips({
			side:3,
            msg:'请选择订单开始时间',
            bg:'#AE81FF',
            time:2
        });
		$("#beginTime").focus();
		return false;
	}
}

</script>
</head>
<body>
	<div class="panel-body" style="padding-bottom:0px;">
		<div class="page-header" >
			<h1 style="font-size: 15px;">
				运营分析<small style="font-size: 15px">
				<i class="icon-double-angle-right"></i>异常运价分析
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top: 10px">
                        <label class="control-label col-sm-1" style="font-weight: normal;width:100px;display:block;" for="comname">公司名称</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="comname" placeholder="请输入公司名称"/>
                        </div>
                        
                        <label class="control-label col-sm-1" style="font-weight: normal;width:80px;display:block;" for="onArea">区域</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="onArea" placeholder="请输入区域"/>
                        </div>
                        
                        <label class="control-label col-sm-1" style="font-weight: normal;">订单起止时间</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px; width:390px">
							从<input type="text" class="date-picker" id="beginTime" placeholder="请选择订单开始时间" data-date-format="yyyy-mm-dd" onchange="changeDateValue();"/>
							至<input type="text" class="date-picker" id="endTime" placeholder="请选择订单结束时间" data-date-format="yyyy-mm-dd" onchange="changeDateValue1();"/>
                        </div>
                        
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
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