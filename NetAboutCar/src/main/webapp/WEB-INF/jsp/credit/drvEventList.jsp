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
	        url: 'drvEventList.action',         //请求后台的URL（*）
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
	     
	        toolbar: '#toolbar',
	        sortOrder: "asc",                   //排序方式
	        queryParams: function queryParams(params) {   //设置查询参数  
	        	var param = {
	        			userName:$("#userName").val(),
	        			certNo:$("#certNo").val(),
	        			status:$('#status').val()
	          	};
	          	return param;                   
	        },
	        clickToSelect: true,                //是否启用点击选中行
	        //height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	        uniqueId: "applyid",                     //每一行的唯一标识，一般为主键列
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
	            field: 'username',
	            align: 'center',
	            title: '姓名'
	        }, {
	            field: 'driver_certno',
	            align: 'center',
	            title: '身份证号'
	        }, {
	            field: 'event_no',
	            align: 'center',
	            title: '事件编号'
	        }, {
	            field: 'event_desc',
	            align: 'left',
	            title: '事件简述'
	        }, {
	            field: 'occur_date',
	            align: 'center',
	            title: '发生日期'
	        }, {
	            field: 'review_no',
	            align: 'center',
	            title: '审核编号'
	        }, {
	            field: 'event_status',
	            align: 'center',
	            title: '审核状态'
	        },{
	            field: 'handle',
	            align: 'center',
	            title: '操作',
	            formatter:function(value, row, index){
	            	var html = "";
	            	if(row.event_status == "已处理"){
	            		html += "<button type='button'  class='btn btn-default' onclick='view(\"" + row.review_no + "\")'><span class='glyphicon glyphicon-wrench' aria-hidden='true' ></span>查看</button>";
	            	}else{
	            		html += "<button type='button'  class='btn btn-default' onclick='audit(\"" + row.event_no + "\")'><span class='glyphicon glyphicon-wrench' aria-hidden='true' ></span>审核</button>";
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
function dispose(certno,event_no){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="审核详情";
	 diag.URL = '<%=basePath %>credit/drvEventDetail.action?certno='+certno+'&event_no='+event_no;
	 diag.Width = 800;
	 diag.Height = 500;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}


function view(review_no){
	 location.href = '<%=basePath %>credit/event/driver/audit/detail.action?review_no='+review_no;
}

function audit(event_no){
	 location.href = '<%=basePath %>credit/event/audit.action?eventNo='+event_no;
}

function toAdd(){
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="添加驾驶员失信事件";
	 diag.URL = '<%=basePath%>credit/toEventsAdd.action?event_type=1';
	 diag.Width = 550;
	 diag.Height = 550;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
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
					驾驶员考核信息审核
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px;" >
                        <label class="control-label col-sm-1" style="font-weight: normal; float:left; display:inline;" for="txt_search_departmentname">姓名</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px; float:left; display:inline;">
                            <input type="text" id="userName" name="userName" value="" class="form-control" />
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal; float:left; display:inline;" for="txt_search_departmentname">身份证号</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px; float:left; display:inline;">
                            <input type="text" id="certNo" name="certNo" value="" class="form-control" />
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal; float:left; display:inline;" 
                        	for="txt_search_departmentname">状态</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px; float:left; display:inline;">
                            <select id="status">
                            	<option value="未处理">未处理</option>
                            	<option value="已处理">已处理</option>
                            </select>
                        </div>
                        <div class="col-sm-3" style="text-align:left; padding-left:0px; float:left; display:inline;">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
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
           </div>
        </div>
		<table id="tradeList">
   		</table>
	</div>
	<script type="text/javascript" src="jquery-1.4.2.min.js"></script>
</body>
</html>