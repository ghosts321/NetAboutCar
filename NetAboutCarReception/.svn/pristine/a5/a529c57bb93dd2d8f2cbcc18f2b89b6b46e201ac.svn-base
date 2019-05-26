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
		<title>补办申请</title>
		<style type="text/css">
			
		</style>
		<script type="text/javascript">
			$(function(){
				$("select").selectlist({
					zIndex: 10,
					width: 212,
					height: 25
				});
				
				var optionHtml="<select id='nation' name='nation'>";
				$.getJSON("${basePath}js/minzu.json",function(datas){
					$.each(datas,function(index,msg){
						optionHtml+="<option value='"+msg.id+"'>"+msg.name+"</option>";
					});
					optionHtml+="</select>";
					$("#minzu").html(optionHtml);
					$('select').selectlist({
						zIndex: 10,
						width: 212,
						height: 25
					});
				});
				
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
				$('#dd2').calendar({
				    trigger: '#dt2',
				    zIndex: 999,
					format: 'yyyy-mm-dd',
					date: new Date(new Date()),
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
			
			$(document).ready(function(){
				$.formValidator.initConfig({formid:"form1",debug:false,submitonce:true,
					onerror:function(msg,obj,errorlist){
						//$.map(errorlist,function(msg1){alert(msg1)});
						alert(msg);
					},
					onsuccess:function(){
						$("#form1").ajaxSubmit({
							type:'post',
							url:'${basePath}driver/addRenewalApply.action',
							success:function(data){
		                    	if(data == "success"){
		                    		$("#main").load("${basePath}driver/openProgress.action", function(){});
								}else if(data == "error"){
									alert("申请失败！");
								}else if(data == "exist"){
									alert("你已经申请过了。");
								}
		                    }
		                });
						return false;
					}
				});
				
				$("#name").formValidator({onshow:"请输入姓名",onfocus:"请输入姓名"}).functionValidator({fun:isChinese});
				$("#idCard").formValidator({onshow:"15或18位的身份证",onfocus:"15或18位的身份证",oncorrect:"输入正确"}).functionValidator({fun:isCardID});
			    $("#driveCard").formValidator({onshow:"15或18位的身份证",onfocus:"15或18位的身份证",oncorrect:"输入正确"}).functionValidator({fun:isCardID});
			    $("#address").formValidator({onshow:"请输入家庭住址",onfocus:"请输入家庭住址"}).inputValidator({min:1,max:30,onerror:"地址格式有误"});
			    $("#driverYears").formValidator({onshow:"请输入驾龄",onfocus:"请输入驾龄"}).functionValidator({fun:isNum});
			    $("#tel").formValidator({onshow:"请输入你的手机号码",onfocus:"请输入你的手机号码"}).functionValidator({fun:isPhoneNumber});
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
					<jsp:param name="leftmenu" value="driver"/>
				</jsp:include>
			</div>
			<div id="workarea" class="workarea">
				<div class="title_area">
					<div class="title">驾驶员证补办申请
						<!-- <div class="help">
							<a class="guide" href="javascript:void(0);" target="_blank">操作指南</a>
							<a class="policy" href="javascript:void(0);" target="_blank">相关政策</a>
						</div> -->
					</div>
				</div>
				<div>
					<form action="addPilotApply.action" method="post" name="form1" id="form1">
						<table width="100%" border="0" cellpadding="5" cellspacing="2">
							<tr height="40">
								<td width="28%" align="right">姓名：</td>
								<td width="30%" align="left">
									<input class="reg_input" size="25" name="name" id="name" type="text"  />
								</td>
								<td align="left">
									<span id="nameTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">性别：</td>
								<td align="left">
									<input type="radio" id="Sex_Man" name="sex" value="1" checked="CHECKED"/><label for="Sex_Man">男</label>
									<input type="radio" id="Sex_Woman" name="sex" value="0" /><label for="Sex_Woman"> 女</label>
								</td>
								<td align="left">
								</td>
							</tr>
							<tr height="40">
								<td align="right">民族：</td>
								<td align="left"><span id="minzu"></span></td>
								<td align="left"></td>
							</tr>
							<tr height="40">
								<td align="right">身份证号：</td>
								<td align="left">
									<input class="reg_input" size="25" name="certno" id="idCard" type="text" />
								</td>
								<td align="left">
									<span id="idCardTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">原从业资格证号：</td>
								<td align="left">
									<input class="reg_input" size="25" name="originalcertnum" id="driveCard" type="text" />
								</td>
								<td align="left">
									<span id="driveCardTip"	class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">颁发时间：</td>
								<td align="left">
									<input type="text" class="reg_input" name="firstdate" id=dt2 placeholder="请选择日期" size="25">
									<div id="dd2"></div>
								</td>
								<td align="left"></td>
							</tr>
							<tr height="40">
								<td align="right">申请种类：</td>
								<td align="left">
									<select id="educationbg" name="applytype">
										<option value="5">补发</option>
									</select>
								</td>
								<td align="left"></td>
							</tr>
							<tr height="40">
								<td align="right">备注：</td>
								<td colspan="2" align="left">
									<textarea class="reg_textarea" cols="27" rows="3" name="remark" id="remark" ></textarea>
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