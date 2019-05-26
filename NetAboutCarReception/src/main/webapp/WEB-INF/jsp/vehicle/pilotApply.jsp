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
		<script type="text/javascript" src="${basePath}js/jquery.tips.js" ></script>
		<title>车辆许可申请</title>
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
		<script type="text/javascript">
	/* 	
		function step1()
		{
			document.getElementById('step_1').style.display='none';
			document.getElementById('step_2').style.display='inline-table';
			document.getElementById('button1').style.display='inline';
			document.getElementById('button2').style.display='inline';
			document.getElementById('step_3').style.display='none';
		}
		function up2()
		{
			document.getElementById('step_1').style.display='inline-table';
			document.getElementById('step_2').style.display='none';
			document.getElementById('step_3').style.display='none';
		}
		function step2(){
			document.getElementById('step_1').style.display='none';
			document.getElementById('step_2').style.display='none';
			document.getElementById('button').style.display='inline';
			document.getElementById('step_3').style.display='inline-table';
			document.getElementById('button3').style.display='inline';
		}
		function up3()
		{
			document.getElementById('step_1').style.display='none';
			document.getElementById('step_2').style.display='inline-table';
			document.getElementById('step_3').style.display='none';
			document.getElementById('button3').style.display='none';
			document.getElementById('button').style.display='none';
		} */
		 
		$(function(){
			$("select").selectlist({
				zIndex: 10,
				width: 190,
				height: 25
			});
			setCarId();
			var instInfoHtml="<select id='instId' name='instId'>";
			//机构下拉框赋值
			$.ajax({
	            type: "post",
	            url: "${basePath}vehicle/findAllInstInfo.action",
	            success: function (data) {
	            	var codeJson = eval(data);
	        		if(codeJson != ""){
	        			for(var i=0;i<codeJson.length;i++){
	        				instInfoHtml += "<option value='"+codeJson[i].instId+"'>"+codeJson[i].instName+"</option>";
	        			}
	        		}else{
	        			instInfoHtml+="<option value='0'>----------请选择机构----------</option>";
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
			
			
			$("#driverYears").spinner({
				max:50,
				min:1,
				step:1
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
			$('#dd5').calendar({
			    trigger: '#dt5',
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
			    }
			});
		});
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
				$("#wheelBase").formValidator({onshow:"请输入轴距",onfocus:"请输入轴距"}).functionValidator({fun:isPosInt});
				$("#dt3").formValidator({onshow: "请选择时间",onfocus: "请选择时间"}).functionValidator({fun:isDate});
			 $("#telNo").formValidator({onshow:"请输入联系电话",onfocus:"请输入联系电话"}).functionValidator({fun:isPhoneNumber}); 
				$("#chassisNum").formValidator({onshow:"请输入车架号",onfocus:"请输入车架号"}).inputValidator({min:17,max:17,onerror:"车架号只能是17位"});
				if("" == $("input[name='carPhotoText']").val() || null == $("input[name='carPhotoText']").val()){
			    	$("#carFile").formValidator({onshow:"请选择车辆照片",onfocus:"请选择车辆照片"}).inputValidator({min:1,onerror:"请选择车辆照片"});	
			    }
				if("" == $("input[name='xingshizhengPhotoText']").val() || null == $("input[name='xingshizhengPhotoText']").val()){
			    	$("#xszFile").formValidator({onshow:"请选择行驶证照片",onfocus:"请选择行驶证照片"}).inputValidator({min:1,onerror:"请选择行驶证照片"});	
			    }
				//联系地址校验
				
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
			//设置机构代码
			function setCarId(){
				var time=getNowFormatDate();
				
				 var code="C"+time;
				$("#carId").val(code);
				
				var code2="A"+time;
				$("#applyId").val(code2);
			}
			function getNowFormatDate(){
			    var day = new Date();
			    var Year = 0;
			    var Month = 0;
			    var Day = 0;
			    var hour=0;
			    var minu=0;
			    var mill=0;
			    var secodes=0;
			    var CurrentDate = "";
			    Year= day.getFullYear();//支持IE和火狐浏览器.
			    Month= day.getMonth()+1;
			    Day = day.getDate();
			    hour=day.getHours();
			    minu=day.getMinutes();
			    secodes=day.getSeconds();
			    mill=day.getMilliseconds();
			    
			    CurrentDate += Year;
			    if (Month >= 10 ){
			     CurrentDate += Month;
			    }
			    else{
			     CurrentDate += "0" + Month;
			    }
			    if (Day >= 10 ){
			     CurrentDate += Day ;
			    }
			    else{
			     CurrentDate += "0" + Day ;
			    }
			    if(hour>=10){
			      CurrentDate += hour ;
			    }else{
			      CurrentDate += "0" + hour ;
			    }
			    if(minu>=10){
				  CurrentDate += minu ;
				  }else{
				  CurrentDate += "0" + minu ;
				}
			    if(secodes>=10){
					  CurrentDate += secodes ;
				  }else{
				  CurrentDate += "0" + secodes ;
				}
			    CurrentDate+=mill;
			    return CurrentDate;
			 }
			
			
			//车辆类别级联显示
			  var cateArray = new Array();
			  cateArray[cateArray.length]=new Array("1","新能源");
			  cateArray[cateArray.length]=new Array("2","自然吸气发动机");
			  var titleArray = new Array();
			  titleArray[titleArray.length]=new Array("1","1","续航里程");
			  titleArray[titleArray.length]=new Array("2","2","排量");
			 function setTitle(obj1ID,obj2ID){
			        var objCate = document.getElementById(obj1ID);
			        var objTitle = document.getElementById(obj2ID);
			        var i;
			        var itemArray = null;
			        if(objCate.value.length > 0){
			             itemArray = new Array();
			             for(i=0;i<titleArray.length;i++){
			                if(titleArray[i][0]==objCate.value){
			                    itemArray[itemArray.length]=new Array(titleArray[i][1],titleArray[i][2]);
			                }
			             }
			        }
			        for(i = objTitle.options.length ; i >= 0 ; i--){
			                objTitle.options[i] = null;
			        }
			        objTitle.options[0] = new Option("请选择类型");
			        objTitle.options[0].value = "";
			        if(itemArray != null){
			                for(i = 0 ; i < itemArray.length; i++){
			                        objTitle.options[i+1] = new Option(itemArray[i][1]);
			                        if(itemArray[i][0] != null){
			                           objTitle.options[i].value = itemArray[i][0];
			                        }
			                }
			        }

			   } 
			 function deleteImage(data) {
				if(data=='1'){
				 document.getElementById('imgPreview').style.display='none';
				 document.getElementById('yy').style.display='none';
				 $("#carPhotoText").val('');
				
				}else if(data=='2'){
				 document.getElementById('img').style.display='none';
				 document.getElementById('yl').style.display='none';
				 $("#xingshizhengPhotoText").val('');
				}
				
		     }
		</script>
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
					<div class="title">网约车资质业务许可申请
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
									<input  class="reg_input" type="hidden" size="25" name="carId" id="carId" type="text"  readonly="readonly"/>
							<!-- 	</td>
							</tr> -->
						
							
							<tr height="40">
								<td align="right" colspan="2">驾驶员身份证号</td>
								<td align="left" colspan="4">
									<input class="reg_input" size="25" value="<%=session.getAttribute("userName") %>" name="certNo" id="certNo" type="text" readonly="readonly"/>
								</td>
								<td align="right" colspan="2">车主名称</td>
								<td align="left" colspan="4">
									<input class="reg_input" size="25" value="" name="manCompany" id="manCompany" type="text" />
							</tr>
							<tr height="40">
								<td align="right" colspan="2">联系电话</td>
								<td align="left" colspan="10">
									<input class="reg_input" size="25" value="" name="telNo" id="telNo" type="text" />
									<span id="telNoTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right" colspan="2">联系地址</td>
								<td align="left" colspan="10">
									<textarea class="reg_textarea" cols="50"  rows="3" name="address" id="address" ></textarea>
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
									<input class="reg_input" size="25" value="" name="carNum" id="carNum" type="text"  />
									<span id="carNumTip" class="show"></span>
								</td>
								</tr>
							<tr height="40">
								<td align="right" colspan="2">品牌</td>
								<td align="left" colspan="4">
									<input class="reg_input" size="25" value="" name="labels" id="labels" type="text" />
								</td>
									
								<td align="right" colspan="2">型号</td>
								<td align="left" colspan="4">
									<input class="reg_input" size="25" value="" name="model" id="model" type="text" />
								</td>
								</tr>
							<tr height="40">
								<td align="right" colspan="2">轴距</td>
								<td align="left" colspan="4">
									<input class="reg_input" size="22" value="" name="wheelBase" id="wheelBase" type="text" />毫米
								</td>
								<td align="right" colspan="2">座位数</td>
								<td align="left" colspan="4">
								    <select id="seatNum" name="seatNum">
								       <option value="4">4</option>
								       <option value="7">7</option>
								    </select>
								    <span class="show" id="seatNumTip"></span>
								</td>
							</tr>
							<tr height="40">
								<td align="right" colspan="2">车架号/VIN</td>
								<td align="left" colspan="10">
									<input class="reg_input" size="25" value="" name="chassisNum" id="chassisNum" type="text" />
									<span id="chassisNumTip" class="show"></span>
								</td>
						 </tr>
							<tr height="40">
								<td align="right" colspan="2">初次登记时间</td>
								<td align="left" colspan="4">
									<input type="text" class="reg_input" value="" name="regDate" id=dt3 placeholder="请选择日期" size="25">
									<div id="dd3"></div>
								</td>
							
								<td align="right" colspan="2">发动机号</td>
								<td align="left" colspan="4">
									<input class="reg_input" size="25" value="" name="engineNum" id="engineNum" type="text" />
								</td>
								</tr>
							<input class="reg_input" size="28" value="<%=session.getAttribute("areaCode") %>" name="areaCode" id="areaCode" type="hidden" readonly="readonly"/>
						 <tr height="40">
								<td align="right" colspan="2">行驶证发放机关</td>
								<td align="left" colspan="4">
									<input class="reg_input" size="25" value="" name="endDept" id="endDept" type="text" />
								</td>
								<td align="right" colspan="2">车辆登记证编码</td>
								<td align="left" colspan="4">
									<input class="reg_input" size="25" value="" name="regCode" id="regCode" type="text" />
								</td>
						 </tr>
							<tr height="40">
								<td align="right" colspan="2">车辆类别</td>
								<td align="left" colspan="10">
								     <select id="category" name="category" >
								      <option value="">请选车辆类型</option>
								       <option value="1">新能源</option>
								       <option value="2">自然吸气发动机</option>
								    </select>
								    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								     <select id="economyType" name="economyType">
								     <option value="暂无">请选择类型</option>
								     <option value="续航里程">续航里程</option>
								     <option value="排量">排量</option>
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
									<input class="reg_input" size="28" value="1" name="applyId" id="applyId" type="hidden" readonly="readonly"/>
							<input class="reg_input" size="28" value="1" name="applyType" id="applyType" type="hidden" />
								<td align="center" colspan="2">车辆年检</td>
								<td align="left" colspan="4">
									<input class="reg_input" size="28" value=""  name="inspectionInfo" id="inspectionInfo" type="text" />
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