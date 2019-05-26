<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>网络预约出租车服务管理平台</title>
		<link rel="stylesheet" type="text/css" href="${basePath}css/jquery-ui-1.10.4.custom.min.css"/>
		<link rel="stylesheet" type="text/css" href="${basePath}css/fontawesome/css/font-awesome.min.css" />
		<!--[if IE]>
		<link rel="stylesheet" type="text/css" href="${basePath}css/client/css/font-awesome-ie7.min.css" />
		<![endif]-->
		<link rel="stylesheet" type="text/css" href="${basePath}css/userReg.css" />
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidator_min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidatorRegex.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery-ui-1.10.4.custom.min.js"></script>
		<style type="text/css">
			.header {
				height: 100px;
				background-color: #067bc1;
				margin-bottom: 20px;
			}
			
			.header .header_area {
				width: 1000px;
				min-width: 1000px;
				margin: 0 auto;
				color: #FFFFFF;
			}
			
			.header .header_area:after {
				content: "."; 
			    display: block;
			    height: 0; 
			    clear: both; 
			    visibility: hidden;
			}
			
			.header .header_area_logo {
				float: left;
			}
			
			.header .header_area_logo .logo {
				float: left;
				padding: 20px 20px 0px 0px;
			}
			
			.header .header_area_logo .title {
				font-size: 31px;
				float: left;
				padding-top: 35px;
			}
			
			.header .header_area_menu {
				width: 570px;
				text-align: right;
				float: right;
				padding-top: 30px;
			}
			
			.header .header_area_menu .menu_a {
				font-size: 17px;
				font-weight: 700;
				color: #FFFFFF;
				display: inline-block;
				line-height: 2;
				margin-left: 2%;
				padding: 5px 0;
				transition: all 0.2s ease-in-out 0s;
			}
			
			.header .header_area_menu .menu_a:hover {
				color: #fbef5f;
			}
			
			.header .header_area_menu .active {
				color: #fbef5f;
				border-bottom: 2px solid #fbef5f;
			}
		</style>
		<script type="text/javascript">
			var basePath='${basePath}';
		
			$(function() {
				if ($("#mainmenu")) {
					$("#mainmenu").children("a").removeClass("active");
					
					var currentMenu = '${sessionScope.menuno}';
					if (currentMenu && currentMenu != "") {
						var menuNO = parseInt(currentMenu); 
						$("#mainmenu").children("a").eq(menuNO).addClass("active");
					}
				}
			});
			
			/**
			 * 主页工作区跳转
			 * @param {Object} url
			 */
			function mainGo(index, url) {
				$("#mainmenu").children("a").removeClass("active");
				if ($("#mainmenu")) {
					var menuNO = parseInt(index); 
					$("#mainmenu").children("a").eq(menuNO).addClass("active");
				}
				
				//防止读取浏览器缓存
				if (url.indexOf("?") >= 0) {
					url = url + "&_number=" + Math.random();
				} else {
					url = url + "?_number=" + Math.random();
				}
				
				if ($("#main")) {
					$("#main").load(url, function() {
						
					});
					if(index=='2'){
						$.getScript('${basePath}/js/announcement.js');
					}
				}
			}
			
			//跳转到帮助
			function gotoHelp(url) {
				$("#mainmenu").children("a").removeClass("active");
				$("#mainmenu").children("a").eq(6).addClass("active");
				if ($("#main")) {
					$("#main").load(url, function() {
						
					});
				}
			}
		</script>
	</head>
	
	<body>
		<div class="header">
			<div class="header_area">
				<div class="header_area_logo">
					<div class="logo">
						<img src="${basePath}images/logo.png" />
					</div>
					<div class="title">
						网络预约出租车服务平台
					</div>
				</div>
				<div id="mainmenu" class="header_area_menu">
					<c:if test="${not empty sessionScope.areaName}">
						<a class="menu_a" href="javascript:void(0)" onclick="mainGo('0', '${basePath}system/openFirstPage.action');">首页</a>
						<a class="menu_a" href="javascript:void(0)" onclick="mainGo('1', '${basePath}system/openBussDeal.action');">业务办理</a>
						<%-- <a class="menu_a" href="javascript:void(0)" onclick="mainGo('2', '${basePath}navigation/openServiceNavigation.action');">服务导航</a> --%>
						<a class="menu_a" href="javascript:void(0)" onclick="mainGo('2', '${basePath}announcement/openAnnouncement.action');">公告公布</a>
						<a class="menu_a" href="javascript:void(0)" onclick="mainGo('3', '${basePath}infoquery/openInfoQuery.action');">资质查询</a>
						<%-- <a class="menu_a" href="javascript:void(0)" onclick="mainGo('5', 'openAPPDownload.action');">APP下载</a>
						<a class="menu_a" href="javascript:void(0)" onclick="mainGo('6', '${basePath}help/toHelpContent1.action');">办事指南</a> --%>
						<a class="menu_a" href="javascript:void(0)" onclick="mainGo('4', '${basePath}system/openComplain.action');">投诉处理</a>
						<a class="menu_a" href="javascript:void(0)" onclick="mainGo('7', '${basePath}system/openfeedBack.action');">投诉公示</a>
						
					</c:if>
				</div>
			</div>
		</div>
	</body>
</html>