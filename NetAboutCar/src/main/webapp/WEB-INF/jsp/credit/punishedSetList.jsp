<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- 引入 -->
<script type="text/javascript">
$(function() {
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
            url: 'findAllPunishedSet.action',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: true,                     //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'left',
            sortOrder: "asc",                   //排序方式
            pageSize:8,
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			pun_type:"${pun_type}",
            			pun_text:$("#pun_text").val()
              	};
              	return param;
            },
            toolbar: '#toolbar', 
            clickToSelect: true,                //是否启用点击选中行
            height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "dataCode",                     //每一行的唯一标识，一般为主键列
           /*  pageNumber:1,                       //初始化加载第一页，默认第一页
            strictSearch: true,
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表 */
            showExport: true,                     //是否显示导出
            exportDataType: "basic",
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
                field: 'pun_text',
                align: 'center',
                title: '处分名称'
            }, {
                field: 'pun_desc',
                align: 'center',
                title: '处分描述'
            }, {
                field: 'max_score',
                align: 'center',
                title: '阈值上限'
            }, {
                field: 'min_score',
                align: 'center',
                title: '阈值下限'
            }, {
                field: 'valid_date',
                align: 'center',
                title: '生效日期'
            }, {
                field: 'invalid_date',
                align: 'center',
                title: '失效日期'
            }, {
                field: 'available',
                align: 'center',
                title: '有效性',
                formatter:function(value, row, index){
                	if(row.available == 0){
                		return "无效";
                	}else if(row.available == 1){
                		return "有效";
                	}
                }
            }]
        });
    };
    return oTableInit;
};

function toAdd(){
	 var pun_type = "${pun_type}";
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="添加驾驶员考核处分设定";
	 diag.URL = '<%=basePath%>credit/toPunishedSetAdd.action?pun_type='+pun_type;
	 diag.Width = 400;
	 diag.Height = 450;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}

function toUpdate(){
	var punCode =  $.map($('#tradeList').bootstrapTable('getSelections'), function (row) {
        return row.pun_code;
    });
	var codeArray = "'"+punCode+"'";
	if(punCode != "" && punCode != null && codeArray.split(',').length == 1){
		var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="修改驾驶员考核处分设定";
		 diag.URL = '<%=basePath%>credit/toPunishedSetUpdate.action?punCode='+punCode;
		 diag.Width = 400;
		 diag.Height = 450;
		 diag.CancelEvent = function(){ //关闭事件
			if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				setTimeout("location.reload()",100);
			}
			diag.close();
		 };
		 diag.show();
	}else{
		alert("请选择一行");
		return false;
	}
}

function toDelete(){
	var selections =  $('#tradeList').bootstrapTable('getSelections');
	if(selections.length<1){
		alert("请至少选择一行数据！");
		return false;
	}
	var punCodes = [];
	$.each(selections,function(i,d){
		punCodes.push(d.pun_code);
	});
	var flag = false;
	if(confirm("确定要删除选中的数据吗？")){
		flag = true;
	}
	if(flag){
		var url = '<%=basePath%>credit/deletePunishedSet.action';
		$.post(url,{punCodes:punCodes.join(',')},function(result){
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
 <div class="panel-body" style="padding-bottom:0px;">
       <div class="page-header">
		<h1 style="font-size:15px;">
			诚信考核
			<small style="font-size: 15px">
				<i class="icon-double-angle-right"></i>
				<c:if test="${pun_type == 1}">驾驶员考核处分设定</c:if>
				<c:if test="${pun_type == 2}">平台考核处分设定</c:if>
			</small>
		</h1>
	</div>
       <div class="panel panel-default">
           <div class="panel-body">
           	<span class="title">查询条件</span>
               <form id="formSearch" class="form-horizontal">
                   <div class="form-group" style="margin-top:15px">
                       <label class="control-label col-sm-1" style="font-weight: normal;" for="pun_text">处分名称</label>
                       <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                           <input type="text" class="form-control" id="pun_text">
                       </div>
                       <div class="col-sm-4" style="text-align:left; padding-left:0px">
                           <button type="button" style="margin-left:5px" id="btn_query" class="btn btn-primary">查询</button>
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
            <button id="btn_update" type="button" class="btn btn-default" onclick="toUpdate();">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>修改
            </button>
            <button id="btn_delete" type="button" class="btn btn-default" onclick="toDelete();">
                <span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>删除
            </button>
           </div>
       </div>
    <table id="tradeList" style="margin-top: -38px;"></table>				 
   </div>
</body>
</html>