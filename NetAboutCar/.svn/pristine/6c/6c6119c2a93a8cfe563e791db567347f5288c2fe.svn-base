<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
	
	
	$("#manageForm").submit();	
		}
		
		function caridB(){
			var alterzd	;
			var altercontentb;
			altercontentb=$("#caridBefore").val();
			alterzd=$("#alterzd").val();
			$("#alterzd").val(alterzd+"车牌号="+altercontentb+"^");	
		}
		 
		
		
		function drivcarnoB(){
			var alterzd;
			var altercontentb;
			altercontentb=$("#drivcarnoBefore").val();
			alterzd=$("#alterzd").val();
			$("#alterzd").val(alterzd+"驾驶证号码="+altercontentb+"^");
		}
		
		
		
		function drivenameB(){
			var alterzd	;
			var altercontentb;
			altercontentb=$("#drivenameBefore").val();
			alterzd=$("#alterzd").val();
			$("#alterzd").val(alterzd+"司机姓名="+altercontentb+"^");	
		}
		
		function plantB(){
			var alterzd	;
			var altercontentb;
			altercontentb=$("#plateNameBefore").val();
			alterzd=$("#alterzd").val();
			$("#alterzd").val(alterzd+"平台名称="+altercontentb+"^");	
		}
		
		function casesourceB(){
			var alterzd	;
			var altercontentb;
			altercontentb=$("#casesourceBefore").val();
			alterzd=$("#alterzd").val();
			$("#alterzd").val(alterzd+"案件来源="+altercontentb +"^");	
		}
		
		function isregisterB(){
			var alterzd	;
			var altercontentb;
			altercontentb=$("#isregisterBefore").val();
			alterzd=$("#alterzd").val();
			$("#alterzd").val(alterzd+"案件状态="+altercontentb+"^");	
		}
		
		function areacodeB(){
			var alterzd	;
			var altercontentb;
			altercontentb=$("#areacodeBefore").val();
			alterzd=$("#alterzd").val();
			$("#alterzd").val(alterzd+"行政区划="+altercontentb+"^");	
		}
		
		function createinstidB(){
			var alterzd	;
			var altercontentb;
			altercontentb=$("#createinstidBefore").val();
			alterzd=$("#alterzd").val();
			$("#alterzd").val(alterzd+"组织机构="+altercontentb+"^");	
		}
		
		/* function casereasonB(){
			var alterzd	;
			var altercontentb;
			altercontentb=$("#casetimeBefore").val();
			alterzd=$("#alterzd").val();
			$("#alterzd").val(alterzd+"案发时间="+altercontentb +"^");	
		} */
		
		function casereasonB(){
			var alterzd	;
			var altercontentb;
			altercontentb=$("#casereasonBefore").val();
			alterzd=$("#alterzd").val();
			$("#alterzd").val(alterzd+"案件事由="+altercontentb+"^");	
		}
		
		
</script>
</head>
<body>
	<div class="container">
		<form action="drvcaserevise.action" method="post" name="manageForm" id="manageForm">
		<input type="hidden" name="caseid" value="${DrvCaseManageInfo.caseid }" />
			<div id="zhongxin" align="center" style="padding-top: 25px">
		   	<table>
		   			<tr>
						<td align="right">案件编号：</td>
						<td align="left"><input class="form-control"
							value ="${DrvCaseManageInfo.caseid }" name="caseid" id="caseid" type="text" placeholder="请输入案件编号" disabled="disabled"></td>
					</tr>
		   			<tr>
						<td align="right">车牌号：</td>
						<td align="left"><input class="form-control"
							value ="${DrvCaseManageInfo.carid }" name="carid" id="carid" type="text" placeholder="请输入车牌号" onchange="caridB()"></td>
					</tr>
					
					<tr>
						<td align="right">驾驶证号码：</td>
						<td align="left"><input class="form-control"
							value ="${DrvCaseManageInfo.drivcarno }" name="drivcarno" id="drivcarno" type="text" placeholder="请输入驾驶证号码"  onchange="drivcarnoB()"
							onblur="getDrvno()"></td>
					</tr>
					<tr>
						<td align="right">司机姓名：</td>
						<td align="left"><input class="form-control"
							value ="${DrvCaseManageInfo.drivename }" name="drivename" id="drivename" type="text" placeholder="请输入司机名称" onchange="drivenameB()"></td>
					</tr>
					<tr >
						<td align="right">平台名称：</td>
						<td align="left">
					<select name="plateName" id="plateName" style="width:220px;" onchange="plantB()">
			        <option value="请选择">请选择</option>
				     <c:forEach items="${comlist}" var="comlist">
				     <option value="${comlist.comname}" <c:if test="${comlist.comname==plantCaseInfo.plateName}">selected</c:if>>${comlist.comname}</option>
				     </c:forEach>     
				    </select></td>
					</tr>
					<tr>
						<td align="right">案件来源：</td>
						<td align="left">
							<select class="form-control" name="casesource" id="casesource" onchange="casesourceB()">
								<option value="01" <c:if test="${DrvCaseManageInfo.casesource=='01'}">selected</c:if>>稽查执法查扣违章</option>
								<option value="02" <c:if test="${DrvCaseManageInfo.casesource=='02'}">selected</c:if>>信访投诉违章</option>
								<option value="02" <c:if test="${DrvCaseManageInfo.casesource=='00'}">selected</c:if>>手工录入</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right">案件状态：</td>
						<td align="left">
							<select class="form-control" name="isregister" id="isregister"  onchange="isregisterB()">
								<option value="00" <c:if test="${DrvCaseManageInfo.isregister=='00'}">selected</c:if>>已结案</option>
								<option value="01" <c:if test="${DrvCaseManageInfo.isregister=='01'}">selected</c:if>>未交罚款</option>
							</select>
							</td>
					</tr>
					<tr>
						<td align="right">行政区划：</td>
						<td align="left"><input class="form-control"
							value ="${DrvCaseManageInfo.areacode }" name="areacode" id=""areacode"" type="text" placeholder="请输入行政区划"  onchange="areacodeB()"/></td>
					</tr>
					
					
					<td align="right">案发时间：</td>
						<td align="left"><input type="text" class="date-picker" id="casetime" name="casetime" value="${DrvCaseManageInfo.casetime }"  
						data-date-format="yyyy-mm-dd" onchange="changeDateValue();"/>
						</td>
					
					<tr>
						<td align="right">案件事由：</td>
						<td align="left"><textarea class="form-control" rows="4" cols="1" 
							 name="casereason" id="casereason" placeholder="请输入案件事由"  onchange="casereasonB()">${DrvCaseManageInfo.casereason }</textarea>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" style="text-align: center; padding-top: 25px;">
							<a class='btn btn-mini btn-primary' onclick='save()'>保存</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">返回</a>
						</td>
					</tr>
					
					<tr>
						<td>
						<input type="hidden" id="caridBefore" name="caridBefore" value="${DrvCaseManageInfo.carid }">						<!-- 1 -->
						<input type="hidden" id="drivcarnoBefore" name="drivcarnoBefore" value="${DrvCaseManageInfo.drivcarno }">			<!-- 2 -->
						<input type="hidden" id="drivenameBefore" name="drivenameBefore" value="${DrvCaseManageInfo.drivename }">			<!-- 3 -->
						<input type="hidden" id="plateNameBefore" name="plateNameBefore" value="${DrvCaseManageInfo.plateName }">			<!-- 4 -->
						<input type="hidden" id="casesourceBefore" name="casesourceBefore" value="${DrvCaseManageInfo.casesource }">		<!-- 5 -->
						<input type="hidden" id="isregisterBefore" name="isregisterBefore" value="${DrvCaseManageInfo.isregister }">		<!-- 6 -->
						<input type="hidden" id="areacodeBefore" name="areacodeBefore" value="${DrvCaseManageInfo.areacode }">				<!-- 7 -->
						<input type="hidden" id="createinstidBefore" name="createinstidBefore" value="${DrvCaseManageInfo.createinstid }">	<!-- 8 -->
						<input type="hidden" id="casetimeBefore" name="casetimeBefore" value="${DrvCaseManageInfo.casetime }">				<!-- 9 -->
						<input type="hidden" id="casereasonBefore" name="casereasonBefore" value="${DrvCaseManageInfo.casereason }">	
						<input  type="hidden"	value ="${DrvCaseManageInfo.caseid }" name="caseId" id="caseId"  >	<!-- 10 -->
						<input type="hidden" id="alterzd" name="alterzd" value="">
						<input type="hidden" id="altercontentb" name="altercontentb" value="">
						</td>
					</tr>
				</table>
			</div>
			<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="<%=basePath%>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
        </form>     
	</div>
</body>
</html>