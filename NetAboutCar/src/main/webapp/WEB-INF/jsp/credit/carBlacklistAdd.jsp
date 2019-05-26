<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../common.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
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
</style>
<script type="text/javascript">
//获取文件名
function getFile(obj){
	var file_name = $(obj).val();
	$("input[name='annexText']").val(file_name);
}
$(function() {
    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
});
var TableInit = function () {
	var oTableInit = new Object();
	//初始化Table
	oTableInit.Init = function () {
	    $('#tradeList').bootstrapTable({
	        url: 'getCarNoList.action',         //请求后台的URL（*）
	        method: 'post',                      //请求方式（*）
	        dataType: "json",
	        contentType: 'application/x-www-form-urlencoded',
	        striped: true,                      //是否显示行间隔色
	        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	        pagination: true,                   //是否显示分页（*）
	        search: false,						//是否启用查询 
	        sortable: true,                     //是否启用排序
	        sortOrder: "asc",                   //排序方式
	        clickToSelect: true,                //是否启用点击选中行
	        height: 260,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	        uniqueId: "carId",                     //每一行的唯一标识，一般为主键列
	        columns: [{
            	checkbox:true
            },{
	            field: 'index',
	            align: 'center',
	            title: '序号',
                formatter:function(value, row, index){
                	return index+1;
                }
	        },{
	            field: 'carId',
	            align: 'center',
	            title: '车辆编号'
	        }]
	    });
	};
	return oTableInit;
};
function toAdd(){
	var annexText = $("#annexText").val();
	if(annexText == ""){
		$("#annexText").tips({
			side:3,
            msg:'请选择入库材料',
            bg:'#AE81FF',
            time:2
        });
		return false;
	}
	if($("#storage_reason").val()==""){
		$("#storage_reason").tips({
			side:3,
            msg:'请输入入库原因',
            bg:'#AE81FF',
            time:2
        });
		$("#storage_reason").focus();
		return false;
	}
	var selections = $('#tradeList').bootstrapTable('getSelections');
	if(selections.length<1){
		alert("请至少选择一条数据！");
		return false;
	}
	var input = $('<input>');
	input.attr('type', 'hidden');
	input.attr('name', 'data');
	input.attr('value', JSON.stringify(selections));
	$("#form").append(input);
	$("#form").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}

</script>
</head>
<body>
<div class="container">
	<form action="addCarBlacklist.action" id="form" method="post" enctype="multipart/form-data">
		<div id="zhongxin">
		<div style="padding-top:30px;"></div>
        <div class="panel panel-default">
        <div class="panel-body">
        <span style="font-size:15px" class="title">车辆</span>
		<table id="tradeList">
		</table>
		</div>
		</div>
		<div style="padding-top:30px;"></div>
	        <div class="panel panel-default">
	            <div class="panel-body">
					<span style="font-size:15px" class="title">审核信息</span>
	                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
	                	<tr>
					    <th style="text-align: right;" >入库类型：</th>
					    <td colspan="3">
					    	<select style="width: 200px" id="bl_type" name="bl_type" class="form-control">
					    		<option value='吊销'>吊销</option>
					    		<option value='处罚'>处罚</option>
					  		</select>
					    </td>
						</tr>
						<tr>
							<th style="text-align: right;" >入库材料上传：</th>
							<td colspan="3">
								 <div class="box">
									<input type="text" name="annexText" id="annexText" class="file_textbox" />
									<a href="javascript:;" class="upload_link">上传</a>
									<input type="file" class="uploadFile" name="annexFile"  id="annexFile" onchange="getFile(this)"/>
								</div>         
							</td>
						</tr>
						<tr>
						    <th style="text-align: right;" >入库原因：</th>
						    <td colspan="3"><textarea style="width: 300px;height:50px" cols="40" rows="5" name="storage_reason" id="storage_reason"></textarea></td>
						</tr>
	                </table>
	           	</div>
	   		</div>
			<table width="100%" border="0" cellpadding="5" cellspacing="2">
				<tr>
					<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
						<button type="button" class="btn btn-mini btn-primary" onclick="toAdd();">提交</button>&nbsp;&nbsp;&nbsp;
						<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					</td>
				</tr>
			</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="<%=basePath%>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
</body>
</html>