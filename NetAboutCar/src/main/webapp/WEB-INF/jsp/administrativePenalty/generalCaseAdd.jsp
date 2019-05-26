<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../../common.jsp" %>

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
    $(".ui_timepicker").datetimepicker({
        //showOn: "button",
        //buttonImage: "./css/images/icon_calendar.gif",
       // buttonImageOnly: true,
        showSecond: true,
        timeFormat: 'hh:mm:ss',
        stepHour: 1,
        stepMinute: 1,
        stepSecond: 1
    }); 
    


});
//获取文件名
function getFile(obj,inputName){
	var file_name = $(obj).val();
	var houzhui=file_name.split(".");
	var last=houzhui[houzhui.length-1];
	var tp ="jpg,gif,bmp,png,JPG,GIF,BMP,PNG";
	var rs=tp.indexOf(last);
	
	//如果返回的结果大于或等于0，说明包含允许上传的文件类型
	if(rs>=0){
		 $("input[name='"+inputName+"']").val(file_name);
		 return true;
	}else{
		 alert("您选择的上传文件不是有效的图片文件！");
		 $("input[name='"+inputName+"']").val("");
		 return false;
	}
}

//获取处罚内容
function getTerm(){
	 document.getElementById('caseReason').blur();
	 window.open("<%=basePath%>penalty/tremIndex.action","","status:no;resizable:yes;dialogHeight:410px;dialogWidth:460px;unadorne:yes");
}
//保存
function save(){
	
	 if($("#plateName").val()==""){
			$("#plateName").tips({
				side:3,
	            msg:'请输入平台名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#plateName").focus();
			return false;
		  } 
		  
		  if($("#source").val()==""){
				$("#source").tips({
					side:3,
		            msg:'请选择案件来源',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#source").focus();
				return false;
			}
		
		  if($("#areaCode").val()==""){
				$("#areaCode").tips({
					side:3,
		            msg:'请输入行政区划',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#areaCode").focus();
				return false;
		  } 

		  if($("#instId").val()==""){
				$("#instId").tips({
					side:3,
		            msg:'请输入组织机构',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#instId").focus();
				return false;
		  } 
		
		

		if($("#caseStatus").val()==""){
			$("#caseStatus").tips({
				side:3,
	            msg:'请选择案件状态',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#caseStatus").focus();
			return false;
		}
		
		if($("#caseReason").val()==""){
			$("#caseReason").tips({
				side:3,
	            msg:'请选择案件事由',
	            bg:'#AE81FF',
	            time:2
	        });
			return false;
		}
		
		if($("#punishType").val()==""){
			$("#punishType").tips({
				side:3,
	            msg:'请选择处罚类型',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#punishType").focus();
			return false;
		}
		
		if($("#punishContent").val()==""){
			$("#punishContent").tips({
				side:3,
	            msg:'请填写处罚内容',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#punishContent").focus();
			return false;
		} 
	$("#plantCaseInfoForm").submit();
    $("#zhongxin").hide();
	$("#zhongxin2").show();  
}
</script>
</head>
<body>
	<div class="container">
		<form action="generalCaseAdd.action" method="post" name="plantCaseInfoForm" id="plantCaseInfoForm">
			<div id="zhongxin" align="center" style="padding-top: 25px">
		   	<table>
					<tr >
						<td align="right">平台名称：</td>
						<td align="left">
							<select class="form-control" name="plateName" id="plateName">
							<option value="">请输入平台名称</option>
								<c:forEach items="${platformList}" var="platform">
									<option value="${platform.platformName}">${platform.platformName}</option>
								</c:forEach>
							</select>
						</td>
						<td align="left"></td>
					</tr>
					<tr>
						<td align="right">案件来源：</td>
						<td align="left">
							<select class="form-control" name="source" id="source">
								<option value="00">手工录入</option>
								<option value="01">稽查执法查扣违章</option>
								<option value="02">信访投诉违章</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right">行政区划：</td>
						<td align="left"><input class="form-control"
							name="areaCode" id="areaCode" type="text" placeholder="请输入行政区划"/></td>
					</tr>
					<tr>
						<td align="right">组织机构：</td>
						<td align="left">
						<input class="form-control"
							name="instId" id="instId" type="text" placeholder="请输入组织机构"/>
						</td>
					</tr>
					<tr>
						<td align="right">案发时间：</td>
						<td><input type="text" class="ui_timepicker" id="caseTime" name="caseTime" readonly="readonly"  value=""  data-date-format="yyyy-mm-dd" style="width:220px;"/></td>	

					</tr>
					<tr>
						<td align="right">案件事由：</td>
						<td align="left"><textarea class="form-control" rows="4" cols="1" 
							name="caseReason" id="caseReason" placeholder="请选择案件事由"  onfocus="getTerm()" readonly></textarea>
						</td>
					</tr>
					<tr>
						<td align="right">处罚内容：</td>
						<td align="left"><textarea class="form-control" rows="4" cols="1" 
							name="punishContent" id="punishContent" placeholder="请输入处罚内容" ></textarea>
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