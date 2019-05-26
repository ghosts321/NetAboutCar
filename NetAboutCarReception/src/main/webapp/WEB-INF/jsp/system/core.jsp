<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公共页面</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<link rel="stylesheet" href="<%=basePath %>css/userReg.css" />
<link rel="stylesheet" href="<%=basePath %>css/calendar.css">
<link rel="stylesheet" href="<%=basePath %>css/jquery.selectlist.css"/>


<script src="<%=basePath %>js/jquery-1.7.2.js" type=text/javascript></script>
<script src="<%=basePath %>js/formValidator_min.js" type="text/javascript" charset="UTF-8"></script>
<script src="<%=basePath %>js/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>

<script src="<%=basePath %>js/jquery.js"></script> 
<script src="<%=basePath %>js/calendar.js"></script> 

<script src="<%=basePath %>js/jquery.selectlist.js" type="text/javascript" charset="UTF-8"></script>
 

</head>
<body>

</body>
</html>