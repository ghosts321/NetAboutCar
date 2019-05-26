<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
var TableInit = function () {
	var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tradeList').bootstrapTable({
            url: 'getAbnormityPriceSetList.action',         //请求后台的URL（*）
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
            			region_code:$("#region_code").val(),
            			fare_type:$("#fare_type").val(),
            			company_id:$("#company_id").val()
              	};
              	return param;
            },
            clickToSelect: true,                //是否启用点击选中行
            height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            columns: [{
                field: 'index',
                align: 'center',
                width:'3%',
                title: '序号',
                formatter:function(value, row, index){
                	return index+1;
                }
            },{
                field: 'id',
                align: 'left',
                title: '案件编号'
            },{
                field: 'vehicle_no',
                align: 'center',
                title: '车牌号'
            },{
                field: 'source',
                align: 'center',
                title: '案件来源'
            },{
                field: 'person',
                align: 'center',
                title: '行政区划'
            },{
                field: 'status',
                align: 'center',
                title: '组织结构'
            },{
                field: 'crimeTime',
                align: 'center',
                title: '处罚类型'
            },{
                field: 'finalAcceptTime',
                align: 'center',
                title: '案件承办人'
            },{
                field: 'penaltyTime',
                align: 'center',
                title: '案发时间'
            },{
                field: 'finalTime',
                align: 'center',
                title: '最后受理时间'
            }],
            data: [{
                id: 'C190C8008',
                vehicle_no: '京AF3952',
                source: '稽查执法查扣违章',
                person: '100000',
                status: '河南省洛阳市新安县',
                crimeTime: '罚款',
                finalAcceptTime: '张三',
                penaltyTime:'2017-2-18 23:23:10',
                finalTime:'2017-2-18 23:23:10'
            },{
                id: 'C190C8008',
                vehicle_no: '京AF3952',
                source: '信访投诉违章',
                person: '100000',
                status: '河南省洛阳市新安县',
                crimeTime: '罚款',
                finalAcceptTime: '张三',
                penaltyTime:'2017-2-18 23:23:10',
                finalTime:'2017-2-18 23:23:10'
            },{
                id: 'C190C8008',
                vehicle_no: '京AF3952',
                source: '信访投诉违章',
                person: '100000',
                status: '河南省洛阳市新安县',
                crimeTime: '罚款',
                finalAcceptTime: '张三',
                penaltyTime:'2017-2-18 23:23:10',
                finalTime:'2017-2-18 23:23:10'
            },{
                id: 'C190C8008',
                vehicle_no: '京AF3952',
                source: '信访投诉违章',
                person: '100000',
                status: '河南省洛阳市新安县',
                crimeTime: '罚款',
                finalAcceptTime: '张三',
                penaltyTime:'2017-2-18 23:23:10',
                finalTime:'2017-2-18 23:23:10'
            },{
                id: 'C190C8008',
                vehicle_no: '京AF3952',
                source: '信访投诉违章',
                person: '100000',
                status: '河南省洛阳市新安县',
                crimeTime: '罚款',
                finalAcceptTime: '张三',
                penaltyTime:'2017-2-18 23:23:10',
                finalTime:'2017-2-18 23:23:10'
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
function toAdd(){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="新增案件";
	 diag.URL = '<%=basePath%>penalty/penaltyAdd.action';
	 diag.Width = 450;
	 diag.Height = 500;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
function toAccept(abnormity_id){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="案件修改";
	 diag.URL = '<%=basePath%>penalty/caseAlterUpdate.action';
	 diag.Width = 450;
	 diag.Height = 500;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
function toDetail(abnormity_id){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="修改历史";
	 diag.URL = '<%=basePath%>penalty/caseAlterHis.action';
	 diag.Width = 1000;
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
	var abnormityids = [];
	$.each(selections,function(i,d){
		abnormityids.push(d.abnormity_id);
	});
	var flag = false;
	if(confirm("确定要删除选中的数据吗？")){
		flag = true;
	}
	if(flag){
		var url = "<%=basePath%>monitor/abnormityPriceDel.action";
		$.post(url,{abnormityids:abnormityids.join(',')},function(result){
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
	<div class="panel-body">
		<div class="page-header" >
			<h1 style="font-size: 15px;">
				统计查询<small style="font-size: 15px">
				<i class="icon-double-angle-right"></i>处罚案件查询
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="region_code">行政区划</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="region_code"/>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="fare_type">处罚类型</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<select class="form-control">
								<option>警告</option>
								<option>罚款</option>
								<option>没收违法所得，没收非法财物</option>
								<option>责令停产停业</option>
								<option>暂扣或吊销许可证</option>
								<option>行政拘留</option>
							</select>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="company_id">案发时间</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px; width:352px">
							从<input type="text" class="date-picker" id="begin_time" data-date-format="yyyy-mm-dd" onchange="changeDateValue();"/>
							到<input type="text" class="date-picker" id="end_time" data-date-format="yyyy-mm-dd" onchange="changeDateValue1();"/>
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