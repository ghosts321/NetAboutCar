<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            url: 'drvYiwanchengDetail.action',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'right',
            sortOrder: "asc",                   //排序方式
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			complain_code:$("#complain_code").val(),
            			allot_depme:$("#allot_depme").val(),
            			begin_time:$("#begin_time").val(),
            			end_time:$("#end_time").val()
              	};
              	return param;
            },
            toolbar: '#toolbar',
            clickToSelect: true,                //是否启用点击选中行
            height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "complain_code",                     //每一行的唯一标识，一般为主键列
            columns: [{
                field: 'index',
                align: 'center',
                width:'3%',
                title: '序号',
                formatter:function(value, row, index){
                	return index+1;
                }
            },{
                field: 'complain_code',
                align: 'center',
                title: '投诉编号'
            },{
                field: 'car_company',
                align: 'center',
                title: '所属平台'
            },{
                field: 'car_number',
                align: 'center',
                title: '车牌号'
               /*  formatter:function(value, row, index){
	            	if(row.data_source == 1){
	            		return "电话热线";
	            	}else if(row.data_source=2){
	            		return "运营平台";
	            	}else{
	            	   return "公共服务平台";
	            	}
	            } */
            },{
                field: 'driver_licence',
                align: 'center',
                title: '驾驶证号码'
            },{
                field: 'compn_name',
                align: 'center',
                title: '投诉人姓名'
            },{
                field: 'compn_tel',
                align: 'center',
                title: '投诉人手机号'
            }/* ,{
                field: 'compn_email',
                align: 'center',
                title: '投诉人电子邮件'
            } */,{
                field: 'compn_time',
                align: 'center',
                title: '投诉时间'
            },{
                field: 'distri_time',
                align: 'center',
                title: '最后受理时间'
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
	                	 var html = "<button type='button' class='btn btn-default' onclick='openDrvDetail(\""+row.complain_code+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >详情</button>&nbsp;";
                        
	                	//html += "<button type='button' class='btn btn-default' onclick='openDrvHistory(\""+row.complain_code+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >处理历史</button>";
						return html;
                }
            }]
        });
    };
    //得到查询的参数
	return oTableInit;
};
$(function(){
	//日期控件
   	$('.date-picker').datepicker();
	 //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
    $('#search').click(function () {
    	//日期条件非空校验
    	var result = true;
    	if(verification() == false){
    		result = false;
    	}
    	if(result){
	    	$('#tradeList').bootstrapTable('refresh');    		
    	}
    });
});

function openDrvHistory(complain_code){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="处理历史";
	 diag.URL = '<%=basePath%>drvcomplaint/openDrvHistory.action?complain_code='+complain_code;
	 diag.Width = 700;
	 diag.Height = 500;
	 diag.CancelEvent = function(){ //关闭事件
		/* if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		} */
		location.reload();
		diag.close();
	 };
	 diag.show();
}


function openDrvDetail(complain_code){
	var diag = new top.Dialog();
	
	 diag.Drag=true;
	 diag.Title ="详情";
	 diag.URL = '<%=basePath%>drvcomplaint/openDrvDetail.action?complain_code='+complain_code;
	 diag.Width =750;
	 diag.Height =500;
	 diag.CancelEvent = function(){ //关闭事件
		/* if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		} */
		location.reload();
		diag.close();
	 };
	 diag.show();
}
</script>
</head>
<body>
	<div class="panel-body">
		<!-- <div class="page-header" >
			<h1 style="font-size: 15px;">
				投诉服务监督<small style="font-size: 15px">
				<i class="icon-double-angle-right"></i>驾驶员投诉处理
				</small>
				<small style="font-size: 15px">
				<i class="icon-double-angle-right"></i>投诉录入
				</small>
			</h1>
		</div> -->
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                <input hidden="true" id=allot_depme name=allot_depme value="${allot_depme}">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="region_code">投诉编号</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="complain_code"/>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="company_id">投诉时间</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px; width:352px">
							从<input type="text" class="date-picker" id="begin_time" value="${begin_time}" data-date-format="yyyy-mm-dd" onchange="changeDateValue();"/>
							至<input type="text" class="date-picker" id="end_time" value="${end_time}" data-date-format="yyyy-mm-dd" onchange="changeDateValue1();"/>
                        </div>
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
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