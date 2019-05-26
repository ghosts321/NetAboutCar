<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
 a:hover{color:white;text-decoration:none;}
 table{border-collapse:separate;}
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
            url: 'menuInfoList.action',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'left',
            pageSize:8,
            sortOrder: "asc",                   //排序方式
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			menuName:$("#menuName").val(),
            			parentId:2
              	};
              	return param;
            },
            clickToSelect: true,                //是否启用点击选中行
            height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "menuId",                     //每一行的唯一标识，一般为主键列

            toolbar: '#toolbar',                //工具按钮用哪个容器

            columns: [{
                field: 'menuId',
                align: 'center',
                title: '菜单编号'
            }, {
                field: 'menuName',
                align: 'center',
                title: '菜单名称'
            }, {
                field: 'menuLevel',
                align: 'center',
                title: '菜单级别',
                formatter:function(value, row, index){
                	return value+"级";
                }
            },{
                field: 'status',
                align: 'center',
                title: '菜单状态',
                formatter:function(value, row, index){
                	if(row.status == 0){
                		return "停用";
                	}else{
                		return "正常";
                	}
                }
            },{
                field: 'createDateTime',
                align: 'center',
                title: '创建时间',
                formatter:function(value, row, index){
                	return (row.createDateTime).substring(0,10);
                }
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
                	var html = "<shiro:hasRole name='系统管理员'><a class='btn btn-default' onclick='updateStatus("+row.menuId+","+row.status+")'><span class='glyphicon glyphicon-exclamation-sign'></span>停用/启用</a>"+
							   "</shiro:hasRole>";
                	/* &nbsp;<a class='btn btn-mini btn-danger' onclick='delMenu("+row.menuId+")'>删除</a>
                	<a class='btn btn-mini btn-purple' onclick='upadteMenu("+row.menuId+")'>修改</a>*/
					return html;
                }
            }]
        });
    };
    return oTableInit;
};
function addMenu(){
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="添加菜单";
	 diag.URL = 'menuInfo/toAddMenu.action';
	 diag.Width = 500;
	 diag.Height = 550;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
function updateStatus(menuId,status){
	$.ajax({
        type: "post",
        url: "updateMenuStatus.action",
        data: "menuId=" + menuId+"&status="+status,
        success: function (data) {
        	$('#tradeList').bootstrapTable('refresh');
        }
    });
}
function upadteMenu(id){
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="修改菜单";
	 diag.URL = 'menuInfo/toUpdateMenu.action?menuId='+id;
	 diag.Width = 500;
	 diag.Height = 550;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
function delMenu(id){
	var flag = false;
	if(confirm("确定要删除该菜单吗？")){
		flag = true;
	}
	if(flag){
		top.jzts();
		var url = "deleteMenu.action?menuId="+id;
		$.get(url,function(data){
			top.jzts();
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
				菜单管理
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					菜单列表
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">菜单名称</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" class="form-control"  id="menuName" name="menuName" value=""/>
                        </div>
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
      
		<table id="tradeList" style="padding-top:30px">
   		</table>
	</div>
</body>
</html>