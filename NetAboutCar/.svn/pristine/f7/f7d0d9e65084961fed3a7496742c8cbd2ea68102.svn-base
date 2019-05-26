<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(function() {
    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
    $('#search').click(function () {  
    	$('#tradeList').bootstrapTable('refresh');
    });
});
var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tradeList').bootstrapTable({
            url: 'findAllCarPermitcert.action',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            pageSize:8,							//每页显示数据条数
            search: false, 						//是否启用查询 
            sortable: true,                     //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'left',
            toolbar:"#toolbar",
            sortOrder: "asc",                   //排序方式
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			carNum:$("#carNum").val(),
            			certNo:$("#certNo").val()
              	};
              	return param;                   
            },
            clickToSelect: true,                //是否启用点击选中行
            height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "pcertno",                     //每一行的唯一标识，一般为主键列
           /*  pageNumber:1,                       //初始化加载第一页，默认第一页
            strictSearch: true,
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表 */
            columns: [{
                field: 'pcertno',
                align: 'center',
                title: '证书编号'
            }, {
                field: 'carnum',
                align: 'center',
                title: '车牌号'
            }, {
                field: 'enginenum',
                align: 'center',
                title: '发动机号'
            }, {
                field: 'receivedate',
                align: 'center',
                title: '行驶证初次登记'
            }, {
                field: 'certno',
                align: 'center',
                title: '身份证号'
            }, {
                field: 'senddate',
                align: 'center',
                title: '初次申领时间'
            },{
                field: 'enddate',
                align: 'center',
                title: '有效截止时间'
            }, {
                field: 'status',
                align: 'center',
                title: '状态',
                formatter:function(value, row, index){
                	if(row.status == 1){
                		return "正常";
                	}else if(row.status == 2){
                		return "吊销";
                	}else if(row.status == 3){
                		return "作废";
                	}
                }
            }, {
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
                	var html = "";
                	if(row.status == 2 || row.status == 3){
                		html += "<shiro:hasPermission name='carCertDeactive'><button type='button' class='btn btn-default' disabled onclick='deactive(\"" + row.applyid + "\",\"" + row.carid + "\")'><span class='glyphicon glyphicon-ban-circle' aria-hidden='true' ></span>吊销</button>&nbsp;</shiro:hasPermission>";
                	}else{
                		html += "<shiro:hasPermission name='carCertDeactive'><button type='button' class='btn btn-default' onclick='deactive(\"" + row.applyid + "\",\"" + row.carid + "\")'><span class='glyphicon glyphicon-ban-circle' aria-hidden='true' ></span>吊销</button>&nbsp;</shiro:hasPermission>";
                	}
                	if(row.status == 3){
                		html += "<shiro:hasPermission name='carCertCancellation'><button type='button' class='btn btn-default' disabled onclick='cancellation(\"" + row.applyid + "\",\"" + row.carid + "\")'><span class='glyphicon glyphicon-remove-circle' aria-hidden='true' ></span>作废</button>&nbsp;</shiro:hasPermission>";
                	}else{
                		html += "<shiro:hasPermission name='carCertCancellation'><button type='button' class='btn btn-default' onclick='cancellation(\"" + row.applyid + "\",\"" + row.carid + "\")'><span class='glyphicon glyphicon-remove-circle' aria-hidden='true' ></span>作废</button>&nbsp;</shiro:hasPermission>";
                	}
                	html += "<shiro:hasPermission name='carCertPrint'><button type='button' class='btn btn-default' onclick='print(\"" + row.carid + "\")'><span class='glyphicon glyphicon-duplicate' aria-hidden='true' ></span>打印</button></shiro:hasPermission>";
    				return html;
                }
            }]
        });
    };
    /* $('#button').click(function () {  
        $table.bootstrapTable('refresh', {url: '../json/data1.json'});  
    }); */
    //得到查询的参数
    return oTableInit;
};
function print(carid){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="出租车运输证打印";
	 diag.URL = '<%=basePath%>car/toTaxiPrintCert.action?carid='+carid;
	 diag.Width = 800;
	 diag.Height = 600;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}
function deactive(applyid,carid){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="证书吊销";
	 diag.URL = '<%=basePath%>car/toCarDeactive.action?carId='+carid+'&applyId=' + applyid;
	 diag.Width = 1000;
	 diag.Height = 500;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

function cancellation(applyid,carid){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="证书作废";
	 diag.URL = '<%=basePath%>car/toCarCancellation.action?carId='+carid+'&applyId=' + applyid;
	 diag.Width = 1000;
	 diag.Height = 500;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}
</script>

</head>

<body>
	<div class="panel-body" style="padding-bottom:0px;">
		<div class="page-header">
			<h1 style="font-size:15px;">
				证件管理
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					营运车辆管理
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">车牌号</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input class="form-control"  type="text" id="carNum" name="carNum" value="" />
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">身份证号</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input class="form-control"  type="text" id="certNo" name="certNo" value="" />
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