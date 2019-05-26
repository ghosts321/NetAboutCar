<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<title></title>
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
		<script type="text/javascript">
		var msgg =  '<%=request.getAttribute("responseMsg")%>';
		if(msgg == "success"){
			alert("预约成功");
			 window.location.href='${basePath}system/openMain.action';
		}else if(msgg != "null") {
			 alert(msgg);
			 window.location.href='${basePath}system/openMain.action';
			}
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
		}
		 
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
		        		if(codeJson!= ""){
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
							width: 212,
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
			
			$(document).ready(function(){
				$.formValidator.initConfig({formid:"form1",debug:false,submitonce:true,
					onerror:function(msg,obj,errorlist){
						//$.map(errorlist,function(msg1){alert(msg1)});
						alert(msg);
					},
					onsuccess:function(){
					$("#form1").ajaxSubmit({
	                    type:'post',
	                    url:'${basePath}driver/addappealDetail.action',
	                    success:function(data){
	                    	if(data == "success"){
	                    		alert("申诉成功")
	                    		$("#main").load("${basePath}driver/openDrvCaseInfo.action", function() {});
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
				
				//联系地址校验
				$("#address").blur(function(){
			    	 var address = $("#address").val(); //ur事件
			    	 if(address == ""){
			    			$("#address").tips({
			    				side:2,				   //1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'请填写联系地址！',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#address").focus();
			    	 }else if(address.length<5 || address.length>50){
			    		 $("#address").tips({
			    				side:2,				   //1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'输入错误！',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#address").focus();
			    	 }
				});
			    //车主姓名校验
				$("#manCompany").blur(function(){
			    	 var manCompany = $("#manCompany").val(); //ur事件
			    	 if(manCompany == ""){
			    			$("#manCompany").tips({
			    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'请输入车主姓名！',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#manCompany").focus();
			    			}else if(manCompany.length<2){
			    			$("#manCompany").tips({
			    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'输入有误！',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#manCompany").focus();
			    	 }
				});
				//联系电话校验
				$("#telNo").blur(function(){
			    	 var telNo = $("#telNo").val(); //ur事件
			    	 if(telNo == ""){
			    			$("#telNo").tips({
			    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'请输入联系电话！',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#telNo").focus();
			    			}else{
			    	 $.ajax({
				    	  data : "num=" + telNo, //传输的数据
				    	  type : "POST", // 用POST方式传输 
				    	  url : '${basePath}vehicle/validateTel.action', //目标地址
				    	  dataType : "json", // 数据格式
				    	  success : function(data) {
				    	  if(data==0){
				    		  $("#telNo").tips({
				    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
				    	            msg:'手机号必须是11位！',
				    	            bg:'#AE81FF',
				    	            time:2
				    	        });
				    			$("#telNo").focus();
				    	  }else if(data==2){
				    		  $("#telNo").tips({
				    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
				    	            msg:'手机号格式有误！',
				    	            bg:'#AE81FF',
				    	            time:2
				    	        });
				    			$("#telNo").focus();
				    	  }
				    	 		 }
				    	});
			    			}
				});
				//长度校验
				$("#length").blur(function(){
			    	 var length = $("#length").val(); //ur事件
			    	 if(length == ""){
			    			$("#length").tips({
			    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'请输入长度！',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#length").focus();
			    			}
			    	 $.ajax({
				    	  data : "num=" + length, //传输的数据
				    	  type : "POST", // 用POST方式传输 
				    	  url : '${basePath}vehicle/validateHLW.action', //目标地址
				    	  dataType : "json", // 数据格式
				    	  success : function(data) {
				    	  if(data==0){
							 	$("#length").tips({
							 		msg:'必须为10以下的整数或包含一位小数',
							 		bg:'#AE81FF',
							 		side:2,
							 		time:2
							 	});
							 	$("#length").focus();
				    	  		}
				    	 		 }
				    		 });
			    	 
				});
				//宽度校验
				$("#width").blur(function(){
			    	 var width = $("#width").val(); //ur事件
			    	 if(width == ""){
			    			$("#width").tips({
			    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'请输入宽度！',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#width").focus();
			    			}else{
			    	 $.ajax({
				    	  data : "num=" + width, //传输的数据
				    	  type : "POST", // 用POST方式传输 
				    	  url : '${basePath}vehicle/validateHLW.action', //目标地址
				    	  dataType : "json", // 数据格式
				    	  success : function(data) {
				    	  if(data==0){
							 	$("#width").tips({
							 		msg:'必须为10以下的整数或包含一位小数',
							 		bg:'#AE81FF',
							 		side:2,
							 		time:2
							 	});
							 	$("#width").focus();
				    	  }
				    	 		 }
				    		 });
			    			}
				});
				//高度校验
				$("#height").blur(function(){
			    	 var height = $("#height").val(); //ur事件
			    	 if(height == ""){
			    			$("#height").tips({
			    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'请输入高度！',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#height").focus();
			    			}else{
					    	 $.ajax({
						    	  data : "num=" + height, //传输的数据
						    	  type : "POST", // 用POST方式传输 
						    	  url : '${basePath}vehicle/validateHLW.action', //目标地址
						    	  dataType : "json", // 数据格式
						    	  success : function(data) {
						    	  if(data==0){
									 	$("#height").tips({
									 		msg:'必须为10以下的整数或包含一位小数',
									 		bg:'#AE81FF',
									 		side:2,
									 		time:2
									 	});
									 	$("#height").focus();
						    	  }
						    	 		 }
						    		 });
					    		
			    			}
				});
				//轴距校验
				$("#wheelBase").blur(function(){
			    	 var wheelBase = $("#wheelBase").val(); //ur事件
			    	 if(wheelBase == ""){
			    			$("#wheelBase").tips({
			    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'请输入轴距！',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#wheelBase").focus();
			    			}
			    	 var string = wheelBase.split('.');
			    	var length=string.length;
			    	
					  if(wheelBase<0||length!=1){
							  $("#wheelBase").tips({
				    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
				    	            msg:'必须为正整数！',
				    	            bg:'#AE81FF',
				    	            time:2
				    	        });
				    			$("#wheelBase").focus();
						 				
					  }
					});
				//总质量校验
				$("#totalQuality").blur(function(){
			    	 var totalQuality = $("#totalQuality").val(); //ur事件
			    	 if(totalQuality == ""){
			    			$("#totalQuality").tips({
			    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'请输入总质量！',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#totalQuality").focus();
			    			}
			    	 var string = totalQuality.split('.');
				    	var length=string.length;
				    	
						  if(totalQuality<0||length!=1){
								  $("#totalQuality").tips({
					    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
					    	            msg:'必须为正整数！',
					    	            bg:'#AE81FF',
					    	            time:2
					    	        });
					    			$("#totalQuality").focus();
							 				
						  }
				});
				//选择日期校验
				$("#dt").blur(function(){
			    	 var dt = $("#dt").val(); //ur事件
			    	 if(dt == ""){
			    			$("#dt").tips({
			    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'请选择时间！',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#dt").focus();
			    			}
				});
				//选择日期校验
				$("#dt2").blur(function(){
			    	 var dt2 = $("#dt2").val(); //ur事件
			    	 if(dt2 == ""){
			    			$("#dt2").tips({
			    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'请选择时间！',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#dt2").focus();
			    			}
				});
				//购买价格校验
				$("#purchasePrice").blur(function(){
			    	 var purchasePrice = $("#purchasePrice").val(); //ur事件
			    	 if(purchasePrice == ""){
			    			$("#purchasePrice").tips({
			    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'请输入购买价格！',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#purchasePrice").focus();
			    			}
				});
				//选择日期校验
				$("#dt3").blur(function(){
			    	 var dt3 = $("#dt3").val(); //ur事件
			    	 if(dt3 == ""){
			    			$("#dt3").tips({
			    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'请选择日期！',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#dt3").focus();
			    			}
				});
				//选择日期校验
				$("#dt4").blur(function(){
			    	 var dt4 = $("#dt4").val(); //ur事件
			    	 if(dt4 == ""){
			    			$("#dt4").tips({
			    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'请选择日期！',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#dt4").focus();
			    			}
				});
				//发动机号校验
				$("#engineNum").blur(function(){
			    	 var engineNum = $("#engineNum").val(); //ur事件
			    	 if(engineNum == ""){
			    			$("#engineNum").tips({
			    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'请输入发动机号！',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#engineNum").focus();
			    			}
				});
				//车架号校验
				$("#chassisNum").blur(function(){
			    	 var chassisNum = $("#chassisNum").val(); //ur事件
			    	 if(chassisNum == ""){
			    			$("#chassisNum").tips({
			    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'请输入车架号！',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#chassisNum").focus();
			    			}else if(chassisNum.length>17 || chassisNum.length<17){
			    		 $("#chassisNum").tips({
			    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'车架号只能是17位！',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#chassisNum").focus(); 
			    	 }
				});
				//车牌号校验
				$("#carNum").blur(function(){
			    	 var carNum = $("#carNum").val(); //ur事件
			    	 if(carNum == ""){
			    			$("#carNum").tips({
			    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'请输入车牌号！',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#carNum").focus();
			    			}else if(carNum.length>7||carNum.length<7){
			    		 $("#carNum").tips({
			    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'车牌号只能是7位',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#carNum").focus();
			    	 }
				});
				//车辆照片校验
				$("#carPhotoText").blur(function(){
			    	 var carPhotoText = $("#carPhotoText").val(); //ur事件
			    	 alert(carPhotoText);
			    	 if(carPhotoText == "" || null ==carPhotoText){
			    			$("#carPhotoText").tips({
			    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'请选择照片！',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#carPhotoText").focus();
			    			}
				});
			   //行驶证照片校验
				$("#xingshizhengPhotoText").blur(function(){
			    	 var xingshizhengPhotoText = $("#xingshizhengPhotoText").val(); //ur事件
			    	 if(xingshizhengPhotoText == "" || null ==xingshizhengPhotoText){
			    			$("#xingshizhengPhotoText").tips({
			    				side:2,//1.输入框的上面2.输入框的有右面3.输入框的下方4.输入框的左面
			    	            msg:'请选择照片！',
			    	            bg:'#AE81FF',
			    	            time:2
			    	        });
			    			$("#xingshizhengPhotoText").focus();
			    			}
					});
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
		</script>
	</head>
	<body>
		<div class="buss_area">
			<div class="personalmenu">
				<jsp:include page="/WEB-INF/jsp/driver/personalMenu.jsp">
					<jsp:param name="leftmenu" value="person6"/>
				</jsp:include>
			</div>
			<div id="workarea" class="workarea">
				<div class="title_area">
					<div class="title">申诉
					</div>
				</div>
				<div>
					<form action="${basePath}driver/addappealDetail.action" method="post" name="form1" id="form1" enctype="multipart/form-data" align="center">
						
					<table width="100%" border="1" class="table">
			<tr>
				<th style="text-align: right;">申诉案件编号：</th>
				<td style=" text-align: left;" colspan="2">${plantCaseInfo.caseid}</td>
			</tr>
			<tr>
				<th style="text-align: right;">案发时间：</th>
				<td style=" text-align: left;" colspan="2">${plantCaseInfo.casetime}</td>
			</tr>
			<tr>
				<th style="text-align: right;">案件事由：</th>
				<td style=" text-align: left;" colspan="2">${plantCaseInfo.casereason}</td>
			</tr>
			<tr>
				<th style="text-align: right;">处罚类型：</th>
				<td style=" text-align: left;" colspan="2"><c:choose>  
					    <c:when test="${plantCaseInfo.punishtype=='0001'}"> 
							     口头警告 
					    </c:when>      
					    <c:when test="${plantCaseInfo.punishtype=='0002'}"> 
							      两百元以下罚款
					    </c:when>
					    <c:when test="${plantCaseInfo.punishtype=='0003'}"> 
							      暂扣或吊销驾驶证
					    </c:when>
					 </c:choose></td>
			</tr>
			<tr>
				<th style="text-align: right;">处罚内容：</th>
				<td style=" text-align: left;" colspan="2">${plantCaseInfo.punishcontent}</td>
			</tr>
			<tr>
				<th style="text-align: right;">申诉人：</th>
				<td style=" text-align: left;" colspan="2">
				<input class="file_textbox" type="text" id="appealuserid" name="appealuserid"></td>
			</tr>
			<tr>
				<th align="right">申诉文件：</th>
				<td  style="text-align: left;" colspan="2">
				 <div class="box">
					<input type="text" name="compn" id="compn" class="file_textbox" />
						<a href="javascript:void(0);" class="upload_link">上传</a>
					<input type="file" multiple  class="uploadFile" name="surveyfile"  id="surveyfile" onchange="getFile(this,'compn')" />
				</div>         
				</td>
			</tr> 

			<tr>
				<th style="text-align: right;">申诉内容：</th>
				<td align="left" colspan="2"><textarea  name="appealcontent" id="appealcontent" style="width:180px;height:50px;"></textarea></td>
				
				
				
			</tr>
							<input type="hidden" id="caseid" name="caseid" value="${plantCaseInfo.caseid}" />
						</table> 
						<div class="form_button_area">
			
							<center>
							<input id="button" name="button" type="submit" value="确认提交" class="button3" />
							</center>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>