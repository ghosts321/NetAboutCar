<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html ng-app='wyc'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
angular.module('wyc',[]).controller('WycController',function($http,$scope){
	$scope.sjzl={exec_period:'single'};
	$scope.periodtypes=[{text:'仅一次',value:'single'},{text:'每年',value:'year'},{text:'每季',value:'quarter'},
	                    {text:'每月',value:'month'},{text:'每天',value:'day'}];
	
});

$(function(){
	$('.check-span').click(function(obj){
		$('.check-span-select').removeClass('check-span-select');
		$(this).addClass('check-span-select');
	});
});

//保存校验
function save(){


	if($("#dataCode").val()==""){
		$("#dataCode").tips({
			side:3,
            msg:'请输入数据种类代码',
            bg:'#AE81FF',
            time:2
        });
		$("#dataCode").focus();
		return;
	}


	if($("#dataTitle").val()==""){
		$("#dataTitle").tips({
			side:3,
            msg:'请输入数据标题',
            bg:'#AE81FF',
            time:2
        });
		$("#dataTitle").focus();
		return;
	}
	
	$("#contentForm").ajaxSubmit({
		success:function(response){
			if(response=='success'){
				top.Dialog.close();
			}
		}		
	});
}

</script>
<style>
input[type=text]{
  width: 550px;
}

textarea{
	width:550px;
	height:400px;
}

.sql-comment{
display: block;
width: 550px;
border: 1px dotted #D0BD93;
padding: 5px;
color: rgb(207, 114, 37);
background-color: #F9F3CC;
}

.check-span{
	border: 1px dotted #ccc;
	padding: 3px 5px;
	width: 80px;
	text-align: center;
	display: block;
	background-color: #F5F3F3;
	color: rgb(176, 164, 164);
	margin: 10px 10px 10px 0;
	text-decoration: none!important;
}

.check-span-select{
	border: 1px solid #A69393;
	background-color: #D8CDCD;
	color: rgb(89, 65, 65);
	text-decoration: none!important;
}

</style>
</head>
<body >
<div class="container" ng-controller="WycController">
<form  action="bcsjzl.action" name="contentForm" id="contentForm" method="post" enctype="multipart/form-data">
	
		<div id="zhongxin" align="center" style="padding-top:30px">
		<table >
		    <tr>
			    <td colspan="2" align="left">新建统计数据种类</td>
			    <td>&nbsp;</td>
			</tr>
			<tr>
				<td style="text-align: right;">数据代码：</td>
				<td align="left"><input type="text" ng-model='sjzl.dataCode' name="dataCode" id="dataCode" value="" placeholder="数据代码"/></td>
			</tr>
			<tr>
				<td style="text-align: right;">数据标题：</td>
				<td align="left"><input type="text" ng-model='sjzl.dataTitle' name="dataTitle" id="dataTitle" value="" placeholder="数据标题，如分年度订单总数"/>
				</td>
			</tr>
			<tr>
			    <td style="text-align: right;">统计SQL：</td>
				<td align="left"><div><textarea ng-model='sjzl.data_sql' name="dataSql" id="dataSql" rows=5 cols=60></textarea></div>
					<div class='sql-comment'>SQL格式应为“insert into jcfx_data() select ”语句，字段应按照规则转义，dim1~dim10为维度字段，value1~value10为值字段。
					例：insert into jcfx_data(dim1,dim2,dim3,value1,value2) select year as dim1,areacode as dim2,areaname as dim3,drivernumber as value1,
					platnum as value2 from tablename group by date,areacode,areanme。
					<br>此例代表<b>分年度和地区统计驾驶员数和平台数</b>。数据字段中dim1即年份，dim2即地区代码，dim3为地区名称，value1值为驾驶员数，value2平台数量。
					</div>
				</td>
			</tr>			
			
			
			<tr>
				<td style="text-align: right;">执行时间：</td>
				<td align="left"><div><input type="text"  ng-model='sjzl.exec_time' name="execTime" id="execTime" value="" placeholder="执行时间"/></div>
					<div class='sql-comment'>参见spring quartz设置。
					</div>
				</td>
			</tr>
			
			
			<tr>
				<td style="text-align: right;">统计任务：</td>
				<td align="left"><div><a href="javascript:void();" class='check-span check-span-select'><span>创建</span></a>
				<a href="javascript:void();" class="check-span">暂不执行</a></div>
				</td>
			</tr>
			
			<tr>			    
				<td colspan="2" style="text-align: center; padding-top: 30px;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/>
		<img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
</body>
</html>