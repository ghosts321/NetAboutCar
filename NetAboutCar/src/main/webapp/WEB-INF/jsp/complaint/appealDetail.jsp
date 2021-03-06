<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

$(function(){ 
  	//日期框
	$('.date-picker').datepicker();
	 
})
//保存校验
function save(){
	$("#addForm").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}

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
			

</script>
<style>
table{
	table-layout:fixed;
	empty-cells:show;
	border-collapse: collapse;
	margin:0 auto;
}
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
padding:5px 0.5em 0;
width:100px
}
.table tr.alter{
background-color:#f5fafe;
}
img{
margin-bottom:0.5em;
width: 220px;
height: 150px;
}

select,textarea{
	margin-bottom: 8px;
}
textarea{
  width: 220px;
}
</style>
</head>
<body>
<div class="container">
<form  action="acceptcomit.action" name="addForm" id="addForm" method="post" enctype="multipart/form-data" >
		<div id="zhongxin" align="center" style="padding-top:30px">
		<table border="1" class="table">
		    <tr>
		<td style="text-align: left;" colspan="4"><strong>投诉人基本信息</strong></td>
		    </tr>	      
			<tr>
				<td style="text-align: right;">姓名：</td>
			 <td>${comcomplaintinfo.compn_name}</td>	
			   <td style="text-align: right;">性别：</td>
				<td>  <c:if test="${comcomplaintinfo.compn_sex=='1'}">男</c:if> 
				       <c:if test="${comcomplaintinfo.compn_sex=='2'}">女</c:if>
				</td>
			</tr>

			<tr>
			    <td style="text-align: right;">手机号：</td>
				<td>${comcomplaintinfo.compn_tel}</td>
				<td style="text-align: right;" >身份证号：</td>
				<td>${comcomplaintinfo.compn_number}</td>	
			</tr>
			<tr>
			    <td style="text-align: right;">电子邮件：</td>
				<td style="text-align: left;" colspan="3" >${comcomplaintinfo.compn_email}</td>
			</tr>
			 <tr>  <td style="text-align: right;">现住地址：</td>
				<td  style="text-align: left;" colspan="3" >${comcomplaintinfo.compn_address}</td></tr>
				<tr>
				<td style="text-align: left;" colspan="4"><strong>投诉信息</strong></td>
				</tr>
				<tr> <td style="text-align: right;">平台名称：</td>
				<td colspan="3">${comcomplaintinfo.compn_compy}
				     <input type="hidden" id="complain_code" name="complain_code" value="${comcomplaintinfo.complain_code}"/>
				      <input type="hidden" id="complain_info_id" name="complain_info_id" value="${comcomplaintinfo.complain_info_id}"/>
				</td></tr>
				<c:if test="${comcomplaintinfo.compn_file!=null && comcomplaintinfo.compn_file!=''}">
				 <tr height="40">
								<td align="right">投诉文件：</td>
								<td align="left" colspan="3">
							         <div class="box">
										<a href="${comcomplaintinfo.compn_file}">点击下载</a>
									</div>         
								</td>
							</tr> 
							</c:if>
							<tr>
			    <td style="text-align: right;">投诉内容：</td>
			    <td style="text-align: left;" colspan="3">${comcomplaintinfo.compn_reason}</td>
			</tr>
			<tr>
			<td style="text-align:left;" colspan="4"><strong>处理信息</strong></td>
			</tr>
			<c:if test="${complaindispose.survey_file!=null && complaindispose.survey_file!=''}">
				<tr>
			    <td style="text-align:right;">调查资料下载</td>
			    <td align="left" colspan="3">
							         <div class="box">
										<a href="${complaindispose.survey_file}">点击下载</a>
									</div>         
								</td>
			   </tr>
			   </c:if>
			 <tr><td style="text-align: right;">处理类型：</td>
				<td colspan="3" style="text-align:left;" >
				   <c:if test="${complaindispose.dis_type=='0'}">不做处理</c:if> 
				       <c:if test="${complaindispose.dis_type=='1'}">口头警告</c:if>
				       <c:if test="${complaindispose.dis_type=='2'}">培训教育</c:if>
				       <c:if test="${complaindispose.dis_type=='3'}">退款</c:if>
				       <c:if test="${complaindispose.dis_type=='4'}">转发行政处罚</c:if>
			</td></tr>
			<tr>
				<td  style="text-align: center; padding-top: 20px;" colspan="4">
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
</body>
</html>