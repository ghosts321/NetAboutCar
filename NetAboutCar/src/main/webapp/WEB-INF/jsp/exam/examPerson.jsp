<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=basePath %>bootstrap/js/bootstrap-table-export.js"></script>
<script type="text/javascript">
$(function() {
	//日期控件
	$('.date-picker').datepicker();
    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
    $('#btn_query').click(function () {
    	$('#tradeList').bootstrapTable('refresh');
    });
});
var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tradeList').bootstrapTable({
            url: 'findAllExamPerson.action?type=export',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            pageSize:8,							//每页显示的条数
            sortable: true,                     //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'right',
            toolbar:'#toolbar',					//显示页码
            sortOrder: "asc",                   //排序方式
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			bespeak_date:$("#bespeak_date").val(),
            			address:$("#address").val(),
            			bespeak_time:$("#bespeaktime").val()
              	};
              	return param;
            },
            clickToSelect: true,                //是否启用点击选中行
            height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "driver_bespeak_id",                     //每一行的唯一标识，一般为主键列
            columns: [{
            	checkbox:true
            },{
                field: 'index',
                align: 'center',
                title: '序号',
                formatter:function(value, row, index){
                	return index+1;
                }
            },{
            	field: 'driver_bespeak_id',
           		align: 'center',
            	title: '考试预约号'
        	}, {
                field: 'username',
                align: 'center',
                title: '姓名'
            }, {
                field: 'certno',
                align: 'center',
                title: '身份证号'
            },{
                field: 'exam_name',
                align: 'center',
                title: '考试名称',
            },{
                field: 'bespeak_date',
                align: 'center',
                title: '预约日期'
            },{
                field: 'bespeak_time',
                align: 'center',
                title: '预约时段',
                formatter:function(value, row, index){
   	            	if(row.bespeak_time == 1){
   	            		return "上午";
   	            	}else if(row.bespeak_time == 2){
   	            		return "下午";
   	            	}
   	            }
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
                field: 'address',
                align: 'center',
                title: '考试地点'
            }]
        });
    };
    return oTableInit;
};
function exportFile(){
	var json = $('#tradeList').bootstrapTable('getSelections');
	var form = $("<form>"); //定义一个form表单
	form.attr('style', 'display:none'); //在form表单中添加查询参数
	form.attr('method', 'post');
	form.attr('action', 'exportExcel.action');
	var input = $('<input>');
	input.attr('type', 'hidden');
	input.attr('name', 'data');
	input.attr('value', JSON.stringify(json));
	$('body').append(form); //将表单放置在web中
	form.append(input);
	form.submit();
}
</script>
</head>
<body>
 <div class="panel-body" >
        <div class="page-header">
			<h1 style="font-size:15px;">
				考试培训
				<small style="font-size: 15px;">
					<i class="icon-double-angle-right"></i>
					考试人员管理
				</small>
			</h1>
		</div>
        <div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="bespeak_date">考试日期</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" class="date-picker" data-date-format="yyyy-mm-dd" id="bespeak_date"/>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="address">考试地点</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" class="form-control" id="address"/>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="bespeaktime">考试时段</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                            <select name="bespeak_time" class="form-control" id="bespeaktime">
                            	 <option value="">请选择...</option>
							     <option value="1">上午</option>
							     <option value="2">下午</option>
                            </select>
                        </div>
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="btn_query" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
	    <table id="tradeList"></table>				 
    </div>
</body>
</html>