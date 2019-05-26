<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>左树</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<link rel="stylesheet" href="<%=basePath %>css/core.css" />
<script src="<%=basePath %>js/jquery-1.7.2.js" type=text/javascript></script>
</head>

<script type="text/javascript">
$(function(){
	
	//菜单隐藏展开
	var tabs_i=0
	$('.vtitle').click(function(){
		var _self = $(this);
		var j = $('.vtitle').index(_self);
		 tabs_i = j;
		$('.vtitle em').each(function(e){
			if(e==tabs_i){
				$('em',_self).removeClass('v01').addClass('v02');
			}else{
				$(this).removeClass('v02').addClass('v01');
			}
		});
		$('.vcon').slideUp().eq(tabs_i).slideDown();
	});
})
</script>

<body>
 
<div style="width:200px;margin:10px auto 10px 10px;">
    
	<div class="vtitle">
	    <c:choose>  
		   <c:when test="${param.id=='xksq'}">
			  <em class="v v02"></em>许可申请</div>
		      <div class="vcon">
		      <span></span>
		   </c:when>  
		   <c:otherwise>  
		     <em class="v"></em>许可申请</div>
		     <div class="vcon" style="display: none;">
		   </c:otherwise>  
		</c:choose>  
		<ul class="vconlist clearfix">
			<li><a href="<%=basePath %>jsp/driver/permitApply.jsp" target="right">在线办理</a></li>
			<li><a href="javascript:;">操作指南</a></li>
			<li><a href="javascript:;">相关政策</a></li>
		</ul>
	</div>
	<div class="vtitle">
		<c:choose>  
		   <c:when test="${param.id=='bgsq'}">
		      <em class="v v02"></em>变更申请</div>
		      <div class="vcon">
		      <span></span>
		   </c:when>  
		   <c:otherwise>  
		     <em class="v"></em>变更申请</div>
		     <div class="vcon" style="display: none;">
		   </c:otherwise>  
		</c:choose>  
		<ul class="vconlist clearfix">
			<li><a href="javascript:;">在线办理</a></li>
			<li><a href="javascript:;">操作指南 </a></li>
			<li><a href="javascript:;">相关政策</a></li>
		</ul>
	</div>
	<div class="vtitle"><em class="v"></em>数据查询</div>
		<c:choose>  
		   <c:when test="${param.id=='sjcx'}">
		      <div class="vcon">
		      <span></span>
		   </c:when>  
		   <c:otherwise>  
		     <div class="vcon" style="display: none;">
		   </c:otherwise>  
		</c:choose>  
		<ul class="vconlist clearfix">
			<li><a href="javascript:;">在线查询</a></li>
			<li><a href="javascript:;">操作指南</a></li>
			<li><a href="javascript:;">相关政策</a></li>
		</ul>
	</div>
	<div class="vtitle"><em class="v"></em>注销申请</div>
		<c:choose>  
		   <c:when test="${param.id=='zxsq'}">
		      <div class="vcon">
		      <span></span>
		   </c:when>  
		   <c:otherwise>  
		     <div class="vcon" style="display: none;">
		   </c:otherwise>  
		</c:choose>  
		<ul class="vconlist clearfix">
			<li><a href="javascript:;">在线办理</a></li>
			<li><a href="javascript:;">操作指南</a></li>
			<li><a href="javascript:;">相关政策</a></li>
		</ul>
	</div>
    <div class="vtitle"><em class="v"></em>补办申请</div>
		<c:choose>  
		   <c:when test="${param.id=='bbsq'}">
		      <div class="vcon">
		      <span></span>
		   </c:when>  
		   <c:otherwise>  
		     <div class="vcon" style="display: none;">
		   </c:otherwise>  
		</c:choose>  
		<ul class="vconlist clearfix">
			<li><a href="javascript:;">在线办理</a></li>
			<li><a href="javascript:;">操作指南</a></li>
			<li><a href="javascript:;">相关政策</a></li>
		</ul>
	</div>
	<div class="vtitle"><em class="v"></em>个人中心</div>
		<c:choose>  
		   <c:when test="${param.id=='grzx'}">
		      <div class="vcon">
		      <span></span>
		   </c:when>  
		   <c:otherwise>  
		     <div class="vcon" style="display: none;">
		   </c:otherwise>  
		</c:choose>  
		<ul class="vconlist clearfix">
			<li><a href="javascript:;">个人信息</a></li>
			<li><a href="javascript:;">车辆信息</a></li>
		    <li><a href="javascript:;">考试信息</a></li>
		</ul>
	</div>
</div>
</body>
</html>