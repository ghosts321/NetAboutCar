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
            url: 'findAllContent.action',        //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                    //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'right',
            toolbar:toolbar,
            pageSize:8,							//每页显示数据条数
            sortOrder: "asc",                   //排序方式
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			title:$("#title").val()
              	};
              	return param;
            },
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
                field: 'type',
                align: 'center',
                title: '类型',
                formatter:function(value, row, index){
                	var html="";
                	if(value=="0"){
                		html="图片新闻";
                	}else if(value=="1"){
                		html="信息咨讯";
                	}else if(value=="2"){
                		html="信息公告";
                	}else if(value=="3"){
                		html="政策法规";
                	}else if(value=="4"){
                		html="诚信信息";
                	}else if(value=="5"){
                		html="投诉披露 ";
                	}
					return html;
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
                	var html = "<a class='btn btn-default' onclick='toUpdate(\""+row.id+"\")'><span class='glyphicon glyphicon-edit'></span>修改</a>"+
							   "&nbsp;<a class='btn btn-default' onclick='del(\""+row.id+"\")'><span class='glyphicon glyphicon-remove'></span>删除</a>";
				    /* var html = "<a class='btn btn-mini btn-danger' onclick='del(\""+row.id+"\")'>删除</a>";*/
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
	window.location.href="<%=basePath%>content/toAdd.action";
	 <%-- var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="添加内容";
	 diag.URL = '<%=basePath%>content/toAdd.action';
	 diag.Width = 1080;
	 diag.Height = 600;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show(); --%>
}
function toUpdate(id){
	 window.location.href='<%=basePath%>content/toUpdate.action?id='+id;
	 <%-- var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="修改内容";
	 diag.URL = '<%=basePath%>content/toUpdate.action?id='+id;
	 diag.Width = 450;
	 diag.Height = 300;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show(); --%>
}
function del(id){
	var flag;
	if(confirm("确定要删除该记录？")){
		flag = true;
	}
	if(flag){
		var url = "<%=basePath%>content/del.action?id="+id+"&guid="+new Date().getTime();
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
    //2.初始化Button的点击事件
    /* var oButtonInit = new ButtonInit();
    oButtonInit.Init(); */
});
</script>

</head>

<body>

		<div class="panel-body">
			<div class="page-header">
				<h1 style="font-size:15px;">
					首页维护
					<small style="font-size: 15px;">
						<i class="icon-double-angle-right"></i>
						首页内容维护
					</small>
				</h1>
			</div>
			<!-- <table border='0'>
			<tbody>
				<tr>
					<td><p id="fontStyle">根据条件查询：</p></td>
					<td>
							<input autocomplete="off" id="nav-search-input" type="text" name="title" value="" placeholder="标题" />
					</td>
				<td style="vertical-align:top;"><button class="btn btn-mini btn-light" id="search" title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
				</tr>
			  </tbody>
			</table>
		     <div id="toolbar" style="padding-left: 15px">
			&nbsp;<a class="btn btn-small btn-success" onclick="toAdd();">新增</a>
   		   </div> -->
   		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">标题</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" class="form-control"  id="title" name="title" value=""/>
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