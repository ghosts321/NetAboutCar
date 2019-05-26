<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${basePath}css/userReg.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}css/calendar.css">
		<link rel="stylesheet" type="text/css" href="${basePath}css/jquery.selectlist.css"/>
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidator_min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidatorRegex.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery-ui-1.10.4.custom.min.js"></script>
		<script type="text/javascript" src="${basePath}js/calendar.js"></script> 
		<script type="text/javascript" src="${basePath}js/jquery.selectlist.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery.form.js"></script>
		<title>平台许可申请修改</title>
		<style type="text/css">
			
		</style>
		<script type="text/javascript">
			$(function(){
				$("#driverYears").spinner({
					max:50,
					min:1,
					step:1
				});
				
				$('#dd').calendar({
				    trigger: '#dt',
				    zIndex: 999,
					format: 'yyyy-mm-dd',
				    onSelected: function (view, date, data) {
				        console.log('event: onSelected');
				    },
				    onClose: function (view, date, data) {
				        console.log('event: onClose');
				        console.log('view:' + view);
				        console.log('date:' + date);
				        console.log('data:' + (data || 'None'));
				    }
				});
			});
			
			function getFile(obj,inputName){
				var file_name = $(obj).val();
				
				
				var houzhui=file_name.split(".");
				
				var last=houzhui[houzhui.length-1];
				var tp ="zip,rar";
				var rs=tp.indexOf(last);
				
				//如果返回的结果大于或等于0，说明包含允许上传的文件类型
				if(rs>=0){
					 $("input[name='"+inputName+"']").val(file_name);
					 return true;
				}else{
					 alert("只能上传rar或者zip格式的压缩文件！");
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
		                    url:'${basePath}terrace/addPilotApply.action',
		                    success:function(data){
		                    	if(data == "success"){
		                    		$("#main").load("${basePath}terrace/openProgress.action", function() {});
								}else if(data == "error"){
									alert("申请失败！");
								}else if(data == "cunzai"){
									alert("你已经申请过了。");
								}
		                    }
		                });
						return false;
					 }
				});
				$("#comName").formValidator({onshow:"请输入企业名称",onfocus:"请输入企业名称"}).inputValidator({min:1,max:30,onerror:"格式有误"});
				$("#regAddress").formValidator({onshow:"请输入公司注册地",onfocus:"请输入公司注册地"}).inputValidator({min:1,max:50,onerror:"格式有误"});
				$("#platformName").formValidator({onshow:"请输入网约车平台名称",onfocus:"请输入网约车平台名称"}).inputValidator({min:1,max:20,onerror:"格式有误"});
				$("#busiliceNo").formValidator({onshow:"请输入企业营业执照",onfocus:"请输入企业营业执照"}).inputValidator({min:1,max:20,onerror:"格式有误"});
				$("#contactsTel").formValidator({onshow:"请输入联系电话",onfocus:"请输入联系电话"}).functionValidator({fun:isPhoneNumber});
				$("#corpName").formValidator({onshow:"请输入公司法人",onfocus:"请输入公司法人"}).inputValidator({min:1,max:10,onerror:"格式有误"});
				$("#corpcertNo").formValidator({onshow:"请输入法人证件号码",onfocus:"请输入法人证件号码"}).functionValidator({fun:isCardID});
				$("#corpTelNo").formValidator({onshow:"请输入法人电话",onfocus:"请输入法人电话"}).functionValidator({fun:isPhoneNumber});
				$("#printelNo").formValidator({onshow:"请输入负责人电话",onfocus:"请输入负责人电话"}).functionValidator({fun:isPhoneNumber});
				$("#applyCompany").formValidator({onshow:"请输入申请人名称",onfocus:"请输入申请人名称"}).inputValidator({min:1,max:30,onerror:"格式有误"});
				$("#dutyName").formValidator({onshow:"请输入负责人姓名",onfocus:"请输入负责人姓名"}).inputValidator({min:1,max:30,onerror:"格式有误"});
				$("#handleName").formValidator({onshow:"请输入经办人姓名",onfocus:"请输入经办人姓名"}).inputValidator({min:1,max:30,onerror:"格式有误"});
				
				
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
	</head>
	<body>
		<div class="buss_area">
			<div class="personalmenu">
				<jsp:include page="/WEB-INF/jsp/driver/personalMenu.jsp">
					<jsp:param name="leftmenu" value="platForm"/>
				</jsp:include>
			</div>
			<div id="workarea" class="workarea">
				<div class="title_area">
					<div class="title">平台资质业务许可申请
						<!-- <div class="help">
							<a class="guide" href="javascript:void(0);" target="_blank">操作指南</a>
							<a class="policy" href="javascript:void(0);" target="_blank">相关政策</a>
						</div> -->
					</div>
				</div>
				<div>
					<form action="${basePath}terrace/addPilotApply.action" method="post" name="form1" id="form1" enctype="multipart/form-data">
						<table width="100%" border="0" cellpadding="5" cellspacing="2">
							<tr height="40">
								<td width="28%" align="right">统一社会信用代码：</td>
								<td width="30%" align="left">
									<input class="reg_input" size="25" name="creditCode" id="creditCode" value="${platform.creditCode }" type="text" readonly="readonly" />
								</td>
								<td align="left">
									<span id="nameTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">企业名称：</td>
								<td align="left">
									<input class="reg_input" size="25" name="comName" value="${platform.comName }" id="comName" type="text" />
								</td>
								<td align="left">
									<span id="comNameTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">企业简称：</td>
								<td align="left">
									<input class="reg_input" size="25" name="shortName" value="${platform.shortName }" id="shortName" type="text" />
								</td>
								<td align="left">
									<span id="shortNameTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">公司注册地：</td>
								<td align="left">
								     <textarea class="reg_textarea" cols="28"  rows="2" name="regAddress" id="regAddress" >${platform.regAddress }</textarea>
								</td>
								<td align="left">
									<span id="regAddressTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">网约车平台名称：</td>
								<td align="left">
									<input class="reg_input" size="25" name="platformName" value="${platform.platformName }" id="platformName" type="text"/>
								</td>
								<td align="left">
									<span id="platformNameTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">企业营业执照：</td>
								<td align="left">
									<input class="reg_input" size="25" name="busiliceNo" value="${platform.busiliceNo }" id="busiliceNo" type="text" />
								</td>
								<td align="left">
									<span id="busiliceNoTip" class="onshow"></span>
								</td>
							</tr>
							<input class="reg_input" size="25" value="${platform.areaCode }" name="areaCode" id="areaCode" type="hidden" readonly="readonly"/>
							<tr height="40">
								<td align="right">经营地址：</td>
								<td align="left">
								       <textarea class="reg_textarea" cols="28"  rows="2" name="busiAddress" id="busiAddress" >${platform.busiAddress }</textarea>
								</td>
							</tr>
							<tr height="40">
								<td align="right">联系电话：</td>
								<td align="left">
									<input class="reg_input" size="25" name="contactsTel" value="${platform.contactsTel }" id="contactsTel" type="text" />
								</td>
								<td align="left">
									<span id="contactsTelTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">通信地址：</td>
								<td align="left">
								    <textarea class="reg_textarea" cols="28"  rows="2" name="postAddress" id="postAddress" >${platform.postAddress }</textarea>
								</td>
							</tr>
							<tr height="40">
								<td align="right">公司法人：</td>
								<td align="left">
									<input class="reg_input" size="25" name="corpName" value="${platform.corpName }" id="corpName" type="text" />
								</td>
								<td align="left">
									<span id="corpNameTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">法人证件号码：</td>
								<td align="left">
									<input class="reg_input" size="25" name="corpcertNo" value="${platform.corpcertNo }" id="corpcertNo" type="text" />
								</td>
								<td align="left">
									<span id="corpcertNoTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">法人电话：</td>
								<td align="left">
									<input class="reg_input" size="25" name="corpTelNo" value="${platform.corpTelNo }" id="corpTelNo" type="text" />
								</td>
								<td align="left">
									<span id="corpTelNoTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">公司负责人：</td>
								<td align="left">
									<input class="reg_input" size="25" name="prinName" value="${platform.prinName }" id="prinName" type="text" />
								</td>
								<td align="left">
									<span id="prinNameTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">负责人电话：</td>
								<td align="left">
									<input class="reg_input" size="25" name="printelNo" value="${platform.printelNo }" id="printelNo" type="text" />
								</td>
								<td align="left">
									<span id="printelNoTip" class="onshow"></span>
								</td>
							</tr>
							 	<tr height="40">
								<td align="right">企业申请编码：</td>
								<td align="left">
									<input class="reg_input" size="25" name="applyId" value="${platformApply.applyId }" id="applyId" type="text" />
								</td>
							</tr>
							</tr>
							 	<tr height="40">
								<td align="right">申请人名称（公司全名）：</td>
								<td align="left">
									<input class="reg_input" size="25" name="applyCompany" value="${platformApply.applyCompany }" id="applyCompany" type="text" />
								</td>
								<td align="left">
									<span id="applyCompanyTip" class="onshow"></span>
								</td>
							</tr>
							</tr>
							 	<tr height="40">
								<td align="right">负责人姓名：</td>
								<td align="left">
									<input class="reg_input" size="25" name="dutyName" value="${platformApply.dutyName }" id="dutyName" type="text" />
								</td>
								<td align="left">
									<span id="dutyNameTip" class="onshow"></span>
								</td>
							</tr>
							</tr>
							 	<tr height="40">
								<td align="right">经办人姓名：</td>
								<td align="left">
									<input class="reg_input" size="25" name="handleName" value="${platformApply.handleName }" id="handleName" type="text" />
								</td>
								<td align="left">
									<span id="handleNameTip" class="onshow"></span>
								</td>
							</tr>
							
							</tr>
							 	<tr height="40">
								<td align="right">通信地址：</td>
								<td align="left">
								   <textarea class="reg_textarea" cols="28"  rows="2" name="address" id="address" >${platformApply.address }</textarea>
								</td>
							</tr>
							
							</tr>
							 	<tr height="40">
								<td align="right">邮编：</td>
								<td align="left">
									<input class="reg_input" size="25" name="zipCode" value="${platformApply.zipCode }" id="zipCode" type="text" />
								</td>
							</tr>
							</tr>
							 	<tr height="40">
								<td align="right">电话：</td>
								<td align="left">
									<input class="reg_input" size="25" name="tel" value="${platformApply.tel }" id="tel" type="text" />
								</td>
							</tr>
							</tr>
							 	<tr height="40">
								<td align="right">手机：</td>
								<td align="left">
									<input class="reg_input" size="25" name="mobile" value="${platformApply.mobile }" id="mobile" type="text" />
								</td>
							</tr>
							
							</tr>
							 	<tr height="40">
								<td align="right">电子邮箱：</td>
								<td align="left">
									<input class="reg_input" size="25" name="email" value="${platformApply.email }" id="email" type="text" />
								</td>
							</tr>
							
							</tr>
							 	<tr height="40">
								<td align="right">备注：</td>
								<td colspan="2" align="left">
								  <textarea class="reg_textarea" cols="45"  rows="2" name="remark" id="remark" >${platformApply.remark }</textarea>
								</td>
							</tr>
							</tr>
							 	<tr height="40">
								<td align="right">附件：</td>
								
								<td colspan="2" align="left">
									<c:if test="${platformApply.annex==''}">
									  	无
									</c:if>
									<c:if test="${platformApply.annex!=''}">
									   <a href="${platformApply.annex }">点击下载</a>
									</c:if>
								</td>
							</tr>
							
							<tr height="40">
								<td align="right">附件：</td>
								<td colspan="2" align="left">
							         <div class="box">
										<input type="text" name="annexText" class="file_textbox" width="222px"/>
										<a href="javascript:void(0);" class="upload_link">浏览</a>
										<input type="file" class="uploadFile" name="annexFile"  onchange="getFile(this,'annexText')" />
									</div>         
								</td>
							</tr>
						</table>
						<div class="form_button_area">
						    <input type="hidden" name="appStatus" value="0">
							<input id="button" name="button" type="submit" value="确认办理" class="button3" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>