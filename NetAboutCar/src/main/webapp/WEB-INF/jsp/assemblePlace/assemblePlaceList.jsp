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
            url: 'getAssemblePlaceList.action',         //请求后台的URL（*）
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
            			placeName:$("#placeName").val()
              	};
              	return param;
            },
            toolbar: '#toolbar',
            clickToSelect: true,                //是否启用点击选中行
            height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
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
                field: 'place_name',
                align: 'center',
                title: '聚集地名称'
            }, {
                field: 'time_rate',
                align: 'center',
                title: '时间频率'
            },{
                field: 'car_warning_val',
                align: 'center',
                title: '车辆数预警阈值'
            },{
                field: 'car_alarm_val',
                align: 'center',
                title: '车辆数报警阈值'
            },{
                field: 'handle',
                align: 'center',
                title: '是否启用',
                formatter:function(value, row, index){
                	if(row.is_use == 1){	//启用
	                	var html = "<button type='button' class='btn btn-default' onclick='setState(\""+row.id+"\",\""+row.is_use+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >停止</button>";
                	}
                	else if(row.is_use == 0){	//停止
                		var html = "<button type='button' class='btn btn-default' onclick='setState(\""+row.id+"\",\""+row.is_use+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >启用</button>";
                	}
					return html;
                }
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
	                	var html = "<button type='button' class='btn btn-default' onclick='toUpdate(\""+row.id+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >修改</button>";
						return html;
                }
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

// 添加回车事件
document.onkeydown=function(event){
    var e = event || window.event || arguments.callee.caller.arguments[0];
    if(e && e.keyCode==13){ // enter 键
	    $('#tradeList').bootstrapTable('refresh');
    }
};

// 是否启用
function setState(id, is_use){
	var url = "<%=basePath%>setAssemblePlace/setState.action";
	$.post(url, {id: id, is_use: is_use} ,function(result){
		if(result == "success" && is_use == 1){
			alert("操作成功，已停止！");
		}
		else if(result == "success" && is_use == 0){
			alert("操作成功，已启用！");
		}
		else{
			alert("操作失败！");
		}
		document.location.reload();
	});
}

function toUpdate(id){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="修改聚集地点";
	 diag.URL = '<%=basePath%>setAssemblePlace/mapSetUpdate.action?id='+id;
	 diag.Width = 1200;
	 diag.Height = 1000;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
		$('#tradeList').bootstrapTable('refresh');
	 };
	 diag.show();
}

function toAdd(){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="新增聚集地点";
	 diag.URL = '<%=basePath%>setAssemblePlace/mapSetAdd.action';
	 diag.Width = 1200;
	 diag.Height = 1000;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
		$('#tradeList').bootstrapTable('refresh');
	 };
	 diag.show();
}

function todel(){
	var selections =  $('#tradeList').bootstrapTable('getSelections');
	if(selections.length<1){
		alert("请至少选择一行数据！");
		return false;
	}
	var operatingids = [];
	$.each(selections,function(i,d){
		operatingids.push(d.id);
	});
	var flag = false;
	if(confirm("确定要删除选中的数据吗？")){
		flag = true;
	}
	if(flag){
		var url = "<%=basePath%>setAssemblePlace/assemblePlaceDel.action";
		$.post(url,{operatingids:operatingids.join(',')},function(result){
			if(result=="success"){
				alert("删除成功！");
			}else{
				alert("删除失败！");
			}
			document.location.reload();
		});
	}
}
</script>
</head>
<body>
	<div class="panel-body" style="padding-bottom:0px;">
		<div class="page-header">
			<h1 style="font-size: 15px;">
				运行管理
				<small style="font-size: 15px">
				<i class="icon-double-angle-right"></i>聚集地点设置
				</small>
			</h1>
		</div>
        
       <div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px"> 
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="placeName">聚集地点名称</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="placeName" placeholder="请输入聚集地点名称"/>
                        </div>
                        
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:10px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        
        <div id="toolbar" class="btn-group">
			<div>
				<button id="btn_add" type="button" class="btn btn-default" onclick="toAdd();">
	                <span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>新增
	            </button>
	            <button id="btn_delete" type="button" class="btn btn-default" onclick="todel();">
					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
				</button>
			</div>
   	    </div>
        
		<table id="tradeList">
		</table>
	</div>
</body>
</html>