<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="${basePath}css/userReg.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}css/calendar.css">
		<link rel="stylesheet" type="text/css" href="${basePath}css/jquery.selectlist.css"/>
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidator_min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidatorRegex.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery-ui-1.10.4.custom.min.js"></script>
		<script type="text/javascript" src="${basePath}js/calendar.js"></script> 
		<script type="text/javascript" src="${basePath}js/jquery.selectlist.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery.form.js"></script>
		<title>处分申诉</title>
		<script type="text/javascript">
			$(document).ready(function(){
				$.formValidator.initConfig({formid:"form1",debug:false,submitonce:true,
					onerror:function(msg,obj,errorlist){
						//$.map(errorlist,function(msg1){alert(msg1)});
						//alert(msg);
					},
					onsuccess:function(){
						$("#form1").ajaxSubmit({
							type:'post',
							url:'${basePath}terrace/addPunishAppeal.action',
							success:function(data){
		                    	if(data == "success"){
		                    		alert("申诉成功！");
		                    		$("#main").load("${basePath}terrace/openPunishInfo.action", function(){});
								}
		                    }
		                });
						return false;
					}
				}),
				$("#appeal_text").formValidator({onshow:"不能为空",onfocus:"不能为空",oncorrect:"输入正确"}).inputValidator({min: 1});
			});
			
			function getFile(obj){
				var file_name = $(obj).val();
				var houzhui=file_name.split(".");
				var last=houzhui[houzhui.length-1];
				var tp ="zip,rar";
				var rs=tp.indexOf(last);
				
				//如果返回的结果大于或等于0，说明包含允许上传的文件类型
				if(rs>=0){
					 $("input[name='appealFileText']").val(file_name);
					 return true;
				}else{
					 alert("只能上传rar或者zip格式的压缩文件！");
					 $("input[name='appealFileText']").val("");
					 return false;
				}
			}
		</script>
	</head>
	<body>
		<div class="buss_area">
			<div class="personalmenu">
				<jsp:include page="/WEB-INF/jsp/driver/personalMenu.jsp">
					<jsp:param name="leftmenu" value="platForm7"/>
				</jsp:include>
			</div>
			<div id="workarea" class="workarea">
				<div class="title_area">
					<div class="title">处分申诉申请</div>
				</div>
				<div>
					<form action="${basePath}terrace/addPunishAppeal.action" method="post" name="form1" id="form1">
						<table width="100%" border="0" cellpadding="5" cellspacing="2">
							<tr height="40">
								<td width="38%" align="right">申诉平台名称：</td>
								<td width="30%" align="left">
									<input class="reg_input" size="25" name="comName" id="comName" type="text" value="${comName}" readonly />
								</td>
								<td align="left">
									<span id="nameTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">统一社会信用代码：</td>
								<td align="left">
									<input class="reg_input" size="25" name="creditcode" id="creditcode" type="text"  value="${creditcode}" readonly/>
								</td>
								<td align="left">
									<span id="driveCardTip"	class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">违反指标细则：</td>
								<td align="left">
									<input class="reg_input" size="25" name="indic_text" id="indic_text" type="text"  value="${indic_text}" readonly/>
								</td>
								<td align="left">
									<span id="driveCardTip"	class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">申诉内容：</td>
								<td colspan="2" align="left">
									<textarea class="reg_textarea" cols="27" rows="3" name="appeal_text" id="appeal_text" ></textarea>
								</td>
								<td align="left">
									<span id="appeal_textTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td style="text-align: right;">申诉材料：</td>
								<td align="left" colspan="3"><div class="box">
										<input type="text" name="appealFileText" id="appealFileText" class="file_textbox" width="180px"/>
										<a href="javascript:void(0);" class="upload_link">浏览</a>
										<input type="file" class="uploadFile" name="appealFile" id="appealFile"  onchange="getFile(this)" />
									</div>
									<span id="appealFileTip" class="onshow"></span>
								</td>
							</tr>
							<tr>
								<td align="center" colspan="4">
									<input name="rec_no" id="rec_no" type="hidden" value="${rec_no}"/>
									<input id="confirm" name="button" type="submit" value="确认办理" class="button3" />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>