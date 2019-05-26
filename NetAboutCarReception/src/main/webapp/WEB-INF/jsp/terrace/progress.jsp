<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			if(applytype == 2){//变更
				$(".ystep").loadStep({
				      size: "large",
				      color: "blue",
				      steps: [{
				        title: "申请"
				      },{
				        title: "受理"
				      },{
				        title: "完成"
				      }]
				    });
				if(appstatus == '0'){
					$(".ystep").setStep(2);
					$("#tip").html("您提交的资质变更申请已提交并受理，请耐心等待审核结果。。。");
				}else if(appstatus == '1' || appstatus == '2'){
					$(".ystep").setStep(3);
					$("#tip").html("您提交的资质变更申请已审核完成，审核结果请关注消息通知。");
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
				        title: "平台认证"
				      },{
				        title: "发证"
				      }]
			    });
				if(appstatus == '0'){
					$(".ystep").setStep(2);
					$("#tip").html("您提交的资质许可申请已提交并受理，请耐心等待审核结果。。。");
				}else if(appstatus == '1'){
					$(".ystep").setStep(3);
					$("#tip").html("您提交的资质许可申请正在进行认证，请耐心等待审核结果。。。");
				}else if(appstatus == '-1'){
					$(".ystep").setStep(3);
					$("#tip").html("您提交的资质许可申请认证结束，请关注消息通知");
				}else if(appstatus == '2'){
					$("#tip").html("您提交的资质许可申请已发证");
					$(".ystep").setStep(4);
				}
			}
		});
		</script>
	</head>
	<body>
		<div class="buss_area">
			<div class="personalmenu">
				<jsp:include page="/WEB-INF/jsp/driver/personalMenu.jsp">
					<jsp:param name="leftmenu" value="platForm"/>
				</jsp:include>
			</div>
			<div id="workarea" class="workarea">
				<div class="title_area">
					<div class="title">平台质业务进度查询</div>
				</div>
				<div>
					<div style="text-align:center" class="ystep"></div>
					<table width="100%" border="0" cellpadding="5" cellspacing="2">
						<tr height="40">
							<td align="center">
								<span id="tip"></span>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>