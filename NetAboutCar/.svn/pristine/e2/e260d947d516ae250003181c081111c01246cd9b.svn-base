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
margin-bottom:150px;
}

.driver-cont{
	margin-bottom:30px;
}

.title-score{
	width:100%;
	height:30px;
}
.title-score .btn-score-add{
	float:right;
}
.title-score .title{    
	display: inline-block;
    height: 30px;
    line-height: 30px;
    top: 0;
    text-align: left;
}
.error-msg{
}

.error-msg .msg{        color: red;
    text-align: center;
    margin: 10px;
    padding: 5px;
    font-size: 120%;
    border: 1px dotted #d81c1c;
    background-color: #f9efef;
}
</style>
<script type="text/javascript">

angular.module('wyc',[]).controller('WycController',function($http,$scope){

	$scope.event={drivers:[],platforms:[]};

	if('${event.driverCertno}'!=''){
		var drvCertnos=('${event.driverCertno}').split(',');
		
		for(var i=0;i< drvCertnos.length;i++){
		    $http.post("driver/find.action?drvCertno="+drvCertnos[i]).success(function (response) {
		    	if(response==null){
		    		$('<div>').appendTo('.error-msg').addClass('msg').html('未找到驾驶员信息');
		    		$('.btn-save').hide();
		    	}else{
			    	$scope.event.drivers.push(response);		    		
		    	}
		    });
		}		
	}
	
	if('${event.comCreditcode}'!=''){
		var comCreditcodes=('${event.comCreditcode}').split(',');
		
		for(var i=0;i< comCreditcodes.length;i++){
		    $http.post("platform/find.action?creditcode="+comCreditcodes[i]).success(function (response) {
		    	if(response==null){
		    		$('<div>').appendTo('.error-msg').addClass('msg').html('未找到平台信息');
		    		$('.btn-save').hide();
		    	}else{
			    	$scope.event.platforms.push(response);
		    	}
		    });
		}
	}
	
	
	$scope.doAddScoreDrv=function(drv){
		top.selected=drv.indics;
		top.allScore=drv.allScore;
		
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="确定驾驶员违规细则";
		 diag.URL = '${path}/credit/event/audit/selectscore.action?category=1';
		 diag.Width = 700;
		 diag.Height = 550;
		 diag.CancelEvent = function(){ //关闭事件
			 if(top.selected){
				 drv.indics=top.selected;
				 drv.allScore=top.allScore;
	   			  $scope.$digest();
			 }
			console.log(drv);				 
			diag.close();
		 };
		 diag.show();
	}


	$scope.doAddScorePL=function(platform){
		top.selected=platform.indics;
		top.allScore=platform.allScore;
		
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="确定平台违规细则";
		 diag.URL = '${path}/credit/event/audit/selectscore.action?category=2';
		 diag.Width = 700;
		 diag.Height = 550;
		 diag.CancelEvent = function(){ //关闭事件
			 if(top.selected){
				 platform.indics=top.selected;
				 platform.allScore=top.allScore;
	   			  $scope.$digest();
			 }
			console.log(platform);				 
			diag.close();
		 };
		 diag.show();
	}
	
	$scope.doSave=function(){
		var review_result = $("#review_result").val();
		if(review_result == ""){
			$("#review_result").tips({
				side:3,
	            msg:'请填写处理结论！',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#review_result").focus();
		}else{
						
			$('#driverModels').val(JSON.stringify($scope.event.drivers));				
					
			$('#platformModels').val(JSON.stringify($scope.event.platforms));
			
			console.clear();
			console.log($scope.event);
			console.log(JSON.stringify($scope.event.drivers));
			
			$("#form1").ajaxSubmit({
				success:function(response){
					if(response=='success'){
						alert('提交成功');
						location.href="${path}/credit/toEventList.action?where=${where}";
					}else{
						alert('提交失败：'+response);	
					}
				}
			});
		}
	}
	
	console.log($scope.event);
});

$(function() {
	
});

//获取文件名
function getFile(obj){
	var file_name = $(obj).val();
	var houzhui=file_name.split(".");
	var last=houzhui[houzhui.length-1];
	var tp ="doc,docx";
	var rs=tp.indexOf(last);
				
	//如果返回的结果大于或等于0，说明包含允许上传的文件类型
	if(rs>=0){
		$("input[name='result']").val(file_name);
	}else{
		alert("您选择的上传文件不是有效的word文件！");
		$("input[name='result']").val("");
	}
}



</script>

</head>
<body >
<div class="container" ng-controller="WycController">
<form action="<%=basePath %>credit/event/audited.action" name="form1" id="form1" method="post" enctype ="multipart/form-data">
	<div id="zhongxin">
		<div class='error-msg'></div>
        <div style="padding-top:30px;"></div>
        <div class="panel panel-default">
            <div class="panel-body">
            	<span style="font-size:15px;width:200px;" class="title">失信事件信息（${event.eventStatus}）</span>
				<table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
					<tr>
						<th style="text-align: right;width:20%;">事件概要：</th>
						<td style="width:30%;">${event.eventDesc}</td>
					    <th style="text-align: right;width:20%;">事件详情：</th>
						<td style="width:30%;">${event.eventDetail}</td>
					</tr>
					<tr>
					    <th style="text-align: right;">内容附件：</th>
						<td>
							<c:choose>
								<c:when test="${null == event.attachment || event.attachment == ''}">无</c:when>
								<c:otherwise><a href="${event.attachment}">点击下载</a></c:otherwise>
							</c:choose>
						</td>
					    <th style="text-align: right;">违规事实：</th>
						<td>${event.arFact}</td>
					</tr>
					<tr>
						<th style="text-align: right;">发生日期：</th>
						<td><fmt:formatDate  value="${event.occurDate}" type="both" pattern="yyyy-MM-dd hh:mm:ss" /></td>
					    <th style="text-align: right;">发生地点：</th>
						<td>${event.occurAddress}</td>
					</tr>
					<tr>
						<th style="text-align: right;">数据来源：</th>
						<td>${event.dataSource}</td>
					    <th style="text-align: right;"></th>
						<td></td>
					</tr>
					<tr>
						<th style="text-align: right;">涉事驾驶员：<br/>（身份证号）</th>
						<td colspan=3>${event.driverCertno}</td>
					</tr>
					<tr>
						<th style="text-align: right;">涉事平台：<br/>（社会统一信用代码）</th>
						<td colspan=3>${event.comCreditcode}</td>
					</tr>
				</table>
            </div>
        </div>
		<div style="padding-top:30px;"></div>
		
        <div class="panel panel-default driver-cont"  ng-repeat="drv in event.drivers">
            <div class="panel-body">
            	<span style="font-size:15px;width:150px;" class="title">涉事驾驶员：{{drv.username}}</span>
                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
					<tr>
						<th style="text-align: right;width:20%;">姓名：</th>
						<td style="width:30%;">{{drv.username}}</td>
					    <th style="text-align: right;width:20%;">性别：</th>
						<td style="width:30%;">
							<span ng-show="drv.sex==1">男</span>
							<span ng-show="drv.sex==0">女</span>
						</td>
					</tr>
					<tr>
					    <th style="text-align: right;">身份证号：</th>
						<td>{{drv.certno}}</td>
					    <th style="text-align: right;">车牌号：</th>
						<td>{{drv.carnum}}</td>
					</tr>
					<tr>
						<th style="text-align: right;">车辆型号：</th>
						<td>{{drv.model}}</td>
					    <th style="text-align: right;">所属平台：</th>
						<td>{{drv.platformname}}</td>
					</tr>
				</table>
            </div>
            
            <div class="panel-body">
            	<div class='title-score'>
		           <span style="font-size:15px;width:230px" class="title">确认违规记分项目{{drv.indicList.length}}条：记{{drv.allScore}}分</span>
		           <button id="btn_add" type="button" class="btn btn-default btn-score-add" ng-click="doAddScoreDrv(drv);">
		                <span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>修改记分项目
		            </button> 	
		           </div>
						<table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
							<tr>
							    <th style="text-align: center;">序号</th>
								<th style="text-align: center;">细则代码</th>
								<th style="text-align: center;">细则名称</th>
								<th style="text-align: center;">记分值</th>
							</tr>
								<tr ng-repeat="indic in drv.indics">
									<td style="text-align: center;">{{$index+1}}</td>
									<td style="text-align: center;">{{indic.indicCode}}</td>
									<td style="text-align: center;">{{indic.indicText}}</td>
									<td style="text-align: center;">{{indic.score}}</td>
								</tr>
						</table>
		            </div>
        </div>
        
        
		<div style="margin-top:30px;"></div>
		<div class="panel panel-default driver-cont" ng-repeat="platform in event.platforms">
            <div class="panel-body">
            	<span style="font-size:15px;width:200px;" class="title">涉事平台：{{platform.comName}}</span>
                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
					<tr>
						<th style="text-align: right;width: 20%">统一社会信用号：</th>
						<td style="width:30%;">{{platform.creditCode}}</td>
					    <th style="text-align: right;width: 20%">企业名称：</th>
						<td style="width:30%">{{platform.comName}}</td>
					</tr>
					<tr>
						<th style="text-align: right;">企业简称：</th>
						<td>{{platform.shortName}}</td>
					    <th style="text-align: right;">平台名称：</th>
						<td>{{platform.platformName}}</td>
					</tr>
					<tr>
						<th style="text-align: right;">企业营业执照号：</th>
						<td>{{platform.busiliceNo}}</td>
					    <th style="text-align: right;">注册地址：</th>
						<td>{{platform.regAddress}}</td>
					</tr>
				</table>
            </div>
            
            <div class="panel-body">
            	<div class='title-score'>
		           <span style="font-size:15px;width:230px" class="title">确认违规记分项目{{platform.indicList.length}}条：记{{platform.allScore}}分</span>
		           <button id="btn_add" type="button" class="btn btn-default btn-score-add" ng-click="doAddScorePL(platform);">
		                <span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>修改记分项目
		            </button> 	
		           </div>
						<table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
							<tr>
							    <th style="text-align: center;">序号</th>
								<th style="text-align: center;">细则代码</th>
								<th style="text-align: center;">细则名称</th>
								<th style="text-align: center;">记分值</th>
							</tr>
								<tr ng-repeat="indic in platform.indics">
									<td style="text-align: center;">{{$index+1}}</td>
									<td style="text-align: center;">{{indic.indicCode}}</td>
									<td style="text-align: center;">{{indic.indicText}}</td>
									<td style="text-align: center;">{{indic.score}}</td>
								</tr>
						</table>
		            </div>
        </div>
        
        
		        <div style="padding-top:30px;"></div>
		        <div class="panel panel-default">
		            <div class="panel-body">
						<span style="font-size:15px" class="title">审核信息</span>
		                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
							<tr>
								<th style="text-align: right;" >结论材料上传：</th>
								<td colspan="3">
									 <div class="box">
										<input type="text" name="result" id="result" class="file_textbox" />
										<a href="javascript:void(1);" class="upload_link">上传</a>
										<input type="file" class="uploadFile" name="resultfile"  id="resultfile" onchange="getFile(this)" />
									</div>         
								</td>
							</tr>
							<tr>
							    <th style="text-align: right;" >处理结论：</th>
							    <td colspan="3"><textarea style="width: 400px;height:50px" cols="40" rows="5"
							     name="review_result" id="review_result" ng-model="event.reviewResult"></textarea></td>
							</tr>
		                </table>
		           	</div>
		   		</div>
				<table width="100%" border="0" cellpadding="5" cellspacing="2">
					<tr>
						<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
							<input type="hidden" id="event_no" name="event_no" value="${event.eventNo}" />
							<input type="hidden" id="driverModels" name="driverModels" ng-model="driverModels"/>
							<input type="hidden" id="platformModels" name="platformModels" ng-model="platformModels"/>
							<button type="button" class="btn btn-mini btn-primary btn-save" ng-click="doSave()">提交</button>&nbsp;&nbsp;&nbsp;
							<a class="btn btn-mini btn-danger" href='${path }/credit/toEventList.action?where=${where}'">取消</a>
						</td>
					</tr>
				</table>
	</div>
	<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="<%=basePath %>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
</form>
</div>
</body>
</html>