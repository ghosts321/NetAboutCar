<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=basePath %>bootstrap/js/bootstrap-table-export.js" type="text/javascript"></script>
<script src="<%=basePath %>static/js/myjs/navigateBar.js" type="text/javascript"></script>
<style type="text/css">

span.title{
 display:block;
 width:70px;
 height:6px;
 position:relative;
 top:-15px;
 text-align: center;
 font-weight: bold;
 background: white;
}
uploadFile:hover{
 cursor:pointer;
}
input.uploadFile{
 margin-right:50px;
 padding-left:0px;
 right:30px;
 width: 226px;
}
</style>
<script type="text/javascript">
var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tradeList').bootstrapTable({
            url: 'applyValidateIndex.action',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            pageSize:8,                         //每页显示的条数
            sortable: true,                     //是否启用排序
            showExport: true,                     //是否显示导出
            exportDataType: "basic",
            buttonsAlign:'right',
            toolbarAlign:'left',
            toolbar: '#toolbar', 
            sortOrder: "asc",                   //排序方式
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			username:$("#username").val(),
            			certno:$("#certno").val()
              	};
              	return param;
            },
            clickToSelect: true,                //是否启用点击选中行
            height: 460,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "userId",                     //每一行的唯一标识，一般为主键列
            columns: [{
            	checkbox:true,
            },{
                field: 'certno',
                align: 'center',
                title: '序号',
                formatter:function(value, row, index){
                	return index+1;
                }
            }, {
                field: 'username',
                align: 'center',
                title: '姓名'
            },{
                field: 'sex',
                align: 'center',
                title: '性别',
                formatter:function(value, row, index){
                	if(row.sex == 1){
                		return "男";
                	}else{
                		return "女";
                	}
                }
            },{
                field: 'certno',
                align: 'center',
                title: '身份证号'
            },{
                field: 'birthday',
                align: 'center',
                title: '出生日期'
            }, {
                field: 'nation',
                align: 'center',
                title: '民族'
            }, {
                field: 'carddate',
                visible: true,
                align: 'center',
                title: '驾驶证取证时间'
            }, {
                field: 'carissuingagency',
                align: 'center',
                title: '驾驶证签发机构'
            }, {
                field: 'familybg',
                align: 'center',
                title: '家庭社会背景'
            },{
                field: 'checkStatus',
                align: 'center',
                title: '状态',
                formatter:function(value, row, index){
                	var html = "";
                	if(value == '1'){
                		html = "未验证";
                	}else if (value == '2'){
                		html = "验证中"
                	}else if (value == '3'){
                		html = "未通过"
                	}else if (value == '4'){
                		html = "已通过"
                	}
					return html;
                }
            }]
        });
    };
    return oTableInit;
};
$(function() {
    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
    $('#search').click(function () {  
    	$('#tradeList').bootstrapTable('refresh');
    });
    
    /* $("#sel_exportoption").change(function () {
        $('#tradeList').bootstrapTable('refreshOptions', {
            exportDataType: $(this).val()
        });
    }); 
    $("#myModal").modal("none");*/
    
});
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

function exportFile(){
	var row =  $.map($('#tradeList').bootstrapTable('getSelections'), function (row) {
        return row;
    });
	if(row == null || row == ''){
		alert("请选择要导出的数据！");
		return false;
	}
	var json = $('#tradeList').bootstrapTable('getAllSelections');
	window.location.href="exportExcel.action?data="+JSON.stringify(json);
	window.setTimeout("refreshTab()",3000);
}
function refreshTab(){
	$('#tradeList').bootstrapTable('refresh');
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
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">驾驶员姓名</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" class="form-control"  id="username" name="username" value=""/>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">身份证号</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" class="form-control"  id="certno" name="certno" value=""/>
                        </div>
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div id="toolbar" class="btn-group">
			<form action="importExcel.action" id="importForm" method="post" enctype="multipart/form-data" style="float: left">
	            <div class="box">
					<p style="float: left;">&nbsp;&nbsp;导入Excel&nbsp;</p><input type="text" id="excelFileText" name="excelFileText" class="file_textbox" style="width: 150px;" />
					<input type="file" multiple class="uploadFile" id="excelFile" name="excelFile" onchange="getFile(this,'excelFileText')" />
					<a href="javascript:importFile();" style="border-radius: 4px;" class="upload_link">导 入</a>&nbsp;
				</div>
			</form>
            <!-- <div style="float: left">
            	<select id="sel_exportoption" class="form-control">
		            <option value="basic">导出当前页</option>
		            <option value="all">导出所有</option>
		            <option value="selected">导出选中</option>
	        	</select>
            </div> -->
        </div>
		<table id="tradeList">
   		</table>
	</div>
</body>
</html>