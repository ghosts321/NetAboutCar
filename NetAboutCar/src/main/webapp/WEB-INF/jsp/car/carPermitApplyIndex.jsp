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
            url: 'findAllInstInfo.action',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            buttonsAlign:'right',
            showRefresh:true,
            toolbarAlign:'left',
            toolbar:toolbar,
            sortOrder: "asc",                   //排序方式
            queryParams: oTableInit.queryParams,//传递参数（*）
            clickToSelect: true,                //是否启用点击选中行
            height: 460,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "instId",                     //每一行的唯一标识，一般为主键列
            toolbar: '#toolbar',                //工具按钮用哪个容器
           /*  pageNumber:1,                       //初始化加载第一页，默认第一页
            strictSearch: true,
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表 */
            columns: [{
            	checkbox:true
            },{
                field: 'instId',
                align: 'left',
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
                field: 'areaCode',
                align: 'center',
                title: '所属区域'
            }, {
                field: 'description',
                align: 'center',
                title: '备注'
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
                	var html = "<a class='btn btn-mini btn-purple' onclick='toUpdate(\""+row.instId+"\")'>修改</a>"+
							   "&nbsp;<a class='btn btn-mini btn-danger' onclick='del(\""+row.instId+"\",\""+row.pinstCode+"\")'>删除</a>";
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
	 diag.Width = 600;
	 diag.Height = 400;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}
function toUpdate(instId){
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="修改机构";
	 diag.URL = '<%=basePath%>instInfo/toUpdate.action?instId='+instId;
	 diag.Width = 600;
	 diag.Height = 400;
	 diag.CancelEvent = function(){ //关闭事件
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

		<div class="page-content">
						<div class="page-header">
							<h1 style="font-size:25px;font-weight: lighter;color: #2679b5">
								机构管理
								<small style="font-size: 19px">
									<i class="icon-double-angle-right"></i>
									机构维护
								</small>
							</h1>
						</div>
						<form action="happuser/listUsers.do" method="post" name="userForm" id="userForm">
			<table border='0'>
			<tbody>
				<tr>
					<td><p id="fontStyle">根据条件查询：</p></td>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="机构名称" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="机构地址" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
				<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
				</tr>
			  </tbody>
			</table>
		     <div id="toolbar" style="padding-left: 15px">
			&nbsp;<a class="btn btn-small btn-success" onclick="toAdd();">新增</a>
   		   </div>
			<table id="tradeList" class="table table-striped table-bordered table-hover">
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