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
            url: 'findAllLbContent.action',        //请求后台的URL（*）
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
            height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            toolbar: '#toolbar',                //工具按钮用哪个容器
           /*  pageNumber:1,                    //初始化加载第一页，默认第一页
            strictSearch: true,
            cardView: false,                    //是否显示详细视图
            detailView: false,                  //是否显示父子表 */
            columns: [{
                field: 'id',
                align: 'center',
                title: '编号'
            }, {
                field: 'title',
                align: 'center',
                title: '标题',
                formatter:function(value, row, index){
                	return '<a href="<%=request.getContextPath()%>/'+row.url+'">'+row.title+'</a>';
                }
            }, {
                field: 'createDate',
                align: 'center',
                title: '创建时间'
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
                	/* var html = "<a class='btn btn-mini btn-purple' onclick='toUpdate(\""+row.id+"\")'>修改</a>"+
							   "&nbsp;<a class='btn btn-mini btn-danger' onclick='del(\""+row.id+"\")'>删除</a>"; */
				    var html = "<button type='button' class='btn btn-default' onclick='del(\""+row.id+"\")'><span class='glyphicon glyphicon-trash'></span> 删除</button>";
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
	 diag.Title ="添加图片";
	 diag.URL = '<%=basePath%>content/toAddLb.action';
	 diag.Width = 600;
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
	 diag.Title ="修改内容";
	 diag.URL = '<%=basePath%>content/toUpdate.action?instId='+instId;
	 diag.Width = 600;
	 diag.Height = 500;
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
		top.jzts();
		var url = "<%=basePath%>content/delLb.action?id="+id+"&guid="+new Date().getTime();
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
					首页维护
					<small style="font-size: 15px">
						<i class="icon-double-angle-right"></i>
						轮播图片维护
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