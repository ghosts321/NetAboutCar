<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.col-sm-3{
 width: 14%;
}
.col-sm-1 {
    width: 11.333333%;
}
.panel{
 margin-bottom: 0px;
}

#alginLeft{
 float: right !important;
}
.pagination{
 padding-right: 5px;
}
</style>
<script type="text/javascript">
var TableInit = function () {
	var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tradeList').bootstrapTable({
            url: 'getMngOperatingTimeSetList.action',         //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            pageSize: 8,						//每页显示数据条数
            sortable: false,                     //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'right',
            toolbar:"#toolbar",
            sortOrder: "asc",                   //排序方式
            queryParams: function queryParams(params) {   //设置查询参数  
            	var param = {
            			company_name:$("#company_name").val(),
            			begin_time:$("#begin_time").val(),
            			end_time:$("#end_time").val()
              	};
              	return param;
            },
            toolbar: '#toolbar',
            clickToSelect: true,                //是否启用点击选中行
            //height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "operating_time_id",                     //每一行的唯一标识，一般为主键列
            columns: [{
            	checkbox:true,
            },{
                field: 'index',
                align: 'center',
                width:'3%',
                title: '序号',
                formatter:function(value, row, index){
                	return index+1;
                }
            },{
                field: 'region_code',
                align: 'center',
                title: '行政区划代码'
            }, {
                field: 'region_name',
                align: 'center',
                title: '行政区划名称'
            },{
                field: 'company_id',
                align: 'center',
                title: '网约车公司标识'
            },{
                field: 'company_name',
                align: 'center',
                title: '网约车公司名称'
            },{
                field: 'begin_time',
                align: 'center',
                title: '监测开始时间'
            },{
                field: 'end_time',
                align: 'center',
                title: '监测结束时间'
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
	                	var html = "<button type='button' class='btn btn-default' onclick='toUpdate(\""+row.operating_time_id+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >修改</button>";
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
    	}; 
    });
});

// 日期校验
function changeDateValue(){
	var beginTime = $("#begin_time").val();
	var endTime = $("#end_time").val();	
	
	var arr = beginTime.split("-");
    var begintime = new Date(arr[0], arr[1], arr[2]);
    var begintimes = begintime.getTime();

    var arrs = endTime.split("-");
    var endtime = new Date(arrs[0], arrs[1], arrs[2]);
    var endtimes = endtime.getTime();

	if(endTime == "" || begintimes > endtimes){ //开始时间大于结束时间时，设置结束时间的值为开始时间
		$("#end_time").val(beginTime);
	}
}
function changeDateValue1(){
	var beginTime = $("#begin_time").val();
	var endTime = $("#end_time").val();	
	
	var arr = beginTime.split("-");
    var begintime = new Date(arr[0], arr[1], arr[2]);
    var begintimes = begintime.getTime();

    var arrs = endTime.split("-");
    var endtime = new Date(arrs[0], arrs[1], arrs[2]);
    var endtimes = endtime.getTime();

	if(beginTime == "" || begintimes > endtimes){ //开始时间大于结束时间时，设置结束时间的值为开始时间
		$("#begin_time").val(endTime);
	}
}

// 添加回车事件
document.onkeydown=function(event){
    var e = event || window.event || arguments.callee.caller.arguments[0];
    if(e && e.keyCode==13){ // enter 键
    	
    	//日期条件非空校验
    	var result = true;
    	if(verification() == false){
    		result = false;
    	}
    	if(result){
	    	$('#tradeList').bootstrapTable('refresh');
    	}; 
    }
};

// 日期查询条件非空校验
function verification() {
	if($("#begin_time").val() != "" &&  $("#end_time").val() == ""){
		$("#end_time").tips({
			side:3,
            msg:'请选择监测结束时间',
            bg:'#AE81FF',
            time:2
        });
		$("#end_time").focus();
		return false;
	}
	if($("#end_time").val() != "" &&  $("#begin_time").val() == ""){
		$("#begin_time").tips({
			side:3,
            msg:'请选择监测开始时间',
            bg:'#AE81FF',
            time:2
        });
		$("#begin_time").focus();
		return false;
	}
}

function toAdd(){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="增加长期未运营记录";
	 diag.URL = '<%=basePath%>mngoperating/mngOperatingTimeSetAdd.action';
	 diag.Width = 400;
	 diag.Height = 400;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
function toUpdate(operating_time_id){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="修改长期未运营时间";
	 diag.URL = '<%=basePath%>mngoperating/mngOperatingUpdate.action?operating_time_id='+operating_time_id;
	 diag.Width = 400;
	 diag.Height = 400;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
function todel(){
	var selections =  $('#tradeList').bootstrapTable('getSelections');
	if(selections.length<1){
		alert("请至少选择一行数据！");
		return false;
	}
	var operatingids = [];
	$.each(selections,function(i,d){
		operatingids.push(d.operating_time_id);
	});
	var flag = false;
	if(confirm("确定要删除选中的数据吗？")){
		flag = true;
	}
	if(flag){
		var url = "<%=basePath%>mngoperating/mngOperatingDel.action";
		$.post(url,{operatingids:operatingids.join(',')},function(result){
			if(result=="success"){
				alert("删除成功！");
			}else{
				alert("删除失败！");
			}
			document.location.reload();
		});
	}
}

</script>
</head>
<body>
	<div class="panel-body" >
		<div class="page-header" >
			<h1 style="font-size: 15px;">
				运营监管<small style="font-size: 15px">
				<i class="icon-double-angle-right"></i>长期未运营时间设定
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px"> 
                        <label class="control-label col-sm-1" style="font-weight: normal;width:140px;" for="company_name">网约车公司名称</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="company_name" placeholder="请输入网约车公司名称"/>
                        </div>
                        
                        <label class="control-label col-sm-1" style="font-weight: normal;">监测起止时间</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px; width:390px">
							从<input type="text" class="date-picker" id="begin_time" placeholder="请选择监测开始时间" data-date-format="yyyy-mm-dd" onchange="changeDateValue();"/>
							至<input type="text" class="date-picker" id="end_time" placeholder="请选择监测结束时间" data-date-format="yyyy-mm-dd" onchange="changeDateValue1();"/>
                        </div>
                        
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:10px" id="search" class="btn btn-primary">查询</button>
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
	            <button id="btn_delete" type="button" class="btn btn-default" onclick="todel();">
					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
				</button>
			</div>
   	    </div>
		<table id="tradeList">
		</table>
	</div>
</body>
</html>