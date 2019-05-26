<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
//服务器校验
var msgg =  '<%=request.getAttribute("msg")%>';
 if(msgg!="null"){
	alert(msgg);
	 
 }
var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tradeList').bootstrapTable({
            url: 'drvUserList.action',         //请求后台的URL（*）
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
            			username:$("#username").val(),
            			certno:$("#certno").val()
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
                field: 'certno',
                align: 'center',
                title: '身份证号码'
            },  {
                field: 'username',
                align: 'center',
                title: '用户名'
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
            }, {
                field: 'drivecardno',
                align: 'center',
                title: '驾驶证号'
            }, {
                field: 'address',
                align: 'center',
                title: '家庭地址'
            }, {
                field: 'telno',
                align: 'center',
                title: '手机'
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
                	var html = "<shiro:hasPermission name='distributeRole'><a class='btn btn-default' onclick=updatePwd('"+row.certno+"')><span class='glyphicon glyphicon-edit'></span>修改密码</a></shiro:hasPermission>"+
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
function updatePwd(certno){
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="驾驶员密码修改";
	 diag.URL = '<%=basePath%>drvUserInfo/toUpdateUser.action?certno='+certno;
	 diag.Width = 300;
	 diag.Height = 250;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

</script>
</head>
<body>
	<div class="panel-body">
		<div class="page-header">
			<h1 style="font-size:15px;">
				驾驶员管理
				<small style="font-size: 15px;">
					<i class="icon-double-angle-right"></i>
					驾驶员列表
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">驾驶员姓名</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" class="form-control"  id="username" name="username" value=""/>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">身份证号</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" class="form-control"  id="certno" name="certno" value=""/>
                        </div>
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        
		<table id="tradeList" >
   		</table>
	</div>
</body>
</html>