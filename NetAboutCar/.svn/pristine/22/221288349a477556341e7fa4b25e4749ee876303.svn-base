<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../common.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
var type = "${type}";
var TableInit = function () {
	var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tradeList').bootstrapTable({
            url: 'getIndicList.action',         //请求后台的URL（*）
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
            		indic_text:$("#indic_text").val(),
            		type:type
              	};
              	return param;
            },
            toolbar: '#toolbar',
            clickToSelect: true,                //是否启用点击选中行
            height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "type_code",                     //每一行的唯一标识，一般为主键列
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
                field: 'indic_code',
                align: 'left',
                title: '细则编码'
            }, {
                field: 'indic_text',
                align: 'center',
                title: '细则名称'
            },{
                field: 'type_name',
                align: 'center',
                title: '指标名称'
            },{
                field: 'score',
                align: 'center',
                title: '分值'
            },{
                field: 'indic_status',
                align: 'center',
                title: '状态',
                formatter:function(value, row, index){
                	if(value == 0){
                		return "禁用"
                	}else if(value == 1){
                		return "启用"
                	}
                }
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
                	if(row.indic_status == 0){
	                	var html = "<button type='button' class='btn btn-default' onclick='toDisable(\""+row.indic_code+"\",\""+row.indic_status+"\")'><span class='glyphicon glyphicon-check' aria-hidden='true' >启用</button>";                		
                	}else if(row.indic_status == 1){
                		var html = "<button type='button' class='btn btn-default' onclick='toDisable(\""+row.indic_code+"\",\""+row.indic_status+"\")'><span class='glyphicon glyphicon-check' aria-hidden='true' >禁用</button>";
                	}
					return html;
                }
            }]
        });
    };
    //得到查询的参数
	return oTableInit;
};
$(function(){
	 //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
    $('#search').click(function () {  
    	$('#tradeList').bootstrapTable('refresh');
    });
    

    $('#indic_text').keydown(function(){
    	if(event.keyCode==13){
    		$('#search').click();
    	}
    });
});
function toAdd(){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="新增指标细则";
	 diag.URL = '<%=basePath%>credit/indicAdd.action?type='+type;
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
function toUpdate(){
	var selections =  $('#tradeList').bootstrapTable('getSelections');
	if(selections.length!=1){
		alert("请选择一条数据！");
		return false;
	}
	var indic_code;
	$.each(selections,function(i,d){
		indic_code = d.indic_code;
	});
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="修改指标细则";
	 diag.URL = '<%=basePath%>credit/indicAdd.action?indic_code='+indic_code+'&type='+type;
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
function toDisable(indic_code,indic_status){
	if(indic_status == 0){
		indic_status = 1;
	}else if(indic_status == 1){
		indic_status = 0;
	}
	$.post('<%=basePath%>credit/toDisable.action',{indic_code:indic_code,indic_status:indic_status},function(data){
		setTimeout("location.reload()",100);
	})
}
function todel(){
	var selections =  $('#tradeList').bootstrapTable('getSelections');
	if(selections.length<1){
		alert("请至少选择一行数据！");
		return false;
	}
	var indic_codes = [];
	$.each(selections,function(i,d){
		indic_codes.push(d.indic_code);
	});
	var flag = false;
	if(confirm("确定要删除选中的数据吗？")){
		flag = true;
	}
	if(flag){
		var url = "<%=basePath%>credit/indicDel.action?type="+type;
		$.post(url,{indic_codes:indic_codes.join(',')},function(result){
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
				诚信考核<small style="font-size: 15px">
				<i class="icon-double-angle-right"></i>
					<c:if test="${type==1}">驾驶员指标细则管理</c:if>
					<c:if test="${type==2}">平台指标细则管理</c:if>
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <div id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="indic_text">细则名称</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="indic_text"/>
                        </div>
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:10px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<div id="toolbar" class="btn-group">
			<div>
				<button id="btn_add" type="button" class="btn btn-default" onclick="toAdd();">
	                <span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>新增
	            </button>
				<button id="btn_add" type="button" class="btn btn-default" onclick="toUpdate();">
	                <span class="glyphicon glyphicon-edit" aria-hidden="true" ></span>修改
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