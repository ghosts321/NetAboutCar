<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#alginLeft{
 float: right !important;
}
</style>
<!-- 引入 -->
<script type="text/javascript">
$(function() {
    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
    $('#btn_query').click(function () {
    	$('#tradeList').bootstrapTable('refresh');
    });
    $("#sel_exportoption").change(function () {
        $('#tradeList').bootstrapTable('refreshOptions', {
            exportDataType: $(this).val()
        });
    });
});
var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tradeList').bootstrapTable({
            url: 'findAllDataDic.action',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: true,                     //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'left',
            sortOrder: "asc",                   //排序方式
            pageSize:8,
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			dataName:$("#txt_search_departmentname").val()
              	};
              	return param;
            },
            toolbar: '#toolbar', 
            clickToSelect: true,                //是否启用点击选中行
            height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "dataCode",                     //每一行的唯一标识，一般为主键列
           /*  pageNumber:1,                       //初始化加载第一页，默认第一页
            strictSearch: true,
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表 */
            showExport: true,                     //是否显示导出
            exportDataType: "basic",
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
                field: 'dataCode',
                align: 'center',
                title: '字典代码'
            }, {
                field: 'dataName',
                align: 'center',
                title: '字典名称'
            }, {
                field: 'remark',
                align: 'center',
                title: '备注'
            }, {
                field: 'handle',
                align: 'center',
                width: '10%',
                title: '操作',
                formatter:function(value, row, index){
                	var html ="<button type='button' class='btn btn-default' onclick='showDetail(\""+row.dataCode+"\")'><span class='glyphicon glyphicon-list-alt'></span> 查看</button>";
                	return html;
                }
            }]
        });
    };
    return oTableInit;
};

function toAdd(){
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="添加字典";
	 diag.URL = '<%=basePath%>dataDic/toAdd.action';
	 diag.Width = 400;
	 diag.Height = 300;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}

function toUpdate(){
	var codeStr =  $.map($('#tradeList').bootstrapTable('getSelections'), function (row) {
        return row.dataCode;
    });
	var codeArray = "'"+codeStr+"'";
	if(codeArray.split(',').length>1){
		alert("请选择一行");
		return false;
	}
}

function showDetail(dataCode){
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="查看详情";
	 diag.URL = '<%=basePath%>dataDic/detail.action?dataCode='+dataCode;
	 diag.Width = 850;
	 diag.Height = 400;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
function checkExportType(type){
	
	
}

</script>

</head>

<body>
 <div class="panel-body" style="padding-bottom:0px;">
        <div class="page-header">
			<h1 style="font-size:15px;">
				系统管理
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					字典维护
				</small>
			</h1>
		</div>
        <div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">字典名称</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" class="form-control" id="txt_search_departmentname">
                        </div>
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="btn_query" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>       
		  	<div id="toolbar" class="btn-group">
	            <div>
	            	&nbsp;<button id="btn_add" type="button" class="btn btn-default" onclick="toAdd();">
		                <span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>新增
		            </button>
		            <button id="btn_update" type="button" class="btn btn-default" onclick="toUpdate();">
		                <span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>修改
		            </button>
		            <button id="btn_delete" type="button" class="btn btn-default" onclick="toAdd();">
		                <span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>删除
		            </button>
	            </div>
	            
	            <!-- <div style="float: right">
	            	<select id="sel_exportoption" class="form-control">
			            <option value="basic">导出当前页</option>
			            <option value="all">导出所有</option>
			            <option value="selected">导出选中</option>
		        	</select>
	            </div> -->
	        </div>
        
	    <table id="tradeList" style="margin-top: -38px;"></table>				 
    </div>
   		   
	</div>
</body>
</html>