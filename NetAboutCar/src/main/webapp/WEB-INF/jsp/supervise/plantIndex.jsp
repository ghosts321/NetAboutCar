<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp"%>
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
            url: 'plantInformationlist.action',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'right',
            sortOrder: "asc",                   //排序方式
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			platformname:$("#platformname").val(),
            			creditcode:$("#creditcode").val(),
              	};
              	return param;
            },
            toolbar: '#toolbar',
            clickToSelect: true,                //是否启用点击选中行
            //height: 420,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "creditcode",                     //每一行的唯一标识，一般为主键列
            columns: [{
            	checkbox:true,
            },{
                field: 'index',
                align: 'center',
                width:'3%',
                title: '序号',
                formatter:function(value, row, index){
                	return index+1;
                }
            },{
                field: 'platformname',
                align: 'center',
                title: '平台名称'
            },{
                field: 'creditcode',
                align: 'center',
                title: '社会信用代码'
            },{
                field: 'corpname',
                align: 'center',
                title: '公司法人'
            },{
                field: 'regaddress',
                align: 'center',
                title: '注册地址'
            },{
                field: 'contactstel',
                align: 'center',
                title: '联系电话'
            },{
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

            }
            ],
            
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
    	}
    });
});

</script>
</head>
<body>
	<div class="panel-body">
		<div class="page-header" >
			<h1 style="font-size: 15px;">
				运营监管<small style="font-size: 15px">
				<i class="icon-double-angle-right"></i>综合信息查询
				<i class="icon-double-angle-right"></i>平台信息查询
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                    
                    
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="region_code">平台名称</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px; width:240px">
							<input type="text" class="form-control" id="platformname" name="platformname"/>
                        </div>

                        <label class="control-label col-sm-1" style="font-weight: normal;" for="company_id">社会信用代码</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px; width:240px">
							<input type="text" class="form-control" id="creditcode" name="creditcode"/>
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