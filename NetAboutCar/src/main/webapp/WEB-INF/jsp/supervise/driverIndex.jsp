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
            url: 'drvFindAll.action',         //请求后台的URL（*）
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
            			name:$("#name").val(),
            			pcertno:$("#pcertno").val()
            			
              	};
              	return param;
            },
            toolbar: '#toolbar',
            clickToSelect: true,                //是否启用点击选中行
            //height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "drv_illegal_id",                     //每一行的唯一标识，一般为主键列
              columns: [{
            	  field: 'index',
                  align: 'center',
                  title: '序号',
                  formatter:function(value, row, index){
                  	return index+1;
                  }
            }, {
                field: 'name',
                align: 'center',
                title: '姓名'
            }, {
                field: 'sex',
                align: 'center',
                title: '性别',
                formatter:function(value, row, index){
                	if(row.sex == 0){
                		return "女";
                	}else if(row.sex == 1){
                		return "男";
                	}
                }
            }, {
                field: 'tel',
                align: 'center',
                title: '手机号'
            }, {
                field: 'certno',
                align: 'center',
                title: '身份证号'
            }, {
                field: 'pcertno',
                align: 'center',
                title: '证书编号'
            }, {
                field: 'status',
                align: 'center',
                title: '证书状态',
                formatter:function(value, row, index){
                	if(row.status == 1){
                		return "正常";
                	}else if(row.status == 2){
                		return "吊销";
                	}else if(row.status == 3){
                		return "作废";
                	}
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
	<div class="panel-body">
		<div class="page-header">
			<h1 style="font-size:15px;">
				运营监管
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>综合信息查询<i class="icon-double-angle-right"></i>驾驶员信息查询
				</small>
			</h1>
		</div>
		
		
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">驾驶员姓名</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="name" name="name" value=""/>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">证书编号</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="pcertno" name="pcertno" value=""/>
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