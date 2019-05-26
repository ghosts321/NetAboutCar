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
            url: 'findAllPlantCaseHis.action?id=1',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: false,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'right',
            sortOrder: "asc",                   //排序方式
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			caseId:$("#caseId").val(),
            			beginTime:$("#beginTime").val(),
            			endTime:$("#endTime").val()
              	};
              	return param;
            },
            toolbar: '#toolbar',
            clickToSelect: true,                //是否启用点击选中行
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            columns: [{
                field: 'dealDateTime',
                align: 'left',
                title: '处理时间'
            },{
                field: 'dealRoleId',
                align: 'left',
                title: '处理角色'
            },{
                field: 'dealUserId',
                align: 'center',
                title: '处理人'
            },{
                field: 'dealContent',
                align: 'center',
                title: '处理内容'
            },{
                field: 'dealView',
                align: 'center',
                title: '处理意见'
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
    	$('#tradeList').bootstrapTable('refresh');

    });
});
function toAdd(){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="新增案件";
	 diag.URL = '<%=basePath%>penalty/penaltyAdd.action';
	 diag.Width = 450;
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
function toAlterCase(caseId){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="修改案件";
	 diag.URL = '<%=basePath%>penalty/toAlterCase.action?caseId='+caseId;
	 diag.Width = 450;
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
	 diag.URL = '<%=basePath%>penalty/penaltyDetail.action?caseId='+caseId;
	 diag.Width =1000;
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

function todel(){
	var selections =  $('#tradeList').bootstrapTable('getSelections');
	if(selections.length<1){
		alert("请至少选择一行数据！");
		return false;
	}
	var caseIds = [];
	$.each(selections,function(i,d){
		caseIds.push(d.caseId);
	});
	var flag = false;
	if(confirm("确定要删除选中的数据吗？")){
		flag = true;
	}
	if(flag){
		var url = '<%=basePath%>penalty/deleteCase.action';
		$.post(url,{caseIds:caseIds.join(',')},function(result){
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
                <form id="formSearch" class="form-horizontal">
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input type="hidden" class="form-control" id="caseId" value="${caseId }"/>
                        </div>
                </form>
			
		<table id="tradeList">
		</table>
	</div>
</body>
</html>