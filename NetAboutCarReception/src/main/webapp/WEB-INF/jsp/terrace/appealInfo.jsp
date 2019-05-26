<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery-ui-1.10.4.custom.min.js"></script>
		<title>投诉信息</title>
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
		
			.table_main {
				width: 1100px;
				border-collapse: collapse;
				border: 0px none;
				margin: auto;
			}
			
			.table_main tr {
				height: 38px;
				color: #363636;
			}
			
			.table_main th {
				color: #ffffff;
				font-weight: normal;
				background-color: #9370db;
				border: 1px solid #9370db !important;
			}
			
			.table_main td {
				border: 1px solid #cccccb !important;
				padding: 3px;
				color: #464646;
			}
			
		</style>
		<script type="text/javascript">
			function gotoBuss(url) {
				if ($("#main")) {
					$("#main").load(url, function() {
						
					});
				}
			}
		
			function showonclick(){
				alert("该功能暂未开放！");
			}
		</script>
	</head>
	<body>
		<div class="buss_area">
			<div class="personalmenu">
				<jsp:include page="/WEB-INF/jsp/system/feedBack.jsp">
					<jsp:param name="leftmenu" value="person2"/>
				</jsp:include>
			</div>
			<div id="workarea" class="workarea">
				<div class="title_area">
					<div class="title">平台投诉公示</div>
					<div style="overflow-y:hidden;overflow-x:auto;width:100%;height:520px;">
						<table width="100%" border="0" cellpadding="5" cellspacing="2" class="table_main">
							<tr>
								<th  style="font-size:15px;">序号</th>
								<th  align="center" style="font-size:15px;">投诉编号</th>
								<th  align="center" style="font-size:15px;">投诉人姓名</th>
								<th  align="center" style="font-size:15px;">投诉平台</th>
								<th  align="center" style="font-size:15px;">投诉事件</th>
								<th  align="center" style="font-size:15px;">投诉时间</th>
								<th  align="center" style="font-size:15px;">处理结果</th>
								<th  align="center" style="font-size:15px;">处理结束时间</th>							
							</tr>
							<c:forEach items="${complainList}" var="complain" varStatus="vs">  
								<tr>
									<td width="50px" align="center" style="font-size:13px;">${((pagebean.pageDQ-1)*12)+(vs.index+1)}</td>
									<td width="150px" align="center" style="font-size:13px;">${complain.complain_code}</td>
									<td width="100px" align="center" style="font-size:13px;">${complain.compn_name}</td>
									<td width="150px" align="center" style="font-size:13px;">${complain.compn_compy}</td>
									<td width="250px" align="center" style="font-size:13px;">${complain.compn_reason}</td>
									<td width="200px" align="center" style="font-size:13px;">${complain.compn_time}</td>
									<td width="100px" align="center" style="font-size:13px;">
									<c:choose>
				                    <c:when test="${complain.dis_type=='0'}">不做处理</c:when>
				                    <c:when test="${complain.dis_type=='1'}">口头警告</c:when>
				                    <c:when test="${complain.dis_type=='2'}">培训教育</c:when>
				                    <c:when test="${complain.dis_type=='3'}">退款</c:when>
				                    <c:when test="${complain.dis_type=='4'}">转发行政处罚</c:when>
				                    </c:choose>
									</td>
									<td width="200" align="center" style="font-size:13px;">${complain.idea_time}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<!-- <div class="title">
					</div> -->
				</div>
			 	<div class="pagination">
						<c:set var="DQ"  value="${pagebean.pageDQ}" scope="session"/>				  
						 <c:choose>
						  <c:when test="${pagebean.pageZYS>3}">
						  <c:set var="ZYS"  value="3" scope="session"/>
						  </c:when>
						  <c:when test="${pagebean.pageZYS<=3}">
						  <c:set var="ZYS"  value="${pagebean.pageZYS}" scope="session"/>
						  </c:when>						 
						 </c:choose>								
					<ul>
						<li >
							<a href="javascript:void(0);" data-page="0"  onclick="gotoBuss('${basePath}system/openfeedBack.action?pageDQ=1');">首页</a>
						</li>
						 <c:choose>
						 <c:when test="${DQ==1}">
						 <li class="disabled">
							<a href="javascript:void(0);" data-page="0">上一页</a>
						</li>
						 </c:when>
						  <c:when test="${DQ>1}">
						  <li >
							<a href="javascript:void(0);" data-page="0" onclick="gotoBuss('${basePath}system/openfeedBack.action?pageDQ=${DQ-1}');">上一页</a>
						</li>
						  </c:when>
						 </c:choose>						
						<c:forEach begin="1" end="${ZYS}" varStatus="vs">						
						  <c:if test="${DQ<=3}">
						  <li class="active">
							<a href="javascript:void(0);" onclick="gotoBuss('${basePath}system/openfeedBack.action?pageDQ=${vs.index}');" data-page="${vs.index}">${vs.index}</a>
						 </li>	  
						  </c:if>						
						 <c:if test="${DQ>3}">
						    <c:if test="${DQ+vs.index-1>pagebean.pageZYS}">
						      <li class="disabled">
						      <a href="javascript:void(0);"  data-page="${vs.index}">${DQ+vs.index-1}</a>
						      </li>
						    </c:if>
						    <c:if test="${DQ+vs.index-1<=pagebean.pageZYS}">
						      <li class="active">
						      <a href="javascript:void(0);" onclick="gotoBuss('${basePath}system/openfeedBack.action?pageDQ=${DQ+vs.index-1}');" data-page="${vs.index}">${DQ+vs.index-1}</a>
						      </li>
						    </c:if>					 
						 </c:if>
						</c:forEach>
						 										
						 <c:choose>
						 <c:when test="${DQ==pagebean.pageZYS}">
						 <li class="disabled">
							<a href="javascript:void(0);" data-page="0">下一页</a>
						</li>
						 </c:when>
						  <c:when test="${DQ<pagebean.pageZYS}">
						  <li >
							<a href="javascript:void(0);" data-page="0" onclick="gotoBuss('${basePath}system/openfeedBack.action?pageDQ=${DQ+1}');">下一页</a>
						</li>
						  </c:when>
						 </c:choose>
						<li>
							<a href="javascript:void(0);" data-page="4" onclick="gotoBuss('${basePath}system/openfeedBack.action?pageDQ=${pagebean.pageZYS}');">末页</a>
						</li>
					</ul>
				</div>  
				   <div align="center">
				    <span>共${pagebean.pageZS}条记录,总页数为${pagebean.pageZYS}页,当前为第${pagebean.pageDQ}页</span> 
				  </div> 
			</div>			
		</div>
	</body>
</html>