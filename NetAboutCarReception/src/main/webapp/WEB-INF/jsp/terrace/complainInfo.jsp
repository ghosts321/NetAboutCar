<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
         <meta http-equiv="expires" content="0"> 
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
				width: 100%;
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
				<jsp:include page="/WEB-INF/jsp/driver/personalMenu.jsp">
					<jsp:param name="leftmenu" value="platForm2"/>
				</jsp:include>
			</div>
			<div id="workarea" class="workarea">
				<div class="title_area">
					<div class="title">网约车投诉信息</div>
					<div style="overflow:auto;overflow-x:hidden;width:100%;height:550px;">
						<table width="100%" border="0" cellpadding="5" cellspacing="2" class="table_main">
							<tr>
								<th width='30'>序号</th>
								<th width='80' align="center">投诉车牌号</th>
								<th width='90' align="center">驾驶证号码</th>
								<th width='80' align="center">驾驶员姓名</th>
								<th width='100' align="center">投诉人姓名</th>
								<th width='100' align="center">投诉人手机号</th>
								<th width='100' align="center">投诉时间</th>
								<th width='100' align="center">操作</th>
								
							</tr>
							<c:forEach items="${complainList}" var="complain" varStatus="vs">  
								<tr>
									<td width="3%" align="center">${vs.index + 1}</td>
									<td width="10%" align="center">${complain.car_number}</td>
									<td align="center" width="19%" >${complain.driver_licence}</td>
									<td width="10%" width="10%" align="center">${complain.driver_name}</td>
									<td width="10%" align="center">${complain.compn_name}</td>
									<td width="14%" align="center">${complain.compn_tel}</td>
									<td width="11%" align="center">${complain.compn_time}</td>
									<c:if test="${complain.compn_state=='6'}">
									<td width="9%" align="center"><button type='button' class='btn btn-default'  onclick="gotoBuss('${basePath}terrace/showDrvHandle.action?complain_code=${complain.complain_code}');"><span class='glyphicon glyphicon-pencil' aria-hidden='true' >申诉处理</button>&nbsp;</td>
									</c:if>
									 <c:if test="${complain.compn_state=='3'}"> 
						            <td width="9%" align="center"><button type='button' class='btn btn-default'  onclick="gotoBuss('${basePath}terrace/showDrvHandle.action?complain_code=${complain.complain_code}');"><span class='glyphicon glyphicon-pencil' aria-hidden='true' >处理</button>&nbsp;</td>
									 </c:if> 
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
							<a href="javascript:void(0);" data-page="0"  onclick="gotoBuss('${basePath}terrace/openComplainInfo.action?pageDQ=1');">首页</a>
						</li>
						 <c:choose>
						 <c:when test="${DQ==1}">
						 <li class="disabled">
							<a href="javascript:void(0);" data-page="0">上一页</a>
						</li>
						 </c:when>
						  <c:when test="${DQ>1}">
						  <li >
							<a href="javascript:void(0);" data-page="0" onclick="gotoBuss('${basePath}terrace/openComplainInfo.action?pageDQ=${DQ-1}');">上一页</a>
						</li>
						  </c:when>
						 </c:choose>						
						<c:forEach begin="1" end="${ZYS}" varStatus="vs">						
						  <c:if test="${DQ<=3}">
						  <li class="active">
							<a href="javascript:void(0);" onclick="gotoBuss('${basePath}terrace/openComplainInfo.action?pageDQ=${vs.index}');" data-page="${vs.index}">${vs.index}</a>
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
						      <a href="javascript:void(0);" onclick="gotoBuss('${basePath}terrace/openComplainInfo.action?pageDQ=${DQ+vs.index-1}');" data-page="${vs.index}">${DQ+vs.index-1}</a>
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
							<a href="javascript:void(0);" data-page="0" onclick="gotoBuss('${basePath}terrace/openComplainInfo.action?pageDQ=${DQ+1}');">下一页</a>
						</li>
						  </c:when>
						 </c:choose>
						<li>
							<a href="javascript:void(0);" data-page="4" onclick="gotoBuss('${basePath}terrace/openComplainInfo.action?pageDQ=${pagebean.pageZYS}');">末页</a>
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