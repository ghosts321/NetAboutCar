<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
table{
	table-layout:fixed;
	empty-cells:show;
	border-collapse: collapse;
	margin:0 auto;
}
.table{
border:1px solid #cad9ea;
color:#666;
margin-bottom: 10px;
margin-top: 10px;
}
.table th {
background-repeat:repeat-x;
height:30px;
}
.table td,.table th{
border:1px solid #cad9ea;
padding:5px 0.5em 0;
}
.table tr.alter{
background-color:#f5fafe;
}
img{
margin-bottom:0.5em;
width: 100px;
height: 100px;
}
</style>
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
            url: 'platShowDetail.action',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'left',
            toolbar:'#toolbar',
            sortOrder: "asc",                   //排序方式
            clickToSelect: true,                //是否启用点击选中行
            height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "applyId",                     //每一行的唯一标识，一般为主键列
           /*  pageNumber:1,                       //初始化加载第一页，默认第一页
            strictSearch: true,
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表 */
            columns: [{
	            field: 'index',
	            align: 'center',
	            title: '序号',
                formatter:function(value, row, index){
                	return index+1;
                }
	        }, {
                field: 'indic_text',
                align: 'center',
                title: '指标名称'
            }, {
                field: 'indic_desc',
                align: 'center',
                title: '案件信息'
            }, {
	            field: 'score',
	            align: 'center',
	            title: '分值',
	            
	        }]
        });
    };
    //得到查询的参数
    return oTableInit;
};

</script>
</head>
<body>
<div class="container">

<table id="tradeList">
		</table>
	<div style="text-align: center; padding-top: 5px;padding-bottom: 5px;"><a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a></div>
	</div>
	<script language="javascript" src="jquery-1.4.2.min.js"></script>
</body>
</html>