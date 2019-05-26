<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../../../common.jsp" %>
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
            url: 'platformApplyList.action',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            pageSize:8,							//每页显示数据条数
            sortable: false,                     //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'left',
            sortOrder: "asc",                   //排序方式
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			creditCode:$("#nav-search-input").val()
              	};
              	return param;
            },
            clickToSelect: true,                //是否启用点击选中行
            height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "applyId",                     //每一行的唯一标识，一般为主键列
           /*  pageNumber:1,                       //初始化加载第一页，默认第一页
            strictSearch: true,
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表 */
            columns: [{
                field: 'applyId',
                align: 'center',
                title: '申请编码'
            }, {
                field: 'creditCode',
                align: 'center',
                title: '统一社会信用代码'
            }, {
                field: 'applyCompany',
                align: 'center',
                title: '申请公司名称'
            },{
                field: 'dutyName',
                align: 'center',
                title: '负责人姓名'
            },{
                field: 'address',
                align: 'center',
                title: '通信地址'
            },{
                field: 'applytype',
                align: 'center',
                title: '申请类型',
                formatter:function(value){
                	if(value=='1'){
                		return '申请';
                	}else if(value=='2'){
                		return '变更';
                	}else if(value=='3'){
                		return '注销';
                	}else if(value=='4'){
                		return '补办';
                	}
                }
            },{
                field: 'appStatus',
                align: 'center',
                title: '审批状态',
                formatter:function(value, row, index){
                	if(value=="0"){
                		return "未审核";
                	}else if(value=="1"){
                		return "已通过";
                	}else if(value=="2"){
                		return "已发证";
                	}else if(value=="-1"){
                		return "未通过";
                	}else if(value=="3"){
                		return "待注销";
                    }
                }
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
                	var html = "<button type='button' class='btn btn-default' onclick='showDetail(\""+row.creditCode+"\",\""+row.applyId+"\",\""+row.applytype+"\")'><span class='glyphicon glyphicon-wrench' aria-hidden='true' ></span>受理</button>&nbsp;";
	            	if(row.appStatus == "1" && row.applytype == "1"){
	            		html += "<button type='button' class='btn btn-default' onclick='faZheng(\""+row.creditCode+"\",\""+row.applytype+"\")'><span class='glyphicon glyphicon-education' aria-hidden='true' ></span>发证</button>";
	            	}else{
	            		html += "<button type='button' class='btn btn-default' onclick='faZheng(\""+row.creditCode+"\")' disabled><span class='glyphicon glyphicon-education' aria-hidden='true' ></span>发证</button>";
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
function showDetail(creditCode,applyId,applyType){
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="平台详情";
	 diag.URL = '<%=basePath%>platform/toShowDetail.action?creditCode='+creditCode+'&applyId='+applyId+'&applyType='+applyType;
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
function faZheng(creditCode,applytype){
	var flag = false;
	if(confirm("确认发证？")){
		flag = true;
	}
	if(flag){
		var url = "<%=basePath%>platform/faZheng.action?creditCode="+creditCode+"&applytype="+applytype;
		$.get(url,function(data){
			if(null != data){
				alert(data);
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
				业务审批
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					营运平台业务
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">统一社会信用代码</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" class="form-control"  id="nav-search-input" name="xydm" value=""/>
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