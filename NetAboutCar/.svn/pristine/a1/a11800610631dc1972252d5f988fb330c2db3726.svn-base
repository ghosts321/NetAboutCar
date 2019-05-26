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
    	oTableInit.queryParams = function (params) {
        	return {
 //       		dataTitle:'dsfsdfsd'	
        	}    	
        }
    	
        $('#tradeList').bootstrapTable({
            url: 'findAllDataCatalog.action',        //请求后台的URL（*）
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
            toolbar:toolbar,
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
                title: '标题',
            }, {
                field: 'createTime',
                align: 'center',
                title: '创建时间',
                formatter:function(value){
                	return moment(value.time).format('YYYY-MM-DD HH:mm:ss');
                }
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
                	/* var html = "<a class='btn btn-mini btn-purple' onclick='toUpdate(\""+row.id+"\")'>修改</a>"+
							   "&nbsp;<a class='btn btn-mini btn-danger' onclick='del(\""+row.id+"\")'>删除</a>"; */
					var html ="<button type='button' class='btn btn-default' onclick='toUpdate(\""+row.dataCode+"\")'><span class='glyphicon glyphicon-edit'></span> 修改</button>";
				    html += "<button type='button' class='btn btn-default' onclick='del(\""+row.dataCode+"\")'><span class='glyphicon glyphicon-trash'></span> 删除</button>";
				    html += "<button type='button' class='btn btn-default' onclick='toDeminsion(\""+row.dataCode+"\")'><span class='glyphicon glyphicon-edit'></span> 维度定义</button>";
				    //html += "<button type='button' class='btn btn-default' onclick='toGraphics(\""+row.dataCode+"\")'><span class='glyphicon glyphicon-edit'></span> 统计图形定义</button>";
				    html += "<button type='button' class='btn btn-default' onclick='toCreateTask(\""+row.dataCode+"\")'><span class='glyphicon glyphicon-edit'></span> 创建定时任务</button>";
				    html += "<button type='button' class='btn btn-default' onclick='toQueryData(\""+row.dataCode+"\")'><span class='glyphicon glyphicon-search'></span>查看数据</button>";
					   
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

function toQueryData(dataCode){
	location.href="${path}/jcfx/cksj.action?dataCode="+dataCode;
}

function toCreateTask(dataCode){
	if(confirm('确定要创建定时任务吗？')){
		var url = "${path}/jcfx/createTask.action?dataCode="+dataCode+"&guid="+new Date().getTime();
		$.get(url,function(data){
			if(data=='success'){
				alert('任务创建成功');
			}else{
				alert('任务创建失败:'+data);
			}
		});
	}	
}

function toAdd(){
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="新建统计数据种类";
	 diag.URL = '${path}/jcfx/tjsjzl.action';
	 diag.Width = 800;
	 diag.Height = 600;
	 diag.CancelEvent = function(){ //关闭事件
		/* if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		} */
		$('#tradeList').bootstrapTable('refresh');
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
		 $('#tradeList').bootstrapTable('refresh');
		diag.close();
	 };
	 diag.show();
}


function toDeminsion(dataCode){
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="维度定义";
	 diag.URL = '${path}/jcfx/wddy.action?dataCode='+dataCode;
	 diag.Width = 1000;
	 diag.Height = 600;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

function del(dataCode){
	var flag;
	if(confirm("确定要删除该记录？")){

		var url = "${path}/jcfx/scsjzl.action?dataCode="+dataCode+"&guid="+new Date().getTime();
		$.get(url,function(data){
			if(data=='success'){
				$('#tradeList').bootstrapTable('refresh');		
			}else{
				alert('删除失败:'+data);
			}
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
						统计数据目录
					</small>
				</h1>
			</div>
  		   <div id="toolbar" class="btn-group">
			<div>
            	<button id="btn_add" type="button" class="btn btn-default" onclick="toAdd();">
	                <span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>新增
	            </button>
            </div>
        </div>
		<table id="tradeList">
	 	</table>
	</div>
</body>
</html>