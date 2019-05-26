<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(function() {
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
            url: 'drvHandleSelect.action',         //请求后台的URL（*）
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
            			
            			allot_depme:$("#allot_depme").val(),
            			begin_time:$("#begin_time").val(),
            			end_time:$("#end_time").val()
              	};
              	return param;
            },
            toolbar: '#toolbar',
            clickToSelect: true,                //是否启用点击选中行
            height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "allot_depme",                     //每一行的唯一标识，一般为主键列
            columns: [{
                field: 'index',
                align: 'center',
                width:'3%',
                title: '序号',
                formatter:function(value, row, index){
                	return index+1;
                }
            },{
                field: 'allot_depme',
                align: 'center',
                title: '处理部门'
            },{
                field: 'compn_sum',
                align: 'center',
                title: '投诉信息总数'
            },{
                field: 'compn_handle',
                align: 'center',
                title: '待处理个数',
                formatter:function(value, row, index){
                	if(row.compn_handle != 0){
	                var html = "<a onclick='toDaichuli(\""+row.allot_depme+"\")'>"+row.compn_handle+"</a>";
					return html;
                	}else{
                		return "0";
                	}
                }
            },{
                field: 'compn_end',
                align: 'center',
                title: '已完成数',
                formatter:function(value, row, index){
                	if(row.compn_end != 0){
	                var html = "<a onclick='toYiwancheng(\""+row.allot_depme+"\")'>"+row.compn_end+"</a>";
					return html;
                	}else{
                		return "0";
                	}
                }
            },{
                field: 'compn_rate',
                align: 'center',
                title: '处理完成率(%)'
            }]
        });
    };
    //得到查询的参数
	return oTableInit;
};

function toDaichuli(allot_depme){
	var diag = new top.Dialog();
	var begin_time = $("#begin_time").val();
	var end_time = $("#end_time").val();
	 diag.Drag=true;
	 diag.Title ="待处理详情";
	 diag.URL = '<%=basePath%>drvcomplaint/drvDaichuliList.action?allot_depme='+allot_depme+'&&begin_time='+begin_time+'&&end_time='+end_time;
	 diag.Width = 1200;
	 diag.Height = 700;
	 diag.CancelEvent = function(){ //关闭事件
		/*  if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}  */
		 location.reload();
		diag.close();
	 };
	 diag.show();
}

function toYiwancheng(allot_depme){
	var begin_time = $("#begin_time").val();
	var end_time = $("#end_time").val();
	/* var str;	
	str= allot_depme+";"+begin_time+";"+end_time;	 */
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="已完成详情";
	 diag.URL = '<%=basePath%>drvcomplaint/drvYiwanchengList.action?allot_depme='+allot_depme+'&&begin_time='+begin_time+'&&end_time='+end_time;
	 diag.Width = 1200;
	 diag.Height = 700;
	 diag.CancelEvent = function(){ //关闭事件
		/*  if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}  */
		 location.reload();
		diag.close();
	 };
	 diag.show();
}



</script>
</head>
<body>
	<div class="panel-body">
		<div class="page-header" >
			<h1 style="font-size: 15px;">
				投诉服务监督<small style="font-size: 15px">
				<i class="icon-double-angle-right"></i>驾驶员投诉信息处理查询
				</small>	
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="region_code">处理部门</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="allot_depme" name="allot_depme"/>
                        </div>
                        
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="company_id">投诉时间</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px; width:352px">
							从<input type="text" class="date-picker" id="begin_time" data-date-format="yyyy-mm-dd" />
							至<input type="text" class="date-picker" id="end_time" data-date-format="yyyy-mm-dd" />
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