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
function save(id){

    document.addForm.action='<%=basePath%>drvcomplaint/drvappealsuccess.action?id='+id;
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
  width:200px;
  height:50px
}
</style>
</head>
<body>
<div class="container">
<form  name="addForm" id="addForm" method="post" enctype="multipart/form-data" >
		<div id="zhongxin" align="center" style="padding-top:30px">
		<table  class="table">	      
			     <tr>
			     <td style="text-align: left;" colspan="2"><strong>申诉信息</strong></td>
			     </tr>
			     <c:if test="${drvplainappeal.appeal_file!=null && drvplainappeal.appeal_file!=''}">
				 <tr height="40">
								<td align="right">申诉文件：</td>
								<td  align="left">
							         <div class="box">
										<a href="${drvplainappeal.appeal_file}">点击下载</a>
										 
									</div>       
								</td>
							</tr> 
							</c:if>
							<tr>
			    <td style="text-align: right;">申诉内容：</td>
			    <td>${drvplainappeal.appl_content}
			    <input type="hidden" id="complain_code" name="complain_code" value="${drvcomplaintinfo.complain_code}"/>
				   <input type="hidden" id="drv_complain_info_id" name="drv_complain_info_id" value="${drvcomplaintinfo.drv_complain_info_id}"/>
			    </td>
			</tr>
			<tr>
			     <td style="text-align: left;" colspan="2"><strong>意见</strong></td>
			     </tr>
			<tr>
			    <td style="text-align: right;">申诉意见：</td>
			    <td><textarea name="appl_dis_idea" id="appl_dis_idea" style="width:200px;height:80px;"
			     ></textarea></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center; padding-top: 20px;" colspan=4>
					<a class="btn btn-mini btn-primary" value="1" onclick="save('1');">申诉通过</a>&nbsp;&nbsp;&nbsp;
					<a class="btn btn-mini btn-primary" value="2" onclick="save('2');">申诉不通过</a>&nbsp;&nbsp;&nbsp;
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
				
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="<%=basePath%>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
</body>
</html>