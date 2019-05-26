<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html ng-app='wyc'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
angular.module('wyc',[]).controller('WycController',function($http,$scope){
	$scope.pics=[{text:'饼图',name:'pie'},{text:'柱图',name:'bar'},{text:'折线图',name:'line'},{text:'雷达图',name:'rador'},{text:'分时图',name:'timeline'}];
	$scope.fieldTypes=[{text:'维度字段',value:'DEMINSION'},{text:'值字段',value:'VALUE'}];

	$scope.jdd={fieldType:'DEMINSION'}	
	
	$scope.dims={AREACODE:'地区代码',AREANAME:'地区名称',PROVINCE:'省级',CITY:'市级',COUNTRY:'区级'};
	
	$scope.dims.DATE={text:'日期',title:'当前维度层级',dimTypes:[{value:'MINUTE',text:'分'},{value:'DAY',text:'天'},
	                                                     {value:'MONTH',text:'月'},{value:'QUARTER',text:'季'},{value:'YEAR',text:'年'}]}
	
	
    $http.post("findDataCatalog.action?dataCode=${jdd.dataCode}").success(function (response) {
    	$scope.sjzl=response;
    });
	

    $http.post("findDataDeminsion.action?dataCode=${jdd.dataCode}&dimCode=${jdd.dimCode}").success(function (response) {
    	$scope.jdd=response;
    	$scope.dim=(eval('$scope.dims.'+$scope.jdd.dimCode));    	
    });
	
	$scope.doChangeDimCode=function(){
		if($scope.jdd.dimCode==null||$scope.jdd.dimCode==''){
			delete $scope.dim; 
			return;
		}
		$scope.jdd.dimCode=$scope.jdd.dimCode.toUpperCase();
		$scope.dim=(eval('$scope.dims.'+$scope.jdd.dimCode));
		if($scope.dim!=null){
			$scope.jdd.dimName=$scope.dim.text;			
		}else{
			delete $scope.dim;
		}
	}
});

//保存校验
function save(){

	if($("#dimName").val()==""){
		$("#dimName").tips({
			side:3,
            msg:'请输入维度名称',
            bg:'#AE81FF',
            time:2
        });
		$("#dimName").focus();
		return;
	}

	if($("#dimFieldname").val()==""){
		$("#dimFieldname").tips({
			side:3,
            msg:'请输入对应字段名',
            bg:'#AE81FF',
            time:2
        });
		$("#dimFieldname").focus();
		return;
	}
	
	
	$("#contentForm").submit();
}

</script>
<style>
input[type=text]{
  width: 550px;
}

input[type=checkbox]{
	width:18px;
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

.title-comment{
display: block;
width: 550px;
border: 1px dotted #ECDCBB;
padding: 5px;
color: rgb(186, 106, 39);
background-color: #FDFBE8;
	margin-bottom:30px;
}

ul li{
float: left;
margin-right: 15px;
}

#dimCode{
text-transform:uppercase;
}

.readonly{
	    background-color: #f3f0ed!important;
}
</style>
</head>
<body >
<div class="container" ng-controller="WycController">
<form  action="gxwddy.action" name="contentForm" id="contentForm" method="post" enctype="multipart/form-data">
	<input type=hidden name="dataCode" id="dataCode" value="{{sjzl.dataCode}}"/>
	<input type=hidden name="fieldType" id="fieldType" value="{{jdd.fieldType}}"/>
	<input type=hidden name="dimType" id="dimType" value="{{jdd.dimType}}"/>
		<div id="zhongxin" align="center" style="padding-top:30px">
		<table >
		    <tr class='title-tr'>
			    <td colspan="2" align="left"><div>修改维度定义:{{sjzl.dataTitle}}</div>
			    <div class="title-comment">维度定义功能主要完成对数据字段的解译，包括了维度字段和值字段。</div></td>
			    <td>&nbsp;</td>
			</tr>
			<tr>
				<td style="text-align: right;">字段类型：</td>
				<td align="left"><span ng-show="jdd.fieldType=='VALUE'">值字段</span><span ng-show="jdd.fieldType=='DEMINSION'">维度字段</span>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">维度/值代码：</td>
				<td align="left"><div><input type="text" readonly class="readonly" ng-model='jdd.dimCode' name="dimCode" id="dimCode" value="" placeholder="维度代码"/></div>
							<div class="sql-comment" ng-hide='jdd.fieldType=="VALUE"'>
							标准维度代码：日期=DATE、地区代码=AREACODE、地区名=AREANAME、省级=PROVINCE、市级=CITY、区级=COUNTRY等，使用大写英文或数字。</div>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">维度/值名称：</td>
				<td align="left"><input type="text" ng-model='jdd.dimName' name="dimName" id="dimName" value="" placeholder="维度名称，如地区"/>
				</td>
			</tr>
			<tr ng-hide='jdd.fieldType=="VALUE" || jdd.dimCode!="DATE" '>
				<td style="text-align: right;">{{dim.title}}：</td>
				<td align="left"><select ng-model="jdd.dimType" 
				 ng-options='p.value as p.text for p in dim.dimTypes'></select>
				</td>
			</tr>
				
			<tr>
				<td style="text-align: right;">对应代码字段名：</td>
				<td align="left"><input type="text" ng-model='jdd.dimFieldname' name="dimFieldname" id="dimFieldname" value="" placeholder="jcfx_data表字段，如dim2或value3"/></select>
				</td>
			</tr>	
					
			<tr ng-show='jdd.fieldType=="DEMINSION"'>
				<td style="text-align: right;">对应名称字段名：</td>
				<td align="left"><input type="text" ng-model='jdd.dimNamefield' name="dimNamefield" id="dimNamefield" value="" placeholder="jcfx_data表字段，保存维度名称值"/></select>
				</td>
			</tr>				
				
			<tr ng-show='jdd.fieldType=="DEMINSION"'>
				<td style="text-align: right;">数据Url：</td>
				<td align="left"><input type="text" ng-model='jdd.dataUrl' name="dataUrl" id="dataUrl" value=""
					 placeholder="改维度的数据读取的链接，如营运平台数据链接findCompany.action"/></select>
				</td>
			</tr>	
			
			<tr ng-show='jdd.fieldType=="DEMINSION"'>
				<td style="text-align: right;">数据代码字段名：</td>
				<td align="left"><input type="text" ng-model='jdd.dataCodeField' name="dataCodeField" id="dataCodeField" value=""
					 placeholder="对应数据链接，如营运平台代码字段：creditcode"/></select>
				</td>
			</tr>	
			
			<tr ng-show='jdd.fieldType=="DEMINSION"'>
				<td style="text-align: right;">数据名称字段名：</td>
				<td align="left"><input type="text" ng-model='jdd.dataNameField' name="dataNameField" id="dataNameField" value=""
					 placeholder="对应数据链接，如营运平台名称字段：comname"/></select>
				</td>
			</tr>	
			<!-- <tr ng-hide='jdd.fieldType=="VALUE"'>
				<td style="text-align: right;">适用图形：</td>
				<td align="left">
					<ul>
					<li ng-repeat='pic in pics'>
						<span><input type='checkbox' value='{{pic.name}}'>{{pic.text}}</span>
					</li></ul>
				</td>
			</tr> -->
			
			<tr>			    
				<td colspan="2" style="text-align: center; padding-top: 30px;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="btn btn-mini btn-danger" href='${path }/jcfx/wddy.action?dataCode=${jdd.dataCode}'>取消</a>
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