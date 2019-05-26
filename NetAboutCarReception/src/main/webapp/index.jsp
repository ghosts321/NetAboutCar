<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>网络预约出租车服务管理平台</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${basePath}css/core.css" />
		<script type="text/javascript" src="build/dist/echarts.js"></script>
		<script type="text/javascript" src="build/dist/jquery.min.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
			 
			 
		<script type="text/javascript">
		     $(function(){
		    	 window.location.href="<%=basePath%>system/index.action";
		     })
	    </script>
	</head>
	<body>
	
	</body>
</html>
