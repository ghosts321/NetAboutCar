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
				$.ajaxSettings.async = false; //设置getJson同步
				$.getJSON("${basePath}js/minzu.json",function(datas){
					$.each(datas,function(index,msg){
						if("${drv.nation}" == msg.id){
							$("#nationTd").html(msg.name);
							return false;
						}
					});
				});
				$.ajaxSettings.async = true;//设置getJson异步
				
				var certphotoImg = "";
				if("" != "${permitapply.certphoto}" && null != "${permitapply.certphoto}"){
					var certphoto = "${permitapply.certphoto}".split('#');
					for(var i = 0;i < certphoto.length;i++){
						certphotoImg += "<img class='imgStyle' src='"+certphoto[i]+"'>";
					}
				}
				$("#certphotoTd").html(certphotoImg);
				var drivecardphotoImg = "";
				if("" != "${permitapply.drivecardphoto}" && null != "${permitapply.drivecardphoto}"){
					drivecardphotoImg = "<img class='imgStyle' src='${permitapply.drivecardphoto}'>";
				}
				$("#drivecardphotoTd").html(drivecardphotoImg);
			});
			
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
					<div class="title">申请详细信息
						<div class="help">
							<a class="policy" href="#" onclick="funcGo(this,'${basePath}driver/openProgress.action')">返回</a>
						</div>
					</div>
				</div>
				<div>
					<table border="1" class="table">
					    <tr>
					      <th colspan="4">驾驶员信息</th>
					    </tr>
						<tr>
							<th style="text-align: right;width: 100px;">姓名：</th>
							<td style="width:200px;">${drv.username}</td>
						    <th style="text-align: right;width: 100px;">性别：</th>
							<td style="width:200px;">
								<c:if test="${drv.sex==1}">男</c:if>
								<c:if test="${drv.sex==0}">女</c:if>
							</td>
						</tr>
						<tr>
							<th style="text-align: right;">区域编码：</th>
							<td>${drv.areacode}</td>
						    <th style="text-align: right;">民族：</th>
							<td id="nationTd">${drv.nation}</td>
						</tr>
						<tr>
							<th style="text-align: right;">政治背景：</th>
							<td>
								<c:if test="${drv.political==0}">群众</c:if>
								<c:if test="${drv.political==1}">团员</c:if>
								<c:if test="${drv.political==2}">党员</c:if>
							</td>
						    <th style="text-align: right;">身份证号：</th>
							<td>${drv.certno}</td>
						</tr>
						<tr>
							<th style="text-align: right;">学历：</th>
							<td>
								<c:if test="${drv.education==0}">初中</c:if>
								<c:if test="${drv.education==1}">高中</c:if>
								<c:if test="${drv.education==2}">中技</c:if>
								<c:if test="${drv.education==3}">中专</c:if>
								<c:if test="${drv.education==4}">大专</c:if>
								<c:if test="${drv.education==5}">本科</c:if>
								<c:if test="${drv.education==6}">硕士</c:if>
								<c:if test="${drv.education==7}">博士</c:if>
								<c:if test="${drv.education==8}">博士后</c:if>
								<c:if test="${drv.education==9}">教授</c:if>
							</td>
							<th style="text-align: right;">户籍所在地：</th>
							<td>${drv.censusaddr}</td>
						</tr>
						<tr>
							<th style="text-align: right;">现在住址：</th>
							<td>${drv.address}</td>
							<th style="text-align: right;">手机：</th>
							<td>${drv.telno}</td>
						</tr>
						<tr>
							<th style="text-align: right;">紧急联系人：</th>
							<td>${drv.contactname}</td>
						    <th style="text-align: right;">紧急联系电话：</th>
							<td>${drv.contacttelno}</td>
						</tr>
						<tr>
							<th style="text-align: right;">居住证：</th>
							<td>${drv.residencepermit}</td>
						    <th style="text-align: right;">车辆档案号：</th>
							<td>${drv.filenumber}</td>
						</tr>
						<tr>
							<th style="text-align: right;">驾驶证号：</th>
							<td>${drv.drivecardno}</td>
						    <th style="text-align: right;">驾驶证取证时间：</th>
							<td>
								<fmt:formatDate  value="${drv.carddate}" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
						</tr>
						<tr>
							<th style="text-align: right;">发证机关：</th>
							<td>${drv.carissuingagency}</td>
						    <th style="text-align: right;">驾驶证准驾车型：</th>
							<td>
								<c:if test="${drv.cardrivingtype==0}">小型车</c:if>
								<c:if test="${drv.cardrivingtype==1}">中型车</c:if>
								<c:if test="${drv.cardrivingtype==2}">大型车</c:if>
							</td>
						</tr>
						<tr>
						    <th style="text-align: right;">创建时间：</th>
							<td>
								<fmt:formatDate  value="${drv.createdatetime}" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<th style="text-align: right;">申请时间：</th>
							<td>
								<fmt:formatDate  value="${permitapply.applydate}" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
						</tr>
						<tr>
							
							<th style="text-align: right;">身份认证状态：</th>
							<td>
								<c:if test="${permitapply.checkstatus==null}">未认证</c:if>
								<c:if test="${permitapply.checkstatus==1}">已提交认证</c:if>
								<c:if test="${permitapply.checkstatus==2}">认证中</c:if>
								<c:if test="${permitapply.checkstatus==3}">认证未通过</c:if>
								<c:if test="${permitapply.checkstatus==4}">认证通过</c:if>
							</td>
							<th style="text-align: right;">记录内容：</th>
							<td>${permitapply.recordcont}</td>
						</tr>
						<tr>
						    <th style="text-align: right;">个人照片(白底1寸)：</th>
							<td><img width='120' height='140' src="${permitapply.photo}"></td>
							<th style="text-align: right;">驾驶证照片：</th>
							<td id="drivecardphotoTd"></td>
						</tr>
						<tr>
							<th style="text-align: right;">身份证照片：</th>
							<td colspan="3" id="certphotoTd"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>