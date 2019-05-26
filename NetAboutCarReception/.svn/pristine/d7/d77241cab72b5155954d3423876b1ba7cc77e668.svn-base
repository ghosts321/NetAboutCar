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
		<title></title>
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
			.imgStyle{
				margin-bottom:0.5em;
				width: 220px;
				height: 150px;
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
					<div class="title">申诉
						<div class="help">
							<a class="policy" href="#" onclick="funcGo(this,'${basePath}driver/openPenaltyInfo.action')">返回</a>
						</div>
					</div>
				</div>
				<div>
					<table border="1" class="table">
						<tr>
							<th style="text-align: right;width: 100px;">申诉案件编号：</th>
							<td style="width:200px;">C190C8008</td>
						</tr>
						<tr>
						    <th style="text-align: right;width: 100px;">案发时间：</th>
							<td style="width:200px;">
								2017-3-30 23:23:10
							</td>
						</tr>
						<tr>
							<th style="text-align: right;">案件事由：</th>
							<td>违章停车</td>
						</tr>
						<tr>
							<th style="text-align: right;">申诉人：</th>
							<td>
								张三
							</td>
						</tr>
						<tr>
							<th style="text-align: right;">申诉内容：</th>
							<td>
							<textarea class="reg_textarea" cols="45" rows="3"></textarea>
							</td>
						</tr>
						<tr>
								<td></td>
								<td>
									<input id="confirm" name="button" type="submit" value="确认申诉" class="button3" />
								</td>
							</tr>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>