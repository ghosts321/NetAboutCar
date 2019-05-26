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
    //2.初始化Button的点击事件
    /* var oButtonInit = new ButtonInit();
    oButtonInit.Init(); */
});
var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tradeList').bootstrapTable({
            url: 'findAllCar.action',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'left',
            toolbar:'#toolbar',
            sortOrder: "asc",                   //排序方式
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			carNum:$("#nav-search-input").val()
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
                field: 'carNum',
                align: 'center',
                title: '车牌号'
            }, {
                field: 'applyDate',
                align: 'center',
                title: '申请时间'
            }, {
	            field: 'applyType',
	            align: 'center',
	            title: '申请类型',
	            formatter:function(value, row, index){
	            	if(row.applyType == 1){
	            		return "申请";
	            	}else if(row.applyType == 2){
	            		return "变更";
	            	}else if(row.applyType == 3){
	            		return "注销";
	            	}else if(row.applyType == 4){
	            		return "换证";
	            	}else if(row.applyType == 5){
	            		return "补办";
	            	}
	            }
	        }, {
                field: 'appStatus',
                align: 'center',
                title: '审批状态',
                formatter:function(value, row, index){
                	if(value=="0"){
                		return "未审核";
                	}else if(value=="1"){
                		return "车辆认证通过";
                	}else if(value=="2"){
                		return "车辆外勘通过";
                	}else if(value=="3"){
                		return "变更车辆性质通过";
                	}else if(value=="4"){
                		return "窗口办理通过";
                	}else if(value=="6"){
                		return "车辆变更通过";
                	}else{
                		return "未通过";
                	}
                }
            },
            {
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
                	var html = "<button type='button' class='btn btn-default' onclick='showDetail(\"" + row.applyId + "\",\""+row.carId+"\")'><span class='glyphicon glyphicon-wrench' aria-hidden='true' ></span>受理</button>&nbsp;";
	            	if(row.appStatus == "4"){
	            		html += "<button type='button' class='btn btn-default' onclick='faZheng(\"" + row.applyId + "\",\""+row.carId+"\")'><span class='glyphicon glyphicon-education' aria-hidden='true' ></span>发证</button>";
	            	}else{
	            		html += "<button type='button' class='btn btn-default' onclick='faZheng(\"" + row.applyId + "\",\""+row.carId+"\")' disabled><span class='glyphicon glyphicon-education' aria-hidden='true' ></span>发证</button>";
	            	}
	            	return html;
                }
            }]
        });
    };
    //得到查询的参数
    return oTableInit;
};

function showDetail(applyId,carId){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="车辆详情";
	 diag.URL = '<%=basePath%>car/toShowDetail.action?carId=' + carId + '&applyId=' + applyId;
	 diag.Width = 1000;
	 diag.Height = 500;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}
function faZheng(applyId,carId){
	var flag = false;
	if(confirm("确认发证？")){
		flag = true;
	}
	if(flag){
		var url = "<%=basePath%>car/faZheng.action?carId="+carId + '&applyId=' + applyId+"&guid="+new Date().getTime();
		$.get(url,function(data){
			document.location.reload();
		});
	}
}
$(function() {
    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
    $('#search').click(function () {
    	$('#tradeList').bootstrapTable('refresh');
    });
});
</script>

</head>

<body>
	<div class="panel-body" style="padding-bottom:0px;">
		<div class="page-header">
			<h1 style="font-size:15px">
				业务审批
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					营运车辆业务
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">车牌号</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" class="form-control"  id="nav-search-input" name="carNum" />
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