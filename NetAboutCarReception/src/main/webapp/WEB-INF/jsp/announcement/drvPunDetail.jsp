<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>驾驶员诚信考核处分公示</title>
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
				background: #f5f5f5 none repeat scroll 0 0;
				border-top: 2px solid #cccccc;
				padding: 0px 10px;
				text-align: center;
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
				margin: 10px 5px;
			}
			
			.buss_area .info_block .content_box p {
				line-height: 1.7;
				color: #555555;
				text-indent: 2em;
			}
			
			.list-table{
			    width: 60%;
			    text-align: center;
			    margin-left: 30px;
			    margin: 10px 10px 10px 30px;
			}
			.list-table .title-row{
			
			}
			.list-table .title-row td{
			
			}
			
			.list-table .data-row{
				
			}
			
			.list-table .data-row td{
				
			}
		</style>

	</head>
  
	<body>
		<div class="buss_area">
			<div class="info_block">
				<div class="title_bar">驾驶员诚信考核处分公示
				</div>
				<div class="content_box">
					<p>下列驾驶员因本年度累记满分，根据规定给予处分，特此公示！
					</p>
					<p>
						<table class='list-table' border=1>
							<tr>
								<th width="60">驾驶员证号</th>
								<th width="60">姓名</th>
							</tr>
						</table>
					</p>
					<p>处分名单编号：${listNo }</p>
					
				</div>
				
			</div>
			<jsp:include page="/WEB-INF/jsp/announcement/announcementSearch.jsp" />
		</div>
	</body>
</html>
