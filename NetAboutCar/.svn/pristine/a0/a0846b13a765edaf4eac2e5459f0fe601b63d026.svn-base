<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=basePath %>static/js/myjs/navigateBar.js" type="text/javascript"></script>
<script type="text/javascript">
var TableInit = function () {
	var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tradeList').bootstrapTable({
            url: 'findAllExamBespeak.action',         //请求后台的URL（*）
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
            pageSize:8,
            sortOrder: "asc",                   //排序方式
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			bespeak_date:$("#bespeak_date").val()
              	};
              	return param;
            },
            toolbar: '#toolbar',
            clickToSelect: true,                //是否启用点击选中行
            height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "bespeak_id",                     //每一行的唯一标识，一般为主键列
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
                field: 'bespeak_id',
                align: 'center',
                title: '预约号'
            }, {
                field: 'address',
                align: 'center',
                title: '考试地点'
            }, {
                field: 'exam_name',
                align: 'center',
                title: '考试名称'
            },{
                field: 'exam_type',
                align: 'center',
                title: '考试类型',
               	formatter:function(value, row, index){
   	            	if(row.exam_type == 1){
   	            		return "全国";
   	            	}else if(row.exam_type == 2){
   	            		return "地方";
   	            	}
   	            }
            },{
                field: 'exam_content',
                align: 'center',
                title: '考试内容'
            },{
                field: 'bespeak_date',
                align: 'center',
                title: '预约日期'
            },{
                field: 'morning_count',
                align: 'center',
                title: '上午预约人数'
            },{
                field: 'afternoon_count',
                align: 'center',
                title: '下午预约人数'
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
	                	var html = "<button type='button' class='btn btn-default' onclick='toUpdate(\""+row.bespeak_id+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >修改</button>";
						return html;
                }
            }]
        });
    };
    //得到查询的参数
	return oTableInit;
};
$(function(){
	//navigateBar();
	//日期控件
	$('.date-picker').datepicker();
	 //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
    $('#search').click(function () {  
    	$('#tradeList').bootstrapTable('refresh');
    });
});
function toAdd(){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="新增考试预约";
	 diag.URL = '<%=basePath%>exam/appointmentAdd.action';
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
function toUpdate(bespeakid){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="修改考试预约";
	 diag.URL = '<%=basePath%>exam/appointmentUpdate.action?bespeakid='+bespeakid;
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
function todel(){
	var selections =  $('#tradeList').bootstrapTable('getSelections');
	if(selections.length<1){
		alert("请至少选择一行数据！");
		return false;
	}
	var bespeakids = [];
	$.each(selections,function(i,d){
		bespeakids.push(d.bespeak_id);
	});
	var flag = false;
	if(confirm("确定要删除选中的数据吗？")){
		flag = true;
	}
	if(flag){
		var url = "<%=basePath%>exam/appointmentDel.action";
		$.post(url,{bespeakids:bespeakids.join(',')},function(result){
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
		<div class="page-header">
			<h1 style="font-size: 15px;">
				<!-- 考试培训 <small style="font-size: 15px">
				<i class="icon-double-angle-right"></i>考试预约管理
				</small> -->
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:14px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="bespeak_date">预约日期</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="date-picker" id="bespeak_date" data-date-format="yyyy-mm-dd"/>
                        </div>
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
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