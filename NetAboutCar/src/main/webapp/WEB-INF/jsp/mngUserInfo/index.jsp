<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">

</style>
<script type="text/javascript">
//服务器校验
function regist(){
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="添加管理员";
	 diag.URL = '<%=basePath%>mngUserInfo/toRegistUser.action';
	 diag.Width = 550;
	 diag.Height = 500;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}
var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tradeList').bootstrapTable({
            url: 'mngUserList.action',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: true,                     //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'right',
            toolbar:'#toolbar',
            pageSize:8,
            sortOrder: "asc",                   //排序方式
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			userName:$("#userName").val(),
            			realName:$("#realName").val()
              	};
              	return param;
            },
            clickToSelect: true,                //是否启用点击选中行
            //height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "userId",                     //每一行的唯一标识，一般为主键列
            columns: [{
                field: 'userId',
                align: 'center',
                title: '序号',
                formatter:function(value, row, index){
                	return index+1;
                }
            }, {
                field: 'userName',
                align: 'center',
                title: '用户名'
            }, {
                field: 'realName',
                align: 'center',
                title: '真实姓名'
            },{
                field: 'sex',
                align: 'center',
                title: '性别',
                formatter:function(value, row, index){
                	if(row.sex == 1){
                		return "男";
                	}else{
                		return "女";
                	}
                }
            },{
                field: 'birthday',
                align: 'center',
                title: '出生日期'
            }, {
                field: 'phoneNum',
                align: 'center',
                title: '手机号'
            }, {
                field: 'createDate',
                align: 'center',
                title: '创建时间',
                formatter:function(value, row, index){
                	return (row.createDate).substring(0,10);
                }
            }, {
                field: 'roleId',
                align: 'center',
                visible: false,
                title: '角色id列表'
            }, {
                field: 'roleName',
                align: 'center',
                title: '角色列表'
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
                	var html = "<shiro:hasPermission name='distributeRole'><a class='btn btn-default' onclick=assignRole("+row.userId+",'"+row.roleId+"')><span class='glyphicon glyphicon-edit'></span>分配角色</a></shiro:hasPermission>"+
							   "";
							   /* &nbsp;<a class='btn btn-mini btn-purple' onclick='toUpadteUser("+row.userId+")'>修改</a>
						    	&nbsp;<a class='btn btn-mini btn-danger' onclick='delUser("+row.userId+")'>删除</a>*/
					return html;
                }
            }]
        });
    };
    return oTableInit;
};
$(function() {
    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
    $('#search').click(function () {  
    	$('#tradeList').bootstrapTable('refresh');
    });
    
    $("#sel_exportoption").change(function () {
        $('#tradeList').bootstrapTable('refreshOptions', {
            exportDataType: $(this).val()
        });
    });
    $("#myModal").modal("none");
});


/* $(function () {
	TableInit();
	$('#tradeList').bootstrapTable('hideColumn', 'roleId');
}); */
//修改
function toUpadteUser(Id){
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="用户信息修改";
	 diag.URL = '<%=basePath%>mngUserInfo/toUpdateUser.action?userId='+Id;
	 diag.Width = 600;
	 diag.Height = 650;
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			 setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
function delUser(userId){
	var flag = false;
	if(confirm("确定要删除该用户吗？")){
		flag = true;
	}
	if(flag){
		top.jzts();
		var url = "deleteUser.action?userId="+userId;
		$.get(url,function(data){
			top.jzts();
			document.location.reload();
		});
	}
}
//分配角色
function assignRole(Id,roleId){
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="分配角色";
	 diag.URL = '<%=basePath%>mngUserInfo/toAssignRole.action?userId='+Id+'&roleIds='+roleId;
	 diag.Width = 323;
	 diag.Height = 210;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
function getFile(obj,inputName){
	var file_name = $(obj).val();
	var suffix=file_name.split(".");
	var last=suffix[suffix.length-1];
	var tp ="xls,xlsx";
	var rs=tp.indexOf(last);
	
	//如果返回的结果大于或等于0，说明包含允许上传的文件类型
	if(rs>=0){
		 $("input[name='"+inputName+"']").val(file_name);
		 return true;
	}else{
		 alert("您选择的文件不是有效的Excel文件！");
		 $("input[name='"+inputName+"']").val("");
		 return false;
	}
}
function exportFile(){
	alert("准备导出！");
	window.location.href="exportExcel.action";
}
function importFile(){
	$("#importForm").submit();
}
</script>
</head>
<body>
	<div class="panel-body">
		<div class="page-header">
			<h1 style="font-size:15px;">
				管理员管理
				<small style="font-size: 15px;">
					<i class="icon-double-angle-right"></i>
					管理员列表
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">用户名</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" class="form-control"  id="userName" name="userName" value=""/>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">真实姓名</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" class="form-control"  id="realName" name="realName" value=""/>
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
		    	&nbsp;<button id="btn_add" type="button" class="btn btn-default" onclick="javascript:regist();">
	                <span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>新增
	            </button>
	   		</div>
       </div>
		<table id="tradeList" >
   		</table>
	</div>
</body>
</html>