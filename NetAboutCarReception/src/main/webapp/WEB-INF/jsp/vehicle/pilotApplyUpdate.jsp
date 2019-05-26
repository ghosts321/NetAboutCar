<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
		<title>车辆许可申请</title>
		<script type="text/javascript">
		
		    //下拉框设置选中
			$("#carColor option[value='${carInfo.carColor}']").attr("selected","selected");
			$("#bodyColor option[value='${carInfo.bodyColor}']").attr("selected","selected");
			$("#category option[value='${carInfo.category}']").attr("selected","selected");
			$("#carType option[value='${carInfo.category}']").attr("selected","selected");
			$("#economyType option[value='${carInfo.economyType}']").attr("selected","selected");
			$("#seatNum option[value='${carInfo.seatNum}']").attr("selected","selected");
			$("#allowSeat option[value='${carInfo.allowSeat}']").attr("selected","selected");
			
			$(function(){
				$("select").selectlist({
					zIndex: 10,
					width: 190,
					height: 25
				});
				
				
				var instInfoHtml="<select id='instId' name='instId'>";
				var instid="${carPermitApply.instId}";
				//机构下拉框赋值
				$.ajax({
		            type: "post",
		            url: "${basePath}vehicle/findAllInstInfo.action",
		            success: function (data) {
		            	var codeJson = eval(data);
		        		if(codeJson != null && ""!=codeJson){
		        			for(var i=0;i<codeJson.length;i++){
		        				if("" != instid && null != instid && instid == codeJson[i].instId){
			        				instInfoHtml += "<option value='"+codeJson[i].instId+"'  selected=selected>"+codeJson[i].instName+"</option>";
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
				
				$('#dd').calendar({
				    trigger: '#dt',
				    zIndex: 999,
					format: 'yyyy-mm-dd',
					date: new Date(2000,00,01),
				    onSelected: function (view, date, data) {
				        console.log('event: onSelected');
				    },
				    onClose: function (view, date, data) {
				        console.log('event: onClose');
				        console.log('view:' + view);
				        console.log('date:' + date);
				        console.log('data:' + (data || 'None'));
				        $("#dt").formValidator({onshow: "请选择时间",onfocus: "请选择时间"}).functionValidator({fun:isDate}).defaultPassed();;
				    }
				});
				$('#dd2').calendar({
				    trigger: '#dt2',
				    zIndex: 999,
					format: 'yyyy-mm-dd',
					date: new Date(2000,00,01),
				    onSelected: function (view, date, data) {
				        console.log('event: onSelected');
				    },
				    onClose: function (view, date, data) {
				        console.log('event: onClose');
				        console.log('view:' + view);
				        console.log('date:' + date);
				        console.log('data:' + (data || 'None'));
				        $("#dt2").formValidator({onshow: "请选择时间",onfocus: "请选择时间"}).functionValidator({fun:isDate}).defaultPassed();;
				    }
				});
				$('#dd3').calendar({
				    trigger: '#dt3',
				    zIndex: 999,
					format: 'yyyy-mm-dd',
					date: new Date(2000,00,01),
				    onSelected: function (view, date, data) {
				        console.log('event: onSelected');
				    },
				    onClose: function (view, date, data) {
				        console.log('event: onClose');
				        console.log('view:' + view);
				        console.log('date:' + date);
				        console.log('data:' + (data || 'None'));
				        $("#dt3").formValidator({onshow: "请选择时间",onfocus: "请选择时间"}).functionValidator({fun:isDate}).defaultPassed();;
				    }
				});
				$('#dd4').calendar({
				    trigger: '#dt4',
				    zIndex: 999,
					format: 'yyyy-mm-dd',
					date: new Date(2000,00,01),
				    onSelected: function (view, date, data) {
				        console.log('event: onSelected');
				    },
				    onClose: function (view, date, data) {
				        console.log('event: onClose');
				        console.log('view:' + view);
				        console.log('date:' + date);
				        console.log('data:' + (data || 'None'));
				        $("#dt4").formValidator({onshow: "请选择时间",onfocus: "请选择时间"}).functionValidator({fun:isDate}).defaultPassed();;
				    }
				});
			});
			function getFile(obj,inputName){
				var file_name = $(obj).val();
				
				
				var houzhui=file_name.split(".");
				
				var last=houzhui[houzhui.length-1];
				var tp ="jpg,jpeg,png,bmp,gif";
				var rs=tp.indexOf(last);
				
				//如果返回的结果大于或等于0，说明包含允许上传的文件类型
				if(rs>=0){
					 $("input[name='"+inputName+"']").val(file_name);
					 return true;
				}else{
					 alert("请上传正确的照片格式！");
					 $("input[name='"+inputName+"']").val("");
					 return false;
				}
			}
			 function getFile(imgFile,inputName){
				   var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;
				   var file_name = $(imgFile).val();
					var houzhui=file_name.split(".");
				    if(!pattern.test(imgFile.value)) 
				    { 
				      alert("请上传正确的照片格式！");  
				     imgFile.focus(); 
				    } 
				    else 
				    { 
				     var path; 
				     if(document.all) 
				     { 
				      imgFile.select(); 
				      path = document.selection.createRange().text; 
				      document.getElementById("imgPreview").innerHTML=""; 
				      document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";
				     }else{ 
				     	 path = URL.createObjectURL(imgFile.files[0]);
						 $("input[name='"+inputName+"']").val(file_name);
						 if(inputName=='xingshizhengPhotoText'){
						      document.getElementById("img").innerHTML = "<img width='220' height='150'  src='"+path+"'/>";
						      document.getElementById("img").style.display="block";
						      document.getElementById("yl").style.display="inline-table";
						 }else if(inputName=='carPhotoText'){
						      document.getElementById("imgPreview").innerHTML = "<img width='220' height='150' src='"+path+"'/>";
						      document.getElementById("imgPreview").style.display="inline-table";
						      document.getElementById("yy").style.display="inline-table";
						 }
				     } 
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
	                    url:'${basePath}vehicle/addPilotApply.action',
	                    success:function(data){
	                    	if(data == "success"){
	                    		$("#main").load("${basePath}vehicle/openProgressList.action", function() {});
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
				$("#carNum").formValidator({onshow:"请输入车牌号",onfocus:"请输入车牌号"}).inputValidator({min:8,max:8,onerror:"车牌号只能是8位(汉字占2位)"});
				$("#manCompany").formValidator({onshow:"请输入车主姓名",onfocus:"请输入车主姓名"}).inputValidator({min:2,onerror:"输入有误"});
				$("#length").formValidator({onshow:" ",onfocus:" ",empty: true}).functionValidator({fun:isDecmal});
				$("#width").formValidator({onshow:" ",onfocus:" ",empty: true}).functionValidator({fun:isDecmal});
				$("#height").formValidator({onshow:" ",onfocus:" ",empty: true}).functionValidator({fun:isDecmal});
				$("#wheelBase").formValidator({onshow:"请输入轴距",onfocus:"请输入轴距"}).functionValidator({fun:isPosInt});
				$("#totalQuality").formValidator({onshow:" ",onfocus:" ",empty: true}).functionValidator({fun:isPosInt});
				$("#dt").formValidator({onshow: "请选择时间",onfocus: "请选择时间"}).functionValidator({fun:isDate});
				$("#dt2").formValidator({onshow: "请选择时间",onfocus: "请选择时间"}).functionValidator({fun:isDate});
				$("#purchasePrice").formValidator({onshow:" ",onfocus:" ",empty: true}).functionValidator({fun:isPosInt});
				$("#dt3").formValidator({onshow: "请选择时间",onfocus: "请选择时间"}).functionValidator({fun:isDate});
				$("#dt4").formValidator({onshow: "请选择时间",onfocus: "请选择时间"}).functionValidator({fun:isDate});
				$("#address").formValidator({onshow:"请输入联系地址",onfocus:"请输入联系地址"}).inputValidator({min:5,max:50,onerror:"输入有误"});
				$("#telNo").formValidator({onshow:"请输入联系电话",onfocus:"请输入联系电话"}).functionValidator({fun:isPhoneNumber});
				$("#engineNum").formValidator({onshow:"请输入发动机号",onfocus:"请输入发动机号"}).inputValidator({min:1,max:30,onerror:"请输入发动机号"});
				$("#chassisNum").formValidator({onshow:"请输入车架号",onfocus:"请输入车架号"}).inputValidator({min:17,max:17,onerror:"车架号只能是17位"});
				
				if("" == $("input[name='carPhotoText']").val() || null == $("input[name='carPhotoText']").val()){
			    	$("#carFile").formValidator({onshow:"请选择车辆照片",onfocus:"请选择车辆照片"}).inputValidator({min:1,onerror:"请选择车辆照片"});	
			    }
				if("" == $("input[name='xingshizhengPhotoText']").val() || null == $("input[name='xingshizhengPhotoText']").val()){
			    	$("#xszFile").formValidator({onshow:"请选择行驶证照片",onfocus:"请选择行驶证照片"}).inputValidator({min:1,onerror:"请选择行驶证照片"});	
			    }
				
				/* 	$("#name").formValidator({onshow:"请输入姓名",onfocus:"请输入姓名"}).functionValidator({fun:isChinese});
				$("#idCard").formValidator({onshow:"15或18位的身份证",onfocus:"15或18位的身份证",oncorrect:"输入正确"}).functionValidator({fun:isCardID});
			    $("#driveCard").formValidator({onshow:"15或18位的身份证",onfocus:"15或18位的身份证",oncorrect:"输入正确"}).functionValidator({fun:isCardID});
			    $("#address").formValidator({onshow:"请输入家庭住址",onfocus:"请输入家庭住址"}).inputValidator({min:1,max:30,onerror:"地址格式有误"});
			    $("#driverYears").formValidator({onshow:"请输入驾龄",onfocus:"请输入驾龄"}).functionValidator({fun:isNum});
			    $("#tel").formValidator({onshow:"请输入你的手机号码",onfocus:"请输入你的手机号码"}).functionValidator({fun:isPhoneNumber}); */
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
		<style>
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
			.span {
			display:inline;
			}
			input.file_textbox {
				float: left;
				height: 25px;
				line-height: 25px;
				width: 357px;
				_behavior: url(js/Round_htc.htc);
				-moz-border-radius: 4px;
				-webkit-border-radius: 4px;
				border-radius: 4px;
				background-color: #FFF;
				border: 1px solid #d5cfc2;
				font-size: 14px;
				vertical-align: middle;
				padding-left: 5px;
				margin-right: 4px;
			}
			.imgStyle{
			margin-bottom:0.5em;
			width: 120px;
			height: 80px;
			}

		</style>
	</head>
	<body>
		<div class="buss_area">
			<div class="personalmenu">
				<jsp:include page="/WEB-INF/jsp/driver/personalMenu.jsp">
					<jsp:param name="leftmenu" value="vehicle"/>
				</jsp:include>
			</div>
			<div id="workarea" class="workarea">
				<div class="title_area">
					<div class="title">网约车资质业务许可申请（资料修改）
						<!-- <div class="help">
							<a class="guide" href="javascript:void(0);" target="_blank">操作指南</a>
							<a class="policy" href="javascript:void(0);" target="_blank">相关政策</a>
						</div> -->
					</div>
				</div>
				<div>
							<form action="${basePath}vehicle/addPilotApply.action" method="post" name="form1" id="form1" enctype="multipart/form-data" align="center">
						
					<table border="1" class="table" id="step_1"  width="100%" border="0" cellpadding="5" cellspacing="2">
		   					 <tr height="40">
		     					 <th colspan="12" align="left">车主基本信息</th>
		   					 </tr>
							<!-- <tr height="40">
								<td width="28%" align="right">车辆编号：</td>
								<td width="30%" align="left"> -->
									<input  class="reg_input" type="hidden" value="${carInfo.carId }" size="25" name="carId"  type="text"  readonly="readonly"/>
							<!-- 	</td>
							</tr> -->
						
							
							<tr height="40">
								<td align="right" colspan="2">驾驶员身份证号</td>
								<td align="left" colspan="4">
									<input class="reg_input" size="25" value="<%=session.getAttribute("userName") %>" name="certNo" id="certNo" type="text" readonly="readonly"/>
								</td>
								<td align="right" colspan="2">车主名称</td>
								<td align="left" colspan="4">
									<input class="reg_input" size="25" value="${carInfo.manCompany }" name="manCompany" id="manCompany" type="text" />
							</tr>
							<tr height="40">
								<td align="right" colspan="2">联系电话</td>
								<td align="left" colspan="10">
									<input class="reg_input" size="25" value="${carInfo.telNo }" name="telNo" id="telNo" type="text" />
									<span id="telNoTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right" colspan="2">联系地址</td>
								<td align="left" colspan="10">
									<textarea class="reg_textarea" cols="52"  rows="3"  name="address" id="address" >${carInfo.address }</textarea>
								</td>
								</tr>
							
							<!-- <tr>
								<td colspan="2" align="center">
								 <input id="button4" name="button" type="button" class="button3" value="下一步"  onclick="javascript:step1()"/>
								</td>
							</tr> -->
							
		   					 <tr height="40">
		     					 <th colspan="12" align="left">车辆基本信息</th>
		   					 </tr>
							<tr height="40">
								<td align="right" colspan="2">车牌号</td>
								<td align="left" colspan="10">
									<input class="reg_input" size="25" value="${carInfo.carNum }" name="carNum" id="carNum" type="text"  />
									<span id="carNumTip" class="show"></span>
								</td>
								 </tr>
								<tr height="40">
								<td align="right" colspan="2">品牌</td>
								<td align="left" colspan="4">
									<input class="reg_input" size="25" value="${carInfo.labels }" name="label" id="label" type="text" />
								</td>
								<td align="right" colspan="2">型号</td>
								<td align="left" colspan="4">
									<input class="reg_input" size="25" value="${carInfo.model }" name="model" id="model" type="text" />
								</td>
								 </tr>
								<tr height="40">
								<td align="right" colspan="2">轴距</td>
								<td align="left" colspan="4">
									<input class="reg_input" size="22" value="${carInfo.wheelBase }" name="wheelBase" id="wheelBase" type="text" />毫米
								</td>
								<td align="right" colspan="2">座位数</td>
								<td align="left" colspan="4">
								    <select id="seatNum" name="seatNum">
								       <option value="4" <c:if test="${carInfo.seatNum==4}">selected</c:if>>4</option>
								       <option value="7" <c:if test="${carInfo.seatNum==7}">selected</c:if>>7</option>
								    </select>
								     <span class="show" id="seatNumTip"></span>
								</td>
								 </tr>
								<tr height="40">
								<td align="right" colspan="2">初次登记时间：</td>
								<td align="left" colspan="4">
									<input type="text" class="reg_input" value="${carInfo.regDate }" name="regDate" id=dt3 placeholder="请选择日期" size="25">
									<div id="dd3"></div>
								</td>
								<td align="right" colspan="2">发动机号</td>
								<td align="left" colspan="4">
									<input class="reg_input" size="25" value="${carInfo.engineNum }" name="engineNum" id="engineNum" type="text" />
								</td>
								</tr>
								<tr height="40">
								<td align="right" colspan="2">车架号/VIN</td>
								<td align="left" colspan="10">
									<input class="reg_input" size="25" value="${carInfo.chassisNum }" name="chassisNum" id="chassisNum" type="text" />
									<span id="chassisNumTip" class="show"></span>
								</td>
						
						 </tr>
							<input class="reg_input" size="28" value="<%=session.getAttribute("areaCode") %>" name="areaCode" id="areaCode" type="hidden" readonly="readonly"/>
						 <tr height="40">
								<td align="right" colspan="2">行驶证发放机关</td>
								<td align="left" colspan="4">
									<input class="reg_input" size="25" value="${carInfo.endDept }" name="endDept" id="endDept" type="text" />
								</td>
								<td align="right" colspan="2">车辆登记证编码</td>
								<td align="left" colspan="4">
									<input class="reg_input" size="25" value="${carInfo.regCode }" name="regCode" id="regCode" type="text" />
								</td>
						 </tr>
							<tr height="40">
								<td align="right" colspan="2">车辆类别</td>
								<td align="left" colspan="10">
								     <select id="category" name="category" onChange="setTitle('category','economytype')">
								      <option value="">请选车辆类型</option>
								       <option value="1" <c:if test='${carInfo.category== "1"}'>  selected='selected'  </c:if>>新能源</option>
								       <option value="2" <c:if test='${carInfo.category== "2"}'>  selected='selected'  </c:if>>自然吸气发动机</option>
								    </select>
								    
								    &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp; &nbsp;&nbsp;
								     <select id="economytype" name="economytype">
								     <option value="暂无">请选择类型</option>
								     <option value="续航里程" <c:if test="${carInfo.economyType == '续航里程'}">selected="selected"</c:if>>续航里程</option>
								     <option value="排量" <c:if test="${carInfo.economyType == '排量' }">select="selected"</c:if>>排量</option>
								    </select>
								</td>
							</tr>
							 <input class="reg_input" size="25" value="1" name="status" id="status" type="hidden" />
						 <!-- <tr>
							    <td colspan="6" align="center">
							    <input id="button2" name="button" class="button3" type="button"  value="上一步"  onclick="javascript:up2()" style="display:none;"/>
							    <input id="button1" name="button" type="button" class="button3" value="下一步"  onclick="javascript:step2()" style="display:none;"/> </td>
 						 </tr> -->
						   <tr height="40"><th colspan="12" align="left">申请信息</th></tr>
								<tr height="40">
									<input class="reg_input" size="28" value="${carPermitApply.applyId}" name="applyId"  type="hidden" readonly="readonly"/>
							<input class="reg_input" size="28" value="1" name="applyType" id="applyType" type="hidden" />
								<td align="center" colspan="2">车辆年检</td>
								<td align="left" colspan="4">
									<input class="reg_input" size="28" value="${carPermitApply.inspectionInfo }"  name="inspectionInfo" id="inspectionInfo" type="text" />
								</td>
								<td align="center" colspan="2">申请机构</td>
								 <td align="left" colspan="4">
									<span id="instInfo" name="instInfo"></span>
								</td>
								
							</tr>
							
								
							<tr height="40">
								<td align="center" colspan="2">车辆照片</td>
								<td  align="left" colspan="10">
							         <div class="box">
										<input type="text" name="carPhotoText" id="carPhotoText" class="file_textbox" />
										<a href="javascript:void(0);" class="upload_link">浏览</a>
										<input type="file" multiple  class="uploadFile" name="carFile"  id="carFile" onchange="getFile(this,'carPhotoText')" />
										<span class="show" id="carFileTip"></span>
									</div>         
								</td>
									</tr>
									<tr height="40">
								<td align="center" colspan="2">样例</td>
								<td  align="left" colspan="10">
									<div id="imgPreview"><img src="../images/car.jpg" class="imgStyle"/></div>  
									<!-- <button type='button' id="yy" class='kv-file-remove btn btn-xs btn-default' title='删除文件' onclick="deleteImage(1)">
									<i class='fa fa-trash-o red icon-size-14'></i>
          					  </button>	  -->        
								</td>
									</tr>
							<tr height="40">
								<td align="center" colspan="2">行驶证照片</td>
								<td  align="left" colspan="10">
								         <div class="box">
										<input type="text" name="xingshizhengPhotoText" id="xingshizhengPhotoText" class="file_textbox" width="600px"/>
										<a href="javascript:void(0);" class="upload_link">浏览</a>
										<input type="file" multiple class="uploadFile" name="xszFile" id="xszFile" onchange="getFile(this,'xingshizhengPhotoText')" />
										<span class="show" id="xszFileTip"></span>
									</div>
									
								</td>
							</tr>
							<tr height="40">
								<td align="center" colspan="2">样例</td>
								<td colspan="10" align="left">
								<div id="img" width="120px" height="80px" ><img src="../images/driver.jpg"  class="imgStyle"/>
								</div>  	     
							<!-- 	<button type='button' id="yl" class='kv-file-remove btn btn-xs btn-default' title='删除文件' onclick="deleteImage(2)">
								<i class='fa fa-trash-o red icon-size-14'></i>
          					  </button> -->
								    </td>
							</tr>
								<input class="reg_input" size="27" value="0"  name="appStatus" id="appStatus" type="hidden" />
						</table>
						<div class="form_button_area">
							<center>
							<!-- 	<input id="button3" name="button" type="button" class="button3" value="上一步"  onclick="javascript:up3()" style="display:none;"/> -->
								<input id="button" name="button" type="submit" value="提交" class="button3" />
							</center>
						</div>
						</form>
				</div>
			</div>
		</div>
	</body>
</html>