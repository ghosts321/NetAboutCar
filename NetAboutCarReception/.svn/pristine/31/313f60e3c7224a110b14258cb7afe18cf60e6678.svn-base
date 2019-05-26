<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>公布公告首页</title>
		<style type="text/css">
			.buss_area .info_block {
				width: 720px;
				float: left;
				margin-right: 20px;
			}
			
			.buss_area .info_block .title_bar {
				height: 40px;
				line-height: 40px;
				font-size: 16px;
				color: #002ec0;
				background: #f5f5f5 none repeat scroll 0 0;
				border-top: 2px solid #002ec0;
				padding: 0px 10px;
			}
			
			.buss_area .info_block .title_bar:after {
				content: "."; 
			    display: block;
			    height: 0; 
			    clear: both; 
			    visibility: hidden;
			}
			
			.buss_area .info_block .title_bar i {
				margin-right: 5px;
			}
			
			.buss_area .info_block .content_box {
				margin: 5px 0px;
			}
			
			.buss_area .info_block .content_box li {
				line-height: 28px;
			}
			
			.buss_area .info_block .content_box li:after {
				content: "."; 
			    display: block;
			    height: 0; 
			    clear: both; 
			    visibility: hidden;
			}
			
			.buss_area .info_block .content_box li i {
				font-size: 6px;
				float: left;
				padding: 12px 5px 0px 0px;
			}
			
			.buss_area .info_block .content_box li .info_index {
				display: block;
				float: left;
				width: 620px;
				color: #10218b;
				overflow: hidden;
				text-overflow: ellipsis;
				white-space: nowrap;
				word-break: keep-all;
				cursor: pointer;
			}
			
			.buss_area .info_block .content_box li .info_index:hover {
				color: #002ec0;
			}
			
			.buss_area .info_block .content_box li .info_time {
				float: right;
				width: 80px;
			}
			
			.pagination {
				margin: 20px 0 10px;
				text-align: center;
			}
			
			.pagination ul {
			 	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
				display: inline-block;
				margin-bottom: 0;
				margin-left: 0;
			}
			
			.pagination ul > li {
				display: inline;
			}
			
			.pagination ul > li:first-child > a {
				border-left-width: 1px;
				border-radius: 2px 0 0 2px;
				margin-left: 0;
			}
			
			.pagination ul > li:last-child > a {
				border-radius: 0 2px 2px 0;
			}
			
			.pagination ul > li > a {
				float: left;
				line-height: 20px;
				padding: 4px 12px;
				text-decoration: none;
				background-color: #f3f3f3;
				background-image: linear-gradient(to bottom, #f5f5f5, #f1f1f1);
				background-repeat: repeat-x;
				border-style: solid;
				border-width: 1px 1px 1px 0;
				border-color: #dddddd;
				box-shadow: none;
				color: #333333;
				text-shadow: none;
			}
			
			.pagination ul > li > a:hover {
				background-color: #f5f5f5;
				border-color: #c6c6c6;
				box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
			}
			
			.pagination ul > .active > a {
				box-shadow: none;
				color: #4d90fe;
				background-color: #f5f5f5;
				border-color: #c6c6c6;
				cursor: default;
			}
			
			.pagination ul > .disabled > a, .pagination ul > .disabled > a:hover {
				background-color: #f3f3f3;
				background-image: linear-gradient(to bottom, #f5f5f5, #f1f1f1);
				background-repeat: repeat-x;
				border-color: #d9d9d9;
				box-shadow: none;
				color: #b3b3b3;
				text-shadow: none;
				cursor: default;
			}
		</style>
		<script type="text/javascript">
			function gotoMore(url) {
				if ($("#main") && url != "") {
					$("#main").load(url, function() {
						
					});
				}
			}
		</script>
	</head>
  
	<body>
		<div class="buss_area">
			<div class="info_block">
				<div class="title_bar">
					<i class="fa fa-bullhorn"></i>信息公告
				</div>
				<ul class="content_box">
					<li>
						<i class="fa fa-circle"></i>
						<a class="info_index" href="javascript:void(0);" onclick="gotoMore('${basePath}announcement/viewAnnouncement.action');">运营证停止使用公告</a>
						<span class="info_time">2016-09-29</span>
					</li>
					<li>
						<i class="fa fa-circle"></i>
						<a class="info_index" title="运营证停止使用公告运营证停止使用公告运营证停止使用公告" href="javascript:void(0);" onclick="gotoMore('${basePath}announcement/viewAnnouncement.action');">运营证停止使用公告运营证停止使用公告运营证停止使用公告</a>
						<span class="info_time">2016-09-29</span>
					</li>
					<li>
						<i class="fa fa-circle"></i>
						<a class="info_index" href="javascript:void(0);" onclick="gotoMore('${basePath}announcement/viewAnnouncement.action');">运营证停止使用公告</a>
						<span class="info_time">2016-09-29</span>
					</li>
					<li>
						<i class="fa fa-circle"></i>
						<a class="info_index" href="javascript:void(0);" onclick="gotoMore('${basePath}announcement/viewAnnouncement.action');">运营证停止使用公告</a>
						<span class="info_time">2016-09-29</span>
					</li>
					<li>
						<i class="fa fa-circle"></i>
						<a class="info_index" href="javascript:void(0);" onclick="gotoMore('${basePath}announcement/viewAnnouncement.action');">运营证停止使用公告</a>
						<span class="info_time">2016-09-29</span>
					</li>
				</ul>
				<div class="pagination">
					<ul>
						<li class="disabled">
							<a href="#" data-page="0">首页</a>
						</li>
						<li class="disabled">
							<a href="#" data-page="0">上一页</a>
						</li>
						<li class="active">
							<a href="#page1" data-page="1">1</a>
						</li>
						<li>
							<a href="#page2" data-page="2">2</a>
						</li>
						<li>
							<a href="#page3" data-page="3">3</a>
						</li>
						<li>
							<a href="#page4" data-page="4">4</a>
						</li>
						<li>
							<a href="#" data-page="2">下一页</a>
						</li>
						<li>
							<a href="#" data-page="4">末页</a>
						</li>
					</ul>
				</div>
			</div>
			<jsp:include page="/WEB-INF/jsp/announcement/announcementSearch.jsp" />
		</div>
	</body>
</html>
