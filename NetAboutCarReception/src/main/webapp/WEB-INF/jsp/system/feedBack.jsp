<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<style type="text/css">
			.accordion {
				width: 100%;
				max-width: 300px;
				margin: 0px auto;
				-webkit-border-radius: 4px;
				-moz-border-radius: 4px;
				border-radius: 4px;
			}
			
			.accordion .first_li {
				padding: 0px 0px 15px;
			}
			
			.accordion .first_li_bd {
				border-bottom: 1px dashed #127ea8;
			}
			
			.accordion .link {
				cursor: pointer;
				display: block;
				padding: 20px 15px 10px 30px;
				color: #232323;
				font-size: 16px;
				font-weight: bolder;
				position: relative;
				-webkit-transition: all 0.4s ease;
				-o-transition: all 0.4s ease;
				transition: all 0.4s ease;
			}
			
			.accordion .link:hover {
				color: #ffffff;
				background-color: #00479d;
			}
			
			.accordion .link:hover i {
				color: #ffffff;
			}
			
			.accordion .title_act {
				color: #ffffff;
				background-color: #9932CC;
			}
			
			.accordion .title_act i {
				color: #ffffff;
			}
			
			.accordion li i {
				float: right;
				margin-top: 4px;
				font-size: 18px;
				color: #232323;
				-webkit-transition: all 0.4s ease;
				-o-transition: all 0.4s ease;
				transition: all 0.4s ease;
			}
			
			.accordion li i.fa-chevron-down {
				font-size: 16px;
			}
			
			.accordion li.open i.fa-chevron-down {
				-webkit-transform: rotate(180deg);
				-ms-transform: rotate(180deg);
				-o-transform: rotate(180deg);
				transform: rotate(180deg);
			}
			
			/**
			 * Submenu
			 */
			.submenu {
				font-size: 14px;
				margin: 0px;
			}
			
			.submenu a {
				display: block;
				text-decoration: none;
				font-size: 16px;
				padding: 7px 12px 7px 45px;
				-webkit-transition: all 0.25s ease;
				-o-transition: all 0.25s ease;
				transition: all 0.25s ease;
			}
			
			.submenu a.clr {
				color: #232323;
			}
			
			.submenu a.clr:hover {
				color: #ffffff;
				background: #00479d;
			}
			
			.submenu a.active {
				color: #ffffff;
				background: #9370DB;
			}
			
			.badge-info, .label-info {
			   /*  background-color: #0f7cb1 !important; */
			    background-color: red;
			}
			
			.badge {
			    text-shadow: none;
			    font-size: 12px;
			    padding-top: 1px;
			    padding-bottom: 1px;
			    font-weight: normal;
			    line-height: 15px;
			    padding-left: 7px;
				padding-right: 6px;
				-webkit-border-radius: 9px;
				-moz-border-radius: 9px;
				border-radius: 9px;
				vertical-align: text-top;
				color:white;
			}
		</style>
		<script type="text/javascript">
			$(function() {
				
				var Accordion = function(el, multiple) {
					this.el = el || {};
					this.multiple = multiple || false;
					
					// Variables privadas
					var links = this.el.find('.link');
					// Evento
					links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown);
				};
			
				Accordion.prototype.dropdown = function(e) {
					var $el = e.data.el;
						$this = $(this),
						$next = $this.next();
			
					$next.slideToggle();
					$this.parent().toggleClass('open');
			
					if (!e.data.multiple) {
						$el.find('.submenu').not($next).slideUp().parent().removeClass('open');
					};
				};
			
				var accordion = new Accordion($('#accordion'), true);
				
				if ($("#accordion").outerHeight() < $("#workarea").outerHeight()) {
					$("#menuarea").height($("#workarea").outerHeight() - 2);
				}
					
				//监听主工作区尺寸变化
				$("#accordion").resize(function() {
					$("#menuarea").css("height", "auto");
					if ($("#accordion").outerHeight() < $("#workarea").outerHeight()) {
						$("#menuarea").height($("#workarea").outerHeight() -2);
					}
					//$("#menuarea").height($("#accordion").height());
				});
				
				//初始化菜单选中项
				$("#accordion").find("a:not(this)").removeClass("active").addClass("clr");
				$("#${param.leftmenu}").removeClass("clr").addClass("active");
				$("#accordion").find("li").has(".link.title_act").find("div").removeClass("title_act");
				$("#${param.leftmenu}").parent().parent().find(".link").addClass("title_act");
			});
			
			/**
			 * 改变菜单样式
			 */
			function changeCss(obj) {
				$("#accordion").find("a:not(this)").removeClass("active").addClass("clr");
				$(obj).removeClass("clr").addClass("active");
				$("#accordion").find("li").has(".link.title_act").find("div").removeClass("title_act");
				$(obj).parent().parent().parent().find(".link").addClass("title_act");
			}
			
			/**
			 * 主页工作区跳转
			 * @param {Object} url
			 */
			function funcGo(obj, url) {
				if ($("#main") && url != "") {
					$("#main").load(url, function() {
						
					});
				}
			}
		</script>
	</head>
	<body>
		<div id="menuarea" class="menuarea">
			<ul id="accordion" class="accordion">
					<li class="first_li first_li_bd" onclick="funcGo(this,'${basePath}system/openfeedBack.action')">
						<div class="link"><a class="clr" id="person2" href="#">平台投诉公示</a></div>
					</li>
					<li class="first_li first_li_bd" onclick="funcGo(this,'${basePath}driver/openComplain.action')">
						<div class="link"><a class="clr" id="driver" href="#">驾驶员投诉公示</a></div>
					</li>
			</ul>
		</div>
	</body>
</html>
