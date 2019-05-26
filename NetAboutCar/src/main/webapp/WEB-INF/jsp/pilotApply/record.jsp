<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
 /* #fontStyle{
 	size:20px;
 	padding-left:20px
 } */
/*  a:hover{color:white;text-decoration:none;}
 table{border-collapse:separate;} */
</style>
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
	        url: 'recordList.action',         //请求后台的URL（*）
	        method: 'post',                      //请求方式（*）
	        dataType: "json",
	        contentType: 'application/x-www-form-urlencoded',
	        striped: true,                      //是否显示行间隔色
	        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	        pagination: true,                   //是否显示分页（*）
	        pageSize:8,                         //每页显示条数
	        search: false,  //是否启用查询 
	        sortable: true,                     //是否启用排序
	        buttonsAlign:'right',
	        toolbarAlign:'left',
	        sortOrder: "asc",                   //排序方式
	        toolbar:'#toolbar',
	        queryParams: function queryParams(params) {   //设置查询参数  
	        	var param = {
	        			userName:$("#userName").val(),
	        			comName:$("#comName").val()
	          	};
	          	return param;                   
	        },
	        clickToSelect: true,                //是否启用点击选中行
	        height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	        uniqueId: "recordid",                     //每一行的唯一标识，一般为主键列
	       /*  pageNumber:1,                       //初始化加载第一页，默认第一页
	        strictSearch: true,
	        cardView: false,                    //是否显示详细视图
	        detailView: false,                   //是否显示父子表 */
	        columns: [{
	            field: 'recordid',
	            align: 'center',
	            title: '序号'
	        },{
	            field: 'username',
	            align: 'center',
	            title: '姓名'
	        },{
	            field: 'drivecardno',
	            align: 'center',
	            title: '驾驶证号'
	        },{
	            field: 'carnum',
	            align: 'center',
	            title: '车牌号'
	        },{
	            field: 'platformname',
	            align: 'center',
	            title: '平台名称'
	        },{
	            field: 'creditcode',
	            align: 'center',
	            title: '统一社会信用代码'
	        },{
	            field: 'type',
	            align: 'center',
	            title: '合同类型',
	            formatter:function(value, row, index){
	            	if(row.type == 1){
	            		return "合同";
	            	}else{
	            		return "协议";
	            	}
	            }
	        },{
	            field: 'status',
	            align: 'center',
	            title: '状态',
	            formatter:function(value, row, index){
	            	if(row.status == 0){
	            		return "未审核";
	            	}else if(row.status == 1){
	            		return "审核不通过";
	            	}else if(row.status == 2){
	            		return "审核通过";
	            	}else if(row.status == 3){
	            		return "撤销";
	            	}
	            }
	        },{
	            field: 'handle',
	            align: 'center',
	            title: '操作',
	            formatter:function(value, row, index){
	            	var html = "<button type='button'  class='btn btn-default' onclick='dispose(\"" + row.recordid + "\")'><span class='glyphicon glyphicon-wrench' aria-hidden='true' ></span>审批</button>&nbsp;";
	            	if(row.status == 2){
	            		html += "<button type='button'  class='btn btn-default' onclick='revocation(\"" + row.recordid + "\")'><span class='glyphicon glyphicon-education' aria-hidden='true' ></span>撤销</button>";
	            	}else{
	            		html += "<button type='button' class='btn btn-default'  onclick='revocation(\"" + row.recordid + "\")' disabled><span class='glyphicon glyphicon-education' aria-hidden='true' ></span>撤销</button>";
	            	}
					return html;
	            }
	        }]
	    });
	};
	/* $('#button').click(function () {  
	    $table.bootstrapTable('refresh', {url: '../json/data1.json'});  
	}); */
	//得到查询的参数
	return oTableInit;
};
//审批
function dispose(recordid){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="备案详情";
	 diag.URL = '<%=basePath %>pilotApply/recordDetail.action?recordid='+recordid;
	 diag.Width = 1000;
	 diag.Height = 500;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
function search(){
	alert("search");
}
//撤销
function revocation(recordid){
	var flag = false;
	if(confirm("确认撤销？")){
		flag = true;
	}
	if(flag){
		$.ajax({
			type: "POST",
			url: '<%=basePath %>pilotApply/revocationRecord.action',
	    	data: {recordid:recordid},
			dataType:'json',
			success: function(data){
				window.location.href="<%=basePath %>pilotApply/record.action";
			}
		});
	}
}
</script>
</head>
<body>
	<div class="panel-body" style="padding-bottom:0px;">
		<div class="page-header">
			<h1 style="font-size:15px;">
				备案管理
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					营运驾驶员备案
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">姓名</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input class="form-control" type="text" id="userName" name="userName" value="" />
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">平台名称</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input class="form-control" type="text" id="comName" name="comName" value="" />
                        </div>
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
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