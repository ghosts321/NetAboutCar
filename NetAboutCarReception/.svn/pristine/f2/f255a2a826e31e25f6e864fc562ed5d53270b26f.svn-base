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
 a:hover{color:white;text-decoration:none;}
 table{border-collapse:separate;}
</style>
<script type="text/javascript">
$(function() {
    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();		
});

function refreshTab(){
	$('#tradeList').bootstrapTable('refresh');
}
var TableInit = function () {
	var oTableInit = new Object();
	var a="";
	//初始化Table
	oTableInit.Init = function () {
	    $('#tradeList').bootstrapTable({
	        url: 'drvPunishment.action',         //请求后台的URL（*）
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
	        			pubStatus:'警告',
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
	        	checkbox:true
	        },{
	            field: 'index',
	            align: 'center',
	            title: '序号',
                formatter:function(value, row, index){
                	return index+1;
                }
	        }, {
	            field: 'listNo',
	            align: 'center',
	            title: '表单单号'
	        }, {
	            field: 'drvName',
	            align: 'center',
	            title: '驾驶员姓名',
	        },{
	            field: 'certno',
	            align: 'center',
	            title: '身份证号'
	           
	        }, {
	            field: 'belongs',
	            align: 'center',
	            title: '所属平台',
	            formatter:function(value, row, index){
	            	if(row.belongs == 1){
	            		return "自有车辆";
	            	}else if(row.belongs == 2){
	            		return "平台车辆";
	            	}else if(row.belongs == 3){
	            		return "公司车辆";
	            	}
	            }
	        }, {
	            field: 'carnum',
	            align: 'center',
	            title: '车牌号'
	        }, {
	            field: 'score',
	            align: 'center',
	            title: '累计积分'
	        }, {
	            field: 'punText',
	            align: 'center',
	            title: '处理结果'
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
			诚信考核
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					驾驶员考核处分名单
				</small>
			</h1>
		</div>
		<br/>
		
         <div style="text-align:right; padding-left:0px;">
                            <button type="button" style="margin-left:5px" id="record" onclick="javacript:addrecord();" class="btn btn-primary"><font color="white">公布处分名单</font></button>
                        </div>
		<table id="tradeList">
   		</table>
</body>
</html>