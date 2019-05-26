<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>网络预约出租车服务管理平台</title>
		<style type="text/css">
			.top {
				height: 25px;
				max-height: 25px;
				line-height: 25px;
				background-color: #00479d;
			}
			
			.top .top_area {
				width: 1000px;
				min-width: 1000px;
				margin: 0 auto;
				color: #FFFFFF;
			}
			
			.top .top_area:after {
				content: "."; 
			    display: block;
			    height: 0; 
			    clear: both; 
			    visibility: hidden;
			}
			
			.top .top_area a {
				color: #FFFFFF;
				transition:0.5s;
				text-decoration:none;
			}
			
			.top .top_area a:hover {
				color:yellow
			}
			
			.top .top_area .top_area_changearea {
				width: 350px;
				float: left;
			}
			
			.top .top_area .top_area_loginarea {
				float: right;
			}
			
			.top .top_area .top_area_loginarea a {
				display: inline-block;
				margin-right: 10px;
			}
		</style>
		<script>
		/**
			 * 主页工作区跳转
			 * @param {Object} url
			 */
			function funcGo(obj, url) {
				if ($("#main") && url != "") {
					$("#main").load(url, function() {
						
					});
				}
			}
		</script>
	</head>
	
	<body>
		<div class="top">
			<div class="top_area">
				<%-- <div class="top_area_changearea">
					<span>切换地区：</span>
					<a href="${basePath}index.jsp" target="blank">${sessionScope.areaName}</a>
				</div> --%>
				<div class="top_area_loginarea">
					<c:choose>
						<c:when test="${not empty sessionScope.userName}">
							欢迎您：
							<c:if test="${sessionScope.usertype == 0}">
								<a href="#" onclick="funcGo(this,'${basePath}driver/openMyPage.action')">${sessionScope.userName}</a>
							</c:if>
							<c:if test="${sessionScope.usertype == 1}">
								<a href="#" onclick="funcGo(this,'${basePath}driver/openPersonalInfo.action')">${sessionScope.userName}</a>
							</c:if>
							<a href="loginout.action" target="_top">退出</a>
						</c:when>
						<c:otherwise>
							<a href="javascript:void(0);" onclick="mainGo('', '${basePath}system/openLogin.action?usertype=0');"><i class="fa fa-user"></i>用户登录</a>
							<a href="javascript:void(0);" onclick="mainGo('', '${basePath}system/openReg.action');"><i class="fa fa-user-plus"></i> 用户注册</a>
							<%--<a href="javascript:void(0);" onclick="mainGo('', '${basePath}system/openLogin.action?usertype=0');"><i class="fa fa-user"></i> 用户登录</a>
							 <a href="javascript:void(0);" onclick="mainGo('', '${basePath}system/openLogin.action?usertype=1');"><i class="fa fa-building"></i> 单位登录</a>
						 --%>
							<%-- <a href="javascript:void(0);" onclick="mainGo('', '${basePath}system/openLogin.action?usertype=1');"><i class="fa fa-building"></i> 单位登录</a> --%>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</body>
</html>