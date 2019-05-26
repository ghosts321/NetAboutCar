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
            url: 'comselect.action',         //请求后台的URL（*）
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
            			compn_compy:$("#compn_compy").val(),
            			begin_time:$("#begin_time").val(),
            			end_time:$("#end_time").val(),
            			compn_state:$("#compn_state").val(),
              	};
              	return param;
            },
            toolbar: '#toolbar',
            clickToSelect: true,                //是否启用点击选中行
            //height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "complain_code",                     //每一行的唯一标识，一般为主键列
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
                field: 'complain_code',
                align: 'center',
                title: '投诉编号'
            },{
                field: 'compn_compy',
                align: 'center',
                title: '平台名称',
            },{
                field: 'compn_name',
                align: 'center',
                title: '投诉人姓名'
            },{
                field: 'compn_tel',
                align: 'center',
                title: '投诉人手机号'
            },{
                field: 'compn_email',
                align: 'center',
                title: '投诉人电子邮件'
            },{
                field: 'compn_time',
                align: 'center',
                title: '投诉时间'
            },{
                field: 'compn_state',
                align: 'center',
                title: '投诉状态',
                formatter:function(value, row, index){
                	if(row.compn_state==3){
                	   return "待处理";
                	}else if (row.compn_state==4){
                	     return "待反馈";
                	}else if (row.compn_state==5){
                	     return "申诉中";
                	}else if (row.compn_state==6){
                	     return "申诉待处理";
                	}else if (row.compn_state==1){
                	     return "待提交";
                	}else if (row.compn_state==2){
                	     return "待受理";
                	}else if (row.compn_state==8){
                	     return "已完结";
                	}else{
                	     return "申诉待反馈";
                	}
                }
            } ,{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
	                	 var html = "<button type='button' class='btn btn-default' onclick='openComDetail(\""+row.complain_code+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >详情</button>&nbsp;";
                        
	                	//html += "<button type='button' class='btn btn-default' onclick='openComHistory(\""+row.complain_code+"\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' >处理历史</button>";
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
   	$('#begin_time').datepicker();
   	$('#end_time').datepicker();
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
	 diag.Title ="投诉信息录入";
	 diag.URL = '<%=basePath%>complaint/toAdd.action';
	 diag.Width = 450;
	 diag.Height = 400;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
function showhandlehistory(complain_code){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="处理历史";
	 diag.URL = '<%=basePath%>complaint/showhandlehistory.action?complain_code='+complain_code;
	 diag.Width = 700;
	 diag.Height = 250;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
function openComDetail(complain_code){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="详情";
	 diag.URL = '<%=basePath%>complaint/openComDetail.action?complain_code='+complain_code;
	 diag.Width =800;
	 diag.Height =700;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}

function openComHistory(complain_code){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="处理历史";
	 diag.URL = '<%=basePath%>complaint/openComHistory.action?complain_code='+complain_code;
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

function todel(){
	var selections =  $('#tradeList').bootstrapTable('getSelections');
	if(selections.length<1){
		alert("请至少选择一行数据！");
		return false;
	}
	var compids = [];
	$.each(selections,function(i,d){
		compids.push(d.complain_code);
	});
	var flag = false;
	if(confirm("确定要删除选中的数据吗？")){
		flag = true;
	}
	if(flag){
		var url = "<%=basePath%>complaint/comDel.action";
		$.post(url,{compids:compids.join(',')},function(result){
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
				投诉查询<small style="font-size: 15px">
				<i class="icon-double-angle-right"></i>平台投诉信息查询
				</small>
				
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                <div class="form-group" style="margin-top:13px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="region_code">投诉编号</label>
                        <div class="col-sm-1" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="complain_code"/>
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="company_id">平台名称</label>
                         <div class="col-sm-1" style="padding-right: 5px;padding-left: 0px">
							<input type="text" class="form-control" id="compn_compy"/>
                        </div>
                        
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="fare_type">投诉状态</label>
                       <div class="col-sm-1" style="padding-right: 5px;padding-left: 0px">
                      <select style="width:160px;" name=compn_state id="compn_state" class="form-control" >
				         <option value="" >请选择</option>
				         <option value="1">待提交</option>  
				         <option value="2">待受理</option>
				          <option value="3">待处理</option>
				         <option value="4">待反馈</option>
				         <option value="8">已完结</option>       
				        </select>
				        </div> 
				         
                   </div>

				        <div class="form-group" style="margin-top:10px">
				       
				       <label class="control-label col-sm-1" style="font-weight: normal;">投诉时间</label>
		                        <div class="col-sm-1" style="padding-right: 5px;padding-left: 0px; ">
									<input type="text" class="col-sm-1" name="begin_time" id="begin_time"  data-date-format="yyyy-mm-dd"/>
		                        </div>
		                        
		                        <label class="control-label col-sm-1" style="font-weight:normal;">至&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		                        <div class="col-sm-1" style="padding-right: 5px;padding-left: 0px;">
									<input type="text" class="col-sm-1" name="end_time" id="end_time" data-date-format="yyyy-mm-dd"/>
		                        </div>
                        <div class="col-sm-2" style="text-align:left; padding-left:200px">
                            <button type="button" style="margin-left:100px;margin-top:5px" id="search" class="btn btn-primary">查询<tton>
                        </div>
                    </div>

                </form>
            </div>
        </div>
		  <div id="toolbar" class="btn-group">
			
   	    </div>
		<table id="tradeList">
	
	</div>
</body>
</html>