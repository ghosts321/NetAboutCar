<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../../../common.jsp" %>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<script type="text/javascript">
$(function(){
	var oTable = new TableInit();
	oTable.Init();
	 $('#search').click(function () {                                                                                                                                    
	    	$('#tradeList').bootstrapTable('refresh');                                                                                                                      
	    });
	 
		$('.date-picker').datepicker();

});

var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tradeList').bootstrapTable({
            url: '<%=basePath%>orderSet/orderList.action',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'right',
            toolbar:'#toolbar',
            sortOrder: "asc",                   //排序方式
			pageSize:8,							//每页显示数据条数
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			bespeakDate:$("#nav-search-input").val()
              	};
              	return param;
            },
            clickToSelect: true,                //是否启用点击选中行
            height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "bespeakId",                     //每一行的唯一标识，一般为主键列
           /*  pageNumber:1,                       //初始化加载第一页，默认第一页
            strictSearch: true,
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表 */
            columns: [{
                field: 'bespeakId',
                align: 'center',
                title: '预约代码'
            }, {
                field: 'address',
                align: 'center',
                title: '办理地点'
            }, {
                field: 'bespeakDate',
                align: 'center',
                title: '预约日期'
            },{
                field: 'morningCount',
                align: 'center',
                title: '上午预约人数'
            },{
                field: 'afternoonCount',
                align: 'center',
                title: '下午预约人数'
            },
            {
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
	                	var html = "<button class='btn btn-default' onclick='toUpdate(\""+row.bespeakId+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >修改</button>";
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
	 diag.Title ="添加驾驶员预约窗口";
	 diag.URL = '<%=basePath%>orderSet/toAdd.action';
	 diag.Width = 400;
	 diag.Height = 300;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
function toUpdate(bespeakId){
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="驾驶员预约修改窗口";
	 diag.URL = '<%=basePath%>orderSet/toUpdate.action?bespeakId='+bespeakId;
	 diag.Width = 400;
	 diag.Height = 200;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
</script>
<body>
<div class="panel-body">
			<div class="page-header">
				<h1 style="font-size:15px;">
					业务审核
					<small style="font-size: 15px">
						<i class="icon-double-angle-right"></i>
						驾驶员预约
					</small>
				</h1>
			</div>
			<!-- <table border='0'>
			<tbody>
				<tr>
										
				<tr>
					<td><p id="fontStyle">查询条件：</p></td>
					<td>
						<span class="input-icon">
							<input class="date-picker" autocomplete="off" id="nav-search-input" type="text" data-date-format="yyyy-mm-dd" name="bespeakDate" value="" placeholder="预约时间" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
				<td style="vertical-align:top;"><button id="search" class="btn btn-mini btn-light" title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
				</tr>
					<td><a class="btn btn-small btn-success" onclick="toAdd();">新增</a></td>
				</tr>
			  </tbody>
			</table> -->
			<div class="panel panel-default">
				<div class="panel-body">
	            	<span class="title">查询条件</span>
	                <form id="formSearch" class="form-horizontal">
	                    <div class="form-group" style="margin-top:15px">
	                       <!--  <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">预约时间：</label>
	                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
	                            <input class="date-picker" autocomplete="off" id="nav-search-input" type="text" data-date-format="yyyy-mm-dd" name="bespeakDate" value="" />
	                        </div> -->
	                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">预约时间</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input class="date-picker" autocomplete="off" id="nav-search-input"
							type="text" data-date-format="yyyy-mm-dd"
							 />
                        </div>
	                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
	                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
	                        </div>
	                    </div>
	                </form>
	            </div>
			</div>
			<div id="toolbar" style="float: right" class="btn-group">
			    <div>
			    	<button id="btn_add" type="button" class="btn btn-default" onclick="toAdd();">
		                <span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>新增
		            </button>
		   		</div>
	        </div>
			<table id="tradeList">
			 </table>				 
					<%-- <c:choose>
						<c:when test="${not empty menuList}">
							<c:forEach items="${menuList}" var="menu" varStatus="vs">
							<tr id="tr ${menu.MENU_ID }">
							<td class="center">${vs.index+1}</td>
							<td class='center'><i class="${menu.MENU_ICON }">&nbsp;</i>${menu.MENU_NAME }&nbsp;
								<c:if test="${menu.MENU_TYPE == '1' }">
								<span class="label label-success arrowed">系统</span>
								</c:if>
								<c:if test="${menu.MENU_TYPE != '1' }">
								<span class="label label-important arrowed-in">业务</span>
								</c:if>
							</td>
							<td>${menu.MENU_URL == '#'? '': menu.MENU_URL}</td>
							<td class='center'>${menu.MENU_ORDER }</td>
							<td style="width: 25%;">
							<a class='btn btn-mini btn-warning' onclick="openClose('${menu.MENU_ID }',this,${vs.index })" >展开</a>
							<a class='btn btn-mini btn-purple' title="图标" onclick="editTb('${menu.MENU_ID }')" ><i class='icon-picture'></i></a>
							<a class='btn btn-mini btn-info' title="编辑" onclick="editmenu('${menu.MENU_ID }')" ><i class='icon-edit'></i></a>
							<a class='btn btn-mini btn-danger' title="删除"  onclick="delmenu('${menu.MENU_ID }',true)"><i class='icon-trash'></i></a>
							</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
							<td colspan="100">没有相关数据</td>
							</tr>
						</c:otherwise>
					</c:choose> --%>
</div>
</body>
</html>