<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>驾驶员许可申请</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<link rel="stylesheet" href="<%=basePath %>css/core.css" />
<script src="<%=basePath %>js/jquery-1.7.2.js" type=text/javascript></script>
</head>




<frameset cols="200,200,*" framespacing="0" frameborder="NO" border="0" >
   <frame src=""></frame>
   <frame src="<%=basePath %>driver/toLeftTree.action?id=<%=request.getParameter("id") %>" name="left" scrolling="no" ></frame>
   
   
    <c:choose>  
	   <c:when test="${param.id=='xksq'}">
	        <frame src="<%=basePath %>driver/toPermitApply.action" name="right" >11111</frame>
	   </c:when>  
	    <c:when test="${param.id=='bgsq'}">
	        <frame src="<%=basePath %>driver/toChangeApply.action" name="right" >11111111</frame>
	   </c:when>  
	   <c:when test="${param.id=='grzx'}">
	        <frame src="<%=basePath %>driver/toGrzx.action" name="right" >111111</frame>
	   </c:when>  
    </c:choose>  
</frameset>
<body>
</body>
</html>