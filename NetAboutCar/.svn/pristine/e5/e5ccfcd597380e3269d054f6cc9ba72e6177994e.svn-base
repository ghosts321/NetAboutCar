<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            url: 'plantappealFindAll.action',         //请求后台的URL（*）
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
            			plateName:$("#plateName").val(),
            			caseId:$("#caseId").val(),
            			begin_time:$("#begin_time").val(),
            			end_time:$("#end_time").val()
              	};
              	return param;
            },
            toolbar: '#toolbar',
            clickToSelect: true,                //是否启用点击选中行
            height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "caseId",                     //每一行的唯一标识，一般为主键列
              columns: [{
            	  field: 'index',
                  align: 'center',
                  title: '序号',
                  formatter:function(value, row, index){
                  	return index+1;
                  }
            }, {
                field: 'caseId',
                align: 'center',
                title: '案件编号'
            }, {
                field: 'plateName',
                align: 'center',
                title: '平台名称'
            }, {
                field: 'source',
                align: 'center',
                title: '案件来源',
                formatter:function(value, row, index){
                	if(row.source == 01){
                		return "稽查执法查扣违章";
                	}else if(row.source == 02){
                		return "信访投诉违章";
                	}
                }
            }, {
                field: 'appealuserid',
                align: 'center',
                title: '申诉人'
            }, {
                field: 'caseTime',
                align: 'center',
                title: '案发时间'
            },{
                field: 'updateTime',
                align: 'center',
                title: '最后受理时间'
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
                	var html = "";	
                	
                		html += "<button type='button' class='btn btn-default' onclick='toAccept(\""+row.caseId+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >受理</button>&nbsp;";
                	
                		html += "<button type='button' class='btn btn-default' onclick='toDetail(\""+row.caseId+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >详情</button>&nbsp;";
                	

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
		return false;
	}
	$("#importForm").submit();
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
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
function toAccept(caseId){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="申诉处理";
	 diag.URL = '<%=basePath%>plantcaseappeal/caseAppeal.action?caseId=' + caseId;
	 diag.Width = 1000;
	 diag.Height = 600;
	 diag.CancelEvent = function(){ //关闭事件
		/* if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		} */
		location.reload();
		diag.close();
	 };
	 diag.show();
}
function toDetail(caseId){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="案件详情";
	 diag.URL = '<%=basePath%>plantcaseappeal/appealDetail.action?caseId=' + caseId;
	 diag.Width =1000;
	 diag.Height = 600;
	 diag.CancelEvent = function(){ //关闭事件
		/* if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		} */
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
			<h1 style="font-size:15px;">
				案件申诉
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					平台案件申诉
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">平台名称</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="plateName" name="plateName" value=""/>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">案件编号</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="caseId" name="caseId" value=""/>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">案发时间</label>
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
		<table id="tradeList">
		</table>
	</div>
</body>
</html>