<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../common.jsp" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String basePath2 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>主面板</title>
		<link rel="stylesheet" type="text/css" href="${basePath}css/calendar.css">
		<script type="text/javascript" src="${basePath}js/calendar.js"></script>
		<style type="text/css">
			.buss_area .buss_left {
				width: 740px;
				min-height: 200px;
				float: left;
			}
			
			.buss_area .buss_right {
				width: 260px;
				min-height: 200px;
				float: left;
			}
			
			.buss_area .buss_left .row {
				margin-bottom: 15px;
			}
			
			.buss_area .buss_left .row:after {
				content: ".";
				display: block;
				height: 0;
				clear: both;
				visibility: hidden;
			}
			
			.buss_area .buss_left .row .img_news {
				width: 350px;
				float: left;
				margin-right: 20px;
			}
			
			.buss_area .buss_left .row .info_block {
				width: 350px;
				height: 192px;
				over-flow: hidden;
				float: left;
				margin-right: 20px;
			}
			
			.buss_area .buss_left .row .info_block .title_bar {
				height: 40px;
				line-height: 40px;
				font-size: 16px;
				background: #f5f5f5 none repeat scroll 0 0;
				border-top: 2px solid #114ec9;
				padding: 0px 10px;
			}
			
			.buss_area .buss_left .row .info_block .title_bar:after {
				content: ".";
				display: block;
				height: 0;
				clear: both;
				visibility: hidden;
			}
			
			.buss_area .buss_left .row .info_block .title_bar i {
				margin-right: 5px;
				color: #0000cd;
			}
			
			.buss_area .buss_left .row .info_block .title_bar .more {
				float: right;
				font-size: 14px;
				color: #114ec9;
			}
			
			.buss_area .buss_left .row .info_block .title_bar .more:hover {
				color: #002ec0;
			}
			
			.buss_area .buss_left .row .info_block .content_box {
				margin: 5px 0px;
			}
			
			.buss_area .buss_left .row .info_block .content_box li {
				line-height: 28px;
			}
			
			.buss_area .buss_left .row .info_block .content_box li:after {
				content: ".";
				display: block;
				height: 0;
				clear: both;
				visibility: hidden;
			}
			
			.buss_area .buss_left .row .info_block .content_box li i {
				font-size: 6px;
				float: left;
				padding: 12px 5px 0px 0px;
			}
			
			.buss_area .buss_left .row .info_block .content_box li .info_index {
				display: block;
				float: left;
				width: 250px;
				color: #10218b;
				overflow: hidden;
				text-overflow: ellipsis;
				white-space: nowrap;
				word-break: keep-all;
				cursor: pointer;
			}
			
			.buss_area .buss_left .row .info_block .content_box li .info_index:hover
				{
				color: #002ec0;
			}
			
			.buss_area .buss_left .row .info_block .content_box li .info_time {
				float: right;
				width: 80px;
			}
			
			.buss_area .buss_right .complain_block {
				width: 260px;
				float: right;
				margin: 38px 0px 0px;
			}
			
			.buss_area .buss_right .complain_block:after {
				content: ".";
				display: block;
				height: 0;
				clear: both;
				visibility: hidden;
			}
			
			.buss_area .buss_right .complain_block .title_bar {
				height: 40px;
				line-height: 40px;
				font-size: 16px;
				color: #e60000;
				background: #f5f5f5 none repeat scroll 0 0;
				border-top: 2px solid #e60000;
				padding: 0px 10px;
			}
			
			.buss_area .buss_right .complain_block .title_bar:after {
				content: ".";
				display: block;
				height: 0;
				clear: both;
				visibility: hidden;
			}
			
			.buss_area .buss_right .complain_block .title_bar i {
				margin-right: 5px;
			}
			
			.buss_area .buss_right .complain_block .search_area {
				margin: 0px;
			}
			
			.buss_area .buss_right .complain_block .search_area .search_tabs {
				
			}
			
			.buss_area .buss_right .complain_block .search_area .search_tabs:after {
				content: ".";
				display: block;
				height: 0;
				clear: both;
				visibility: hidden;
			}
			
			.buss_area .buss_right .complain_block .search_area .search_tabs li {
				width: 50%;
				line-height: 20px;
				float: left;
			}
			
			.buss_area .buss_right .complain_block .search_area li:after {
				content: ".";
				display: block;
				height: 0;
				clear: both;
				visibility: hidden;
			}
			
			.buss_area .buss_right .complain_block .search_area .search_tabs li a {
				line-height: 20px;
				padding: 10px 8px;
				text-align: center;
				display: block;
				background-color: #f0f0f0;
				border-top: 1px solid #f0f0f0;
				border-left: 1px solid #f0f0f0;
				border-right: 1px solid #f0f0f0;
				cursor: pointer;
			}
			
			.buss_area .buss_right .complain_block .search_area .search_tabs li a:hover
				{
				background-color: #eee0e6;
				border-top: 1px solid #eee0e6;
				border-left: 1px solid #eee0e6;
				border-right: 1px solid #eee0e6;
			}
			
			.buss_area .buss_right .complain_block .search_area .search_tabs li a.active
				{
				background-color: #ffffff;
				border-top: 1px solid #dddddd;
				border-left: 1px solid #dddddd;
				border-right: 1px solid #dddddd;
			}
			
			.buss_area .buss_right .complain_block .search_area .search_cont {
				border-bottom: 1px solid #e5e5e5;
				border-left: 1px solid #e5e5e5;
				border-right: 1px solid #e5e5e5;
			}
			
			.buss_area .buss_right .complain_block .search_area .search_cont .tab_panel
				{
				margin: 0px 10px 8px;
				display: none;
			}
			
			.buss_area .buss_right .complain_block .search_area .search_cont .tab_panel.active
				{
				display: block;
			}
			
			.buss_area .buss_right .complain_block .search_area .search_cont .tab_panel .t_title
				{
				border-bottom: 1px dotted #ccc;
				color: #555555;
				font-size: 14px;
				font-weight: bold;
				line-height: 24px;
				margin-bottom: 10px;
				padding: 5px;
			}
			
			.buss_area .buss_right .complain_block .search_area .search_cont .tab_panel .t_inp
				{
				padding: 5px 0px;
				margin: 0px;
				text-align: center;
			}
			
			.buss_area .buss_right .complain_block .search_area .search_cont .tab_panel .t_inp input
				{
				width: 231px;
			}
			
			.buss_area .buss_right .complain_block .search_area .search_cont .tab_panel .t_inp textarea
				{
				width: 231px;
			}
			
			.buss_area .buss_right .complain_block .search_area .search_cont .tab_panel .t_button
				{
				line-height: 20px;
				width: 100%;
				font-size: 16px;
				border-radius: 3px;
				-moz-border-radius: 3px;
				-webkit-border-radius: 3px;
				margin: 15px 0px 5px;
				padding: 6px 14px;
				text-align: center;
				overflow: visible;
				text-transform: uppercase;
				cursor: pointer;
				background-color: #e60000;
				background-image: linear-gradient(to bottom, #e60000, #e60000);
				border: 1px solid #e60000;
				color: #ffffff;
			}
			
			.buss_area .buss_right .complain_block .search_area .search_cont .tab_panel .t_button:hover
				{
				background-color: #fe280e;
				background-image: linear-gradient(to bottom, #fe280e, #e60000);
				text-shadow: 0 1px rgba(0, 0, 0, 0.1);
			}
			
			.buss_area .buss_right .complain_block .search_area .search_cont .tab_panel .t_button i
				{
				margin-right: 6px;
			}
			
			/*yx_rotaion*/
			.yx-rotaion {
				width: 350px;
				height: 192px;
				margin: 0 auto;
			}
			
			.yx-rotaion-btn,.yx-rotaion-title,.yx-rotation-focus,.yx-rotation-t,.yx-rotaion-btn
				{
				position: absolute
			}
			
			.yx-rotation-title {
				position: absolute;
				width: 100%;
				height: 40px;
				line-height: 40px;
				background: #000;
				filter: alpha(opacity = 40);
				-moz-opacity: 0.4;
				-khtml-opacity: 0.4;
				opacity: 0.4;
				left: 0;
				bottom: 0;
				_bottom: -1px;
				z-index: 1
			}
			
			.yx-rotation-t {
				color: #fff;
				font-size: 14px;
				font-family: microsoft yahei;
				z-index: 2;
				bottom: 0;
				left: 10px;
				line-height: 40px
			}
			
			.yx-rotation-focus span,.yx-rotaion-btn span {
				background: url(../images/firstpage/ico.png) no-repeat;
				display: block;
			}
			
			.yx-rotation-focus {
				height: 40px;
				line-height: 40px;
				right: 20px;
				bottom: 0;
				z-index: 2
			}
			
			.yx-rotation-focus span {
				width: 12px;
				height: 12px;
				line-height: 12px;
				float: left;
				margin-left: 5px;
				position: relative;
				top: 14px;
				cursor: pointer;
				background-position: -24px -126px;
				text-indent: -9999px
			}
			
			.yx-rotaion-btn {
				width: 100%;
				height: 41px;
				top: 50%;
				margin-top: -20px;
			}
			
			.yx-rotaion-btn span {
				width: 41px;
				height: 41px;
				cursor: pointer;
				filter: alpha(opacity = 30);
				-moz-opacity: 0.3;
				-khtml-opacity: 0.3;
				opacity: 0.3;
				position: relative
			}
			
			.yx-rotaion-btn .left_btn {
				background-position: -2px -2px;
				float: left;
				left: 10px
			}
			
			.yx-rotaion-btn .right_btn {
				background-position: -2px -49px;
				float: right;
				right: 10px
			}
			
			.yx-rotaion-btn span.hover {
				filter: alpha(opacity = 80);
				-moz-opacity: 0.8;
				-khtml-opacity: 0.8;
				opacity: 0.8
			}
			
			.yx-rotation-focus span.hover {
				background-position: -10px -126px
			}
			
			.rotaion_list {
				width: 0;
				height: 0;
				overflow: hidden;
			}
			
			.rotaion_list img {
				width: 350px;
				height: 192px;
			}
			.myImg:hover{
			 cursor:pointer;
			}
			.buss_right li{
				line-height: 40px;
				height: 42px;
				background-color: #fff;
				padding-left: 26px;
				border-bottom: 1px solid #e5e5e5;
				cursor: pointer;
			}
		</style>
		<script type="text/javascript">
		
		$(function(){
			var lbContent="";
			 $.ajax({
				    type:"POST",
				    async:false,
				    url:"${basePath}content/getLbContent.action",
				    success:function(returnValue){
				   		lb=eval("("+returnValue+")");
				   	}
			 });
			 for(var i=0;i<lb.length;i++){
	   			lbContent+="<li><a href='<%=services_path%>"+lb[i].url+"' target='_blank'><img src='<%=services_path%>face/"+lb[i].imgPath+"' alt='"+lb[i].title+"'></a></li>";
			}
		    $("#lbContent").html(lbContent);
		    
			 $.ajax({
				    type:"POST",
				    async:false,
				    url:"${basePath}content/toFirstPage.action",
				    success:function(returnValue){
				   // alert(returnValue)
				   		a=eval("("+returnValue+")");
				   	}
			 });
			  var ss1="";
			  var ss2="";
			  var ss3="";
			  var ss4="";
			  var ss5="";
			  var n1=0;
			  var n2=0;
			  var n3=0;
			  var n4=0;
			  var n5=0;
				for(var i=0;i<a.length;i++){
					var title=a[i].title;
					var linkh='<%=services_path%>'+a[i].url;
					var id =a[i].id;
				    var createDate=a[i].createDate;
					if(a[i].type == '1'&& n1<5){
						 
						ss1+="<li><i class='fa fa-circle'></i>";
						ss1+='<a class="info_index" href="'+linkh+'" target="_blank">'+title+'</a>';
						ss1+='<span class="info_time">'+createDate.slice(0,10)+'</span>';
						ss1+="</li>";
						n1++;
					}else if(a[i].type == '2'&& n2<5){
						ss2+="<li><i class='fa fa-circle'></i>";
						ss2+='<a class="info_index" href="'+linkh+'" target="_blank">'+title+'</a>';
						ss2+='<span class="info_time">'+createDate.slice(0,10)+'</span>';
						ss2+="</li>";
						n2++;
					}else if(a[i].type == '3'&& n3<5){
						ss3+="<li><i class='fa fa-circle'></i>";
						ss3+='<a class="info_index" href="'+linkh+'" target="_blank">'+title+'</a>';
						ss3+='<span class="info_time">'+createDate.slice(0,10)+'</span>';
						ss3+="</li>";
						n3++;
					}else if(a[i].type == '4'&& n4<5){
						ss4+="<li><i class='fa fa-circle'></i>";
						ss4+='<a class="info_index" href="'+linkh+'" target="_blank">'+title+'</a>';
						ss4+='<span class="info_time">'+createDate.slice(0,10)+'</span>';
						ss4+="</li>";
						n4++;
					}else if(a[i].type == '5'&& n5<5){
						ss5+="<li><i class='fa fa-circle'></i>";
						ss5+='<a class="info_index" href="'+linkh+'" target="_blank">'+title+'</a>';
						ss5+='<span class="info_time">'+createDate.slice(0,10)+'</span>';
						ss5+="</li>";
						n5++;
					}
				}
			 $("#xxzx").html(ss1);
		     $("#xxgg").html(ss2);
			 $("#cxxx").html(ss4);
			 $("#zcfg").html(ss3);
			 $("#tspl").html(ss5);
			
			
		});
		
			$("#bytaxidate").calendar({
				trigger : '#bydate',
				zIndex : 999,
				format : 'yyyy-mm-dd hh-MM-ss',
				date : new Date(),
				onSelected : function(view, date, data) {
					console.log('event: onSelected');
				},
				onClose : function(view, date, data) {
					console.log('event: onClose');
					console.log('view:' + view);
					console.log('date:' + date);
					console.log('data:' + (data || 'None'));
				}
			});

			/***********幻灯*****************/
			(function($){	
				$.fn.extend({	 
					yx_rotaion: function(options) {	
						//默认参数
						var defaults = {
							/**轮换间隔时间，单位毫秒*/
							during: 3000,
							/**是否显示左右按钮*/
							btn: false,
							/**是否显示焦点按钮*/
							focus: true,
							/**是否显示标题*/
							title: true,
							/**是否自动播放*/
							auto: true				 
						};
						var options = $.extend(defaults, options);
						return this.each(function(){
							var o = options;
							var curr_index = 0;
							var $this = $(this);			
							var $li = $this.find("li");
							var li_count = $li.length;
							$this.css({position:'relative',overflow:'hidden'});
							$this.find("li").css({position:'absolute',left:0,top:0}).hide();
							$li.first().show();
							$this.append('<div class="yx-rotaion-btn"><span class="left_btn"><\/span><span class="right_btn"></span><\/div>');
							if (!o.btn) {
								$(".yx-rotaion-btn").css({visibility:'hidden'});
							}
							if (o.title) {
								$this.append(' <div class="yx-rotation-title"><\/div><a href="" class="yx-rotation-t"><\/a>');
							}
							if (o.focus) {
								$this.append('<div class="yx-rotation-focus"><\/div>');
							}
							var $btn = $(".yx-rotaion-btn span"),
								$title = $(".yx-rotation-t"),
								$title_bg = $(".yx-rotation-title"),
								$focus = $(".yx-rotation-focus");
							//如果自动播放，设置定时器
							if(o.auto) {
								var t = setInterval(function(){
									$btn.last().click();
								},o.during);
							}
							$title.text($li.first().find("img").attr("alt"));
							$title.attr("href",$li.first().find("a").attr("href"));			
							
							// 输出焦点按钮
							for (var i = 1; i <= li_count; i++){
								$focus.append('<span>'+i+'</span>');
							}
							
							// 兼容IE6透明图片	
							if (/msie/.test(navigator.userAgent.toLowerCase()) && 'undefined' == typeof(document.body.style.maxHeight) ) {
								$btn.add($focus.children("span")).css({backgroundImage:'url(../images/firstpage/ico.gif)'});
							}	
							var $f = $focus.children("span");
							$f.first().addClass("hover");
							
							// 鼠标覆盖左右按钮设置透明度
							$btn.hover(function(){
								$(this).addClass("hover");
							},function(){
								$(this).removeClass("hover");
							});
							
							//鼠标覆盖元素，清除计时器
							$btn.add($li).add($f).hover(function(){
								if(t) {
									clearInterval(t);
								}
							},function(){
								if(o.auto) {
									t = setInterval(function(){$btn.last().click();},o.during);
								}
							});
							
							//鼠标覆盖焦点按钮效果
							$f.bind("mouseover",function(){
								var i = $(this).index();
								$(this).addClass("hover");
								$focus.children("span").not($(this)).removeClass("hover");
								$li.eq(i).fadeIn(300);
								$li.not($li.eq(i)).fadeOut(300);
								$title.text($li.eq(i).find("img").attr("alt"));
								curr_index = i;
							});
							
							//鼠标点击左右按钮效果
							$btn.bind("click",function(){
								$(this).index() == 1?curr_index++:curr_index--;
								if(curr_index >= li_count) curr_index = 0;
								if(curr_index < 0) curr_index = li_count-1;
								$li.eq(curr_index).fadeIn(300);
								$li.not($li.eq(curr_index)).fadeOut(300);
								$f.eq(curr_index).addClass("hover");
								$f.not($f.eq(curr_index)).removeClass("hover");
								$title.text($li.eq(curr_index).find("img").attr("alt"));
								$title.attr("href",$li.eq(curr_index).find("a").attr("href"));
							});
						});
					}
				});
			})(jQuery);
			
			$(document).ready(function(){
				$(".yx-rotaion").yx_rotaion({auto:true});
			});
			function reload(){
				 window.location.reload();
			}
		</script>
	</head>
	<body>
		<div class="buss_area">
			<div class="buss_left">
				<div class="row">
					<div class="img_news">
						<div class="yx-rotaion">
							<ul class="rotaion_list" id="lbContent">
							   <%-- <c:forEach var="content" items="${sessionScope.list2 }">
									<li><a href="<%=services_path%>${content.url }" target="_blank"><img src="<%=services_path%>/face/${content.imgPath }" alt="${content.title }"></a></li>
							   </c:forEach> --%>
								<!-- <li><a href=""><img src="../images/firstpage/banner1.jpg" alt="本市网约车监管细则出台"></a></li>
								<li><a href=""><img src="../images/firstpage/banner2.jpg" alt="市领导视察滴滴公司"></a></li>
								<li><a href=""><img src="../images/firstpage/banner3.jpg" alt="交通厅召开网约车专项整治活动会议"></a></li> -->
							</ul>
						</div>
					</div>
					<div class="info_block">
						<div class="title_bar">
							<i class="fa fa-newspaper-o"></i>信息咨讯
							<a class="more" href="javascript:void(0);" onclick="gotoMore('${basePath}announcement/searchAnnouncement.action?type=1');">更多&gt;&gt;</a>
						</div>
						<ul class="content_box" id="xxzx">
						     
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="info_block">
						<div class="title_bar">
							<i class="fa fa-bullhorn"></i>信息公告
							<a class="more" href="javascript:void(0);" onclick="gotoMore('${basePath}announcement/searchAnnouncement.action?type=2');">更多&gt;&gt;</a>
						</div>
						<ul class="content_box" id="xxgg">
							 
						</ul>
					</div>
					<div class="info_block">
						<div class="title_bar">
							<i class="fa fa-credit-card"></i>诚信信息
							<a class="more" href="javascript:void(0);" onclick="gotoMore('${basePath}announcement/searchAnnouncement.action?type=4');">更多&gt;&gt;</a>
						</div>
						<ul class="content_box" id="cxxx">
							 
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="info_block">
						<div class="title_bar">
							<i class="fa fa-legal"></i>政策法规
							<a class="more" href="javascript:void(0);" onclick="gotoMore('${basePath}announcement/searchAnnouncement.action?type=3');">更多&gt;&gt;</a>
						</div>
						<ul class="content_box" id="zcfg">
							 
						</ul>
					</div>
					<div class="info_block">
						<div class="title_bar">
							<i class="fa fa-comments-o"></i>投诉披露
							<a class="more" href="javascript:void(0);" onclick="gotoMore('${basePath}announcement/searchAnnouncement.action?type=5');">更多&gt;&gt;</a>
						</div>
						<ul class="content_box" id="tspl">
							 
						</ul>
					</div>
				</div>
				
			</div>
			<div class="buss_right">
				<jsp:include page="/WEB-INF/jsp/announcement/announcementSearch.jsp" />
				<div class="search_block" style="margin-top: 32px;">
					<div class="title_bar">
						<i class="fa fa-envelope-o"></i>友情链接
					</div>
					<ul class="content_box">
                        <li>
                                <a href="http://www.moc.gov.cn/" target="_blank">中华人民共和国交通运输部</a>
                        </li>
                        <li>
                                <a href="http://www.mps.gov.cn/n16/index.html" target="_blank">中华人民共和国公安部</a>
                        </li>
                        <li>
                                <a href="http://www.hncd.gov.cn/portal/index.htm" target="_blank">河南省交通运输厅</a>
                        </li>
        			</ul>
					<!-- <div class="search_area">
						<div class="search_cont">
							<div id="serach1" class="tab_panel active">
								<ul class="news-list">
				                    <li class="active">
				                        <span class='dots'>·</span>
				                        <a href="/cmspage/jgdt/2016-10-14/20161014000099.html" title="10月13日至17日丰台支队方庄大队执法站暂停办公" target="_blank">10月13日至17日丰台支队方庄大队执</a>
				                    <span class="news-time">10-14</span>
				
				                    </li>
				                    <li class="">
				                        <span class='dots'>·</span>
				                        <a href="/cmspage/jgdt/2016-10-14/20161014000098.html" title="10月14日至17日东城支队广渠门综合服务大厅暂停办公" target="_blank">10月14日至17日东城支队广渠门综合</a>
				                    <span class="news-time">10-14</span>
				
				                    </li>
				                    <li class="">
				                        <span class='dots'>·</span>
				                        <a href="/cmspage/jgdt/2016-08-22/20160822000095.html" title="八大处建成停车诱导系统" target="_blank">八大处建成停车诱导系统</a>
				                    <span class="news-time">08-22</span>
				
				                    </li>
				                    <li class="">
				                        <span class='dots'>·</span>
				                        <a href="/cmspage/jgdt/2016-08-22/20160822000093.html" title="三环主路将夜间大修 交管部门提示过往车辆注意安全提前绕行" target="_blank">三环主路将夜间大修 交管部门提示</a>
				                    <span class="news-time">08-22</span>
				
				                    </li>
				        		</ul>
							</div>
						</div>
					</div> -->
				</div>
				<div class="complain_block">
					<div class="title_bar">
						<i class="fa fa-envelope-o"></i>投诉
					</div>
					<div class="search_area">
						<div class="search_cont">
							<div id="serach1" class="tab_panel active">
								<img class="myImg" width="220" height="160" style="padding-left: 10px" title="投诉举报" onclick="mainGo('7', '${basePath}system/openComplain.action');" src="<%=basePath %>images/abc.jpg">
								<%-- <form >
									<div class="t_title">网约车投诉</div>
									<div class="t_inp">
										<input type="text" class="reg_input" name="carno" id="carno" placeholder="请输入车牌号">
									</div>
									<div class="t_inp">
										<input type="text" class="reg_input" name="bydate" id="bydate" placeholder="请选择乘车时间">
										<div id="bytaxidate"></div>
									</div>
									<div class="t_inp">
										<textarea class="reg_textarea" name="title" id="title" rows="3" placeholder="请输入投诉内容"></textarea>
									</div>
									<button class="t_button" type="button" onclick="gotoMore('${basePath}announcement/searchAnnouncement.action');">
										<i class="fa fa-envelope-o"></i>投诉
									</button>
								</form> --%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
