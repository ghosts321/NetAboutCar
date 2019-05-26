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
	//日期控件
   	$('.date-picker').datepicker();
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
        url: 'globalOperationList.action',         //请求后台的URL（*）
        method: 'post',                      //请求方式（*）
        dataType: "json",
        contentType: 'application/x-www-form-urlencoded',
        striped: true,                      //是否显示行间隔色
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true,                   //是否显示分页（*）
        search: false,  //是否启用查询 
        sortable: true,                     //是否启用排序
        buttonsAlign:'right',
        toolbarAlign:'left',
        sortOrder: "asc",                   //排序方式
        queryParams: function queryParams(params) {   //设置查询参数  
        	var param = {
        			onArea:$("#onArea").val(),
        			createTime:$("#createTime").val()
          	};
          	return param;                   
        },
        clickToSelect: true,                //是否启用点击选中行
        //height: 460,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
        uniqueId: "company_id",                     //每一行的唯一标识，一般为主键列
       /*  pageNumber:1,                       //初始化加载第一页，默认第一页
        strictSearch: true,
        cardView: false,                    //是否显示详细视图
        detailView: false,                   //是否显示父子表 */
        columns: [{
            field: 'comname',
            align: 'center',
            title: '公司名称'
        }, {
            field: 'drvNum',
            align: 'center',
            title: '驾驶员总数'
        }, {
            field: 'activeDrvNum',
            align: 'center',
            title: '活跃驾驶员数'
        }, {
            field: 'carNum',
            align: 'center',
            title: '车辆总数'
        }, {
            field: 'activeCarNum',
            align: 'center',
            title: '活跃车辆数'
        }, {
            field: 'outcarNum',
            align: 'center',
            title: '小时出车数',
            formatter:function(value, row, index){
            	if("0" == row.outcarNum){
            		return 0;
            	}else{
            		if(getNowFormatDate() == $("#createTime").val()){
                		return (row.outcarNum/new Date().getHours()).toFixed(2);
                	}else{
                		return (row.outcarNum/24).toFixed(2);
                	}
            	}
            }
        }, {
            field: 'orderNum',
            align: 'center',
            title: '小时订单数',
            formatter:function(value, row, index){
            	if("0" == row.orderNum){
            		return 0;
            	}else{
            		if(getNowFormatDate() == $("#createTime").val()){
                		return (row.orderNum/new Date().getHours()).toFixed(2);
                	}else{
                		return (row.orderNum/24).toFixed(2);
                	}
            	}
            }
        }, {
            field: 'orderSuccessNum',
            align: 'center',
            title: '小时完成订单数',
            formatter:function(value, row, index){
            	if("0" == row.orderSuccessNum){
            		return 0;
            	}else{
            		if(getNowFormatDate() == $("#createTime").val()){
                		return (row.orderSuccessNum/new Date().getHours()).toFixed(2);
                	}else{
                		return (row.orderSuccessNum/24).toFixed(2);
                	}
            	}
            }
        }, {
            field: 'totalPrice',
            align: 'center',
            title: '小时完成订单率',
            formatter:function(value, row, index){
            	if("0" == row.orderNum){
            		return 0;
            	}else{
            		return (row.orderSuccessNum/row.orderNum).toFixed(2);
            	}
            }
        },{
            field: 'warnNum',
            align: 'center',
            title: '预警次数'
        }]
    });
};
/* $('#button').click(function () {  
    $table.bootstrapTable('refresh', {url: '../json/data1.json'});  
}); */
//得到查询的参数
return oTableInit;
};

function getNowFormatDate(){
    var day = new Date();
    var Year = 0;
    var Month = 0;
    var Day = 0;
    var hour=0;
    var minu=0;
    var mill=0;
    var secodes=0;
    var CurrentDate = "";
    Year= day.getFullYear();//支持IE和火狐浏览器.
    Month= day.getMonth()+1;
    Day = day.getDate();
    
    CurrentDate += Year+"-";
    if (Month >= 10 ){
     CurrentDate += Month+"-";
    }
    else{
     CurrentDate += "0" + Month+"-";
    }
    if (Day >= 10 ){
     CurrentDate += Day ;
    }
    else{
     CurrentDate += "0" + Day ;
    }
    return CurrentDate;
 } 
</script>
</head>
<body>
	<div class="panel-body" style="padding-bottom:0px;">
		<div class="page-header">
			<h1 style="font-size:15px;">
				运营监管
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					全局运营分析
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                    	<label class="control-label col-sm-1" style="font-weight: normal;" for="company_name">区域</label>
                        <div class="col-sm-1" style="padding-right: 5px;padding-left: 0px">
							<select id="onArea" name="onArea" placeholder="区域">
								<option value="">全部</option>
								<c:forEach items="${areaList}" var="area">
									<option value="${area.on_area}">${area.areaname}</option>
								</c:forEach>
	                        </select>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;">时间</label>
                        <div class="col-sm-1" style="padding-right: 5px;padding-left: 0px; ">
							<input type="text" class="date-picker" name="createTime" id="createTime" value="${createTime}" placeholder="时间" data-date-format="yyyy-mm-dd"/>
                        </div>
                        
                        <div class="col-sm-2" style="text-align:left; padding-left:0px">
                        	<input type="hidden" name="tabType" id="tabType" value="1"/>
                            <button type="button" style="margin-left:10px" id="search" class="btn btn-primary">查询</button>
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