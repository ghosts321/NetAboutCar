<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>网络预约出租车服务管理平台</title>
		<link rel="stylesheet" type="text/css" href="${basePath}css/core.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}css/common.css" />
		<!--引用百度地图API-->
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=0ydUr2iGAepzhp8BX6fCGnBeTflC0zO9"></script>
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${basePath}js/moment.min.js"></script>
		<style type="text/css">
			.body_area {
				min-height: 380px;
			}
			
			.body_area .main_area {
				width: 1000px;
				min-width: 1000px;
				margin: 0 auto;
			}
		</style>
		<script type="text/javascript">
			$(function() {
				var userType = '${sessionScope.userType}';
				if (userType && userType != "") {
					if(userType == 1){
						$("#main").load("${basePath}driver/openMyPage.action", function() {});
					}else if(userType == 2){
						$("#main").load("${basePath}driver/openPersonalInfo.action", function() {});
					}
				}
			});
		</script>
	</head>
	
	<body>
		<jsp:include page="/WEB-INF/jsp/system/top.jsp" />
		<jsp:include page="/WEB-INF/jsp/system/head.jsp" />
		
		<div class="body_area">
			<div id="main" class="main_area">
				<jsp:include page="/WEB-INF/jsp/system/firstpage.jsp" />
			</div>
		</div>
		
		<jsp:include page="/WEB-INF/jsp/system/foot.jsp" />
		
	</body>
</html>
