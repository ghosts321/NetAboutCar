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
.error-msg{    
	background-color: #efead5;
    font-size: 110%;
    color: red;
    text-align: center;
    padding: 5px;
    border: 1px dotted #dea2a2;
    margin-bottom: 8px;
}
</style>
<script type="text/javascript">
angular.module('wyc',[]).controller('WycController',function($http,$scope){


	$http.post("${path}/credit/driver/detail.action?drvCertno=${certNo}").success(function (response) {
    	
		if(response==null){
			$('<div>').appendTo('.errors').html('驾驶员不存在').addClass('error-msg');
		}else{

			$scope.driver=response;    
		}
    });

	$http.post("${path}/credit/driver/cert/detail.action?drvCertno=${certNo}").success(function (response) {
    	
		if(response==null){
			$('<div>').appendTo('.errors').html('未找到驾驶员证件').addClass('error-msg');
		}else{

			$scope.cert=response;    		
			
			//console.log(response);
		}
    });

	$http.post("${path}/credit/driver/aw/list.action?drvLicense=${certNo}").success(function (response) {
    	
		if(response==null){
			//$('<div>').appendTo('.errors').html('未找到驾驶员证件').addClass('error-msg');
		}else{

			$scope.awyears=response;    		
			
			//console.log(response);
		}
    });

	$http.post("${path}/credit/driver/pun/list.action?drvLicense=${certNo}").success(function (response) {
    	
		if(response==null){
			//$('<div>').appendTo('.errors').html('未找到驾驶员证件').addClass('error-msg');
		}else{

			$scope.puns=response;    		
			
			//console.log(response);
		}
    });
	

	$http.post("${path}/credit/driver/xzcf/list.action?drivcarno=${certNo}").success(function (response) {
    	
		if(response==null){
			//$('<div>').appendTo('.errors').html('未找到驾驶员证件').addClass('error-msg');
		}else{

			$scope.xzcfs=response;    		
			
			//console.log(response);
		}
    });
});

$(function() {
	$("#check_all").click(function() {
		var totalScore = 0;
	    if (this.checked) {
	        $("input[name='indics']").each(function() {
	        	this.checked = true;
	        	totalScore += parseInt($(this).attr("score"));
	        });
	    }else{
	        $("input[name='indics']").each(function() {
	            this.checked = false;
	        });
	    }
	    $("#totalScore").html(totalScore);
	});
});

function countScore(obj,score){
	if (obj.checked) {
		var totalScore = parseInt(score)+parseInt($("#totalScore").text());
        $("#totalScore").html(totalScore);
    }else{
    	var totalScore = parseInt($("#totalScore").text()) - parseInt(score);
        $("#totalScore").html(totalScore);
    }
}

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

function submitForm(){
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
		$("#scoreSum").val($("#totalScore").text());
		$("#form1").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
}

</script>

</head>
<body ng-controller="WycController">
<div class="container">
	<div id="zhongxin" style="margin-bottom:80px">
		<div style="padding-top:30px;"></div>
		<div class="errors"></div>
		<div style="padding-top:30px;"></div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span style="font-size:15px" class="title">基本信息</span>
                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
					<tr>
						<th style="text-align: right;width:20%;">姓名：</th>
						<td style="width:30%;">{{driver.username}}</td>
					    <th style="text-align: right;width:20%;">性别：</th>
						<td style="width:30%;">
							<span ng-show="driver.sex=='1'">男</span>
							<span ng-show="driver.sex=='0'">女</span>
						</td>
					</tr>
					<tr>
					    <th style="text-align: right;">身份证号：</th>
						<td>{{driver.certno}}</td>
					    <th style="text-align: right;">出生年月：</th>
						<td>{{driver.birthday}}</td>
					</tr>
					<tr>
					    <th style="text-align: right;">联系电话：</th>
						<td>{{driver.contacttelno}}</td>
					    <th style="text-align: right;">手机：</th>
						<td>{{driver.telno}}</td>
					</tr>
					<tr>
					    <th style="text-align: right;">政治面貌：</th>
						<td><span ng-show='driver.political=="2"'>党员</span>
						<span ng-show='driver.political=="1"'>团员</span>
						<span ng-show='driver.political=="0"'>群众</span></td>
					    <th style="text-align: right;">手机：</th>
						<td>{{driver.telno}}</td>
					</tr>
					<tr>
						<th style="text-align: right;">户籍地址：</th>
						<td colspan='3'>{{driver.censusaddr}}</td>
					</tr>
					<tr>
					    <th style="text-align: right;">居住住址：</th>
						<td colspan=3>{{driver.address}}</td>
					</tr>
				</table>
            </div>
        </div>
        <div style="padding-top:30px;"></div>
        <div class="panel panel-default">
            <div class="panel-body">
            	<span style="font-size:15px;width:100px;" class="title">驾驶证信息</span>
				<table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
					<tr>
						<th style="text-align: right;width:20%;">驾驶员证号：</th>
						<td style="width:30%;">{{cert.pcertno}}</td>
					    <th style="text-align: right;width:20%;">发证日期：</th>
						<td style="width:30%;">{{cert.senddate.time|date:'yyyy年MM月dd日'}}
						</td>
					</tr>
					<tr>
					    <th style="text-align: right;width:20%;">有效期起：</th>
						<td>{{cert.senddate.time|date:'yyyy年MM月dd日'}}</td>
					    <th style="text-align: right;">有效期始：</th>
						<td>{{cert.enddate.time|date:'yyyy年MM月dd日'}}</td>
					</tr>
					<tr>
						<th style="text-align: right;">车牌号码：</th>
						<td>{{cert.carnum}}</td>
					    <th style="text-align: right;">所属平台：</th>
						<td>{{cert.comname}}</td>
					</tr>
					<tr>
						<th style="text-align: right;">在黑名单中：</th>
						<td></td>
					    <th style="text-align: right;">被投诉次数：</th>
						<td></td>
					</tr>
				</table>
            </div>
        </div>
        
        <div style="padding-top:30px;"></div>
        <div class="panel panel-default">
            <div class="panel-body">
            	<span style="font-size:15px;width:100px;" class="title">历年考核记录</span>
				<table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
					<tr>
						<th style="text-align: ;width:20%;">年份</th>
						<th style="text-align: ;width:20%;">开始日期</th>
						<th style="text-align: ;width:20%;">结束日期</th>
						<th style="text-align: ;width:20%;">记分</th>
						<th style="text-align: ;width:20%;">评级</th>
					</tr>
					<tr ng-repeat="aw in awyears">
						<td>{{aw.year}}</td>
						<td>{{aw.startDate.time|date:'yyyy年MM月dd日'}}</td>
						<td>{{aw.endDate.time|date:'yyyy年MM月dd日'}}</td>
						<td>{{aw.score}}</td>
						<td></td>
					</tr>
				</table>
            </div>
        </div>
        
        <div style="padding-top:30px;"></div>
        <div class="panel panel-default">
            <div class="panel-body">
            	<span style="font-size:15px;width:100px;" class="title">历次处分记录</span>
				<table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
					<tr>
						<th style="text-align: ;width:20%;">处分日期</th>
						<th style="text-align: ;width:20%;">处分种类</th>
					</tr>
					<tr ng-repeat="aw in puns">
						<td>{{aw.punDate.time|date:'yyyy年MM月dd日'}}</td>
						<td>{{aw.punText}}</td>
					</tr>
				</table>
            </div>
        </div>
        
        <div style="padding-top:30px;"></div>
        <div class="panel panel-default">
            <div class="panel-body">
            	<span style="font-size:15px;width:150px;" class="title">历次行政处罚记录</span>
				<table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
					<tr>
						<th style="text-align: ;width:20%;">日期</th>
						<th style="text-align: ;width:20%;">处罚原因</th>
					</tr>
					<tr ng-repeat="aw in xzcfs">
						<td>{{aw.casetime.time|date:'yyyy年MM月dd日'}}</td>
						<td>{{aw.casereason}}</td>
					</tr>
				</table>
            </div>
        </div>
        
        <div style="padding-top:30px;"></div>
				<table width="100%" border="0" cellpadding="5" cellspacing="2">
					<tr>
						<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">							
							<a class="btn btn-mini btn-danger" href="${path }/credit/drvexamination.action">关闭</a>
						</td>
					</tr>
				</table>
		
	</div>
	<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="<%=basePath %>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>

</div>
</body>
</html>