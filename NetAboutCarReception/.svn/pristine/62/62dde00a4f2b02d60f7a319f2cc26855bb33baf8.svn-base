<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<style type="text/css">
			
		</style>
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
		                    url:'${basePath}terrace/addRecord.action',
		                    success:function(data){
		                    	if(data == "success"){
		                    		alert("备案成功！");
		                    		$("#main").load("${basePath}terrace/openRecord.action", function() {});
								}else if(data == "error"){
									alert("备案失败！");
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
				$("#contractFile").formValidator({onshow:"请选择附件",onfocus:"请选择附件"}).inputValidator({min:1,onerror:"请选择附件"});
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
	</head>
	<body>
		<div class="buss_area">
			<div class="personalmenu">
				<jsp:include page="/WEB-INF/jsp/driver/personalMenu.jsp">
					<jsp:param name="leftmenu" value="platForm3"/>
				</jsp:include>
			</div>
			<div id="workarea" class="workarea">
				<div class="title_area">
					<div class="title">平台驾驶员备案
					</div>
				</div>
				<div>
					<form action="addRecord.action" method="post" name="form1" id="form1">
						<table width="100%" border="0" cellpadding="5" cellspacing="2">
							<tr height="40">
								<td width="28%" align="right">身份证号：</td>
								<td width="30%" align="left">
									<input class="reg_input" size="25" name="certno" id="certno" type="text" />
								</td>
								<td align="left">
									<span id="certnoTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">合同类型：</td>
								<td align="left">
									<select id="type" name="type">
										<option value="1">合同</option>
										<option value="2">协议</option>
									</select>
								</td>
								<td align="left"></td>
							</tr>
							<tr height="40">
								<td align="right">合同开始时间：</td>
								<td align="left">
									<input type="text" class="reg_input" name="startDate" id="startDate" placeholder="请选择日期" size="25">
									<div id="dd"></div>
								</td>
								<td align="left">
									<span id="startDateTip"	class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">合同结束时间：</td>
								<td align="left">
									<input type="text" class="reg_input" name="endDate" id="endDate" placeholder="请选择日期" size="25">
									<div id="dd2"></div>
								</td>
								<td align="left">
									<span id="endDateTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">上传合同：</td>
								<td colspan="2" align="left">
							         <div class="box">
										<input type="text" name="contractText" id="contractText" class="file_textbox" width="222px"/>
										<a href="javascript:void(0);" class="upload_link">浏览</a>
										<input type="file" class="uploadFile" name="contractFile" id="contractFile"  onchange="getFile(this,'contractText')" />
									</div>    
									<span id="contractFileTip" class="onshow"></span>     
								</td>
							</tr>
							<tr>
								<td></td>
								<td colspan="2">
									<input id="button" name="button" type="submit" value="确认办理" class="button3" />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>