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
            url: 'tremSelect.action?',         //请求后台的URL（*）
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
           // height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            columns: [{
            	checkbox:true,
            },{
                field: 'index',
                align: 'center',
                width:'10%',
                title: '序号',
                formatter:function(value, row, index){
                	return index+1;
                }
            },{
                field: 'term',
                align: 'left',
                title: '处罚内容'
            }/* ,{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
	                	var html = "<button type='button' class='btn btn-default' onclick='toAlterCase(\""+row.caseId+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >修改</button>&nbsp;";
	                	html += "<button type='button' class='btn btn-default' onclick='toDetail(\""+row.caseId+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >详情</button>";
						return html;
                }
            } */]
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

function toSave(){
 	var selections =  $('#tradeList').bootstrapTable('getSelections');
	if(selections.length<1){
		alert("请至少选择一行数据！");
		return false;
	}
	var terms="" ;
	$.each(selections,function(i,d){
		terms = terms+d.term+":::";
	});
	var flag = false;
	if(confirm("确定要保存选中的数据吗？")){
		flag = true;
	}
	
	if(flag){
		
		//window.opener.document.all.punishContent.focus();
		window.opener.document.all.caseReason.value = terms;
		//window.opener.document.all.caseReason.blur();
	}  
	
	window.close();
	
}
</script>
</head>
<body>
	<form action="addCase.action" method="post" name="addForm" id="addForm" enctype ="multipart/form-data">
	<div id="zhongxin" align="center" style="padding-top: 25px">
		
		<div id="toolbar" class="btn-group">
			<div>
				
	            <button id="btn_delete" type="button" class="btn btn-default" onclick="toSave();">
					<span  aria-hidden="true"></span>保存
				</button>
			</div>
   	    </div>
		<table id="tradeList">
		</table>
		</div>
	</form>
				<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="<%=basePath%>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	
</body>
</html>