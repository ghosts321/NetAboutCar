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
		<td style="text-align: left;" colspan="5"><strong>投诉人基本信息</strong></td>
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
				<td colspan="2">${drvcomplaintinfo.compn_number}</td>	
			</tr>
			<tr>
			    <td style="text-align: right;">电子邮件：</td>
				<td style="text-align: left;" colspan="4" >${drvcomplaintinfo.compn_email}</td>
			</tr>
			 <tr>  <td style="text-align: right;">现住地址：</td>
				<td  style="text-align: left;" colspan="4" >${drvcomplaintinfo.compn_address}</td></tr>
				<tr>
				<td style="text-align: left;" colspan="5"><strong>投诉信息</strong></td>
				</tr>
				<tr>
			    <td style="text-align: right;">驾驶员姓名：</td>
				<td>${drvcomplaintinfo.driver_name}</td>
				<td style="text-align: right;" >车牌号：</td>
				<td colspan="2">${drvcomplaintinfo.car_number}</td>	
			</tr>
			<tr> <td style="text-align: right;">驾驶证号码:</td>
				<td colspan="4">${drvcomplaintinfo.driver_licence}
				</td></tr>
				<tr> <td style="text-align: right;">网约车所属平台:</td>
				<td colspan="4">${drvcomplaintinfo.car_company}
				     <input type="hidden" id="complain_code" name="complain_code" value="${drvcomplaintinfo.complain_code}"/>
				      <input type="hidden" id="complain_info_id" name="complain_info_id" value="${drvcomplaintinfo.drv_complain_info_id}"/>
				</td></tr>
				<c:if test="${drvcomplaintinfo.compn_file!=null&& drvcomplaintinfo.compn_file!=''}">
				 <tr height="40">
								<td align="right">投诉文件：</td>
								<td align="left" colspan="4">
							         <div class="box">
										<a href="${drvcomplaintinfo.compn_file}">点击下载</a>
									</div>         
								</td>
							</tr> 
							</c:if>
							<tr>
			    <td style="text-align: right;">投诉内容：</td>
			    <td style="text-align: left;" colspan="4">${drvcomplaintinfo.compn_reason}</td>
			</tr>
		     <c:if test="${drvcomplaintinfo.compn_state=='3' || drvcomplaintinfo.compn_state=='5' || drvcomplaintinfo.compn_state=='6' || drvcomplaintinfo.compn_state=='7'
		                   || drvcomplaintinfo.compn_state=='8' || drvcomplaintinfo.compn_state=='4' }">
		      <tr>
				<td style="text-align: left;" colspan="5"><strong>受理信息</strong></td>
				</tr>
                <tr>
                  <td style="text-align: right;">受理分派部门</td>
                  <td  style="text-align: left;" colspan="4" >${drvcomplaindistribute.allot_depme}</td>
                </tr>
                <tr>
			    <td style="text-align: right;">受理意见：</td>
			    <td style="text-align: left;" colspan="4">${drvcomplaindistribute.distri_idea}</td>
			</tr>
		      </c:if>
		      <c:if test="${drvcomplaintinfo.compn_state=='4' || drvcomplaintinfo.compn_state=='5' || drvcomplaintinfo.compn_state=='6' || drvcomplaintinfo.compn_state=='7'
		                    || drvcomplaintinfo.compn_state=='8'}">
		           <tr>
		         <td style="text-align:left;" colspan="5"><strong>处理信息</strong></td>
			</tr>
			<c:if test="${drvcomplaindispose.survey_file!=null&& drvcomplaindispose.survey_file!=''}">
				<tr>
			    <td style="text-align:right;">调查文件下载</td>
			    <td align="left" colspan="4">
							         <div class="box">
										<a href="${drvcomplaindispose.survey_file}">点击下载</a>
									</div>         
								</td>
			   </tr>
			   </c:if>
			 <tr><td style="text-align: right;">处理类型：</td>
				<td colspan="4" style="text-align:left;">
				   <c:if test="${drvcomplaindispose.dis_type=='0'}">不做处理</c:if> 
				       <c:if test="${drvcomplaindispose.dis_type=='1'}">口头警告</c:if>
				       <c:if test="${drvcomplaindispose.dis_type=='2'}">培训教育</c:if>
				       <c:if test="${drvcomplaindispose.dis_type=='3'}">退款</c:if>
				       <c:if test="${drvcomplaindispose.dis_type=='4'}">转发行政处罚</c:if>
			      </td>
			    </tr>
				<tr>
				<td style="text-align: right;">是否加入黑名单</td>
				<td colspan="4" style="text-align:left;">
				<c:if test="${drvcomplaindispose.is_blacklist=='0'}">不加入黑名单</c:if> 
				       <c:if test="${drvcomplaindispose.is_blacklist=='1'}">加入黑名单</c:if>
				</td>
				</tr>
				   <tr>
			    <td style="text-align: right;">调查意见：</td>
			    <td style="text-align: left;" colspan="4">${drvcomplaindispose.survey_idea}</td>
			</tr>
		      </c:if>
		      
		       <tr>
		      <td style="text-align:left;" colspan="5"><strong>处理历史</strong></td>
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
		      <c:if test="${drvcomplaintinfo.compn_state=='3' || drvcomplaintinfo.compn_state=='4'|| drvcomplaintinfo.compn_state=='8'}">
		      <tr>
	             <td style="text-align: center;">${drvcomplaindistribute.distri_time}</td>
	             <td style="text-align: center;">受理部门</td>
	             <td style="text-align: center;">${drvcomplaindistribute.distri_peo}</td>
	             <td style="text-align: center;">投诉受理</td>
	             <td style="text-align: center;">${drvcomplaindistribute.distri_idea}</td>
	         </tr>
		      </c:if>
		      <c:if test="${ drvcomplaintinfo.compn_state=='4'|| drvcomplaintinfo.compn_state=='8'}">
		      <tr>
	             <td style="text-align: center;">${drvcomplaindispose.idea_time}</td>
	             <td style="text-align: center;">处理部门</td>
	             <td style="text-align: center;">${drvcomplaindispose.idea_peo}</td>
	             <td style="text-align: center;">投诉处理</td>
	             <td style="text-align: center;">${drvcomplaindispose.dis_idea}</td>
	         </tr>		      
		      </c:if>
		      
		      <c:if test="${drvcomplaintinfo.compn_state=='5'||drvcomplaintinfo.compn_state=='6' || drvcomplaintinfo.compn_state=='7'}">
                   <tr>
		<td style="text-align: left;" colspan="5"><strong>申诉信息</strong></td>
		    </tr>
		    <c:if test="${drvcomplainappeal.appeal_file!=null&& drvcomplainappeal.appeal_file!=''}">
		           <tr>
                  <td style="text-align: right;">申诉文件下载</td>
                  <td align="left" colspan="4">
					  <div class="box">
					<a href="${drvcomplainappeal.appeal_file}">点击下载</a>
					</div>         
					</td>
                  </tr>
                  </c:if>
                <tr>
			    <td style="text-align: right;">申诉内容：</td>
			    <td style="text-align: left;" colspan="4">${drvcomplainappeal.appl_content}</td>
			</tr>
			        <c:if test="${drvcomplaintinfo.compn_state=='7'}">
		          <tr>
			    <td style="text-align: right;">申诉结果：</td>
			    <td style="text-align: left;" colspan="4">
			         <c:if test="${drvcomplainappeal.appl_dis_result=='0'}">申诉不通过</c:if>
			         <c:if test="${drvcomplainappeal.appl_dis_result=='1'}">申诉通过</c:if>
			    </td>
			    </tr>      
                  </c:if>
		       </c:if>
		      <c:if test="${drvcomplaintinfo.compn_state=='8'}"> 
		           <c:if test="${drvcomplaindispose.appl_idea_peo!=null}">
		              <tr>
		           <td style="text-align: left;" colspan="5"><strong>申诉信息</strong></td>
		                </tr>
		            <c:if test="${drvcomplainappeal.appeal_file!=null&& drvcomplainappeal.appeal_file!=''}">
		           <tr>
                  <td style="text-align: right;">申诉文件下载</td>
                  <td align="left" colspan="4">
					  <div class="box">
					<a href="${drvcomplainappeal.appeal_file}">点击下载</a>
					</div>         
					</td>
                  </tr>
                  </c:if>
                <tr>
			    <td style="text-align: right;">申诉内容：</td>
			    <td style="text-align: left;" colspan="4">${drvcomplainappeal.appl_content}</td>
			</tr>
			        
		          <tr>
			    <td style="text-align: right;">申诉结果：</td>
			    <td style="text-align: left;" colspan="4">
			         <c:if test="${comcomplainappeal.appl_dis_result=='0'}">申诉不通过</c:if>
			         <c:if test="${comcomplainappeal.appl_dis_result=='1'}">申诉通过</c:if>
			    </td>
			    </tr>      
                 
		           
		           </c:if>
		      </c:if>
			<tr>
				<td  style="text-align: center; padding-top: 20px;" colspan="5">
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