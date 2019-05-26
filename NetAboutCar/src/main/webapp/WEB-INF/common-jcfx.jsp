<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	request.setAttribute("path", path);
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	request.setAttribute("basePath", basePath);
%>


<link href="${path }/bootstrap/css/bootstrap.css" rel="stylesheet"/>

<script src="${path }/static/js/jquery/1.11.3/jquery.min.js"></script>  
<script src="${path }/bootstrap/3.3.5/js/bootstrap.min.js"></script>  
<script src="${path }/static/js/angular.js" type="text/javascript"></script>
