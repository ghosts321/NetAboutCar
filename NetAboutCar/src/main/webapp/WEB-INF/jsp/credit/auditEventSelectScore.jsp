<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html ng-app='wyc'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
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
padding:0 0.5em 0;
}
.table tr.alter{
background-color:#f5fafe;
}
.imgStyle{
	margin-bottom:0.5em;
	width: 220px;
	height: 150px;
 }
textarea{
 margin-bottom: 4px;
}

.container{
margin-top:30px;
	}
</style>
<script type="text/javascript">
angular.module('wyc',[]).controller('WycController',function($http,$scope){
	
    $http.post("${path}/credit/indic/list.action?category=${category}").success(function (response) {
    	$scope.list=(response);

    	if(top.selected){
    		console.log(top.selected);
        	for(var i=0;i<top.selected.length;i++){
        		$('.indic-'+top.selected[i].indicCode).attr('checked',true);
        	}    		
    	}
		
    });
    
    $scope.allScore=top.allScore;
	$scope.doSelect=function(indic){
		$scope.allScore=0.0;
		$('.indic').each(function(){
			if($(this).prop('checked')){
				$scope.allScore+=parseFloat($(this).attr('score'));
			}
		});
	}
	
	$scope.doSelectAll=function(){
		$scope.allScore=0.0;
	    if ($("#check_all").prop('checked')) {
	        $("input[name='indics']").each(function() {
	        	this.checked = true;
	        	$scope.allScore += parseInt($(this).attr("score"));
	        });
	    }else{
	        $("input[name='indics']").each(function() {
	            this.checked = false;
	        });
	    }
	}
	

	$scope.doSave=function(){
		top.selected=[];
		$('.indic').each(function(){
			if($(this).prop('checked')){
				top.selected.push($scope.list[$(this).attr('index')]);
			}
		});
		top.allScore=$scope.allScore;
		top.Dialog.close();
	}
	
//	console.log($scope.event);
});

$(function() {

});



</script>

</head>
<body >
<div class="container" ng-controller="WycController">
	<div id="zhongxin">
		        <div class="panel panel-default">
		            <div class="panel-body">
		            	<span style="font-size:15px" class="title">记分列表</span>
						<table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
							<tr>
							    <th style="text-align: center;width:5%;"><input style="width: 15px;" type="checkbox" id="check_all"
							    ng-click="doSelectAll()" /></th>
							    <th style="text-align: center;">序号</th>
								<th style="text-align: center;">指标名称</th>
								<th style="text-align: center;">细则名称</th>
								<th style="text-align: center;">记分值</th>
							</tr>
								<tr ng-repeat="indic in list">
									<td style="text-align: center;width:5%;">
										<input style="width: 15px;" type="checkbox" name="indics"  class="indic indic-{{indic.indicCode}}"
										value="{{indic.indicCode}}" score="{{indic.score}}" index="{{$index}}" ng-click="doSelect(indic)"/>
									</td>
									<td style="text-align: center;">{{$index+1}}</td>
									<td style="text-align: center;">{{indic.typeName}}</td>
									<td style="text-align: center;">{{indic.indicText}}</td>
									<td style="text-align: center;">{{indic.score}}</td>
								</tr>
							<tr>
								<td style="text-align: center;" colspan="2">记分合计</td>
								<td style="text-align: center;" colspan="3" id="totalScore">{{allScore}}</td>
							</tr>
						</table>
		            </div>
		        </div>
				<table width="100%" border="0" cellpadding="5" cellspacing="2">
					<tr>
						<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
							<button type="button" class="btn btn-mini btn-primary" ng-click="doSave()">确定</button>&nbsp;&nbsp;&nbsp;
							<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
						</td>
					</tr>
				</table>
	</div>
	<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/>
	<img src="<%=basePath %>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
</div>
</body>
</html>