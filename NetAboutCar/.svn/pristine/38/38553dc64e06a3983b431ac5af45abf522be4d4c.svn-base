<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
 #fontStyle{
 	size:20px;
 	padding-left:20px
 }
 a:hover{color:white;text-decoration:none;}
 table{border-collapse:separate;}
 th{
  overflow:hidden;
  white-space:nowrap;
  text-overflow:ellipsis;
 }
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
            url: 'roleInfoList.action',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            pageSize:8,							//每页显示数据条数
            sortable: false,                     //是否启用排序
            toolbarAlign:'right',
            toolbar:'#toolbar',
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			roleName:$("#roleName").val(),
            			flag:'1'
              	};
              	return param;                   
            },
            sortOrder: "asc",                   //排序方式
            clickToSelect: true,                //是否启用点击选中行
            height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "roleId",                     //每一行的唯一标识，一般为主键列
            //toolbar: '#toolbar',                //工具按钮用哪个容器
            pageSize:8,
            columns: [{
                field: 'roleId',
                align: 'center',
                title: '序号'
            }, {
                field: 'roleName',
                align: 'center',
                title: '角色名称'
            }, {
                field: 'remark',
                align: 'center',
                title: '角色描述'
            }, {
                field: 'createDateTime',
                align: 'center',
                title: '创建时间',
                formatter:function(value, row, index){
                	return (row.createDateTime).substring(0,10);
                }
            },{
                field: 'menuIds',
                align: 'center',
                title: '菜单'
            },{
                field: 'menuNames',
                align: 'center',
                title: '菜单',
                width:'10%'
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
                	var html = "<shiro:hasPermission name='distributePermis'><a class='btn btn-default' onclick=assignPermissions("+row.roleId+",'"+row.menuIds+"')><span class='glyphicon glyphicon-cog'></span>分配权限</a>"+
							   "</shiro:hasPermission>"+
							   "";
							   /* &nbsp;<a class='btn btn-mini btn-purple' onclick='upadteRole("+row.roleId+")'>修改</a>
							   &nbsp;<a class='btn btn-mini btn-danger' onclick='delRole("+row.roleId+")'>删除</a> */
					return html;
                }
            }]
        });
    };
    return oTableInit;
};
$(function () {
	TableInit();
	$('#tradeList').bootstrapTable('hideColumn', 'menuIds');
	$('#tradeList').bootstrapTable('hideColumn', 'menuNames');
});
function addRole(){
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="添加角色";
	 diag.URL = 'roleInfo/toAddRole.action';
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
function upadteRole(id){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="修改角色";
	 diag.URL = 'roleInfo/toUpdateRole.action?roleId='+id;
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
function delRole(id){
	var flag = false;
	if(confirm("确定要删除该角色吗？")){
		flag = true;
	}
	if(flag){
		top.jzts();
		var url = "deleteRole.action?roleId="+id;
		$.get(url,function(data){
			top.jzts();
			document.location.reload();
		});
	}
}
//分配权限
function assignPermissions(Id,menuId){
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="分配菜单权限";
	 diag.URL = '<%=basePath%>roleInfo/toAssignPermissions.action?roleId='+Id+'&menuIds='+menuId;
	 diag.Width = 335;
	 diag.Height = 556;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
</script>
</head>
<body>
	<div class="panel-body" style="padding-bottom:0px;">
		<div class="page-header">
			<h1 style="font-size:15px;">
				角色管理
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					角色列表
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">角色名称</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" class="form-control"  id="roleName" name="roleName" value=""/>
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