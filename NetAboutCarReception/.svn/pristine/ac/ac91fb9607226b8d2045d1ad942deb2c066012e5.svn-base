<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${basePath}css/userReg.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}css/calendar.css">
		<link rel="stylesheet" type="text/css" href="${basePath}css/jquery.selectlist.css"/>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui-1.10.4.custom.min.css"/>
		<script src="<%=request.getContextPath()%>/js/formValidator_min.js" type="text/javascript" charset="UTF-8"></script>
		<script src="<%=request.getContextPath()%>/js/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
		<script src="<%=request.getContextPath()%>/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript" charset="UTF-8"></script>
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidator_min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidatorRegex.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery-ui-1.10.4.custom.min.js"></script>
		<script type="text/javascript" src="${basePath}js/calendar.js"></script> 
		<script type="text/javascript" src="${basePath}js/jquery.selectlist.js"></script>
		<title>平台基本信息</title>
		<style type="text/css">
			.STYLE1 {color: #2E863E;font-family:'Microsoft YaHei';font-size: 12px}
			 .divStyle {
				width:78%;
				border: 1px solid #E5E5E5;
				min-height:200px;
				-webkit-box-shadow: 3px 3px 50px #E5E5E5;
				box-shadow: 3px 3px 50px #E5E5E5;
				margin: 10px 0 10px 5px
			 }
			body,table{
			font-size:13px;
			}
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
			padding:0 0.5em 0;
			}
			.table tr.alter{
			background-color:#f5fafe;
			}
		</style>
		<script type="text/javascript">
			$(function(){
				$("select").selectlist({
					zIndex: 10,
					width: 230,
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
						width: 230,
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
					<jsp:param name="leftmenu" value="platForm1"/>
				</jsp:include>
			</div>
			<div id="workarea" class="workarea">
				<div class="title_area">
					<div class="title">平台相关信息
						<div class="help">
							<%-- <a class="guide" href="javascript:void(0);" onclick="gotoHelp('${basePath}help/toHelpContent3_1_1.action');">操作指南</a> 
							<a class="policy" href="javascript:void(0);" onclick="gotoHelp('${basePath}help/toHelpContent3_1_1.action');">相关政策</a>--%>
						</div>
					</div>
				</div>
				<div>
					<form action="addPilotApply.action" method="post" name="form1" id="form1">
						<table width="97%"  border="1" cellpadding="0" cellspacing="0" class="table">
						  <tr height="40">
						    <th width="20%" height="36" align="right">社会信用代码：</td>
						    <td width="30%" align="left"><%=session.getAttribute("userName") %></td>
						    <th width="20%" align="right">创建时间：</td>
						    <td width="30%" align="left">${platformUserReg.regDateTime}</td>
						  </tr>
						  <tr height="40">
						    <th height="39" align="right">手机号：</td>
						    <td align="left">${platformUserReg.phoneNo}</td>
						    <td align="right">&nbsp;</td>
						    <td align="left">&nbsp;</td>
						  </tr>
						</table>
						<h1>&nbsp;企业信息</h1>     
						<table width="97%"  border="1" cellpadding="0" cellspacing="0" class="table">
						   <tr height="80">
						     <th width="20%" align="right">企业名称：</td>
						     <td width="30%" align="left">${platform.comName}</td>
						      <th width="20%" align="right">照片：</td>
						      <td width="30%" align="left"><%--<image src="${platform.photo}" >--%></td>   
						   </tr>
						   
						  <tr height="40">
						     <th align="right">法人姓名：</td>
						     <td align="left">${platform.corpName}</td>
						     <th align="right">法人身份证：</td>
						     <td align="left">${platform.corpcertNo}</td>
						   </tr>
						  <tr height="40">
						    <th align="right">所属区域：</td>
						    <td align="left"><%=session.getAttribute("areaName") %></td>
						    <th align="right">公司地址：</td>
						    <td align="left">${platform.postAddress}</td>
						  </tr>
						 <!--  <tr height="50">
						     <th align="right">经营范围：</td>
						     <td align="left" colspan="3">计算机软件设计开发，产品维护，系统建设，中间件开发等;</td>
						   </tr> -->
						 </table>
						<h1>&nbsp;资质信息</h1>  
						 <table width="97%"  border="1" cellpadding="0" cellspacing="0" class="table">
						  <tr height="40">
						    <th width="20%" height="36" align="right">营业执照：</td>
						    <td width="30%" align="left"><!-- <a href="javascript:void(0)">查看 -->${platform.busiliceNo}</a></td>
						    <th width="20%" align="right">荣誉证书：</td>
						    <td width="30%" align="left"><a href="javascript:void(0)">查看</a></td>
						  </tr>
						  <tr height="40">
						    <th height="39" align="right">其他：</td>
						    <td align="left"><a href="javascript:void(0)">查看</a></td>
						    <td align="right">&nbsp;</td>
						    <td align="left">&nbsp;</td>
						  </tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>