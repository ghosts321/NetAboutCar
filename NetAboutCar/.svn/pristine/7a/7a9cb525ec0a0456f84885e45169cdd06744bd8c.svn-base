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
            url: 'getAbnormityPriceSetList.action',         //请求后台的URL（*）
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
            			region_code:$("#region_code").val(),
            			fare_type:$("#fare_type").val(),
            			company_id:$("#company_id").val()
              	};
              	return param;
            },
            toolbar: '#toolbar',
            clickToSelect: true,                //是否启用点击选中行
            height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
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
                field: 'id',
                align: 'left',
                title: '规范用语'
            },{
                field: 'vehicle_no',
                align: 'center',
                title: '创建人'
            },{
                field: 'source',
                align: 'center',
                title: '创建时间'
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
	                	var html = "<button type='button' class='btn btn-default' onclick='toAccept(\""+row+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >修改</button>";
						return html;
                }
            }],
            data: [{
                id: '规范用语1',
                vehicle_no: '张三1',
                source: '2017-2-18 23:23:10'
            },{
                id: '规范用语2',
                vehicle_no: '张三2',
                source: '2017-2-18 23:23:10'
            },{
                id: '规范用语3',
                vehicle_no: '张三3',
                source: '2017-2-18 23:23:10'
            },{
                id: '规范用语4',
                vehicle_no: '张三4',
                source: '2017-2-18 23:23:10'
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
    	}
    });
});
function toAdd(){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="新增规范用语";
	 diag.URL = '<%=basePath%>penalty/standardLangAdd.action';
	 diag.Width = 450;
	 diag.Height = 500;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
function toAccept(abnormity_id){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="修改规范用语";
	 diag.URL = '<%=basePath%>penalty/standardLangUpdate.action';
	 diag.Width = 450;
	 diag.Height = 500;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
function toDetail(abnormity_id){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="修改历史";
	 diag.URL = '<%=basePath%>penalty/caseAlterHis.action';
	 diag.Width = 1000;
	 diag.Height = 400;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
function todel(){
	var selections =  $('#tradeList').bootstrapTable('getSelections');
	if(selections.length<1){
		alert("请至少选择一行数据！");
		return false;
	}
	var abnormityids = [];
	$.each(selections,function(i,d){
		abnormityids.push(d.abnormity_id);
	});
	var flag = false;
	if(confirm("确定要删除选中的数据吗？")){
		flag = true;
	}
	if(flag){
		var url = "<%=basePath%>monitor/abnormityPriceDel.action";
		$.post(url,{abnormityids:abnormityids.join(',')},function(result){
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
	<div class="panel-body">
		<div class="page-header" >
			<h1 style="font-size: 15px;">
				案件管理<small style="font-size: 15px">
				<i class="icon-double-angle-right"></i>规范用语查询
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="region_code">规范用语</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="region_code"/>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="fare_type">创建人</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="fare_type"/>
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