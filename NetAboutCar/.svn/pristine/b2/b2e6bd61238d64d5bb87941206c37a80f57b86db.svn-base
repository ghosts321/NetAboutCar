<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../common.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <script type="text/javascript" src="<%=basePath %>bootstrap/js/bootstrap-table-export.js"></script> --%>
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
            url: 'driverwzwfFindAll.action',         //请求后台的URL（*）
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
            			company_name:$("#company_name").val(),
            			begin_time:$("#begin_time").val(),
            			end_time:$("#end_time").val()
              	};
              	return param;
            },
            toolbar: '#toolbar',
            clickToSelect: true,                //是否启用点击选中行
           // height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
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
                title: '违章人'
            }, {
                field: 'illegal_content',
                align: 'center',
                title: '违章内容'
            }, {
                field: 'company_name',
                align: 'center',
                title: '所属经营平台'
            }, {
                field: 'illegal_source',
                align: 'center',
                title: '违章来源'
            }, {
                field: 'illegal_time',
                align: 'center',
                title: '违章时间'
            }, {
                field: 'status',
                align: 'center',
                title: '状态',
                formatter:function(value, row, index){
                	if(row.status == 1){
                		return "未判定";
                	}else if(row.status == 2){
                		return "已判定";
                	}
                }
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
                	var html = "";	
                	if(row.status == 1 ){
                		html += "<button type='button' class='btn btn-default' onclick='toAccept(\""+row.drv_illegal_id+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >判定</button>&nbsp;";
                	}else{
                		html += "<button type='button' class='btn btn-default' disabled onclick='toAccept(\""+row.drv_illegal_id+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >判定</button>&nbsp;";
                	}

						return html;
                }
            }]
        });
    };
    //得到查询的参数
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
		//return false;
	}
	$("#importForm").submit();
}

function exportForm(){
	$("#exportForm").submit();
}

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
	 diag.Title ="投诉信息录入";
	 diag.URL = '<%=basePath%>supervise/driverwzwfImport';
	 diag.Width = 450;
	 diag.Height = 400;
	 diag.CancelEvent = function(){ //关闭事件
		/* if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		} */
		diag.close();
	 };
	 diag.show();
}
function toAccept(drv_illegal_id){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="违规判定";
	 diag.URL = '<%=basePath%>supervise/driverwzwfDetermine.action?drv_illegal_id=' + drv_illegal_id;
	 diag.Width = 800;
	 diag.Height = 700;
	 diag.CancelEvent = function(){ //关闭事件
		/*  top.Dialog.close(); */
		 /*   if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}   */ 
		location.reload();
		diag.close();
	 };

	 diag.show();
}
function toDetail(abnormity_id){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="案件详情";
	 diag.URL = '<%=basePath%>penalty/penaltyDetail.action';
	 diag.Width =1000;
	 diag.Height = 600;
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
/* function exportFile(){
	var json = $('#tradeList').bootstrapTable('getData');
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
} */
</script>
</head>
<body>
	<div class="panel-body">
		<div class="page-header" >
			<h1 style="font-size:15px;">
				驾驶员营运违章管理
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					驾驶员违章违法信息
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">违章人</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="name" name="name" value=""/>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">所属经营平台</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
						<input type="text" class="form-control" id="company_name" name="company_name" value=""/>
							<%-- <select id="company_name" name="company_name" class="form-control">
											<option value="">${platformList}</option>
											<c:forEach items="${platformList}" var="add">
												<option value="${add.platformName}">${add.platformName}</option>
											</c:forEach>
				                        </select> --%>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">违章时间</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px; width:352px">
							<input type="text" class="date-picker" id="begin_time" data-date-format="yyyy-mm-dd" onchange="changeDateValue();"/>
							到<input type="text" class="date-picker" id="end_time" data-date-format="yyyy-mm-dd" onchange="changeDateValue1();"/>
                        </div>
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:10px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
		 <div id="toolbar" class="btn-group" style="float:right">
			<form action="<%=basePath%>supervise/drvimportExcel.action" id="importForm" method="post" enctype="multipart/form-data" style="float: left">
	            <div class="box">
					<p style="float: left;margin-top: 7px;">导入Excel&nbsp;&nbsp;</p><input type="text" id="excelFileText" name="excelFileText" class="file_textbox" style="width: 150px;" />
					<input type="file" multiple class="uploadFile" id="excelFile" name="excelFile" onchange="getFile(this,'excelFileText')" />
					
					
				</div>
				<a href="javascript:importFile();" style="border-radius: 4px;padding: 5px 12px;line-height: 22px;" class="upload_link"> 导 入</a>&nbsp;
			</form>
			<form action="<%=basePath%>supervise/drvexportExcel.action" id="exportForm" method="post" enctype="multipart/form-data" style="float: left">
			 <a href="javascript:exportForm();" style="border-radius: 4px;padding: 5px 12px;line-height: 22px;" class="upload_link" >导出</a>
			</form>
        </div>  
		<table id="tradeList">
		</table>
	</div>
</body>
</html>