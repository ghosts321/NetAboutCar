<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${basePath}css/ystep.css" />
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${basePath}js/ystep.js"></script>
		<title>进度查询</title>
		<script type="text/javascript">
		$(function() {
			var appstatus = '${appstatus}';
			var applytype = '${applytype}';
			if(applytype == 5){
				$(".ystep").loadStep({
				      size: "large",
				      color: "blue",
				      steps: [{
				        title: "申请"
				      },{
				        title: "受理"
				      },{
				        title: "发证"
				      }]
				    });
				if(appstatus == '0'){
					$(".ystep").setStep(1);
				}else if(appstatus == '1' || appstatus == '2'){
					$(".ystep").setStep(2);
				}else if(appstatus == '7'){
					$(".ystep").setStep(3);
				}
			}else if(applytype == 2){//变更
				$(".ystep").loadStep({
				      size: "large",
				      color: "blue",
				      steps: [{
				        title: "申请"
				      },{
				        title: "受理"
				      },{
				        title: "审核"
				      }]
				    });
				if(appstatus == '0'){
					$(".ystep").setStep(2);
				}else if(appstatus == '1' || appstatus == '2'){
					$(".ystep").setStep(3);
				}
			}else{
				$(".ystep").loadStep({
			      size: "large",
			      color: "blue",
			      steps: [{
			        title: "申请"
			      },{
			        title: "受理"
			      },{
			        title: "身份认证"
			      },{
			        title: "考试审核"
			      },{
			        title: "窗口办理"
			      },{
			        title: "发证"
			      }]
			    });
				if(appstatus == '0'){
					$(".ystep").setStep(2);
				}else if(appstatus == '1' || appstatus == '2'){
					$(".ystep").setStep(3);
				}else if(appstatus == '3' || appstatus == '4'){
					$(".ystep").setStep(4);
				}else if(appstatus == '5' || appstatus == '6'){
					$(".ystep").setStep(5);
				}else if(appstatus == '7'){
					$(".ystep").setStep(6);
				}
			}
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
					<div class="title">驾驶员资质业务进度查询</div>
				</div>
				<div>
					<div style="text-align:center" class="ystep"></div>
					<table width="100%" border="0" cellpadding="5" cellspacing="2">
						<tr height="40">
							<td align="center">
								<c:if test="${applytype == 1}">
									<c:if test="${appstatus == 0 }">您提交的资质许可申请已提交并受理，请耐心等待审核结果。。。</c:if>
									<c:if test="${appstatus == 1 || appstatus == 2}">您提交的资质许可申请正在进行身份认证，请耐心等待审核结果。。。</c:if>
									<c:if test="${appstatus == 3 || appstatus == 4}">您提交的资质许可申请正在进行考试结果审核，请耐心等待审核结果。。。</c:if>
									<c:if test="${appstatus == 5 || appstatus == 6}">您提交的资质许可申请正在进行窗口办理审核，请耐心等待审核结果。。。</c:if>
									<c:if test="${appstatus == 7 }">您提交的资质许可申请已发证</c:if>
								</c:if>
								<c:if test="${applytype == 2}">
									<c:if test="${appstatus == 0 }">您提交的资质变更申请已提交并受理，请耐心等待审核结果。。。</c:if>
									<c:if test="${appstatus == 1 }">您提交的资质变更申请审核不通过，请重新进行变更申请。。。</c:if>
									<c:if test="${appstatus == 2 }">您提交的资质变更申请审核已通过。</c:if>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>