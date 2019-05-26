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
	   $http.post("punish/set/list.action?punType=2").success(function (response) {
	    	$scope.sets=(response);
	    });
	   
	   $scope.doCreateList=function(set){
		   $scope.set=set;
		   _set=set;
			$('#tradeList').bootstrapTable('refresh');
	   }
	   
	   $scope.doAddRecord=function(){
			var row =  $.map($('#tradeList').bootstrapTable('getSelections'), function (row) {
		        return row;
		    });
			if(row == null || row == ''){
				alert("不能生成空名单！");
				return false;
			}
			var json = $('#tradeList').bootstrapTable('getAllSelections');
			
			//window.location.href="addRecord.action?data="+JSON.stringify(json);
			var creditcodes=[];
			for(var i=0;i<json.length;i++){
				creditcodes.push(json[i].creditcode);
			}
			console.log(creditcodes);
			console.log(creditcodes.toString());
			
			$http.post("platform/punish/list/submit.action?punCode="+$scope.set.punCode+'&creditcodes='+creditcodes.toString()).success(function (response) {
		    	if(response=='success'){
		    		alert('名单已生成！');
		    	}else{
		    		alert('名单生成失败：'+response);		    		
		    	}
		    });
	   
			//window.setTimeout("refreshTab()",3000);
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
function addrecord(){
	var row =  $.map($('#tradeList').bootstrapTable('getSelections'), function (row) {
        return row;
    });
	if(row == null || row == ''){
		alert("请选择要导出的数据！");
		return false;
	}
	var json = $('#tradeList').bootstrapTable('getAllSelections');
	window.location.href="addPlatRecord.action?data="+JSON.stringify(json);
	alert("已公布名单");
	window.setTimeout("refreshTab()",3000);
	
}
function refreshTab(){
	$('#tradeList').bootstrapTable('refresh');
}
var TableInit = function () {
	var oTableInit = new Object();
	var a="";
	//初始化Table
	oTableInit.Init = function () {
	    $('#tradeList').bootstrapTable({
	        url: 'platform/punish/list/create.action',         //请求后台的URL（*）
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
	        			comname:$("#comname").val(),
	        			pubText:'警告',
	        			punCode:_set.punCode	        			
	          	};
	          	return param;                   
	        },
	        clickToSelect: true,                //是否启用点击选中行
	       // height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
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
	        },{
	            field: 'listNo',
	            align: 'center',
	            title: '单号'
	        }, {
	            field: 'comname',
	            align: 'center',
	            title: '平台名称'
	        }, {
	            field: 'creditcode',
	            align: 'center',
	            title: '统一社会信用代码',
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
<body ng-controller="WycController">

	<div class="panel-body">
		<div class="page-header">
			<h1 style="font-size:15px;">
			诚信考核
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					平台考核处分名单
				</small>
			</h1>
		</div>

		<br/>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">平台</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" id="comname" name="comname" value="" class="form-control" />
                        </div>
                        <div class="col-sm-3" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
	<div class='pun-list'>	
				<span class='title-pun'>生成处分名单种类：</span>			
		<ul>
			<li ng-repeat="s in sets"><a href='javascript:void;' ng-click='doCreateList(s)'>{{s.punText}}</a>
		<!-- <li><a href="drvpunishment.action">警告</a></li>
		<li ><a href="drvretrain.action">再教育</a></li>
		<li><a href="drvrevoke.action">吊销</a></li> -->
		<ul>
		</div>
         <div style="text-align:right; padding-left:0px;    margin: 10px 0;">
                          <a href='${path }/credit/platform/punish/list/view.action'>已生成名单</a> <b>{{set.punText}}名单：</b> <button type="button" style="margin-left:5px" id="record" ng-click="doAddRecord()" 
                            class="btn btn-danger">生成并公示</button>
                        </div>
		<table id="tradeList">
   		</table>
   	</div>
</body>
</html>