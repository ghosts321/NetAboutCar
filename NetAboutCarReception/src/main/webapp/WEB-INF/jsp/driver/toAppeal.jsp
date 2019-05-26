<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<title>变更申请</title>
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
					<div class="title">驾驶员资质业务许可变更申请
						<%-- <div class="help">
							<a class="guide" href="javascript:void(0);" onclick="gotoHelp('${basePath}help/toHelpContent3_1_1.action');">操作指南</a>
							<a class="policy" href="javascript:void(0);" onclick="gotoHelp('${basePath}help/toHelpContent3_1_1.action');">相关政策</a>
						</div> --%>
					</div>
				</div>
				<div>
					<form action="${basePath}driver/addAppeal.action" method="post" name="form1" id="form1" enctype="multipart/form-data">
						<table class="table" id="basicInfo" width="100%" border="1" cellpadding="5" cellspacing="2">
							<tr height="40">
								<td width="20%" align="right">申诉人姓名：</td>
								<td colspan="3" width="30%" align="left">
									<input class="reg_input" size="25" value="" name="username" id="username" type="text" onkeydown="return banInputSapce(event);" />
									<span id="usernameTip" class="onshow"></span>
								</td>
							</tr>
							
							<tr height="40">
								<td align="right">申诉人身份证号：</td>
								<td colspan="3" align="left">
									<input class="reg_input" size="25" value="" name="certno" id="certno" type="text" />
									<span id="certnoTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td width="20%" align="right">违反指标：</td>
								<td width="30%" align="left">
								<input class="reg_input" size="25" value="${indicText}" name="indicText" id="indicText" type="text"  readonly/>
								</td>
							</tr>
							<tr height="40"><td width="20%" align="right">申诉内容：</td>
								<td align="left">
									<input class="reg_input" size="25" value="" name="appealText" id="appealText" type="text" />
								</td></tr>
							<tr>
								<td colspan="4" align="center">
											<input id="button" name="button" type="submit" value="提交" class="button3"/>
											<input id="button" name="button" type="button" onclick="showMsg();" value="取消" class="button3"/>
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