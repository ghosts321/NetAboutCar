<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<script type="text/javascript" src="${basePath}js/accordion.js"></script>
		<style type="text/css">
			.topnav {
				width: 100%;
				max-width: 300px;
				background-color: #eeeeee;
				margin: 0px auto;
			}
			
			ul.topnav li a {
				font-size: 15px;
				color: #10218b;
				font-weight: bold;
				text-align: left;
				overflow: hidden;
				padding: 10px 10px;
				display: block;
				text-decoration: none;
			}
			
			ul.topnav li a:hover {
				background-color: #675C7C;
				color: #ffffff;
			}
			
			ul.topnav ul {
				background-color: #f5f5f5;
				margin: 0;
				padding: 0;
				display: none;
			}
			
			ul.topnav ul li {
				margin: 0;
				padding: 0;
				clear: both;
			}
			
			ul.topnav ul li a {
				padding-left: 20px;
				font-size: 14px;
				font-weight: normal;
				outline: 0;
			}
			
			ul.topnav ul li a:hover {
				background-color: #D3C99C;
				color: #675C7C;
			}
			
			ul.topnav ul li ul {
				background-color: #f5fffa;
			}
			
			ul.topnav ul li ul li a {
				font-size: 12px;
				padding-left: 30px;
			}
			
			ul.topnav ul li ul li a:hover {
				background-color: #D3CEB8;
				color: #675C7C;
			}
			
			ul.topnav i{
				float: right;
			}
			
			ul.topnav li a.active {
				color: #ffffff;
				background: #9370DB;
			}
		</style>
		<script type="text/javascript">
				
			//添加默认选中菜单
			$("#a${param.activeContent}").addClass("active");
			
			$(function() {
				$("#accordion").accordion({
					accordion: false,
					speed: 500,
					closedSign: 'fa-chevron-down',
					openedSign: 'fa-chevron-up'
				});
			});
		</script>
	</head>
	<body>
		<div id="menuarea" class="menuarea">
			<ul id="accordion" class="topnav">
				<li>
					<a id="a1" onclick="gotoHelp('${basePath}help/toHelpContent1.action');">1 总体介绍</a>
				</li>
				<li>
					<a id="a2">2 用户注册 </a>
					<ul class="topnav" id="help-reg-nav">
						<li class="">
							<a id="a2-1" onclick="gotoHelp('${basePath}help/toHelpContent2_1.action');">2.1 注册用户综述</a>
						</li>
						<li class="">
							<a id="a2-2" onclick="gotoHelp('${basePath}help/toHelpContent2_2.action');">2.2 个人用户窗口注册</a>
						</li>
						<li class="">
							<a id="a2-3" onclick="gotoHelp('${basePath}help/toHelpContent2_3.action');">2.3 个人用户网上注册</a>
						</li>
						<li class="">
							<a id="a2-4" onclick="gotoHelp('${basePath}help/toHelpContent2_4.action');">2.4 单位用户窗口注册</a>
						</li>
					</ul>
				</li>
				<li class="">
					<a id="a3">3 网上业务办理</a>
					<ul class="topnav" id="help-work-nav">
						<li class="">
							<a id="a3-1">3.1 机动车业务</a>
							<ul class="" id="help-work-nav-veh">
								<li class=""><a id="a3-1-1" onclick="gotoHelp('${basePath}help/toHelpContent3_1_1.action');">3.1.1 网约车资质业务许可申请</a></li>
								<li class=""><a id="a3-1-2" onclick="gotoHelp('${basePath}help/toHelpContent3_1_2.action');">3.1.2 网约车资质业务变更申请</a></li>
								<li class=""><a id="a3-1-3" onclick="gotoHelp('${basePath}help/toHelpContent3_1_3.action');">3.1.3 网约车资质业务注销申请</a></li>
								<li class=""><a id="a3-1-4" onclick="gotoHelp('${basePath}help/toHelpContent3_1_4.action');">3.1.4 网约车资质业务补办申请</a></li>
							</ul>
						</li>
						<li>
							<a id="a3-2">3.2 驾驶证业务</a>
							<ul class="" id="help-work-nav-drv">
								<li class=""><a id="a3-2-1" onclick="gotoHelp('${basePath}help/toHelpContent3_1_1.action');">3.2.1 驾驶员资质业务许可申请</a></li>
								<li class=""><a id="a3-2-2" onclick="gotoHelp('${basePath}help/toHelpContent3_2_2.action');">3.2.2 驾驶员资质业务变更申请</a></li>
								<li class=""><a id="a3-2-3" onclick="gotoHelp('${basePath}help/toHelpContent3_2_3.action');">3.2.3 驾驶员资质业务注销申请</a></li>
								<li class=""><a id="a3-2-4" onclick="gotoHelp('${basePath}help/toHelpContent3_2_4.action');">3.2.4 驾驶员资质业务补办申请</a></li>
							</ul>
						</li>
						<li>
							<a id="a3-3">3.3 违法处理业务</a>
							<ul class="" id="help-work-nav-vio">
								<li class=""><a id="a3-3-1" href="">3.3.1 电子监控处理</a></li>
								<li class=""><a id="a3-3-2" href="">3.3.2 缴纳罚款</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<li>
					<a>4 公告公布</a>
					<ul class="topnav" id="help-notice-nav">
						<li><a id="a4-1" href="">4.1 公告公布内容</a></li>
						<li><a id="a4-2" href="">4.2 公告公布查询</a></li>
					</ul>
				</li>
				<li>
					<a id="a5">5 服务导航</a>
				</li>
				<li>
					<a id="a6">6 信息查询</a>
				</li>
				<li>
					<a id="a7">7 窗口办事指南</a>
				</li>
				<li>
					<a id="a8">8 表格及范本下载</a>
					<ul class="" id="help-table-nav">
						<li><a id="a8-1" href="">8.1 互联网业务</a></li>
						<li><a id="a8-2" href="">8.2 机动车业务</a></li>
						<li><a id="a8-3" href="">8.3 驾驶证业务</a></li>
						<li><a id="a8-4" href="">8.4 其他业务</a></li>
					</ul>
				</li>
				<li>
					<a id="a9">9 常见问题</a>
					<ul class="" id="help-qa-nav">
						<li><a id="a9-1" onclick="gotoHelp('${basePath}help/toHelpContent9_1.action');">9.1 驾驶证申请</a></li>
						<li><a id="a9-2" onclick="gotoHelp('${basePath}help/toHelpContent9_2.action');">9.2 驾驶人考试</a></li>
						<li><a id="a9-3" onclick="gotoHelp('${basePath}help/toHelpContent9_3.action');">9.3 驾驶证使用</a></li>
						<li><a id="a9-4" onclick="gotoHelp('${basePath}help/toHelpContent9_4.action');">9.4 校车标牌及驾驶人</a></li>
						<li><a id="a9-5" onclick="gotoHelp('${basePath}help/toHelpContent9_5.action');">9.5 交通违法记分</a></li>
						<li><a id="a9-6" onclick="gotoHelp('${basePath}help/toHelpContent9_6.action');">9.6 服务群众措施</a></li>
						<li><a id="a9-7" onclick="gotoHelp('${basePath}help/toHelpContent9_7.action');">9.7 高速公路驾驶机动车</a></li>
						<li><a id="a9-8" onclick="gotoHelp('${basePath}help/toHelpContent9_8.action');">9.8 法律责任</a></li>
					</ul>
				</li>
				<li>
					<a id="a10" href="">10 政策法规</a>
				</li>
			</ul>
		</div>
	</body>
</html>
