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
            url: 'findAllPunishList.action?id=1',         //请求后台的URL（*）
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
            			caseId:$("#caseId").val(),
            			beginTime:$("#beginTime").val(),
            			endTime:$("#endTime").val()
              	};
              	return param;
            },
            toolbar: '#toolbar',
            clickToSelect: true,                //是否启用点击选中行
           // height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
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
                field: 'caseId',
                align: 'left',
                title: '案件编号'
            },{
                field: 'punishId',
                align: 'left',
                title: '处罚编号'
            },{
                field: 'plateName',
                align: 'center',
                title: '平台名称'
            },{
                field: 'source',
                align: 'center',
                title: '案件来源',
                formatter:function(value, row, index){
    	            	if(row.source == '01'){
    	            		return "稽查执法查扣违章";
    	            	}else if(row.source == '02'){
    	            		return " 信访投诉违章";
    	            	}else if(row.source == '00'){
    	            		return " 手工录入";
    	            	}
    	            }
                
            },{
                field: 'caseUserId',
                align: 'center',
                title: '案件承办人'
            },{
                field: 'punishType',
                align: 'center',
                title: '处罚类型',
                formatter:function(value, row, index){
	            	if(row.punishType =='0001'){
	            		return "口头警告";
	            	}else if(row.punishType =='0002'){
	            		return "两百元以下罚款";
	            	}else if(row.punishType =='0003'){
	            		return "暂扣或吊销驾驶证";
	            	}
	            }
            },{
                field: 'caseTime',
                align: 'center',
                title: '案发时间'
            },{
                field: 'isRegister',
                align: 'center',
                title: '案件状态',
                formatter:function(value, row, index){
	            	if(row.isRegister =='00'){
	            		return "已结案";
	            	}else if(row.isRegister =='01'){
	            		return "未交罚款";
	            	}
	            }
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
	                	var html = "<button type='button' class='btn btn-default' onclick='toAlterCase(\""+row.caseId+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >修改</button>&nbsp;";
	                	html += "<button type='button' class='btn btn-default' onclick='toDetail(\""+row.caseId+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >详情</button>";
						return html;
                }
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
		<div class="page-header" >
			<h1 style="font-size: 15px;">
				平台处罚<small style="font-size: 15px">
				<i class="icon-double-angle-right"></i>简易处罚
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="region_code">案件编号</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="caseId" />
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="fare_type">车牌号</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="fare_type"/>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="company_id">案发时间</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px; width:352px">
							从<input type="text" class="date-picker" id="beginTime" data-date-format="yyyy-mm-dd" onchange="changeDateValue();"/>
							到<input type="text" class="date-picker" id="endTime" data-date-format="yyyy-mm-dd" onchange="changeDateValue1();"/>
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