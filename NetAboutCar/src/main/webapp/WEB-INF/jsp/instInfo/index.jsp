<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.fixed-table-pagination{
		height:80px;
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
            url: 'findAllInstInfo.action',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'right',
            toolbar:toolbar,
            pageSize:10,
            sortOrder: "asc",                   //排序方式
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			instName:$("#instName").val(),
              	};
              	return param;
            },
            clickToSelect: true,                //是否启用点击选中行
            //height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "instId",                     //每一行的唯一标识，一般为主键列
            toolbar: '#toolbar',                //工具按钮用哪个容器
           /*  pageNumber:1,                       //初始化加载第一页，默认第一页
            strictSearch: true,
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表 */
            columns: [{
                field: 'instId',
                align: 'center',
                title: '序号',
                formatter:function(value,row,index){
                	return index+1;
                }
            },{
                field: 'instId',
                align: 'center',
                title: '机构代码'
            }, {
                field: 'instName',
                align: 'center',
                title: '机构名称'
            }, {
                field: 'sinstName',
                align: 'center',
                title: '机构简称'
            }, {
                field: 'pinstCode',
                align: 'center',
                title: '上级机构代码'
            }, {
                field: 'telNo',
                align: 'center',
                title: '机构电话'
            }, {
                field: 'address',
                align: 'center',
                title: '机构地址'
            }, {
                field: 'contractName',
                align: 'center',
                title: '联系人'
            }, {
                field: 'contractTelNo',
                align: 'center',
                title: '联系电话'
            }, {
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
                	var html = "<shiro:hasPermission name='instinfoUpdate'><a class='btn btn-default' onclick='toUpdate(\""+row.instId+"\")'><span class='glyphicon glyphicon-edit'></span>修改</a></shiro:hasPermission>"+
							   "&nbsp;<shiro:hasPermission name='instinfoDelete'><a class='btn btn-default' onclick='del(\""+row.instId+"\",\""+row.pinstCode+"\")'><span class='glyphicon glyphicon-remove'></span>删除</a></shiro:hasPermission>";
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
function toAdd(){
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="添加机构";
	 diag.URL = '<%=basePath%>instInfo/toAdd.action';
	 diag.Width = 450;
	 diag.Height = 500;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
function toUpdate(instId){
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="修改机构";
	 diag.URL = '<%=basePath%>instInfo/toUpdate.action?instId='+instId;
	 diag.Width = 450;
	 diag.Height = 500;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
function del(instId,isParent){
	var flag = false;
	if(isParent!=""){
		if(confirm("确定要删除该机构吗？其下子机构将一并删除！")){
			flag = true;
		}
	}else{
		if(confirm("确定要删除该机构吗？")){
			flag = true;
		}
	}
	if(flag){
		top.jzts();
		var url = "<%=basePath%>instInfo/del.action?instId="+instId+"&guid="+new Date().getTime();
		$.get(url,function(data){
			top.jzts();
			document.location.reload();
		});
	}
}
</script>

</head>

<body>

	<div class="panel-body">
		<div class="page-header">
			<h1 style="font-size:15px;">
				系统管理
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					机构管理
				</small>
			</h1>
		</div>
  		<div class="panel panel-default">
           <div class="panel-body">
           	<span class="title">查询条件</span>
               <form id="formSearch" class="form-horizontal">
                   <div class="form-group" style="margin-top:15px">
                       <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">机构名称</label>
                       <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                           <input type="text" class="form-control"  id="instName" name="instName" value=""/>
                       </div>
                       <div class="col-sm-4" style="text-align:left; padding-left:0px">
                           <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
                       </div>
                   </div>
               </form>
           </div>
       </div>
       <div id="toolbar" class="btn-group">
		<shiro:hasPermission name='instinfoAdd'>
		    <div>
		    	&nbsp;<button id="btn_add" type="button" class="btn btn-default" onclick="toAdd();">
	                <span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>新增
	            </button>
	   		</div>
   		</shiro:hasPermission>
       </div>
	<table id="tradeList" >
	 </table>				 
</div>
</body>
</html>