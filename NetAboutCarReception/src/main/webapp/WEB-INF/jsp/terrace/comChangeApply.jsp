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
<script type="text/javascript" src="${basePath}js/jquery.tips.js"></script>
<title>平台许可申请</title>
<style type="text/css">
	.table{
	border:1px solid #cad9ea;
	color:#666;
	margin-bottom: 10px;
	margin-top: 10px;
	}
	.table th {
	background-repeat:repeat-x;
	height:30px;
	font-size:15px;
	}
	.table td,.table th{
	border:1px solid #cad9ea;
	padding:0 0.5em 0;
	}
	.table tr.alter{
	background-color:#f5fafe;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#baseinfo").show();
		$("#applyinfo").hide();
		var instInfoHtml="<select id='instId' name='instId'>";
		//机构下拉框赋值
		$.ajax({
            type: "post",
            url: "${basePath}vehicle/findAllInstInfo.action",
            success: function (data) {
            	var codeJson = eval(data);
        		if(codeJson != null){
        			for(var i=0;i<codeJson.length;i++){
        				instInfoHtml += "<option value='"+codeJson[i].instId+"'>"+codeJson[i].instName+"</option>";
        			}
        			instInfoHtml+="</select>";
					$("#instInfo").html(instInfoHtml);
					$("select").selectlist({
						enable: false,
						zIndex: 10,
						width: 230,
						height: 25
					});
        		}
            }
        });
		$.formValidator.initConfig({formid:"form1",debug:false,submitonce:true,
			onerror:function(msg,obj,errorlist){
				//$.map(errorlist,function(msg1){alert(msg1)});
				alert(msg);
			},
			onsuccess:function(){
				$("#form1").ajaxSubmit({
                    type:'post',
                    url:'${basePath}terrace/addChangeApply.action',
                    success:function(data){
                    	if(data == "success"){
                    		$("#main").load("${basePath}terrace/openProgress.action?applyType=2&appstatus=0", function() {});
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
		
		$("#comName").formValidator({onshow:"请输入企业名称",onfocus:"请输入企业名称"}).inputValidator({min:1,onerror:"请输入企业名称"});
		$("#platformName").formValidator({onshow:"请输入网约车平台名称",onfocus:"请输入网约车平台名称"}).inputValidator({min:1,onerror:"请输入网约车平台名称"});
		$("#busiliceNo").formValidator({onshow:"请输入企业营业执照号",onfocus:"请输入企业营业执照号"}).inputValidator({min:1,onerror:"请输入企业营业执照号"});
		$("#regAddress").formValidator({onshow:"请输入注册地址",onfocus:"请输入注册地址"}).inputValidator({min:1,onerror:"请输入注册地址"});
		$("#busiAddress").formValidator({onshow:"请输入经营地址",onfocus:"请输入经营地址"}).inputValidator({min:1,onerror:"请输入经营地址"});
		$("#postAddress").formValidator({onshow:"请输入通信地址",onfocus:"请输入通信地址"}).inputValidator({min:1,onerror:"请输入通信地址"});
		$("#corpName").formValidator({onshow:"请输入法人姓名",onfocus:"请输入法人姓名"}).functionValidator({fun:isChinese}); 
		
		$("#corpcertNo").formValidator({onshow:"请输入法人证件号码",onfocus:"请输入法人证件号码"}).functionValidator({fun:isCardNo});
		$("#corpTelNo").formValidator({onshow:"请输入法人电话",onfocus:"请输入法人电话"}).functionValidator({fun:isPhoneNumber});
		//$("#prinName").formValidator({onshow:"请输入负责人姓名",onfocus:"请输入负责人姓名"}).functionValidator({fun:isChinese});
		//$("#printelNo").formValidator({onshow:"请输入负责人电话",onfocus:"请输入负责人电话"}).functionValidator({fun:isPhoneNumber});
		
		$("#applyCompany").formValidator({onshow:"请输入公司全名",onfocus:"请输入公司全名"}).inputValidator({min:1,onerror:"请输入公司全名"});
		$("#address").formValidator({onshow:"请输入通信地址",onfocus:"请输入通信地址"}).inputValidator({min:1,onerror:"请输入通信地址"});
		$("#zipCode").formValidator({onshow:"请输入邮编",onfocus:"请输入邮编"}).functionValidator({fun:isPosInt});
		$("#tel").formValidator({onshow:"请输入电话号码",onfocus:"请输入电话号码"}).functionValidator({fun:isPhoneNumber});
		$("#mobile").formValidator({onshow:"请输入手机号码",onfocus:"请输入手机号码"}).functionValidator({fun:isPhoneNumber});
		$("#email").formValidator({onshow:"请输入邮箱",onfocus:"请输入邮箱"}).functionValidator({fun:isEmail});
		if("" == $("input[name='annexText']").val()){
	    	$("#annexFile").formValidator({onshow:"请选择附件"}).inputValidator({min:1,onerror:"请选择附件"});	
	    }
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
	
	function nextStep(){
		$("#baseinfo").hide();
		$("#applyinfo").show();	
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
				<div class="title">平台资质业务变更申请</div>
			</div>
			<div>
				<form action="" method="post" name="form1" id="form1" enctype="multipart/form-data" onsubmit="return checkform();">
					<div id="baseinfo">
						<table class="table" width="100%" cellpadding="5" cellspacing="2">
							<tr height="40">
								<th colspan="4" align="left">
									平台基本信息
								</th>
							</tr>
							<tr style="display: none;">
								<th style="text-align: right;">企业申请编码</th>
								<td align="left">
									<input class="reg_input" size="25" name="applyId" value="${platformApply.applyId}" id="applyId" type="text" readonly/>
									<input class="reg_input" size="25" value="<%=session.getAttribute("areaCode") %>" name="areaCode" id="areaCode" type="hidden" />
								</td>
							</tr>
							<tr style="display: none;">
								<th style="text-align: right;">统一社会信用代码</th>
								<td>
									<input class="reg_input" size="25" name="creditCode" id="creditCode" value="<%=session.getAttribute("userName") %>" type="text" readonly="readonly" />
								</td>
							</tr>
							<tr height="40">
								<td width="20%" align="right">企业名称</td>
								<td align="left" width="30%" colspan="3">
									<input class="reg_input" size="25" name="comName" value="${platform.comName }" id="comName" type="text" maxlength="18"/>
								<span id="comNameTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">网约车平台名称</td>
								<td align="left" colspan="3">
									<input class="reg_input" size="25" name="platformName" value="${platform.platformName }" id="platformName" type="text" maxlength="18"/>
									<span id="platformNameTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">企业营业执照号</td>
								<td align="left" colspan="3">
									<input class="reg_input" size="25" name="busiliceNo" maxlength="15" id="busiliceNo" type="text" value="${platform.busiliceNo }"/>
									<span id="busiliceNoTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td style="text-align: right;" width="20%">企业简称</td>
								<td align="left" width="30%">
									<input class="reg_input" size="25" name="shortName" value="${platform.shortName }" id="shortName" type="text" maxlength="6"/>
								</td>
								<td align="right" width="20%">联系电话</td>
								<td align="left">
									<input class="reg_input" size="25" name="contactsTel" value="${platform.contactsTel }" id="contactsTel" type="text" maxlength="11"/>
								</td>
							</tr>
							<tr height="40">
								<td align="right">注册地址</td>
								<td align="left" colspan="3">
									<textarea class="reg_textarea" rows="2" cols="45" name="regAddress" id="regAddress" >${platform.regAddress }</textarea>
									<span id="regAddressTip" class="onshow"></span>
								</td>
							</tr>
							<tr heignt="40">
							    <td align="right">经营地址</td>
								<td align="left" colspan="3">
									<textarea class="reg_textarea" cols="45" rows="2" name="busiAddress" id="busiAddress" >${platform.busiAddress }</textarea>
									<span id="busiAddressTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
							    <td align="right">通信地址</td>
								<td align="left" colspan="3">
									<textarea class="reg_textarea" cols="45" rows="2" name="postAddress" id="postAddress" >${platform.postAddress }</textarea>
									<span id="postAddressTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">法人代表姓名</td>
								<td align="left" colspan="3">
									<input class="reg_input" size="25" name="corpName" value="${platform.corpName }" id="corpName" type="text" maxlength="8"/>
									<span id="corpNameTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
							    <td align="right">法人证件号码</td>
								<td align="left" colspan="3">
									<input class="reg_input" size="25" name="corpcertNo" value="${platform.corpcertNo }" id="corpcertNo" type="text" maxlength="18"/>
									<span id="corpcertNoTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">法人电话</td>
								<td align="left" colspan="3">
									<input class="reg_input" size="25" name="corpTelNo" value="${platform.corpTelNo }" id="corpTelNo" type="text" maxlength="11"/>
									<span id="corpTelNoTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
							    <td align="right">公司负责人</td>
								<td align="left">
									<input class="reg_input" size="25" name="prinName" value="${platform.prinName }" id="prinName" type="text" maxlength="8"/>
								</td>
								<td align="right">负责人电话</td>
								<td align="left" >
									<input class="reg_input" size="25" name="printelNo" value="${platform.printelNo }" id="printelNo" type="text" maxlength="11"/>
								</td>
							</tr>
						</table>
						<div class="form_button_area">
							<input id="nextstep" name="button" type="button" value="下一步" class="button3" onclick="nextStep();"/>
						</div>
					</div>
					<div id="applyinfo">
						<table class="table">
							<tr height="40">
						    	<th colspan="4" align="left">
						     		平台申请信息
						     	</th>
						    </tr>
							<tr height="40">
								<td width="20%" style="text-align: right;">公司全名</td>
								<td colspan="3" width="30%" align="left">
									<input class="reg_input" size="25" name="applyCompany" value="${platformApply.applyCompany }" id="applyCompany" type="text" maxlength="18"/>
									<span id="applyCompanyTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
							    <td width="20%" style="text-align: right;">负责人姓名</td>
								<td width="30%" align="left">
									<input class="reg_input" size="25" name="dutyName" value="${platformApply.dutyName }" id="dutyName" type="text" />
								</td>
								<td width="20%" style="text-align: right;">经办人姓名</td>
								<td width="30%" align="left">
									<input class="reg_input" size="25" name="handleName" value="${platformApply.handleName }" id="handleName" type="text" />
								</td>	
							</tr>
							<tr height="40">
							    <td style="text-align: right;">通信地址</td>
								<td align="left" colspan="3"><textarea class="reg_textarea" cols="45" rows="2" name="address" id="address">${platformApply.address }</textarea>
									<span id="addressTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td style="text-align: right;">邮编</td>
								<td align="left" colspan="3">
									<input class="reg_input" size="25" name="zipCode" value="${platformApply.zipCode }" maxlength="6" id="zipCode" type="text" />
									<span id="zipCodeTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
							    <td style="text-align: right;">电话</td>
								<td align="left" colspan="3">
									<input class="reg_input" size="25" name="tel" value="${platformApply.tel }" id="tel" type="text" />
									<span id="telTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td style="text-align: right;">手机</td>
								<td align="left" colspan="3">
									<input class="reg_input" size="25" name="mobile" value="${platformApply.mobile }" id="mobile" type="text" />
									<span id="mobileTip" class="onshow"></span>
								</td>
							<tr height="40">
							    <td style="text-align: right;">电子邮箱</td>
								<td align="left" colspan="3">
									<input class="reg_input" size="25" name="email" value="${platformApply.email }" id="email" type="text" />
									<span id="emailTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td style="text-align: right;">申请机构</td>
								<td align="left" colspan="3">
									<span id="instInfo"></span>
								</td>
							</tr>
							<tr height="40">
								<td style="text-align: right;">附件</td>
								<td align="left" colspan="3"><div class="box">
										<input type="text" name="annexText" id="annexText" class="file_textbox" width="180px"/>
										<a href="javascript:void(0);" class="upload_link">浏览</a>
										<input type="file" class="uploadFile" name="annexFile" id="annexFile"  onchange="getFile(this,'annexText')" />
									    <input type="hidden" name="appStatus" value="0">
									</div>
									<span id="annexFileTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
							<td style="text-align: right;">备注</td>
								<td align="left" colspan="3"><textarea class="reg_textarea" cols="45" rows="2" name="remark" id="remark" >${platformApply.remark }</textarea></td>
							</tr>
						</table>
						<div class="form_button_area">
						    <input id="laststep" type="button" value="上一步" class="button3" onclick="javascript:$('#baseinfo').show();$('#applyinfo').hide();"/>&nbsp;&nbsp;&nbsp;
							<input id="save" type="submit" value="确认办理" class="button3"/>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>