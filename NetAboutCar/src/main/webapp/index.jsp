﻿<%@page import="com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<meta charset="utf-8" />
<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
<META HTTP-EQUIV="expires" CONTENT="-1">
<TITLE>网络预约出租车服务监管平台</TITLE>
<!-- basic styles -->
<link href="static/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/css/font-awesome.min.css" />
<!-- page specific plugin styles -->
<!-- 下拉框
<link rel="stylesheet" href="static/css/chosen.css" />-->
<!-- ace styles -->
<link rel="stylesheet" href="static/css/ace.min.css" />
<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="static/css/ace-skins.min.css" />
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<!--引入弹窗组件start-->
<script type="text/javascript" src="plugins/attention/zDialog/js/zDrag.js"></script>
<script type="text/javascript" src="plugins/attention/zDialog/js/zDialog.js"></script>
<!--引入弹窗组件end-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<!-- 引入 -->
<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/ace-elements.min.js"></script>

<head>
<style type="text/css">
.commitopacity {
	position: absolute;
	width: 100%;
	height: 100px;
	background: #7f7f7f;
	filter: alpha(opacity = 50);
	-moz-opacity: 0.8;
	-khtml-opacity: 0.5;
	opacity: 0.5;
	top: 0px;
	z-index: 99999;
}
.navbar-inverse .nav > li > a{
 font-size: 18px;

}
.navbar .nav.pull-right {
    float: right;
    margin-right: -50px;
    margin-top: -20px;
}
.ace-nav>li{
 margin-top: 30px;
}
</style>

<script type="text/javascript">

$(function(){
	changeleftList("10");
});
$(function(){
	var menuContent="";
	$.ajax({
		url:"menuInfo/menuInfoList.action",
		cache:false,
		success:function(data){
        	var menus = eval(data);
        	for(var i=0;i<menus.length;i++){
        		menuContent += "<li><a href=javascript:changeleftList('"+menus[i].menuId+"')>"+menus[i].menuName+"</a></li>";
        	}
       		$("#content").html(menuContent);
    	}
	})
});
function changeleftList(v){
	$("#mainFrame").attr("src","blank.jsp");
	var leftMenuContent = "";
	var noLeaf = "";
	$.ajax({
		url:"menuInfo/menuInfoList.action",
		data: {"parentId":v},
		cache:false,
		success:function(data){
			var content = eval(data);
			var lengths = content.length;
			//菜单级别 
			var flag = 1;
			var menuFlag = true;
			if(content != null){
				for(var i=0;i<lengths;i++){
					if(content[i].menuLevel == 2){
						if(flag > 2){
							for(var j=2;j<flag;j++){
								noLeaf += "</ul></li>";
							}
						}
						if(menuFlag){
							noLeaf +="<li class='open'><a href='javascript:void(0)' class='dropdown-toggle'><i class='icon-list'></i><span class='menu-text'>"
							+content[i].menuName +"</span><b class='arrow icon-angle-down'></b></a><ul class='submenu sec' style='display: block;'>";
							menuFlag = false;
						}else{
							noLeaf +="<li><a href='javascript:void(0)' class='dropdown-toggle'><i class='icon-list'></i><span class='menu-text'>"
							+content[i].menuName +"</span><b class='arrow icon-angle-down'></b></a><ul class='submenu sec'>";
						}
						flag = 2;
					}else{
						if(content[i].menuLevel == 3 && content[i].isLeaf == 0){
							if(flag > 3){
								for(var j=3;j<flag;j++){
									noLeaf += "</ul></li>";
								}
							}
							noLeaf +="<li><a href='#' class='dropdown-toggle'><i class='icon-double-angle-right'></i>"
							+content[i].menuName +"<b class='arrow icon-angle-down'></b></a><ul class='submenu'>";
							flag = 3;
						}else if(content[i].menuLevel == 4){
							if(flag > 4){
								for(var j=4;j<flag;j++){
									noLeaf += "</ul></li>";
								}
							}
							if(content[i].isLeaf == 0){
								noLeaf +="<li><a href='#' class='dropdown-toggle'>"
								+content[i].menuName +"<b class='arrow icon-angle-down'></b></a><ul class='submenu'>";
							}else{
								noLeaf +="<li><a target='mainFrame' href="+content[i].menuUrl+">"
								+content[i].menuName +"</a></li>";
							}
							flag = 4;
						}else if(content[i].menuLevel == 5){
							noLeaf +="<li><a target='mainFrame' href="+content[i].menuUrl+">"
							+content[i].menuName +"</a></li>";
							flag = 5;
						}else{
							if(flag > 3){
								for(var j=3;j<flag;j++){
									noLeaf += "</ul></li>";
								}
							}
							
							if(content[i].menuId == "401110" || content[i].menuId=="901310"){
								noLeaf += "<li><a target='mainFrame' onclick='openMap(\""+content[i].menuUrl+"\");'><i class='icon-double-angle-right'></i>"
								+content[i].menuName+"</a></li>";
							}
							else{
								noLeaf += "<li><a target='mainFrame' href="+content[i].menuUrl+"><i class='icon-double-angle-right'></i>"
								+content[i].menuName+"</a></li>";
							}
							flag = 3;
						}
					}
					if(i == (lengths-1)){
						noLeaf +="</ul></li>";
					}
				}
				leftMenuContent = "<ul class='nav nav-list'>"+ noLeaf +"</ul><div id='sidebar-collapse'><i class='icon-double-angle-left'></i></div>";
				$("#sidebar").html(leftMenuContent);
				//alert(noLeaf);
				handle_side_menu();
				//初始化缩放按钮
				$("#sidebar-collapse").on("click",function(){
					  $("#sidebar").toggleClass("menu-min");
					  $(this.firstChild).toggleClass("icon-double-angle-right");
					  a=$("#sidebar").hasClass("menu-min");
					  document.cookie="hasMenu="+a+";";
					 if(a){$(".open > .submenu").removeClass("close")}
					  }
				);
				//判断菜单缩放
				var hasMenu = true;
				var strCookie=document.cookie;
				var arrCookie=strCookie.split(";");
				for(var i=0;i<arrCookie.length;i++){
					var arr=arrCookie[i].split("=");
					if("hasMenu"==arr[0]){
						hasMenu=arr[1];
						break;
					}
				}
			}
    	}
	});
}

//运营监管弹出地图
function openMap(menuUrl){
	var width=screen.availWidth-10;	//屏幕宽度
	var height=screen.availHeight-50;	//屏幕高度
	var fulls = "left=0,top=0,width="+ width +",height="+ height +",scrollbars,resizable=yes,toolbar=no";    //定义弹出窗口的参数
	window.open(menuUrl,"XX",fulls);
};


//修改
function updateInfo(Id){
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="用户信息修改";
	 diag.URL = '<%=basePath%>mngUserInfo/toUpdateUser.action';
	 diag.Width = 600;
	 diag.Height = 650;
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			 setTimeout("location.reload()",100);
		}
		diag.close();
	 };
	 diag.show();
}
</script>
</head>
<body style="overflow:hidden">
	<!-- 页面顶部¨ -->
	<div class="navbar navbar-inverse">
	  <div class="navbar-inner">
	   <div class="container-fluid">
		  <a class="brand"><small style="font-size:114%;"><img  src="static/images/gh.png"> 网络预约出租车服务监管平台</small> </a>
		 <!-- <ul class="nav ace-nav pull-right">
				<li class="light-blue user-profile">
					<a class="user-menu dropdown-toggle" href="javascript:alert('预留功能,待开发');" data-toggle="dropdown">
						<img alt="FH" src="static/avatars/user.jpg" class="nav-user-photo" />
						<i class="icon-caret-down"></i>
					</a>
					<ul id="user_menu" class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
						<li><a onclick="updateInfo()" style="cursor:pointer;"><i class="icon-user"></i> 修改资料</a></li>
						<li><a href="login/userLoginOut.action"><i class="icon-off"></i> 退出</a></li>
					</ul>
				</li>
		  </ul> -->
		  <DIV style="padding: 30px 36px 5px">
		  <p style="position:absolute; top: 20px; right: 20px; font-size: 14px;font-family:'微软雅黑';color: #FFFFFF;font-weight:bold">
		  <i class="icon-user"></i> <%=((MngUserInfo)request.getSession().getAttribute("mngUserInfo")).getUserName() %>
		  &nbsp; &nbsp; &nbsp; <a onclick="updateInfo()" style="font-family:'微软雅黑';color: #FFFFFF;cursor:pointer;"><i class="icon-edit"></i> 修改资料</a>
		  
		   &nbsp; &nbsp;&nbsp;&nbsp;<a href="login/userLoginOut.action" style="font-family:'微软雅黑';color: #FFFFFF;cursor:pointer"><i class="icon-off"></i>退出</a>&nbsp;
		  </p>
		  <ul id="content" class="nav navbar-nav pull-right">
		  </ul>
		  </DIV>
	   </div>
	  </div>
	</div>
	
	<div class="container-fluid" id="main-container">
		<a href="#" id="menu-toggler"><span></span></a>
		<!-- 左侧菜单 -->
	   <div id="sidebar" >
	   </div>
		
		<div id="main-content" class="clearfix">
			<div>
				<iframe name="mainFrame" id="mainFrame" frameborder="0" src="blank.jsp" style="margin:0 auto;width:100%;height:90%"></iframe>
			</div>
		</div>
	</div>
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<!-- 引入 -->
<script type="text/javascript" src="static/js/myjs/menusf.js"></script>

<!--引入属于此页面的js -->
<script type="text/javascript" src="static/js/myjs/index.js"></script>
<script src="static/js/ace.min.js"></script>
<script type="text/javascript">
</script>
</body>
</html>
