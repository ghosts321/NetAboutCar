<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${basePath}css/userReg.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui-1.10.4.custom.min.css"/>
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<title>个人基本信息</title>
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
				$.getJSON("${basePath}js/minzu.json",function(datas){
					$.each(datas,function(index,msg){
						if("${drvUserinfo.nation}" == msg.id){
							$("#nation").html(msg.name);
							return false;
						}
					});
				});
				
				var company = "";
				var companyList = "${drvPermitapply.company}".split(",");
				for(var i = 0;i < companyList.length;i++){
					if(companyList[i] == 1){
						company += "滴滴出行，";
					}else if(companyList[i] == 2){
						company += "Uber中国，";
					}else if(companyList[i] == 3){
						company += "神州专车，";
					}else if(companyList[i] == 4){
						company += "首汽约车，";
					}else if(companyList[i] == 5){
						company += "易到";
					}
				}
				if("" != company && null != company){
					$("#company").html(company.substr(0,company.length-1));
				}
			});
			
		</script>
	</head>
	<body>
		<div class="buss_area">
			<div class="personalmenu">
				<jsp:include page="/WEB-INF/jsp/driver/personalMenu.jsp">
					<jsp:param name="leftmenu" value="person1"/>
				</jsp:include>
			</div>
			<div id="workarea" class="workarea">
				<div class="title_area">
					<div class="title">个人相关信息
						<div class="help">
							<%-- <a class="guide" href="javascript:void(0);" onclick="gotoHelp('${basePath}help/toHelpContent3_1_1.action');">操作指南</a> --%>
							<a class="policy" href="javascript:void(0);" onclick="gotoHelp('${basePath}help/toHelpContent3_1_1.action');">相关政策</a>
						</div>
					</div>
				</div>
				<div>
					<form action="addPilotApply.action" method="post" name="form1" id="form1">
						<table width="97%"  border="1" cellpadding="0" cellspacing="0" class="table">
						  <tr height="40">
						    <th width="14%" height="36" align="right">账号：</td>
						    <td width="31%" align="left">${drvUserreg.certno}</td>
						    <th width="22%" align="right">创建时间：</td>
						    <td width="33%" align="left"><fmt:formatDate  value="${drvUserreg.regdatetime}" type="both" pattern="yyyy-MM-dd hh:mm:ss" /></td>
						  </tr>
						  <tr height="40">
						    <th height="39" align="right">手机号：</td>
						    <td align="left">${drvUserreg.phoneno}</td>
						    <td align="right">&nbsp;</td>
						    <td align="left">&nbsp;</td>
						  </tr>
						</table>
						<h1>&nbsp;个人信息</h1>     
						<table width="97%"  border="1" cellpadding="0" cellspacing="0" class="table">
						   <tr height="80">
						     <th width="14%" align="right">姓名：</td>
						     <td width="31%" align="left">${drvUserinfo.username}</td>
						     <th width="22%" align="right">照片：</td>
						     <td width="33%" align="left"><image src="${drvPermitapply.photo}" ></td>
						   </tr>
						   
						  <tr height="40">
						     <th align="right">民族：</td>
						     <td align="left" id="nation"></td>
						     <th align="right">性别：</td>
						     <td align="left">
						     	<c:if test="${drvUserinfo.sex == 0 }">女</c:if>
						     	<c:if test="${drvUserinfo.sex == 1 }">男</c:if>
						     </td>
						   </tr>
						  <tr height="40">
						    <th align="right">所属区域：</td>
						    <td align="left"><%=session.getAttribute("areaName") %></td>
						    <th align="right">身份证号：</td>
						    <td align="left">${drvUserinfo.certno}</td>
						  </tr>
						  <tr height="50">
						     <th align="right">服务平台：</td>
						     <td align="left" id="company"></td>
						     <th align="right">住址：</td>
						     <td align="left">${drvUserinfo.address}</td>
						   </tr>
						 </table>
						<h1>&nbsp;驾照信息</h1>  
						 <table width="97%"  border="1" cellpadding="0" cellspacing="0" class="table">
						  <tr height="40">
						    <th width="14%" height="36" align="right">驾驶证号：</td>
						    <td width="31%" align="left">${drvUserinfo.drivecardno}</td>
						    <th width="22%" align="right">取证时间：</td>
						    <td width="33%" align="left"><fmt:formatDate  value="${drvUserinfo.carddate}" type="both" pattern="yyyy-MM-dd" /></td>
						  </tr>
						  <tr height="40">
						    <th height="39" align="right">驾龄：</td>
						    <td align="left">${drvPermitapply.driveyears}</td>
						    <td align="right">&nbsp;</td>
						    <td align="left">&nbsp;</td>
						  </tr>
						</table>
						<div class="form_button_area">
							<!-- <input id="button" name="button" type="button" value="修改" class="button3" /> -->
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>