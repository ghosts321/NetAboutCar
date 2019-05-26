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
	</style>
<script type="text/javascript">
function gotoMore(creditCode,rec_no,indic_text,comName) {
	var url = "${basePath}terrace/openPunishAppeal.action";
	indic_text = encodeURI(encodeURI(indic_text));
	comName = encodeURI(encodeURI(comName));
	url+="?creditcode="+creditCode+"&rec_no="+rec_no+"&indic_text="+indic_text+"&comName="+comName;
	gotoBuss(url);
}
</script>
</head>
<body>
	<div class="buss_area">
		<div class="personalmenu">
			<jsp:include page="/WEB-INF/jsp/driver/personalMenu.jsp">
				<jsp:param name="leftmenu" value="platForm7"/>
			</jsp:include>
		</div>
		<div id="workarea" class="workarea">
			<div class="title_area">
				<div class="title">处分详情
					<div class="help">
						<a class="policy" href="#" onclick="funcGo(this,'${basePath}terrace/openPunishInfo.action')">返回</a>
					</div>
				</div>
			</div>
			<div>
				<table border="1" class="table">
				    <tr>
				      <th colspan="4">基本信息</th>
				    </tr>
					<tr>
						<th style="text-align: right;width: 150px;">统一社会信用代码：</th>
						<td style="width:200px;">${platform.creditCode}</td>
					    <th style="text-align: right;width: 150px;">企业名称：</th>
						<td style="width:200px;">${platform.comName}</td>
					</tr>
					<tr>
						<th style="text-align: right;">企业简称：</th>
						<td>${platform.shortName}</td>
					    <th style="text-align: right;">网约车平台名称：</th>
						<td>${platform.platformName}</td>
					</tr>
					<tr>
						<th style="text-align: right;">企业营业执照号：</th>
						<td>${platform.busiliceNo}</td>
					    <th style="text-align: right;">注册地址：</th>
						<td>${platform.regAddress}</td>
					</tr>
					<tr>
				      <th colspan="4">违反指标细则</th>
				    </tr>
					<tr>
						<td colspan="4">
							<table width="100%" border="1" class="table">
								<tr>
									<th width="10%">序号</th>
									<th align="center">细则代码</th>
									<th align="center">细则内容</th>
									<th align="center">记分值</th>
									<th align="center">操作</th>
									
								</tr>
								<c:forEach items="${comScoreRecordList}" var="com" varStatus="vs">  
									<tr>
										<td width="10%" align="center">${vs.index + 1}</td>
										<td align="center">${com.indic_code}</td>
										<td align="center">${com.indic_text}</td>
										<td align="center">${com.score}</td>
										<td align="center">
											<c:choose>
												<c:when test="${not empty com.appeal_no}">已申诉</c:when>
												<c:otherwise>
													<a href="#" onclick="gotoMore('${platform.creditCode}','${com.rec_no}','${com.indic_text}','${platform.comName}');">申诉</a>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>