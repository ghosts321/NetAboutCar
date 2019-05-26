<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${basePath}css/userReg.css" />
<script type="text/javascript" src="${basePath}js/jquery.selectlist.js"></script>
		<link rel="stylesheet" type="text/css" href="${basePath}css/jquery.selectlist.css"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
			<style type="text/css">
			    .di{
			       margin-top: 8px;   
			    }
			 
				.buss_area .search_block {
					width: 260px;
					float: right;
				}
				
				.buss_area .search_block:after {
					content: "."; 
				    display: block;
				    height: 0; 
				    clear: both; 
				    visibility: hidden;
				}
				
				.buss_area .search_block .title_bar {
					height: 40px;
					line-height: 40px;
					font-size: 16px;
					color: #002ec0;
					background: #f5f5f5 none repeat scroll 0 0;
					border-top: 2px solid #002ec0;
					padding: 0px 10px;
				}
				
				.buss_area .search_block .title_bar:after {
					content: "."; 
				    display: block;
				    height: 0; 
				    clear: both; 
				    visibility: hidden;
				}
				
				.buss_area .search_block .title_bar i {
					margin-right: 5px;
				}
				
				.buss_area .search_block .search_area {
					margin: 0px;
				}
				
				.buss_area .search_block .search_area .search_tabs {
					
				}
				
				.buss_area .search_block .search_area .search_tabs:after {
					content: "."; 
				    display: block;
				    height: 0; 
				    clear: both; 
				    visibility: hidden;
				}
				
				.buss_area .search_block .search_area .search_tabs li {
					width: 50%;
					line-height: 20px;
					float: left;
				}
				
				.buss_area .search_block .search_area li:after {
					content: "."; 
				    display: block;
				    height: 0; 
				    clear: both; 
				    visibility: hidden;
				}
				
				.buss_area .search_block .search_area .search_tabs li a {
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
				
				.buss_area .search_block .search_area .search_tabs li a:hover {
					background-color: #eee0e6;
					border-top: 1px solid #eee0e6;
					border-left: 1px solid #eee0e6;
					border-right: 1px solid #eee0e6;
				}
				
				.buss_area .search_block .search_area .search_tabs li a.active {
					background-color: #ffffff;
					border-top: 1px solid #dddddd;
					border-left: 1px solid #dddddd;
					border-right: 1px solid #dddddd;
				}
				
				.buss_area .search_block .search_area .search_cont {
					border-bottom: 1px solid #e5e5e5;
					border-left: 1px solid #e5e5e5;
					border-right: 1px solid #e5e5e5;
				}
				
				.buss_area .search_block .search_area .search_cont .tab_panel {
					margin: 0px 10px 8px;
					display: none;
				}
				
				.buss_area .search_block .search_area .search_cont .tab_panel.active {
					display: block;
				}
				
				.buss_area .search_block .search_area .search_cont .tab_panel .t_title {
					border-bottom: 1px dotted #ccc;
					color: #555555;
					font-size: 14px;
					font-weight: bold;
					line-height: 24px;
					margin-bottom: 10px;
					padding: 5px;
				}
				
				.buss_area .search_block .search_area .search_cont .tab_panel .t_inp {
					padding: 5px 0px;
					margin: 0px;
					text-align: center;
				}
				
				.buss_area .search_block .search_area .search_cont .tab_panel .t_inp input {
					width: 231px;
				}
				
				.buss_area .search_block .search_area .search_cont .tab_panel .t_button {
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
					background-color: #9B30FF;
					background-image: linear-gradient(to bottom, #9B30FF, #9B30FF);
					border: 1px solid #9B30FF;
					color: #ffffff;
				}
				
				.buss_area .search_block .search_area .search_cont .tab_panel .t_button:hover {
					background-color: #002ec0;
					background-image: linear-gradient(to bottom, #9B30FF, #002ec0);
					text-shadow: 0 1px rgba(0, 0, 0, 0.1);
				}
				
				.buss_area .search_block .search_area .search_cont .tab_panel .t_button i {
					margin-right: 6px;
				}
				select {
	                padding: 3px;
				}
			</style>
				
			<script type="text/javascript">
				$(function() {
					$(".search_tabs li").click(function() {
						$(this).children("a").addClass("active");
						$(this).siblings().children("a").removeClass("active");
						var index = $(".search_tabs li").index(this);
						$(".search_cont>div").eq(index).show().siblings().hide();
					});
				});
				function gotoMore(url) {
					if ($("#main") && url != "") {
						$("#main").load(url, function() {
							
						});
					}
				}
				function gotoMore2(url) {
					var type=$('#contentType option:selected').val();
					var title=$("#title").val();
					
					if(title!=""){
						title = encodeURI(encodeURI(title));
						url+="?type="+type+"&title="+title;
					}else{
						url+="?type="+type;
					}
					
					if ($("#main") && url != "") {
						$("#main").load(url, function() {
							
						});
					}
				}
				
			</script>
	
			<div class="search_block">
				<div class="title_bar">
					<i class="fa fa-search"></i>信息查询
				</div>
				<div class="search_area">
					<div class="search_cont">
						<div id="serach1" class="tab_panel active">
							<form>
							    <div class="di"></div>
								<select style="width:238px;hegith:27px" name="contentType" id="contentType">
							        <option value="1">信息咨讯</option>
							        <option value="2">信息公告</option>
							        <option value="3">政策法规</option>
							        <option value="4">诚信信息</option>
							        <option value="5">投诉披露 </option>
					    		</select>
								<div class="t_inp">
									<input type="text" class="reg_input" name="title" id="title" placeholder="请输入查询标题">
								</div>
								<button class="t_button" type="button" id="chaxun" onclick="gotoMore2('${basePath}announcement/searchAnnouncement.action');">
									<i class="fa fa-search"></i>查询
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
</html>
