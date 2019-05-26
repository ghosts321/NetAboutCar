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
	        url: '${path}/credit/comAppealList.action',         //请求后台的URL（*）
	        method: 'post',                      //请求方式（*）
	        dataType: "json",
	        contentType: 'application/x-www-form-urlencoded',
	        striped: true,                      //是否显示行间隔色
	        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	        pagination: true,                   //是否显示分页（*）
	        search: false,  //是否启用查询 
	        sortable: true,                     //是否启用排序
	        buttonsAlign:'right',
	        toolbarAlign:'left',
	     
	        //toolbar: '#toolbar',
	        sortOrder: "asc",                   //排序方式
	        queryParams: function queryParams(params) {   //设置查询参数  
	        	var param = {
	        			comname:$("#comname").val(),
	        			creditcode:$("#creditcode").val()
	          	};
	          	return param;                   
	        },
	        clickToSelect: true,                //是否启用点击选中行
	        //height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	        uniqueId: "rec_no",                     //每一行的唯一标识，一般为主键列
	       /*  pageNumber:1,                       //初始化加载第一页，默认第一页
	        strictSearch: true,
	        cardView: false,                    //是否显示详细视图
	        detailView: false,                   //是否显示父子表 */
	        columns: [{
	            field: 'index',
	            align: 'center',
	            title: '序号',
                formatter:function(value, row, index){
                	return index+1;
                }
	        }, {
	            field: 'comname',
	            align: 'center',
	            title: '平台名称'
	        }, {
	            field: 'creditcode',
	            align: 'center',
	            title: '统一社会信用代码'
	        }, {
	            field: 'rec_no',
	            align: 'center',
	            title: '记分编号'
	        }, {
	            field: 'appeal_text',
	            align: 'center',
	            title: '申诉内容'
	        }, {
	            field: 'appeal_status',
	            align: 'center',
	            title: '申诉状态'
	        },{
	            field: 'handle',
	            align: 'center',
	            title: '操作',
	            formatter:function(value, row, index){
	            	var html = "";
	            	if(row.appeal_status == "未处理"){
	            		html += "<button type='button'  class='btn btn-default' onclick='audit("+row.rec_no+")'><span class='glyphicon glyphicon-wrench' aria-hidden='true' ></span>审核</button>";
	            	}else{
	            		html += "<button type='button'  class='btn btn-default' onclick='view("+row.rec_no+")'><span class='glyphicon glyphicon-wrench' aria-hidden='true' ></span>查看</button>";
	            	}
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
//受理
function audit(rec_no){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="审核详情";
	 diag.URL = '${path}/credit/auditComAppeal.action?rec_no='+rec_no;
	 diag.Width = 900;
	 diag.Height = 600;
	 diag.CancelEvent = function(){ //关闭事件
		$('#tradeList').bootstrapTable('refresh');
		diag.close();
	 };
	 diag.show();
}

function view(rec_no){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="审核详情";
	 diag.URL = '${path}/credit/auditComAppealResult.action?rec_no='+rec_no;
	 diag.Width = 900;
	 diag.Height = 600;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}
</script>
</head>
<body>
	<div class="panel-body">
		<div class="page-header">
			<h1 style="font-size:15px;">
				诚信考核
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					平台申诉处理
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px;" >
                        <label class="control-label col-sm-1" style="font-weight: normal; float:left; display:inline;" for="txt_search_departmentname">平台名称</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px; float:left; display:inline;">
                            <input type="text" id="comname" name="comname" value="" class="form-control" />
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal; float:left; display:inline;" for="txt_search_departmentname">统一社会信用号</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px; float:left; display:inline;">
                            <input type="text" id="creditcode" name="creditcode" value="" class="form-control" />
                        </div>
                        <div class="col-sm-3" style="text-align:left; padding-left:0px; float:left; display:inline;">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
		<table id="tradeList" >
   		</table>
	</div>
	<script type="text/javascript" src="jquery-1.4.2.min.js"></script>
</body>
</html>