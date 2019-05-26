<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link rel="stylesheet" href="${basePath}css/userReg.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}css/calendar.css">
		<link rel="stylesheet" type="text/css" href="${basePath}css/jquery.selectlist.css"/>
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidator_min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidatorRegex.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery-ui-1.10.4.custom.min.js"></script>
		<script type="text/javascript" src="${basePath}js/calendar.js"></script> 
		<script type="text/javascript" src="${basePath}js/jquery.selectlist.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery.form.js"></script>
		<title>备案管理</title>

		<script type="text/javascript">
			$(function(){
				$("select").selectlist({
					zIndex: 10,
					width: 230,
					height: 25
				});
				$('#dd').calendar({
				    trigger: '#startDate',
				    zIndex: 999,
					format: 'yyyy-mm-dd',
					date: new Date(),
				    onSelected: function (view, date, data) {
				        console.log('event: onSelected');
				    },
				    onClose: function (view, date, data) {
				        console.log('event: onClose');
				        console.log('view:' + view);
				        console.log('date:' + date);
				        console.log('data:' + (data || 'None'));
				        $("#startDate").formValidator({onshow: "请选择时间",onfocus: "请选择时间"}).functionValidator({fun:isDate}).defaultPassed();;
				    }
				});
				$('#dd2').calendar({
				    trigger: '#endDate',
				    zIndex: 999,
					format: 'yyyy-mm-dd',
					date: new Date(),
				    onSelected: function (view, date, data) {
				        console.log('event: onSelected');
				    },
				    onClose: function (view, date, data) {
				        console.log('event: onClose');
				        console.log('view:' + view);
				        console.log('date:' + date);
				        console.log('data:' + (data || 'None'));
				        $("#endDate").formValidator({onshow: "请选择时间",onfocus: "请选择时间"}).functionValidator({fun:isDate}).defaultPassed();;
				    }
				});
			});
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
					 alert("只能上传doc或者docx格式的文件！");
					 $("input[name='"+inputName+"']").val("");
					 return false;
				}
			}
			
			$(document).ready(function(){
				$.formValidator.initConfig({formid:"form1",debug:false,submitonce:true,
					onerror:function(msg,obj,errorlist){
						//$.map(errorlist,function(msg1){alert(msg1)});
						alert(msg);
					},
					onsuccess:function(){
					$("#form1").ajaxSubmit({
	                    type:'post',
	                    url:'${basePath}terrace/toHandleComit.action',
	                    cache:false,
	                    success:function(data){
	                    	if(data == "success"){
	                    	alert("处理成功");
	                    		$("#main").load("${basePath}terrace/openComplainInfo.action", function() {});
							}else if(data=="error"){
								alert("处理失败!");
							}
	                    }
	                });
					return false;
				 }
				});
				//$("#certno").formValidator({onshow:"15或18位的身份证",onfocus:"15或18位的身份证",oncorrect:"输入正确"}).functionValidator({fun:isCardID});
				$("#certno").formValidator({ajax:true,onshow:"请输入15或18位身份证号码",onfocus:"请输入15或18位身份证号码",oncorrect:"输入正确"}).functionValidator({fun:isCardID})
			       .ajaxValidator({
			         dataType: "text",
			         async: true,
			         url: "${basePath}terrace/drivervalidate.action",
			         success: function (data) {
			           if (data == "1") { return true; }
			           else { alert(data);return false; }
			         },
			         buttons: $("#button"),
			         error: function (jqXHR, textStatus, errorThrown) { alert("服务器没有返回数据，可能服务器忙，请重试" + errorThrown); },
			         onerror: "驾驶员信息验证不通过",
			         onwait: "正在对驾驶员进行合法性校验，请稍候..."
			       });  //这里添加defaultPassed()的话，则默认验证通过。
				$("#is_blacklist").formValidator({onfocus:"是否加入黑名单"}).inputValidator({min:1,onerror:"请选择是否加入黑名单"});
				$("#startDate").formValidator({onshow: "请选择时间",onfocus: "请选择时间"}).functionValidator({fun:isDate});
				$("#endDate").formValidator({onshow: "请选择时间",onfocus: "请选择时间"}).functionValidator({fun:isDate});
			});
			//禁止输入空格键
			function banInputSapce(e){
				var keynum;
				if(window.event) { // IE
				  keynum = e.keyCode;
				} else if(e.which) { // Netscape/Firefox/Opera
				  keynum = e.which;
				}
				if(keynum == 32){
				  return false;
				}
				  return true;
			}
		</script>	
<style type="text/css">
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
}
.table tr.alter{
background-color:#f5fafe;
}
			.table_main {
				width: 100%;
				border-collapse: collapse;
				border: 0px none;
				margin: auto;
			}
			
			.table_main tr {
				height: 38px;
				color: #363636;
			}
			
			.table_main th {
				color: #ffffff;
				font-weight: normal;
				background-color: #9370db;
				border: 1px solid #9370db !important;
			}
			
			.table_main td {
				border: 1px solid #cccccb !important;
				padding: 3px;
				color: #464646;
			}
	
	
	
		</style>		
	</head>
	<body>
		<div class="buss_area">
			<div class="personalmenu">
				<jsp:include page="/WEB-INF/jsp/driver/personalMenu.jsp">
					<jsp:param name="leftmenu" value="platForm2"/>
				</jsp:include>
			</div>
			<div id="workarea" class="workarea">
				<div class="title_area">
					<div class="title">驾驶员投诉处理
					</div>
				</div>
				<div>
					<form   method="post" name="form1" id="form1" enctype="multipart/form-data">
						<table width="100%" border="1" class="table" >
							<tr height="40">
								<td width="28%" align="left" colspan="4">投诉人基本信息：</td>
							</tr>
							<tr>
								<td align="right" >姓名：</td>
			                    <td>${drvcomplaintinfo.compn_name}</td>	
			                    <td  align="right">性别：</td>
				                <td>  <c:if test="${drvcomplaintinfo.compn_sex=='1'}">男</c:if> 
				                 <c:if test="${drvcomplaintinfo.compn_sex=='2'}">女</c:if>
				                 </td>
							</tr>
							<tr>
							  <td align="right">手机号：</td>
				              <td>${drvcomplaintinfo.compn_tel}</td>
				              <td align="right">投诉来源：</td>
				            <td align="left">  
				            <c:choose>
				             <c:when test="${drvcomplaintinfo.data_source=='1'}">电话热线</c:when>
				             <c:when test="${drvcomplaintinfo.data_source=='2'}">运营平台</c:when>
				             <c:when test="${drvcomplaintinfo.data_source=='3'}">公共服务平台</c:when>
				            </c:choose>
				                              无
				              </td>
							</tr>
							<tr>
							<td align="right" >身份证号：</td>
				            <td align="left" colspan="3">${drvcomplaintinfo.compn_number}</td>
							</tr>
							<tr>
			                <td align="right">电子邮件：</td>
				            <td align="left" colspan="3">${drvcomplaintinfo.compn_email}</td>
			                </tr>
			                <tr>  <td align="right">现住地址：</td>
				                  <td align="left" colspan="3">${drvcomplaintinfo.compn_address}</td></tr>
				             <tr>
				             <td width="15%" align="left" colspan="4">被投诉驾驶员信息</td>
				             </tr>
				             <tr> 
				              <td align="right">车牌号：</td>
				              <td align="left" >${drvcomplaintinfo.car_number}
				              <input type="hidden" id="car_number" name="car_number" value="${drvcomplaintinfo.car_number}"/>
				              </td>
				              <td align="right">驾驶证号码：</td>
				             <td align="left">${drvcomplaintinfo.driver_licence}
				             </td>
				             </tr>
				             <tr>
				             <td align="right">网约车所属平台名称：</td>
				              <td align="left" colspan="3">${drvcomplaintinfo.car_company}
				              <input type="hidden" id="complain_code" name="complain_code" value="${drvcomplaintinfo.complain_code}"/>
				              <input type="hidden" id="drv_complain_info_id" name="drv_complain_info_id" value="${drvcomplaintinfo.drv_complain_info_id}"/>
				              <input type="hidden" id="driver_licence" name="driver_licence" value="${drvcomplaintinfo.driver_licence}"/>
				              <input type="hidden" id="driver_name" name="driver_name" value="${drvcomplaintinfo.driver_name}"/>
				              <input type="hidden" id="compn_state" name="compn_state" value="${drvcomplaintinfo.compn_state}"/>
				              <input type="hidden" id="car_company" name="car_company" value="${drvcomplaintinfo.car_company}"/>
				              </td>
				             </tr>
				             <c:if test="${drvcomplaintinfo.compn_file!=null && drvcomplaintinfo.compn_file!=''}">
				             <tr>
				              <td align="right">投诉文件：</td>
								<td align="left" colspan="3"><a href="${drvcomplaintinfo.compn_file}">点击下载</a></td>
				             </tr>
				             </c:if>
				             <tr>
			                <td align="right">投诉内容：</td>
			                 <td align="left" colspan="3">${drvcomplaintinfo.compn_reason}
			                 <input type="hidden" id="compn_reason" name="compn_reason" value="${drvcomplaintinfo.compn_reason}"/>
			                 <input type="hidden" id="compn_time" name="compn_time" value="${drvcomplaintinfo.compn_time}"/>
			                 </td>
			                   </tr>
			                   <tr>
			                   <td width="15%" align="left" colspan="4">处理信息</td>
			                   </tr>
			                   <tr height="40">
								<td align="right">调查资料：</td>
								<td  style="text-align: left;" colspan="3">
							         <div class="box">
										<input type="text" name="compn" id="compn" class="file_textbox" />
										<a href="javascript:void(0);" class="upload_link">上传</a>
										<input type="file" multiple  class="uploadFile" name="surveyfile"  id="surveyfile" onchange="getFile(this,'compn')" />
									</div>         
								</td>
							</tr>     
							<tr height="40">
								<td align="right">处理类型：</td>
								<td align="left" colspan="3">
									<select name="dis_type" id="dis_type" >
				                     <option value="0">不做处理</option>
				                      <option value="1">口头警告</option>  
				                       <option value="2">培训教育</option>
				                      <option value="3">退款</option>
				                     <option value="4">转发行政处罚</option>    
				                       </select>
								</td>
							</tr>
					       <tr>
			               <td align="right" >是否加入黑名单：</td>
			              <td align="left" colspan="3"><input type="radio" name="is_blacklist" id="is_blacklist" value="1" style="width:30px;height:px" />加入黑名单 
			              <input type="radio" name="is_blacklist" id="is_blacklist" value="0" style="width:30px;height:px"/>不加入黑名单 </td>
			              </tr>
			              <tr>
			    <td align="right">调查意见：</td>
			    <td align="left" colspan="3"><textarea name="survey_idea" id="survey_idea" style="width:200px;height:60px;" ></textarea></td>
			</tr>
			<tr>
			    <td align="right">处理意见：</td>
			    <td align="left" colspan="3"><textarea name="dis_idea" id="dis_idea"  style="width:200px;height:60px;"></textarea>
			      <c:if test="${drvcomplaintinfo.compn_state=='6'}">
			      <input type="hidden" id="disidea" name="disidea" value="${drvcomplaindispose.dis_idea}"/>       
			       </c:if>
			    </td>
			</tr>
	
							<!-- <tr height="40">
								<td align="right">上传合同：</td>
								<td colspan="2" align="left">
							         <div class="box">
										<input type="text" name="contractText" id="contractText" class="file_textbox" width="222px"/>
										<a href="javascript:void(0);" class="upload_link">浏览</a>
										<input type="file" class="uploadFile" name="contractFile" id="contractFile"  onchange="getFile(this,'contractText')" />
									</div>    
									<span id="contractFileTip" class="onshow"></span>     
								</td>
							</tr> -->
							<tr>
							
								<td align="center"  colspan="4">
									
								</td>
							</tr>
						</table>
						<div class="form_button_area">
							<center>
				  		<input  id="button" name="button" type="submit" value="处理" class="button3" align="center"/>
							</center>
						</div>	
					</form>
				</div>
			</div>
		</div>
	</body>
</html>