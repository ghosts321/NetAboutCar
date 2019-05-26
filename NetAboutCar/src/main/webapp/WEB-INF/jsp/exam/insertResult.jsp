<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
uploadFile:hover{
 cursor:pointer;
}
input.uploadFile{
 margin-right:50px;
 padding-left:0px;
 right:30px;
 width: 226px;
}
.col-sm-3{
 width: 14%;
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
            url: 'findAllExamPerson.action?type=inport',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
			pageSize:8,                         //每页显示的条数
            sortable: true,                     //是否启用排序
            buttonsAlign:'right',
            toolbar:'#toolbar',
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
                field: 'index',
                align: 'center',
                width:'3%',
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
                width:'7.5%',
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
            },{
                field: 'score',
                align: 'center',
                title: '考试成绩',
                formatter:function(value, row, index){
                	if(row.createdatetime==""){
                		return "";
                	}else{
                		return row.score;
                	}
                }
            },{
                field: 'examresult',
                align: 'center',
                title: '考试结果',
                formatter:function(value, row, index){
                	if(row.createdatetime==""){
                		return "";
                	}
   	            	if(row.examresult == 1){
   	            		return "通过";
   	            	}else if(row.examresult == 0){
   	            		return "不通过";
   	            	}
   	            }
            },{
                field: 'createdatetime',
                align: 'center',
                title: '导入时间'
            }]
        });
    };
    return oTableInit;
};
function getFile(obj,inputName){
	var file_name = $(obj).val();
	var suffix=file_name.split(".");
	var last=suffix[suffix.length-1];
	var tp ="xls,xlsx";
	var rs=tp.indexOf(last);
	
	//如果返回的结果大于或等于0，说明包含允许上传的文件类型
	if(rs>=0){
		 $("input[name='"+inputName+"']").val(file_name);
		 return true;
	}else{
		 alert("您选择的文件不是有效的Excel文件！");
		 $("input[name='"+inputName+"']").val("");
		 return false;
	}
}
function importFile(){
	var excelFile = $("#excelFile").val();
	if(excelFile == ""){
		alert("请选择要上传的文件！");
		return false;
	}
	$("#importForm").submit();
}
</script>

</head>

<body>
 <div class="panel-body">
        <div class="page-header">
							<h1 style="font-size:15px;">
								考试培训
								<small style="font-size: 15px">
									<i class="icon-double-angle-right"></i>
									考试成绩录入
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
        <div id="toolbar" class="btn-group" style="float:left">
			<form action="<%=basePath%>exam/importExcel.action" id="importForm" method="post" enctype="multipart/form-data" style="float: left">
	            <div class="box">
					<p style="float: left;margin-top: 7px;">导入Excel&nbsp;&nbsp;</p><input type="text" id="excelFileText" name="excelFileText" class="file_textbox" style="width: 150px;" />
					<input type="file" multiple class="uploadFile" id="excelFile" name="excelFile" onchange="getFile(this,'excelFileText')" />
					<a href="javascript:importFile();" style="border-radius: 4px;padding: 5px 12px;line-height: 22px;" class="upload_link">导 入</a>&nbsp;
				</div>
			</form>
        </div>   
	    <table id="tradeList"></table>				 
    </div>
</body>
</html>