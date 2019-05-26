<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${basePath}css/userReg.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui-1.10.4.custom.min.css"/>
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<title>申请详细信息</title>
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
			$(function(){
				
			});
			
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
					<div class="title">申请详细信息
						<div class="help">
							<a class="policy" href="#" onclick="funcGo(this,'${basePath}vehicle/openProgressList.action')">返回</a>
						</div>
					</div>
				</div>
				<div>
					<table border="1" class="table">
					    <tr>
					      <th colspan="4">基本信息</th>
					    </tr>
						<tr>
							<th style="text-align: right;width: 100px;">车辆编号：</th>
							<td style="width:200px;">${carInfo.carId}</td>
						    <th style="text-align: right;width: 100px;">车牌号：</th>
							<td style="width:200px;">${carInfo.carNum}</td>
						</tr>
						<tr>
							<th style="text-align: right;">身份证号码：</th>
							<td>${carInfo.certNo}</td>
						    <th style="text-align: right;">车主名称：</th>
							<td>${carInfo.manCompany}</td>
						</tr>
						<tr>
							<th style="text-align: right;">联系地址：</th>
							<td>${carInfo.address}</td>
						    <th style="text-align: right;">联系电话：</th>
							<td>${carInfo.telNo}</td>
						</tr>
						<tr>
							<th style="text-align: right;">车辆类别：</th>
							<td>
						    	<c:choose>  
								    <c:when test="${carInfo.category=='1'}"> 
										     新能源
								    </c:when>  
								    <c:when test="${carInfo.category=='2'}"> 
										     自然吸气发动机
								    </c:when>
								 </c:choose>
						    </td>
							<th style="text-align: right;">轴距：</th>
							<td colspan="3">${carInfo.wheelBase}</td>
						</tr>
						<tr>
							<th style="text-align: right;">发动机号：</th>
							<td>${carInfo.engineNum}</td>
						    <th style="text-align: right;">车架号/VIN：</th>
							<td>${carInfo.chassisNum}</td>
						</tr>
						<tr>
							<th style="text-align: right;">品牌：</th>
							<td>${carInfo.labels}</td>
						    <th style="text-align: right;">型号：</th>
							<td>${carInfo.model}</td>
						</tr>
						<tr>
							<th style="text-align: right;">经济类型：</th>
							<td>
								<c:choose>  
								    <c:when test="${carInfo.economyType=='续航里程'}"> 
										     续航里程
								    </c:when>  
								    <c:when test="${carInfo.economyType=='排量'}"> 
										排量
								    </c:when>
								 </c:choose>
							</td>
						    <th style="text-align: right;">座位数：</th>
							<td>${carInfo.seatNum}</td>
						</tr>
						<tr>
							<th style="text-align: right;">车辆登记证编码：</th>
							<td>${carInfo.regCode}</td>
						    <th style="text-align: right;">初次登记时间：</th>
							<td>${carInfo.regDate}</td>
						</tr>
						
						<tr>
					      <th colspan="4">申请信息</th>
					    </tr>
						<tr>
							<th style="text-align: right;">申请机构代码：</th>
							<td>${carPermitApply.instId}</td>
							<th style="text-align: right;">车辆年检信息：</th>
							<td>${carPermitApply.inspectionInfo}</td>
						</tr>
						<tr>
							<th style="text-align: right;">外勘资料：</th>
							<td>
								<c:choose>  
								    <c:when test="${carPermitApply.externalExploration==null}"> 
										    无
								    </c:when>  
								    <c:otherwise>
										<a href="${carPermitApply.externalExploration}">点击下载</a>
									</c:otherwise>	
								 </c:choose>
							</td>
						    <th style="text-align: right;">变更车辆性质文件：</th>
							<td>
								<c:choose>  
								    <c:when test="${carPermitApply.changeProperty==null}"> 
										    无
								    </c:when>  
								    <c:otherwise>
								    	<img class="imgStyle" src="${carPermitApply.changeProperty}">
									</c:otherwise>	
								 </c:choose>
							</td>
						</tr>
						
						<tr>
							<th style="text-align: right;">车辆照片：</th>
							<c:set value="${ fn:split(carPermitApply.carPhoto, ';') }" var="url" />
							<td>
							  <c:forEach items="${url}" var="s">
								<c:if test="${s=='' }">
							     	<img class="imgStyle" src="${basePath}static/images/zwzp.png">
							     </c:if>
							     <c:if test="${s!='' }">
								 	<img class="imgStyle" src="${s}">
								 </c:if>	
							  </c:forEach>
							</td>
						    <th style="text-align: right;">行驶证照片：</th>
							<c:set value="${ fn:split(carPermitApply.drivePhoto, ';') }" var="url" />
							<td>
							  <c:forEach items="${url}" var="s">
								<c:if test="${s=='' }">
							     	<img class="imgStyle" src="${basePath}static/images/zwzp.png">
							     </c:if>
							     <c:if test="${s!='' }">
								 	<img class="imgStyle" src="${s}">
								 </c:if>	
							  </c:forEach>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>