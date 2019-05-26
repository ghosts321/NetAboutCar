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
});
var TableInit = function () {
    var oTableInit = new Object();
    
    //初始化Table
    oTableInit.Init = function () {
    	oTableInit.queryParams = function (params) {
        	return {
 //       		dataTitle:'dsfsdfsd'	
        	}    	
        }
    	
        $('#tradeList').bootstrapTable({
            url: 'findAllTask.action',        //请求后台的URL（*）
            contentType:'application/x-www-form-urlencoded',
            method: 'post',                      //请求方式（*）
            dataType: "json",
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            pageSize:8,							//每页显示数据条数
            sortable: false,                    //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'right',
            sortOrder: "asc",                   //排序方式
            queryParams: oTableInit.queryParams,//传递参数（*）
            clickToSelect: true,                //是否启用点击选中行
            //height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            toolbar: '#toolbar',                //工具按钮用哪个容器
           /*  pageNumber:1,                    //初始化加载第一页，默认第一页
            strictSearch: true,
            cardView: false,                    //是否显示详细视图
            detailView: false,                  //是否显示父子表 */
            columns: [{
                field: 'dataCode',
                align: 'center',
                title: '数据代码'
            }, {
                field: 'dataTitle',
                align: 'center',
                title: '数据标题',
            }, {
                field: 'id',
                align: 'center',
                title: '任务序号'
            }, {
                field: 'params',
                align: 'center',
                title: '执行时间设定'
            },{
                field: 'finishTime',
                align: 'center',
                title: '实际执行时间'
            },{
                field: 'status',
                align: 'center',
                title: '任务状态',
                formatter:function(){
                	return '挂起';
                }
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
                	/* var html = "<a class='btn btn-mini btn-purple' onclick='toUpdate(\""+row.id+"\")'>修改</a>"+
							   "&nbsp;<a class='btn btn-mini btn-danger' onclick='del(\""+row.id+"\")'>删除</a>"; */
					var html ="<button type='button' class='btn btn-default' onclick='del(\""+row.id+"\")'><span class='glyphicon glyphicon-edit'></span> 取消</button>";
				    html += "<button type='button' class='btn btn-default' onclick='reset(\""+row.dataCode+"\")'><span class='glyphicon glyphicon-trash'></span> 重新执行</button>";
					   
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
	 diag.Title ="新建统计数据种类";
	 diag.URL = '<%=basePath%>jcfx/tjsjzl.action';
	 diag.Width = 800;
	 diag.Height = 600;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
function toUpdate(dataCode){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="修改统计数据种类";
	 diag.URL = '${path}/jcfx/xgsjzl.action?dataCode='+dataCode;
	 diag.Width = 1000;
	 diag.Height = 600;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}


function toDeminsion(dataCode){
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="维度定义";
	 diag.URL = '${path}/jcfx/wddy.action?dataCode='+dataCode;
	 diag.Width = 800;
	 diag.Height = 600;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}

function del(id){
	var flag;
	if(confirm("确定要删除该记录？")){
		flag = true;
	}
	if(flag){
		var url = "${path}/jcfx/delTask.action?id="+id+"&guid="+new Date().getTime();
		$.get(url,function(data){
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
					决策分析
					<small style="font-size: 15px">
						<i class="icon-double-angle-right"></i>
						统计任务一览
					</small>
				</h1>
			</div>
<!--   		   <div id="toolbar" class="btn-group">
			<div>
            	<button id="btn_add" type="button" class="btn btn-default" onclick="toAdd();">
	                <span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>新增
	            </button>
            </div>
        </div>
 -->		
 		<table id="tradeList">
	 	</table>
	</div>
</body>
</html>