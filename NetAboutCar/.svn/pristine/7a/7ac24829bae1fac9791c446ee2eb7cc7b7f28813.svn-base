<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html ng-app="wyc">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
 #fontStyle{
 	size:20px;
 	padding-left:20px
 }
 
 table{border-collapse:separate;}
 
 .pun-list{
     display: block;
    width: 100%;
    height: 30px;
    line-height: 30px;
 }
 
 .pun-list ul{
 	float:left;
     display: inline-block;
    
    height: 100%;
    line-height:100%;
 }
 
 .pun-list ul li{
	 float: left;
    display: inline-block;  
      padding: 3px 10px;
 }
 
 
 .pun-list .title-pun{
 	float:left;
    display: inline-block;  
 }
 
 
 .pun-list ul li a{
 
 }
 
 
 .pun-list ul li a:hover{
 
 }
</style>
<script type="text/javascript">
var _set={};
angular.module('wyc',[]).controller('WycController',function($http,$scope){
	   
	   
	   $scope.doSearchList=function(set){
		   _set=set;
			$('#tradeList').bootstrapTable('refresh');
	   }
	   
});

$(function() {
    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
    $('#search').click(function () {  
    	$('#tradeList').bootstrapTable('refresh');
    });   		
    $('#record').click(function () {  
    	$('#tradeList').bootstrapTable('refresh');
    });   		
    
    
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
	        //url: 'drvPunishmentList.action',         //请求后台的URL（*）
	        url:'detail.action',
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
	        			/* userName:$("#userName").val(),
	        			pubStatus:'警告', */
	        			listNo:'${listNo}'
	          	};
	          	return param;                   
	        },
	        //clickToSelect: true,                //是否启用点击选中行
	        //height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	        uniqueId: "drvLicense",                     //每一行的唯一标识，一般为主键列
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
	            field: 'drvLicense',
	            align: 'center',
	            title: '驾驶证号'
	        }, {
	            field: 'drvName',
	            align: 'center',
	            title: '姓名'
	        } ]
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
<body ng-controller='WycController'>

	<div class="panel-body">
		<div class="page-header">
			<h1 style="font-size:15px;">
			诚信考核
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					驾驶员考核已生成处分名单
				</small>
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					${listNo }
				</small>
			</h1>
		</div>
		<br/>
        
		<table id="tradeList">
   		</table>
</body>
</html>