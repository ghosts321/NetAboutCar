<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link type="text/css" href="<%=basePath%>datetime/css/jquery-ui-1.8.17.custom.css" rel="stylesheet" />
<link type="text/css" href="<%=basePath%>datetime/css/jquery-ui-timepicker-addon.css" rel="stylesheet" />
<script type="text/javascript" src="<%=basePath%>datetime/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>datetime/js/jquery-ui-1.8.17.custom.min.js"></script>
<script type="text/javascript" src="<%=basePath%>datetime/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="<%=basePath%>datetime/js/jquery-ui-timepicker-zh-CN.js"></script> 
<script src="<%=basePath %>static/js/jquery.tips.js" type="text/javascript"></script>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
 a:hover{color:white;text-decoration:none;}
 table{border-collapse:separate;}
select,textarea{
	margin-top: 4px;
	margin-bottom: 4px;
}
textarea{
  width: 222px;
}
</style>
<script type="text/javascript">
$(function(){
	//日期控件
	$('.date-picker').datepicker();
});


function getDrvno(){

var drvId = $("#drivcarno").val();
$.ajax({
type:'post',
url:'<%=basePath%>drvpenalty/getDrvno.action?drivcarno='+drvId,
data:{},
success:function(data){
   if(data=="erro"){
      alert("您输入的驾驶证号不正确");
      document.getElementById("drivcarno").value="";
       
       }

    }
 })

}

//保存
function save(){
	
	var regCar=/^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$/;
  		var regIdCard=/^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
  
  		var carId=$("#carid").val();
  		var drvId = $("#drivcarno").val();



	 if(regCar.test(carId)==false){
		$("#carid").tips({
			side:3,
            msg:'请输入正确的车牌号码',
            bg:'#AE81FF',
            time:2
        });
		$("#carid").focus();
		return false;
	} 
	
	if(regIdCard.test(drvId)==false){
		$("#drivcarno").tips({
			side:3,
            msg:'请输入正确的驾驶证号码',
            bg:'#AE81FF',
            time:2
        });
		$("#drivcarno").focus();
		return false;
	}
	
	$("#drvPlantCaseInfoForm").submit();
	
}
</script>
</head>
<body>
	<div class="container">
		<form action="drvCaseAlter.action" method="post" name="drvPlantCaseInfoForm" id="drvPlantCaseInfoForm">
		<input type="hidden" name="caseid" value="${drvPlantCaseInfo.caseid }" />
			<div id="zhongxin" align="center" style="padding-top: 25px">
		   	<table>
					<tr>
						<td align="right">车牌号：</td>
						<td align="left"><input class="form-control"
							value ="${drvPlantCaseInfo.carid }" name="carid" id="carid" type="text" placeholder="请输入车牌号" ></td>
					</tr>
					<tr>
						<td align="right">处罚人驾驶证号码：</td>
						<td align="left"><input class="form-control"
							value ="${drvPlantCaseInfo.drivcarno }" name="drivcarno" id="drivcarno" type="text" placeholder="请输入驾驶证号" 
							onblur="getDrvno()"></td>
					</tr>
					<tr>
						<td align="right">案件来源：</td>
						<td align="left">
							<select class="form-control" name="casesource" id="casesource">
								<option value="01" <c:if test="${drvPlantCaseInfo.casesource=='01'}">selected</c:if>>稽查执法查扣违章</option>
								<option value="02" <c:if test="${drvPlantCaseInfo.casesource=='02'}">selected</c:if>>信访投诉违章</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right">行政区划：</td>
						<td align="left"><input class="form-control"
							value ="${drvPlantCaseInfo.areacode }" name="areacode" id=""areacode"" type="text" placeholder="请输入行政区划"/></td>
					</tr>
					<tr>
						<td align="right">组织机构：</td>
						<td align="left">
						
						<input class="form-control"
							value ="${drvPlantCaseInfo.createinstid }" name="createinstid" id="createinstid" type="text" placeholder="请输入组织机构"/>
						</td>
					</tr>
					<%-- <tr>
						<td align="right">案件承办人：</td>
						<td align="left"><input class="form-control"
							value ="${drvPlantCaseInfo.caseuserid }" name="caseuserid" id=""caseuserid"" type="text" placeholder="请输入案件承办人"/></td>
					</tr> --%>
					<tr>
						<td align="right">案件状态：</td>
						<td align="left">
							<select class="form-control" name="isregister" id="isregister">
								<option value="00" >已结案</option>
								<option value="01" >未交罚款</option>
							</select>
						</td>
					</tr>
					<td align="right">案发时间：</td>
						<td align="left"><input type="text" class="date-picker" id="casetime" name="casetime"  value="${drvPlantCaseInfo.casetime }"  
						data-date-format="yyyy-mm-dd" onchange="changeDateValue();"/>
						</td>
					
					<tr>
						<td align="right">案件事由：</td>
						<td align="left"><textarea class="form-control" rows="4" cols="1" 
							 name="casereason" id="casereason" placeholder="请输入案件事由">${drvPlantCaseInfo.casereason }</textarea>
						</td>
					</tr>
					<tr>
						<td align="right">处罚类型：</td>
						<td align="left">
							<select class="form-control" name="punishtype" id="punishtype">
								<option value="0000" >暂无处罚</option>
								<option value="0001" >口头警告</option>
								<option value="0002" >200元以下罚款</option>
								<option value="0003" >暂扣或吊销驾驶证</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right">处罚内容：</td>
						<td align="left"><textarea class="form-control" rows="4" cols="1" 
							 name="punishcontent" id="punishcontent" placeholder="请输入处罚内容">${drvPlantCaseInfo.punishcontent }</textarea>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" style="text-align: center; padding-top: 25px;">
							<a class='btn btn-mini btn-primary' onclick='save()'>保存</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">返回</a>
						</td>
					</tr>
				</table>
			</div>
			<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="<%=basePath%>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
        </form>     
	</div>
</body>
</html>