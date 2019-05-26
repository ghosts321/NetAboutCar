<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	        url: 'drvPermitapplyList.action',         //请求后台的URL（*）
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
	     
	        //toolbar: '#toolbar',
	        sortOrder: "asc",                   //排序方式
	        queryParams: function queryParams(params) {   //设置查询参数  
	        	var param = {
	        			userName:$("#userName").val(),
	        			certNo:$("#certNo").val(),
	        			applyType:$("#applyType").val()
	          	};
	          	return param;                   
	        },
	        clickToSelect: true,                //是否启用点击选中行
	        height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	        uniqueId: "applyid",                     //每一行的唯一标识，一般为主键列
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
	            field: 'username',
	            align: 'center',
	            title: '姓名'
	        }, {
	            field: 'telno',
	            align: 'center',
	            title: '手机号'
	        }, {
	            field: 'certno',
	            align: 'center',
	            title: '身份证号'
	        }, {
	            field: 'applytype',
	            align: 'center',
	            title: '类型',
	            formatter:function(value, row, index){
	            	if(row.applytype == 1){
	            		return "申请";
	            	}else if(row.applytype == 2){
	            		return "变更";
	            	}else if(row.applytype == 3){
	            		return "注销";
	            	}else if(row.applytype == 4){
	            		return "换证";
	            	}else if(row.applytype == 5){
	            		return "补办";
	            	}
	            }
	        }, {
	            field: 'applydate',
	            align: 'center',
	            title: '申请时间'
	        }, {
	            field: 'examresult',
	            align: 'center',
	            title: '考试成绩（全国/地区）'
	        }, {
	            field: 'totalstatus',
	            align: 'center',
	            title: '审核状态',
	            formatter:function(value, row, index){
	            	if(row.applytype == 2){
	            		if(row.appstatus == 0){
		            		return "未审核";
		            	}else if(row.appstatus == 2){
		            		return "变更审批通过";
		            	}
	            	}else{
	            		if(row.appstatus == 0){
		            		return "未审核";
		            	}else if(row.appstatus == 1){
		            		return "身份审批未通过";
		            	}else if(row.appstatus == 2){
		            		return "身份审批通过";
		            	}else if(row.appstatus == 3){
		            		return "考试未通过";
		            	}else if(row.appstatus == 4){
		            		return "考试通过";
		            	}else if(row.appstatus == 5){
		            		return "窗口办理不通过";
		            	}else if(row.appstatus == 6){
		            		return "窗口办理通过";
		            	}else if(row.appstatus==7){
		            		return "已发证";
		            	}
	            	}
	            }
	        },{
	            field: 'handle',
	            align: 'center',
	            title: '操作',
	            formatter:function(value, row, index){
	            	var html = "";
	            	if(row.applytype == 5){//补办
	            		html += "<shiro:hasPermission name='driverArrangeExam'><button type='button' class='btn btn-default' onclick='reissue(\"" + row.applyid + "\")'><span class='glyphicon glyphicon-pencil' aria-hidden='true' ></span>补办</button>&nbsp;</shiro:hasPermission>";
	            	}else if(row.applytype == 2){
	            		html += "<shiro:hasPermission name='driverDispose'><button type='button'  class='btn btn-default' onclick='dispose(\"" + row.certno + "\",\"" + row.applytype + "\")'><span class='glyphicon glyphicon-wrench' aria-hidden='true' ></span>受理</button>&nbsp;</shiro:hasPermission>";
	            	}else{
		            	html += "<shiro:hasPermission name='driverDispose'><button type='button'  class='btn btn-default' onclick='dispose(\"" + row.certno + "\",\"" + row.applytype + "\")'><span class='glyphicon glyphicon-wrench' aria-hidden='true' ></span>受理</button>&nbsp;</shiro:hasPermission>";
		            	if(row.appstatus == 6){
		            		html += "<shiro:hasPermission name='driverCertificate'><button type='button'  class='btn btn-default' onclick='certificate("+row.applyid+",\"" + row.instid + "\",\"" + row.certno + "\")'><span class='glyphicon glyphicon-education' aria-hidden='true' ></span>发证</button></shiro:hasPermission>";
		            	}else{
		            		html += "<shiro:hasPermission name='driverCertificate'><button type='button' class='btn btn-default'  onclick='certificate("+row.applyid+",\"" + row.instid + "\",\"" + row.certno + "\")' disabled><span class='glyphicon glyphicon-education' aria-hidden='true' ></span>发证</button></shiro:hasPermission>";
		            	}
		    	 	}
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
//受理
function dispose(certno,applytype){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="驾驶员详情";
	 diag.URL = '<%=basePath %>pilotApply/detail.action?certno='+certno+'&applytype='+applytype;
	 diag.Width = 800;
	 diag.Height = 500;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
//安排考试
function arrangeExam(certno){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="安排考试";
	 diag.URL = '<%=basePath %>pilotApply/toExamplan.action?certno='+certno;
	 diag.Width = 1000;
	 diag.Height = 350;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
//补办
function reissue(applyid){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="审核补办";
	 diag.URL = '<%=basePath %>pilotApply/toReissue.action?applyid='+applyid;
	 diag.Width = 1000;
	 diag.Height = 350;
	 diag.CancelEvent = function(){ //关闭事件
		if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
//发证
function certificate(applyid,instid,certno){
	var flag = false;
	if(confirm("确认发证？")){
		flag = true;
	}
	if(flag){
		$.ajax({
			type: "POST",
			url: '<%=basePath %>pilotApply/sendCertificate.action',
	    	data: {applyid:applyid,instid:instid,certno:certno},
			dataType:'json',
			success: function(data){
				window.location.href="<%=basePath %>pilotApply/index.action";
			}
		});
	}
}


</script>
</head>
<body>
	<div class="panel-body">
		<div class="page-header">
			<h1 style="font-size:15px;">
				业务审批
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					驾驶员业务
				</small>
			</h1>
		</div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px;" >
                        <label class="control-label col-sm-1" style="font-weight: normal; float:left; display:inline;" for="txt_search_departmentname">姓名</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px; float:left; display:inline;">
                            <input type="text" id="userName" name="userName" value="" class="form-control" />
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal; float:left; display:inline;" for="txt_search_departmentname">身份证号</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px; float:left; display:inline;">
                            <input type="text" id="certNo" name="certNo" value="" class="form-control" />
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal; float:left; display:inline;" for="txt_search_departmentname">申请类型</label>
                        <div class="col-sm-1" style=" float:left; display:inline;">
                            <select id="applyType" name="applyType">
					            <option value="">全部</option>
					            <option value="1">申请</option>
					            <option value="2">变更</option>
					            <option value="3">注销</option>
					            <option value="4">换证</option>
				        	</select>
                        </div>
                        <div class="col-sm-3" style="text-align:left; padding-left:0px; float:left; display:inline;">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
		<table id="tradeList">
   		</table>
	</div>
	<script type="text/javascript" src="jquery-1.4.2.min.js"></script>
</body>
</html>