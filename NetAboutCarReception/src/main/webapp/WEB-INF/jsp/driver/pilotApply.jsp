<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<title>许可申请</title>
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
			.imgStyle{
			margin-bottom:0.5em;
			width: 120px;
			height: 80px;
			}
		</style>
		<script type="text/javascript">
			$("input[name='sex'][value='${drvUserinfo.sex}']").attr("checked","checked");
			if("" == "${drvPermitapply.driveyears}" || null == "${drvPermitapply.driveyears}"){
				$("#driveyears").val("1");
			}
			$("#education option[value='${drvUserinfo.education}']").attr("selected","selected");
			$("#political option[value='${drvUserinfo.political}']").attr("selected","selected");
			$("#cardrivingtype option[value='${drvUserinfo.cardrivingtype}']").attr("selected","selected");
			if("" != "${drvPermitapply.photo}" && null != "${drvPermitapply.photo}"){
				$("#photoTd").html("之前申请所使用的个人照片");
				$("#photoImg").html("<img class='imgStyle' src='${drvPermitapply.photo}'>");
				var file_name = "${drvPermitapply.photo}".split("/");
				$("input[name='photoText']").val(file_name[file_name.length-1]);
			}
			if("" != "${drvPermitapply.certphoto}" && null != "${drvPermitapply.certphoto}"){
				var certphoto = "${drvPermitapply.certphoto}".split('#');
				var file_name = "";
				var certHtml = "";
				for(var i = 0;i < certphoto.length;i++){
					certHtml += "<img class='imgStyle' src='"+certphoto[i]+"'>";
					file_name += certphoto[i].split("/")[certphoto[i].split("/").length-1]+"，";
				}
				$("#certImg").html(certHtml);
				$("#certTd").html("之前申请所使用的身份证照片");
				$("input[name='certphotoText']").val(file_name);
			}
			if("" != "${drvPermitapply.drivecardphoto}" && null != "${drvPermitapply.drivecardphoto}"){
				$("#drivecardTd").html("之前申请所使用的驾驶证照片");
				$("#drivecardImg").html("<img class='imgStyle' src='${drvPermitapply.drivecardphoto}'>");
				var file_name = "${drvPermitapply.drivecardphoto}".split("/");
				$("input[name='drivecardphotoText']").val(file_name[file_name.length-1]);
			}
			$("#remark").val("${drvPermitapply.remark}");
			$("#address").val("${drvUserinfo.address}");
			$("#censusaddr").val("${drvUserinfo.censusaddr}");
			$(function(){
				$("select").selectlist({
					zIndex: 10,
					width: 190,
					height: 25
				});
				//机构下拉框赋值
				var instInfoHtml="<select id='instid' name='instid'>";
				var instid = "${drvPermitapply.instid}";
				$.ajax({
		            type: "post",
		            url: "${basePath}driver/findInstInfoByAreacode.action",
		            success: function (data) {
		            	var codeJson = eval(data);
		        		if("" != codeJson && null != codeJson){
		        			$("#instidVal").val("1");
		        			for(var i=0;i<codeJson.length;i++){
		        				if("" != instid && null != instid && instid == codeJson[i].instId){
		        					instInfoHtml += "<option value='"+codeJson[i].instId+"' selected=selected>"+codeJson[i].instName+"</option>";
								}else{
									instInfoHtml += "<option value='"+codeJson[i].instId+"'>"+codeJson[i].instName+"</option>";
								}
		        			}
		        		}else{
		        			instInfoHtml += "<option value=''></option>";
		        		}
		        		instInfoHtml+="</select>";
						$("#instInfo").html(instInfoHtml);
						$("select").selectlist({
							zIndex: 10,
							width: 190,
							height: 25
						});
		            }
		        });
				
				var optionHtml="<select id='nation' name='nation'>";
				var nation = "${drvUserinfo.nation}";
				$.getJSON("${basePath}js/minzu.json",function(datas){
					$.each(datas,function(index,msg){
						if("" != nation && null != nation && nation == msg.id){
							optionHtml+="<option value='"+msg.id+"' selected=selected>"+msg.name+"</option>";
						}else{
							optionHtml+="<option value='"+msg.id+"'>"+msg.name+"</option>";
						}
					});
					optionHtml+="</select>";
					$("#minzu").html(optionHtml);
					$('select').selectlist({
						zIndex: 10,
						width: 190,
						height: 25
					});
				});
				
				$("#driveyears").spinner({
					max:50,
					min:1,
					step:1
				});
				
				$('#dd').calendar({
				    trigger: '#dt',
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
				    }
				});
				$('#dd2').calendar({
				    trigger: '#cardDate',
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
				        $("#cardDate").formValidator({onshow: "请选择时间",onfocus: "请选择时间"}).functionValidator({fun:isDate}).defaultPassed();;
				    }
				});
				
			});
			
			function NextStep(){
				$("#basicInfo").css('display','none');
				$("#applyInfo").css('display','');
				$(document).scrollTop(0);
			}
			
			function PreStep(){
				$("#basicInfo").css('display','');
				$("#applyInfo").css('display','none');
				$(document).scrollTop(0);
			}
			
			function getFile(obj,inputName){
				var file_name = $(obj).val();
				
				
				var houzhui=file_name.split(".");
				
				var last=houzhui[houzhui.length-1];
				var tp ="jpg,jpeg,gif,bmp,png,JPG,JPEG,GIF,BMP,PNG";
				var rs=tp.indexOf(last);
				
				//如果返回的结果大于或等于0，说明包含允许上传的文件类型
				if(rs>=0){
					 var path = URL.createObjectURL(obj.files[0]);
				     if(inputName=='photoText'){
					      document.getElementById("photoTd").innerHTML = "您选择的照片";
					      document.getElementById("photoImg").innerHTML = "<img class='imgStyle' src='"+path+"'>";
					 }else if(inputName=='drivecardphotoText'){
						  document.getElementById("drivecardTd").innerHTML = "您选择的照片";
					      document.getElementById("drivecardImg").innerHTML = "<img class='imgStyle' src='"+path+"'>";
					 }
					
					 $("input[name='"+inputName+"']").val(file_name);
					 return true;
				}else{
					 alert("您选择的上传文件不是有效的图片文件！");
					 $("input[name='"+inputName+"']").val("");
					 return false;
				}
			}
			
			function getCertFile(obj,inputName){
				var file_name = "";
				var length = obj.files.length;
				if(length > 2){
					alert("您最多可选择两个图片文件！");
					return false;
				}else if(length == 1){
					alert("请同时选择身份证正、反面两张图片！");
					return false;
				}else{
					var certHtml = ""; 
					for(var i = 0;i < length;i++){
						file_name += obj.files[i].name+",";
						
						var houzhui=obj.files[i].name.split(".");
						
						var last=houzhui[houzhui.length-1];
						var tp ="jpg,jpeg,gif,bmp,png,JPG,JPEG,GIF,BMP,PNG";
						var rs=tp.indexOf(last);
						
						//如果返回的结果大于或等于0，说明包含允许上传的文件类型
						if(rs < 0){
							 alert("您选择的上传文件不是有效的图片文件！");
							 $("input[name='"+inputName+"']").val("");
							 return false;
						}
					    var path = URL.createObjectURL(obj.files[i]);
					    certHtml += "<img class='imgStyle' src='"+path+"'>";
					}
					$("#certTd").html("您选择的照片");
					$("#certImg").html(certHtml);
					$("input[name='"+inputName+"']").val(file_name);
					return true;
				}
			}
			$(document).ready(function(){
				$.formValidator.initConfig({formid:"form1",debug:false,submitonce:true,
					onerror:function(msg,obj,errorlist){
						//$.map(errorlist,function(msg1){alert(msg1)});
						alert(msg);
					},
					onsuccess:function(){
						if($("#instidVal").val() == "1"){
							$("#form1").ajaxSubmit({
			                    type:'post',
			                    url:'${basePath}driver/addPilotApply.action',
			                    success:function(data){
			                    	if(data == "success"){
			                    		$("#main").load("${basePath}driver/openProgress.action", function() {});
									}else if(data == "error"){
										alert("申请失败！");
									}
			                    }
			                });
						}else{
							alert("申请机构不能为空");
						}
						return false;
					}
				});
				
				$("#username").formValidator({onshow:"请输入姓名",onfocus:"请输入姓名"}).functionValidator({fun:isChinese});
				//$("#certno").formValidator({onshow:"15或18位的身份证",onfocus:"15或18位的身份证",oncorrect:"输入正确"}).functionValidator({fun:isCardID});
			    //$("#drivecardno").formValidator({onshow:"15或18位的身份证",onfocus:"15或18位的身份证",oncorrect:"输入正确"}).functionValidator({fun:isCardID});
			    $("#address").formValidator({onshow:"请输入家庭住址",onfocus:"请输入家庭住址"}).inputValidator({min:1,max:150,onerror:"地址格式有误"});
			    //$("#driveyears").formValidator({onshow:"请输入驾龄",onfocus:"请输入驾龄"}).functionValidator({fun:isNum});
			    $("#telno").formValidator({onshow:"请输入你的手机号码",onfocus:"请输入你的手机号码"}).functionValidator({fun:isPhoneNumber});
			    $("#cardDate").formValidator({onshow: "请选择时间",onfocus: "请选择时间"}).functionValidator({fun:isDate});
			    if("" == $("input[name='photoText']").val() || null == $("input[name='photoText']").val()){
			    	$("#photoFile").formValidator({onshow:"请选择个人照片",onfocus:"请选择个人照片"}).inputValidator({min:1,onerror:"请选择个人照片"});	
			    }
			    if("" == $("input[name='certphotoText']").val() || null == $("input[name='certphotoText']").val()){
			    	$("#certFile").formValidator({onshow:"请选择身份证照片",onfocus:"请同时选择身份证正、反面两张图片"}).inputValidator({min:1,onerror:"请同时选择身份证正、反面两张图片"});	
			    }
			    if("" == $("input[name='drivecardphotoText']").val() || null == $("input[name='drivecardphotoText']").val()){
			    	$("#drivecardFile").formValidator({onshow:"请选择驾驶证照片",onfocus:"请选择驾驶证照片"}).inputValidator({min:1,onerror:"请选择驾驶证照片"});
			    }
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
					<div class="title">驾驶员资质业务许可申请
						<%-- <div class="help">
							<a class="guide" href="javascript:void(0);" onclick="gotoHelp('${basePath}help/toHelpContent3_1_1.action');">操作指南</a>
							<a class="policy" href="javascript:void(0);" onclick="gotoHelp('${basePath}help/toHelpContent3_1_1.action');">相关政策</a>
						</div> --%>
					</div>
				</div>
				<div>
					<form action="${basePath}driver/addPilotApply.action" method="post" name="form1" id="form1" enctype="multipart/form-data">
						<table class="table" id="basicInfo" width="100%" border="1" cellpadding="5" cellspacing="2">
							<tr height="40">
								<th colspan="4" align="left">
									驾驶员基本信息
								</th>
							</tr>
							<tr height="40">
								<td width="20%" align="right">姓名</td>
								<td colspan="3" width="30%" align="left">
									<input class="reg_input" size="25" value="${drvUserinfo.username}" name="username" id="username" type="text" onkeydown="return banInputSapce(event);" />
									<span id="usernameTip" class="onshow"></span>
								</td>
							</tr>
							
							<tr height="40">
								<td align="right">手机号</td>
								<td colspan="3" align="left">
									<input class="reg_input" size="25" value="${drvUserinfo.telno}" name="telno" id="telno" type="text" />
									<span id="telnoTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td width="20%" align="right">性别</td>
								<td width="30%" align="left">
									<input type="radio" id="Sex_Man" name="sex" value="1" checked="CHECKED"/><label for="Sex_Man">男</label>
									<input type="radio" id="Sex_Woman" name="sex" value="0" /><label for="Sex_Woman"> 女</label>
								</td>
								<td width="20%" align="right">身份证号</td>
								<td align="left">
									<input class="reg_input" size="25" value="${userName}" name="certno" id="certno" type="text"  readonly/>
								</td>
							</tr>
							
							<tr height="40">
								<td align="right">民族</td>
								<td align="left"><span id="minzu" name="nation"></span></td>
								<td align="right">学历</td>
								<td align="left">
									<select id="education" name="education">
										<option value="0">初中</option>
										<option value="1">高中</option>
										<option value="2">中技</option>
										<option value="3">中专</option>
										<option value="4">大专</option>
										<option value="5">本科</option>
										<option value="6">硕士</option>
										<option value="7">博士</option>
										<option value="8">博士后</option>
										<option value="9">教授</option>
									</select>
								</td>
							</tr>
							<tr height="40">
								<td align="right">政治背景</td>
								<td align="left">
									<select id="political" name="political">
										<option value="0">群众</option>
										<option value="1">团员</option>
										<option value="2">党员</option>
									</select>
									<span id="politicalTip" class="onshow"></span>
								</td>
								<td align="right">居住证</td>
								<td align="left">
									<input class="reg_input" size="25" value="${drvUserinfo.residencepermit}" name="residencepermit" id="residencepermit" type="text" />
									<span id="residencepermitTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">紧急联系人姓名</td>
								<td align="left">
									<input class="reg_input" size="25" value="${drvUserinfo.contactname}" name="contactname" id="contactname" type="text" />
									<span id="contactnameTip" class="onshow"></span>
								</td>
								<td align="right">紧急联系电话</td>
								<td align="left">
									<input class="reg_input" size="25" value="${drvUserinfo.contacttelno}" name="contacttelno" id="contacttelno" type="text" />
									<span id="contacttelnoTip" class="onshow"></span>
								</td>
							</tr>
							
							<tr height="40">
								<td align="right">户籍所在地</td>
								<td colspan="3" align="left">
									<textarea class="reg_textarea" rows="4" cols="45" value="${drvUserinfo.censusaddr}" name="censusaddr" id="censusaddr"></textarea>
									<span id="censusaddrTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">现在地址</td>
								<td colspan="3" align="left">
									<textarea class="reg_textarea" rows="4" cols="45" value="${drvUserinfo.address}" name="address" id="address"></textarea>
									<span id="addressTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<th colspan="4" align="left">
									驾驶证信息
								</th>
							</tr>
							<tr height="40">
								<td width="20%" align="right">驾驶证号</td>
								<td width="30%" align="left">
									<input class="reg_input" size="25" value="${userName}" name="drivecardno" id="drivecardno" type="text" readonly/>
								</td>
								<td width="20%" align="right">发证机关</td>
								<td align="left">
									<input class="reg_input" size="25" value="${drvUserinfo.carissuingagency}" name="carissuingagency" id="carissuingagency" type="text" />
									<span id="carissuingagencyTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">准驾车型</td>
								<td align="left">
									<select id="cardrivingtype" name="cardrivingtype">
										<option value="0">小型车</option>
										<option value="1">中型车</option>
										<option value="2">大型车</option>
									</select>
								</td>
								<td width="20%" align="right">车辆档案号</td>
								<td align="left">
									<input class="reg_input" size="25" value="${drvUserinfo.filenumber}" name="filenumber" id="filenumber" type="text" />
									<span id="filenumberTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right">取证时间</td>
								<td colspan="3" align="left">
									<input type="text" class="reg_input" value="${cardDate}" name="cardDate" id="cardDate" placeholder="请选择日期" size="25">
									<div id="dd2" style="display:none; POSITION:absolute; border:1px solid #ddd"></div>
									<span id="cardDateTip"	class="onshow"></span>
								</td>
							</tr>
							<tr>
								<td colspan="4" align="center">
									<div class="form_button_area" align="center">
										<input type="button" value="下一步" onclick="NextStep()" class="button3"/>
									</div>
								</td>
							</tr>
						</table>
						<table class="table" id="applyInfo" style="display:none" width="100%" border="0" cellpadding="5" cellspacing="2">
							<tr height="40">
								<th colspan="4" align="left">
									申请信息
								</th>
							</tr>
							<tr height="40">
								<td align="right">个人照片(白底1寸)</td>
								<td colspan="3" align="left">
									<div class="box">
										<input type="text" id="photoText" name="photoText" class="file_textbox" />
										<a href="javascript:void(0);" class="upload_link">浏览</a>
										<input type="file" class="uploadFile" id="photoFile" name="photoFile" onchange="getFile(this,'photoText')" />
									</div>
									<span id="photoFileTip" class="onshow"></span>
								</td>
							</tr>
							<tr id="photoTr">
								<td id="photoTd" align="right">样例</td>
								<td id="photoImg" colspan="3" align="left">
									<img class='imgStyle' src='${basePath}images/photo.jpg'>
								</td>
							</tr>
							<tr height="40">
								<td align="right">身份证照片(正反两张)</td>
								<td colspan="3" align="left">
									<div class="box">
										<input type="text" id="certphotoText" name="certphotoText" class="file_textbox" />
										<a href="javascript:void(0);" class="upload_link">浏览</a>
										<input type="file" multiple class="uploadFile" id="certFile" name="certFile" onchange="getCertFile(this,'certphotoText')" />
									</div>
									<span id="certFileTip" class="onshow"></span>
								</td>
							</tr>
							<tr id="certphotoTr">
								<td id="certTd" align="right">样例</td>
								<td id="certImg" colspan="3" align="left">
									<img class='imgStyle' src='${basePath}images/certPhoto1.jpg'>
									<img class='imgStyle' src='${basePath}images/certPhoto2.jpg'>
								</td>
							</tr>
							<tr height="40">
								<td align="right">驾驶证照片</td>
								<td colspan="3" align="left">
									<div class="box">
										<input type="text" id="drivecardphotoText" name="drivecardphotoText" class="file_textbox" />
										<a href="javascript:void(0);" class="upload_link">浏览</a>
										<input type="file" class="uploadFile" id="drivecardFile" name="drivecardFile" onchange="getFile(this,'drivecardphotoText')" />
									</div>
									<span id="drivecardFileTip" class="onshow"></span>
								</td>
							</tr>
							<tr id="drivecardphotoTr">
								<td id="drivecardTd" align="right">样例</td>
								<td id="drivecardImg" colspan="3" align="left">
									<img class='imgStyle' src='${basePath}images/cardPhoto.jpg'>
								</td>
							</tr>
							<tr height="40">
								<td align="right">申请机构</td>
								<td colspan="3" align="left">
									<span id="instInfo" name="instInfo"></span>
									<span id="instidTip" class="onshow"></span>
								</td>
							</tr>
							
							<tr>
								<td colspan="4" align="center">
									<div class="form_button_area" align="center">
										<input name="instidVal" id="instidVal" type="hidden" value="0" />
										<input type="button" value="上一步" onclick="PreStep()" class="button3"/>
										<input id="button" name="button" type="submit" value="提交" class="button3"/>
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>