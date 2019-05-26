<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
 #fontStyle{
 	size:20px;
 	padding-left:20px
 }
  .imgStyle{
	margin-bottom:0.5em;
	width: 220px;
	height: 150px;
 }
 a:hover{color:white;text-decoration:none;}
 table{border-collapse:separate;}
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
        url: 'unoperatingDriverList.action',         //请求后台的URL（*）
        method: 'post',                      //请求方式（*）
        dataType: "json",
        contentType: 'application/x-www-form-urlencoded',
        striped: true,                      //是否显示行间隔色
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true,                   //是否显示分页（*）
        pageSize:8,							//每页显示数据条数
        search: false,  //是否启用查询 
        sortable: true,                     //是否启用排序
        buttonsAlign:'right',
        toolbarAlign:'left',
        toolbar:"#toolbar",
        sortOrder: "asc",                   //排序方式
        queryParams: function queryParams(params) {   //设置查询参数  
        	var param = {
        			driverName:$("#driverName").val(),
        			regionName:$("#regionName").val()
          	};
          	return param;                   
        },
        clickToSelect: true,                //是否启用点击选中行
        //height: 460,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
        uniqueId: "unoperatingDriverId",                     //每一行的唯一标识，一般为主键列
       /*  pageNumber:1,                       //初始化加载第一页，默认第一页
        strictSearch: true,
        cardView: false,                    //是否显示详细视图
        detailView: false,                   //是否显示父子表 */
        columns: [{
            field: 'unoperatingDriverId',
            align: 'center',
            title: '长期未运营标识'
        }, {
            field: 'regionName',
            align: 'center',
            title: '行政区划'
        }, {
            field: 'companyName',
            align: 'center',
            title: '网约车公司名称'
        }, {
            field: 'licenseId',
            align: 'center',
            title: '驾驶员身份证'
        },{
            field: 'driverName',
            align: 'center',
            title: '驾驶员姓名'
        },{
            field: 'beginTime',
            align: 'center',
            title: '检测开始时间'
        },{
            field: 'endTime',
            align: 'center',
            title: '检测结束时间'
        }, {
            field: 'createTime',
            align: 'center',
            title: '创建时间'
        }]
    });
};
/* $('#button').click(function () {  
    $table.bootstrapTable('refresh', {url: '../json/data1.json'});  
}); */
//得到查询的参数
return oTableInit;
};

</script>
</head>
<body>
	<div class="panel-body" style="padding-bottom:0px;">
		<div class="page-header">
			<h1 style="font-size:15px;">
				运营监管
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					长时间未运营驾驶员情况
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">驾驶员姓名</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input class="form-control"  type="text" id="driverName" name="driverName" value=""/>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">行政区域</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input class="form-control"  type="text" id="regionName" name="regionName" value=""/>
                        </div>
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
		<table id="tradeList">
			
   		</table>
	</div>
	
</body>
</html>