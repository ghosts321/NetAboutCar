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

var regMobile=/^1[3,5,8]\d{9}$/;
  var regIdCard=/^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
  var regEmail =/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
  var regName= /[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*/;
  
  var name=$("#compn_name").val();
  var phoneNum=$("#compn_tel").val();
  var carId = $("#compn_number").val();
  var email = $("#compn_email").val();
  
  
 if(regName.test(name)==false){
		$("#compn_name").tips({
			side:3,
            msg:'请输入正确的姓名',
            bg:'#AE81FF',
            time:2           
        });
		$("#compn_name").focus();
		return false;
	}
	if(regMobile.test(phoneNum)==false){
		$("#compn_tel").tips({
			side:3,
            msg:'请输入正确的电话号',
            bg:'#AE81FF',
            time:2
        });
		$("#compn_tel").focus();
		return false;
	}
	if($("#compn_sex").val()=="0"){
		$("#compn_sex").tips({
			side:3,
            msg:'请选择性别',
            bg:'#AE81FF',
            time:2
        });
		$("#compn_sex").focus();
		return false;
	}
	
	if(regIdCard.test(carId)==false){
		$("#compn_number").tips({
			side:3,
            msg:'请输入正确的身份证号',
            bg:'#AE81FF',
            time:2
        });
		$("#compn_number").focus();
		return false;
	}
	
	
	if($("#compn_time").val()==""){
		$("#compn_time").tips({
			side:3,
            msg:'请选择投诉时间',
            bg:'#AE81FF',
            time:2
        });
		$("#compn_time").focus();
		return false;
	}
	
	if(email!=null &&email!='' ){
	  if(regEmail.test(email)==false){
	  	$("#compn_email").tips({
			side:3,
            msg:'请输入正确的邮箱',
            bg:'#AE81FF',
            time:2
        });
		$("#compn_email").focus();
		return false;
	}
	    
	  }
	
	if($("#compn_compy").val()=="请选择"){
		$("#compn_compy").tips({
			side:3,
            msg:'请选择平台名称',
            bg:'#AE81FF',
            time:2
        });
		$("#compn_compy").focus();
		return false;
	}
	
	
	
    if($("#compn_reason").val()==""){
		$("#compn_reason").tips({
			side:3,
            msg:'请输入投诉内容',
            bg:'#AE81FF',
            time:2
        });
		$("#compn_reason").focus();
		return false;
	} 



	$("#addForm").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}

               function getFile(obj,inputName){
				var file_name = $(obj).val();
				var houzhui=file_name.split(".");
				var last=houzhui[houzhui.length-1];
				var tp ="doc,docx";
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
	table-layout:automatic;
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
<form  action="updatecomp.action" name="addForm" id="addForm" method="post" enctype="multipart/form-data" >
		<div id="zhongxin" align="center" style="padding-top:30px">
		<table border="1" class="table">
		      <tr><td colspan="4"><strong>投诉人基本信息</strong></td></tr>
			<tr>
				<td style="text-align: right;">姓名：</td>
			 <td><input type="text" name="compn_name" id="compn_name" style="width:220px;" value="${comcomplaintinfo.compn_name}" title="姓名"/></td>	
			   <td style="text-align: right;">性别：</td>
				<td> <select name="compn_sex" id="compn_sex" style="width:220px;">		
				    <option value="1" <c:if test="${comcomplaintinfo.compn_sex=='1'}">selected</c:if>>男</option>
					 <option value="2" <c:if test="${comcomplaintinfo.compn_sex=='2'}">selected</c:if>>女</option>      
				  </select></td>
			</tr>
			
			<tr>
			    <td style="text-align: right;">手机号：</td>
				<td><input type="text" name="compn_tel" id="compn_tel" style="width:220px;" value="${comcomplaintinfo.compn_tel}" title="手机号"/></td>
				<td style="text-align: right;" >身份证号：</td>
				<td><input type="text" name="compn_number" id="compn_number" style="width:220px;" value="${comcomplaintinfo.compn_number}" title="身份证号"/></td>	
			</tr>
			
			<tr>
			    <td style="text-align: right;">电子邮件：</td>
				<td colspan="3"> <input type="text" name="compn_email" id="compn_email" style="width:220px;" value="${comcomplaintinfo.compn_email}" title="电子邮件"/></td>
			</tr>
			 <tr>
			 <td style="text-align: right;">现住地址：</td>
				<td colspan="3"><textarea  name="compn_address" id="compn_address" style="width:500px;height:50px;" >${comcomplaintinfo.compn_address}</textarea></td>
			 </tr>
			  <tr><td colspan="4"><strong>投诉信息</strong></td></tr>
				<tr> <td style="text-align: right;">平台名称：</td>
				<td colspan="3">
				<select name="compn_compy" id="compn_compy" style="width:220px;">
			        <option value="请选择">请选择</option>
				     <c:forEach items="${comlist}" var="comlist">
				     <option value="${comlist.comname}" <c:if test="${comlist.comname==comcomplaintinfo.compn_compy}">selected</c:if>>${comlist.comname}</option>
				     </c:forEach>     
				  </select>
				     <input type="hidden" id="complain_code" name="complain_code" value="${comcomplaintinfo.complain_code}"/>
				     <input type="hidden" id="complain_info_id" name="complain_info_id" value="${comcomplaintinfo.complain_info_id}"/>
				        <c:if test="${comcomplaintinfo.compn_file!=null && comcomplaintinfo.compn_file!=''}">
				      <input type="hidden"  name="compn_file" value="${comcomplaintinfo.compn_file}">
				     </c:if>
				</td></tr>
				 <tr height="40">
								<td align="right">投诉文件：</td>
								<td colspan="3" align="left">
							         <div class="box">
										<input type="text" name="compn" id="compn" value="${compn_file}" class="file_textbox" />
										<a href="javascript:void(0);" class="upload_link">上传</a>
										<input type="file" multiple  class="uploadFile" name="compnfile"  id="compnfile" onchange="getFile(this,'compn')" />
									</div>         
								</td>
							</tr> 
							
							<tr>
			    <td style="text-align: right;">投诉内容：</td>
			    <td colspan="3"><textarea name="compn_reason" id="compn_reason" style="width:500px;height:50px;">${comcomplaintinfo.compn_reason}</textarea></td>
			</tr>
			<tr>
				<td style="text-align: center; padding-top: 20px;" colspan=4>
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>&nbsp;&nbsp;&nbsp;
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