<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>投诉页面</title>
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
		<style type="text/css">
			.buss_area .complain_block {
				width: 100%;
				float: center;
				margin: 15px 0px 0px;
			}
			
			.buss_area .complain_block:after {
				content: ".";
				display: block;
				height: 0;
				clear: both;
				visibility: hidden;
			}
			
			.buss_area .complain_block .title_bar {
				height: 40px;
				line-height: 40px;
				font-size: 16px;
				color: #e60000;
				background: #f5f5f5 none repeat scroll 0 0;
				border-top: 2px solid #e60000;
				padding: 0px 10px;
			}
			
			.buss_area .complain_block .title_bar:after {
				content: ".";
				display: block;
				height: 0;
				clear: both;
				visibility: hidden;
			}
			
			.buss_area .complain_block .title_bar i {
				margin-right: 5px;
			}
			
			.buss_area .complain_block .search_area {
				margin: 0px;
			}
			
			.buss_area .complain_block .search_area .search_tabs {
				
			}
			
			.buss_area .complain_block .search_area .search_tabs:after {
				content: ".";
				display: block;
				height: 0;
				clear: both;
				visibility: hidden;
			}
			
			.buss_area .complain_block .search_area .search_tabs li {
				width: 50%;
				line-height: 20px;
				float: left;
			}
			
			.buss_area .complain_block .search_area li:after {
				content: ".";
				display: block;
				height: 0;
				clear: both;
				visibility: hidden;
			}
			
			.buss_area .complain_block .search_area .search_tabs li a {
				line-height: 20px;
				padding: 10px 8px;
				text-align: center;
				display: block;
				background-color: #f0f0f0;
				border-top: 1px solid #f0f0f0;
				border-left: 1px solid #f0f0f0;
				border-right: 1px solid #f0f0f0;
				cursor: pointer;
			}
			
			.buss_area .complain_block .search_area .search_tabs li a:hover
				{
				background-color: #eee0e6;
				border-top: 1px solid #eee0e6;
				border-left: 1px solid #eee0e6;
				border-right: 1px solid #eee0e6;
			}
			
			.buss_area .complain_block .search_area .search_tabs li a.active
				{
				background-color: #ffffff;
				border-top: 1px solid #dddddd;
				border-left: 1px solid #dddddd;
				border-right: 1px solid #dddddd;
			}
			
			.buss_area .complain_block .search_area .search_cont {
				border-bottom: 1px solid #e5e5e5;
				border-left: 1px solid #e5e5e5;
				border-right: 1px solid #e5e5e5;
			}
			
			.buss_area .complain_block .search_area .search_cont .tab_panel
				{
				margin: 0px 10px 8px;
				display: none;
			}
			
			.buss_area .complain_block .search_area .search_cont .tab_panel.active
				{
				display: block;
			}
			
			.buss_area .complain_block .search_area .search_cont .tab_panel .t_title
				{
				border-bottom: 1px dotted #ccc;
				color: #555555;
				font-size: 14px;
				font-weight: bold;
				line-height: 24px;
				margin-bottom: 10px;
				padding: 5px;
			}
			
			.buss_area .complain_block .search_area .search_cont .tab_panel .t_inp
				{
				padding: 5px 0px;
				margin: 0px;
				text-align: center;
			}
			
			.buss_area .complain_block .search_area .search_cont .tab_panel .t_button
				{
				line-height: 20px;
				width: 15%;
				font-size: 16px;
				border-radius: 3px;
				-moz-border-radius: 3px;
				-webkit-border-radius: 3px;
				margin: 15px 0px 5px;
				padding: 6px 14px;
				text-align: center;
				float: center;
				overflow: visible;
				text-transform: uppercase;
				cursor: pointer;
				background-color: #e60000;
				background-image: linear-gradient(to bottom, #e60000, #e60000);
				border: 1px solid #e60000;
				color: #ffffff;
			}
			
			.buss_area .complain_block .search_area .search_cont .tab_panel .t_button:hover
				{
				background-color: #fe280e;
				background-image: linear-gradient(to bottom, #fe280e, #e60000);
				text-shadow: 0 1px rgba(0, 0, 0, 0.1);
			}
			
			.buss_area .complain_block .search_area .search_cont .tab_panel .t_button i
				{
				margin-right: 6px;
			}
			
		</style>
		<script type="text/javascript">
			$(function(){
				$("select").selectlist({
					zIndex: 10,
					width: 230,
					height: 25
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
				
			});
			$(document).ready(function(){
				$.formValidator.initConfig({formid:"form1",debug:false,submitonce:false,
					onerror:function(msg,obj,errorlist){
						//$.map(errorlist,function(msg1){alert(msg1)});
						alert(msg);
					},
					onsuccess:function(){
						if($("input[name='carCompany']").val() == ""){
							alert("车辆所属运营公司不能为空");
						}else{
							$("#form1").ajaxSubmit({
			                    type:'post',
			                    url:'${basePath}system/addBnsComplain.action',
			                    success:function(data){
			                    	if(data == "success"){
			                    		alert("投诉成功！");
			                    		$("#main").load("${basePath}system/openComplain.action", function() {});
									}else if(data == "error"){
										alert("投诉失败！");
									}
			                    }
			                });
						}
						return false;
					}
				});
				
				$("#complainName").formValidator({onshow:"请输入姓名",onfocus:"请输入姓名"}).functionValidator({fun:isChinese});
			    $("#phoneNumber").formValidator({onshow:"请输入手机号码",onfocus:"请输入手机号码"}).functionValidator({fun:isPhoneNumber});
		    	$("#complainReason").formValidator({onshow:"请输入投诉内容",onfocus:"请输入投诉内容"}).inputValidator({min:1,onerror:"请输入投诉内容"});	
			});
		</script>
	</head>

	<body>
		<div class="buss_area">
			<div class="complain_block">
				<div class="title_bar">
					<i class="fa fa-envelope-o"></i>投诉
				</div>
				<div class="search_area">
					<div class="search_cont">
						<div id="serach1" class="tab_panel active">
							<form method="post" name="form1" id="form1" >
								<table width="100%" border="0" cellpadding="5" cellspacing="2">
									<tr height="40">
										<td width="38%" align="right">投诉车牌号：</td>
										<td width="20%" align="left">
											<input type="text" class="reg_input" size="25" name="carNumber" id="carNumber" placeholder="请输入投诉车牌号码">
										</td>
									</tr>
									<tr height="40">
										<td align="right">乘车时间：</td>
										<td align="left">
											<input type="text" class="reg_input" name="rideTime" id="dt" placeholder="请选择乘车时间" size="25">
											<div id="dd"></div>
										</td>
										<td align="left"></td>
									</tr>
									<tr height="40">
										<td align="right">车辆运输证：</td>
										<td align="left">
											<input type="text" class="reg_input" size="25" name="carLicence" id="carLicence" placeholder="请输入网约车运输证号">
										</td>
										<td align="left"></td>
									</tr>
									<tr height="40">
										<td align="right">驾驶员证号：</td>
										<td align="left">
											<input type="text" class="reg_input" size="25" name="driverLicence" id="driverLicence" placeholder="请输入网约车驾驶员证号">
										</td>
										<td align="left"></td>
									</tr>
									<tr height="40">
										<td align="right">车辆所属公司：</td>
										<td align="left">
											<select name="carCompany" id="carCompany">
										        <option value="">请输入车辆所属运营公司</option>
										        <c:forEach items="${platformList}" var="platform">
													<option value="${platform.creditCode}">${platform.platformName}</option>
												</c:forEach>
								    		</select>
										</td>
										<td align="left"></td>
									</tr>
									<tr height="40">
										<td align="right">投诉人姓名：</td>
										<td align="left">
											<input type="text" class="reg_input" size="25" name="complainName" id="complainName" placeholder="请输入投诉人姓名">
										</td>
										<td align="left"><span id="complainNameTip" class="onshow"></span></td>
									</tr>
									<tr height="40">
										<td align="right">投诉人电话：</td>
										<td align="left">
											<input type="text" class="reg_input" size="25" name="phoneNumber" id="phoneNumber" placeholder="请输入投诉人电话">
										</td>
										<td align="left"><span id="phoneNumberTip" class="onshow"></span></td>
									</tr>
									<tr height="40">
										<td align="right">投诉内容：</td>
										<td align="left">
											<textarea class="reg_textarea" cols="28" rows="5" name="complainReason" id="complainReason" placeholder="请输入投诉内容"></textarea>
										</td>
										<td align="left"><span id="complainReasonTip" class="onshow"></span></td>
									</tr>
								</table>
								<div class="t_inp">
									<button class="t_button" type="submit" id="button" name="button">
										<i class="fa fa-envelope-o"></i>投诉
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
