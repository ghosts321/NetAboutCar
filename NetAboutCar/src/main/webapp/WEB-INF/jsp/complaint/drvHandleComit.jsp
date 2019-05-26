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
	 
});
//保存校验
function save(){

  if($("#blacklist").val()==""){
		$("#blacklist").tips({
			side:3,
            msg:'请选择是否加入黑名单',
            bg:'#AE81FF',
            time:2
        });
		$("#blacklist").focus();
		return false;
	}
	if($("#dis_type").val()=="请选择"){
		$("#dis_type").tips({
			side:3,
            msg:'请选择处理类型',
            bg:'#AE81FF',
            time:2
        });
		$("#dis_type").focus();
		return false;
	}
	
	$("#addForm").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}

function avalue(){
   $("#is_blacklist").val("1");
   $("#blacklist").val("1");
   
}

  function novalue(){
   $("#is_blacklist").val("0");
    $("#blacklist").val("0");
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
<form  action="toHandleComit.action" name="addForm" id="addForm" method="post" enctype="multipart/form-data" >
		<div id="zhongxin" align="center" style="padding-top:30px">
		<table border="1" class="table">
		<tr>
		<td style="text-align: left;" colspan="5">
		<strong>投诉人信息</strong>
		</td>
		</tr>	      
			<tr>
				<td style="text-align: right;">姓名：</td>
			 <td>${drvcomplaintinfo.compn_name}</td>	
			   <td style="text-align: right;">性别：</td>
				<td colspan="2">  <c:if test="${drvcomplaintinfo.compn_sex=='1'}">男</c:if> 
				       <c:if test="${drvcomplaintinfo.compn_sex=='2'}">女</c:if>
				</td>
			</tr>
		
				  <tr>
				  <td style="text-align: right;">手机号：</td>
				<td>${drvcomplaintinfo.compn_tel}</td>
				  <td style="text-align: right;" >身份证号：</td>
				<td style="text-align: left;" colspan="2">${drvcomplaintinfo.compn_number}</td>
			   </tr>
		
			<tr>
			    <td style="text-align: right;">电子邮件：</td>
				<td style="text-align: left;" colspan="4">${drvcomplaintinfo.compn_email}</td>
			</tr>
			 <tr>  <td style="text-align: right;">现住地址：</td>
				<td style="text-align: left;" colspan="4">${drvcomplaintinfo.compn_address}</td></tr>
				<tr>
		<td style="text-align: left;" colspan="5">
		<strong>被投诉驾驶员信息</strong>
		</td>
		</tr>
				<tr>  <td style="text-align: right;">车牌号：</td>
				<td style="text-align: left;" >${drvcomplaintinfo.car_number}
				 <input type="hidden" id="car_number" name="car_number" value="${drvcomplaintinfo.car_number}"/>
				 <input type="hidden" id="compn_time" name="compn_time" value="${drvcomplaintinfo.compn_time}"/>
				</td>
				<td style="text-align: right;">驾驶证号码：</td>
				<td style="text-align: left;" colspan="2">${drvcomplaintinfo.driver_licence}</td>
				</tr>
			
				<tr> <td style="text-align: right;">网约车所属平台名称：</td>
				<td style="text-align: left;" colspan="4">${drvcomplaintinfo.car_company}
				     <input type="hidden" id="complain_code" name="complain_code" value="${drvcomplaintinfo.complain_code}"/>
				     <input type="hidden" id="drv_complain_info_id" name="drv_complain_info_id" value="${drvcomplaintinfo.drv_complain_info_id}"/>
				     <input type="hidden" id="compn_state" name="compn_state" value="${drvcomplaintinfo.compn_state}"/>
				      <input type="hidden" id="driver_licence" name="driver_licence" value="${drvcomplaintinfo.driver_licence}"/>
				       <input type="hidden" id="driver_name" name="driver_name" value="${drvcomplaintinfo.driver_name}"/>
				       <input type="hidden" id="car_company" name="car_company" value="${drvcomplaintinfo.car_company }"/>
				     <input type="hidden" id="is_blacklist" name="is_blacklist" />
				</td></tr>
				<c:if test="${drvcomplaintinfo.compn_file!=null && drvcomplaintinfo.compn_file!=''}">
				 <tr height="40">
								<td align="right">投诉文件：</td>
								<td style="text-align: left;" colspan="4"><a href="${drvcomplaintinfo.compn_file}">点击下载</a></td>
							</tr> 
							</c:if>		
							<tr>
			    <td style="text-align: right;">投诉内容：</td>
			    <td style="text-align: left;" colspan="4">${drvcomplaintinfo.compn_reason}
			    <input type="hidden" id="compn_reason" name="compn_reason" value="${drvcomplaintinfo.compn_reason}"/>
			    </td>   
			</tr>
		<tr>
		<td style="text-align: left;" colspan="5">
		<strong>处理历史</strong>
		</td>
		</tr>
		<tr>
		<td style="text-align: center; width: 180px"><strong>处理时间</strong></td><td style="text-align:center; width: 130px"><strong>处理部门</strong></td><td style="text-align:center;width: 91px; "><strong>处理人</strong></td>
		<td style="text-align: center;width: 130px"><strong>处理内容</strong></td> <td style="text-align:center;width: 130px"><strong>处理意见</strong></td>
		</tr>
		 <tr><td style="text-align: center;">${drvcomplaintinfo.create_time}</td>
	       <td style="text-align: center;">录入部门</td>
	       <td style="text-align: center;">${drvcomplaintinfo.create_user}</td>
	       <td style="text-align: center;">投诉录入</td>
	       <td style="text-align: center;"></td>
	     </tr>
	      <tr>
	        <td style="text-align: center;">${drvcomplaindistribute.distri_time}</td>
	        <td style="text-align: center;">受理部门</td>
	        <td style="text-align: center;">${drvcomplaindistribute.distri_peo}</td>
	        <td style="text-align: center;">投诉受理</td>
	        <td style="text-align: center;">${drvcomplaindistribute.distri_idea}</td>
	      </tr>
		<tr>
		<td style="text-align: left;" colspan="5">
		<strong>处理信息</strong>
		</td>
		</tr>
			<tr height="40">
								<td align="right">调查资料：</td>
								<td  style="text-align: left;" colspan="5">
							         <div class="box">
										<input type="text" name="compn" id="compn" class="file_textbox" />
										<a href="javascript:void(0);" class="upload_link">上传</a>
										<input type="file" multiple  class="uploadFile" name="surveyfile"  id="surveyfile" onchange="getFile(this,'compn')" />
									</div>         
								</td>
							</tr> 
				<tr><td style="text-align: right;">处理类型：</td>
				<td style="text-align: left;" colspan="4"> <select style="width:220px" name="dis_type" id="dis_type" >
				     <option value="请选择">请选择</option>
				     <option value="0">不做处理</option>
				      <option value="1">口头警告</option>  
				       <option value="2">培训教育</option>
				       <option value="3">退款</option>
				       <option value="4">转发行政处罚</option>    
				  </select></td></tr>
				  <tr>
			    <td style="text-align: right;">是否加入黑名单：</td>
			    <td style="text-align: left;" colspan="4"><input type="radio" name="blacklist" id="blacklist" value="" style="width:30px;height:px" onclick="avalue()" />加入黑名单 
			              <input type="radio" name="blacklist" id="blacklist" value="" style="width:30px;height:px" onclick="novalue()"/>不加入黑名单 </td>
			</tr>
			<tr>
			    <td style="text-align: right;">调查意见：</td>
			    <td style="text-align: left;" colspan="4"><textarea name="survey_idea" id="survey_idea" style="width:220px;height:80px;" ></textarea></td>
			</tr>
			<tr>
			    <td style="text-align: right;">处理意见：</td>
			    <td style="text-align: left;" colspan="4"><textarea name="dis_idea" id="dis_idea"  style="width:220px;height:80px;"></textarea>
			     <c:if test="${drvcomplaintinfo.compn_state=='6'}">
			      <input type="hidden" id="disidea" name="disidea" value="${drvcomplaindispose.dis_idea}"/>       
			       </c:if>
			    
			    </td>
			</tr>
			<tr>
				<td  style="text-align: center; padding-top: 20px;" colspan="5">
					<a class="btn btn-mini btn-primary" onclick="save();">提交</a>&nbsp;&nbsp;&nbsp;
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