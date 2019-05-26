<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>网约车资质审核系统</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="static/login/bootstrap.min.css" />
<link rel="stylesheet" href="static/login/css/camera.css" />
<link rel="stylesheet" href="static/login/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="static/login/matrix-login.css" />
<link href="static/login/font-awesome.css" rel="stylesheet" />
<script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>

</head>
<style>
/* body{background-color:#067bc1;background-image: static/images/bg.jpg}
 */
  body{background-image: url(static/images/bg_login_02.jpg);} 
/*   body{background-color:#067bc1;}   */
  
  
</style>
<body>

	<div
		style="width:100%;text-align: center;margin: 0 auto;position: absolute;">
		<div id="loginbox">
			<form action="" method="post" name="loginForm"
				id="loginForm">
				<div class="control-group normal_text" >
<!-- 				style="background-image : url(static/images/bg_title_01.jpg);" -->
					<img style="width:100%;height:80px;" src="static/images/bg_title_03.jpg" alt="Logo" />
<!-- 					<h3> -->
<!-- 						<img src="static/login/logo.png" alt="Logo" /> -->
<!-- 						网络预约出租车监管服务平台 -->
<!-- 					</h3> -->
				</div>
				<div style="float:left;" class="class="control-group normal_text">
					&nbsp;&nbsp;&nbsp;<img style="width:200px;height:140px;" src="static/images/bg_title_left_04.jpg" alt="Logo" />
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="19" src="static/login/user.png" /></i>
							</span><input type="text" name="userName" id="userName" value="" placeholder="请输入用户名" />
						</div>
					</div>
				</div>
				<input type="hidden" id="remFlag" value=""/>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly">
							<i><img height="19" src="static/login/suo.png" /></i>
							</span><input type="password" name="password" id="password" placeholder="请输入密码" value="" />
						</div>
					</div>
				</div>
				<div style="float:right;padding-right:38%;display:none" >
					<div style="float: left;margin-top:3px;margin-right:2px;">
						<font>记住密码</font>
					</div>
					<div style="float: left;">
						<input name="form-field-checkbox" id="saveid" type="checkbox"
							onclick="remember();" style="padding-top:0px;" />
					</div>
				</div>
				<div class="form-actions">
					<div style="width:86%;padding-left:-9%;" align="center">

						<!-- <div style="float: left;">
							<i><img src="static/login/yan.png" /></i>
						</div>
						<div style="float: left;" class="codediv">
							<input type="text" name="code" id="code" class="login_code"
								style="height:16px; padding-top:0px;" />
						</div>
						<div style="float: left;">
							<i><img style="height:22px;" id="codeImg" alt="点击更换"
								title="点击更换" src="" /></i>
						</div> -->

						<!-- <span class="pull-right" style="padding-right:12%;"><a
							href="javascript:regist();" class="btn btn-success">注册</a></span> --> 
							<span class="pull-right"><a onclick="severCheck();"
							class="flip-link btn btn-info" id="to-recover">登录</a></span>

					</div>
				</div>
			</form>


		</div>
	</div>
	 <!--  <div id="templatemo_banner_slide" class="container_wapper">
		<div class="camera_wrap camera_emboss" id="">
			<div data-src="static/images/bg.jpg"></div>
			<div data-src="static/images/bg2.jpg"></div>
		</div>
	</div> -->
 
	<script type="text/javascript">
	
		//服务器校验
		function severCheck(){
			if(check()){
				
				var userName = $("#userName").val();
				var password = $("#password").val();
				var remFlag = $("#remFlag").val();
				//var code = "qq313596790fh"+userName+",fh,"+password+"QQ978336446fh"+",fh,"+$("#code").val();
				$.ajax({
					type: "POST",
					url: 'login/userLogin.action',
			    	data: {userName:userName,password:password,remFlag:remFlag,tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
						if("success" == data.result){
							//saveCookie();
							window.location.href="index.jsp?no-cache=" + Math.random();
						}else if("usererror" == data.result){
							$("#userName").tips({
								side : 1,
								msg : "用户名或密码有误",
								bg : '#FF5080',
								time : 15
							});
							$("#userName").focus();
						}else if("codeerror" == data.result){
							$("#code").tips({
								side : 1,
								msg : "验证码输入有误",
								bg : '#FF5080',
								time : 15
							});
							$("#code").focus();
						}else{
							$("#userName").tips({
								side : 1,
								msg : "缺少参数",
								bg : '#FF5080',
								time : 15
							});
							$("#userName").focus();
						}
					}
				});
			}
		}
	
		$(document).ready(function() {
			changeCode();
			$("#codeImg").bind("click", changeCode);
			 //记住密码功能
	        var str = getCookie("loginInfo");
	        str = str.substring(1,str.length-1);
	        var username = str.split(",")[0];
	        var password = str.split(",")[1];
	        //自动填充用户名和密码
	      /*   $("#userName").val(username);
	        $("#password").val(password); */
	        $("#userName").blur(function(){
				var usrName=$("#userName").val();
				if(username==usrName){
					$("#password").val(password);
				}else{
					$("#password").val('');
				}
			});
		});

		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#to-recover").trigger("click");
			}
		});

		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}

		function changeCode() {
			$("#codeImg").attr("src", "code.do?t=" + genTimestamp());
		}

		//客户端校验
		function check() {

			if ($("#userName").val() == "") {

				$("#userName").tips({
					side : 2,
					msg : '用户名不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#userName").focus();
				return false;
			} else {
				$("#userName").val(jQuery.trim($('#userName').val()));
			}

			if ($("#password").val() == "") {

				$("#password").tips({
					side : 2,
					msg : '密码不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#password").focus();
				return false;
			}
			/* if ($("#code").val() == "") {

				$("#code").tips({
					side : 1,
					msg : '验证码不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#code").focus();
				return false;
			} */

			$("#loginbox").tips({
				side : 1,
				msg : '正在登录 , 请稍后 ...',
				bg : '#68B500',
				time : 10
			});

			return true;
		}

		function savePaw() {
			/* if (!$("#saveid").attr("checked")) {
				$.cookie('userName', '', {
					expires : -1
				});
				$.cookie('password', '', {
					expires : -1
				});
				$("#userName").val('');
				$("#password").val('');
			} */
		}

		//获取cookie
		function getCookie(cname) {
		    var name = cname + "=";
		    var ca = document.cookie.split(';');
		    for(var i=0; i<ca.length; i++) {
		        var c = ca[i];
		        while (c.charAt(0)==' ') c = c.substring(1);
		        if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
		    }
		    return "";
		}

		//记住密码功能
		function remember(){
		    var remFlag = $("input[type='checkbox']").is(':checked');
		    if(remFlag==true){ //如果选中设置remFlag为1
		        //cookie存用户名和密码,回显的是真实的用户名和密码,存在安全问题.
		        var conFlag = confirm("记录密码功能不宜在公共场所(如网吧等)使用,以防密码泄露.您确定要使用此功能吗?");
		        if(conFlag){ //确认标志
		            $("#remFlag").val("1");
		        }else{
		            $("input[type='checkbox']").removeAttr('checked');
		            $("#remFlag").val("");
		        }
		    }else{ //如果没选中设置remFlag为""
		        $("#remFlag").val("");
		    }
		}
		

		function saveCookie() {
			if ($("#saveid").attr("checked")) {
				$.cookie('userName', $("#userName").val(), {
					expires : 7
				});
				$.cookie('password', $("#password").val(), {
					expires : 7
				});
			}
		}
		function quxiao() {
			$("#userName").val('');
			$("#password").val('');
		}
		
		jQuery(function() {
			var userName = $.cookie('userName');
			var password = $.cookie('password');
			if (typeof(userName) != "undefined"
					&& typeof(password) != "undefined") {
				$("#userName").val(userName);
				$("#password").val(password);
				$("#saveid").attr("checked", true);
				$("#code").focus();
			}
		});
		
		function stripscript(s) 
		{ 
		var pattern = new RegExp("[%--`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]")        //格式 RegExp("[在中间定义特殊过滤字符]")
		var rs = ""; 
		for (var i = 0; i < s.length; i++) { 
		 rs = rs+s.substr(i, 1).replace(pattern, ''); 
		}
		return rs;
		}
		
		
	</script>
	<script>
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
	</script>

	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/jquery-1.7.2.js"></script>
	<script src="static/login/js/jquery.easing.1.3.js"></script>
	<script src="static/login/js/jquery.mobile.customized.min.js"></script>
	<script src="static/login/js/camera.min.js"></script>
	<script src="static/login/js/templatemo_script.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
</body>

</html>