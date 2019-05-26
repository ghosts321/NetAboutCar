<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
  /*    #fontStyle{
 	size:20px;
 	padding-left:20px
 }
  .imgStyle{
	margin-bottom:0.5em;
	width: 220px;
	height: 150px;
 }  */
/*  a:hover{color:white;text-decoration:none;}
 table{border-collapse:separate;} */
</style>
<style type="text/css">

 a:hover{color:white;text-decoration:none;}
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
        url: 'illegalMonitoringList.action',         //请求后台的URL（*）
        method: 'post',                      //请求方式（*）
        dataType: "json",
        contentType: 'application/x-www-form-urlencoded',
        striped: true,                      //是否显示行间隔色
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true,                   //是否显示分页（*）
        pageSize:8,                        //每页显示数据条数
        search: false,  //是否启用查询 
        sortable: true,                     //是否启用排序
        buttonsAlign:'right',
        toolbarAlign:'left',
        toolbar:"#toolbar",
        sortOrder: "asc",                   //排序方式
        queryParams: function queryParams(params) {   //设置查询参数  
        	var param = {
        			driverName:$("#driverName").val(),
        			vehicleNo:$("#vehicleNo").val()
          	};
          	return param;                   
        },
        clickToSelect: true,                //是否启用点击选中行
        //height: 420,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
        uniqueId: "violationId",                     //每一行的唯一标识，一般为主键列
       /*  pageNumber:1,                       //初始化加载第一页，默认第一页
        strictSearch: true,
        cardView: false,                    //是否显示详细视图
        detailView: false,                   //是否显示父子表 */
        columns: [{
            field: 'violationId',
            align: 'center',
            title: '违规标识'
        }, {
            field: 'companyId',
            align: 'center',
            title: '网约车公司标识'
        }, {
            field: 'companyName',
            align: 'center',
            title: '网约车公司名称'
        },{
            field: 'orderId',
            align: 'center',
            title: '订单编号'
        }, {
            field: 'licenseId',
            align: 'center',
            title: '机动车驾驶证号'
        }, {
            field: 'vehicleNo',
            align: 'center',
            title: '车牌号码'
        },{
            field: 'driverName',
            align: 'center',
            title: '驾驶员姓名'
        },{
            field: 'violationDescription',
            align: 'center',
            title: '违规行为'
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
	<div class="panel-body">
		<div class="page-header">
			<h1 style="font-size:15px;">
				运营监管
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					经营者违规行为监测
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
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">车牌号码</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input class="form-control"  type="text" id="vehicleNo" name="vehicleNo" value=""/>
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