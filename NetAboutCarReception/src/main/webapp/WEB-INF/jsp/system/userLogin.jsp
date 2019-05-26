<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>用户登录</title>
		<link rel="stylesheet" type="text/css" href="${basePath}css/fontawesome/css/font-awesome.min.css" />
		<!--[if IE]>
		<link rel="stylesheet" type="text/css" href="${basePath}css/client/css/font-awesome-ie7.min.css" />
		<![endif]-->
		<script type="text/javascript" src="${basePath}js/formValidator_min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidatorRegex.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery.form.js"></script>
		<style type="text/css">
			.login_area {
			}
			
			.login_area .login_block {
				margin: 0;
				padding: 0;
			}
			
			.login_area .login_block .login_tabs {
				ist-style: outside none none;
				border-bottom: 1px solid #ddd;
			}
			
			.login_area .login_block .login_tabs:after {
				content: "."; 
			    display: block;
			    height: 0; 
			    clear: both; 
			    visibility: hidden;
			}
			
			.login_area .login_block .login_tabs li {
				line-height: 20px;
				margin-bottom: -1px;
				float: left;
			}
			
			.login_area .login_block .login_tabs li a {
				display: block;
				background-color: #f5f5f5;
				border: 1px solid transparent;
				color: #555;
				line-height: 20px;
				padding: 10px 12px;
				text-align: center;
				cursor: pointer;
			}
			
			.login_area .login_block .login_tabs li a:hover {
				background-color: #eeeeee;
			}
			
			.login_area .login_block .login_tabs li a.active {
				background-color: #fff;
				border-top: 1px solid #dddddd;
				border-left: 1px solid #dddddd;
				border-right: 1px solid #dddddd;
				cursor: default;
			}
			
			.login_area .login_block .tab_content {
				margin: 0;
				padding: 0;
			}
			
			.login_area .login_block .tab_content .login_form {
				margin-top: 30px;
			}
			
			.login_area .login_block .tab_content .login_form .form_table {
				width: 100%;
				border-collapse: collapse;
				border: none;
			}
			
			.login_area .login_block .tab_content .login_form .form_table td {
				border: 0px;
				padding: 10px 6px;
				color: #555555;
			}
			
			.login_area .login_block .tab_content .login_form .form_table .but_area {
				background: rgba(255, 255, 255, 0.6) none repeat scroll 0 0;
				border-top: 1px solid #e5e5e5;
				margin: 20px 0px;
				padding-top: 20px;
				padding-left: 155px;
			}
			
			.login_area .login_block .tab_content .login_form .form_table .but_area:after {
				content: "."; 
			    display: block;
			    height: 0; 
			    clear: both; 
			    visibility: hidden;
			}
		</style>
		<script type="text/javascript">
			$(function() {
				$(".login_tabs").children("li").children("a").removeClass("active");
				
				var usertype = "${usertype}";
				if (usertype && usertype != "") {
					if (usertype == "0") {
						$(".login_tabs").children("li").eq(0).children("a").addClass("active");
						$(".tab_content").children("div").eq(0).show().siblings().hide();
					} else if (usertype == "1"){
						$(".login_tabs").children("li").eq(1).children("a").addClass("active");
						$(".tab_content").children("div").eq(1).show().siblings().hide();
					}
				}
				
				$(".login_tabs li a").click(function() {
					$(".login_tabs").children("li").children("a").removeClass("active");
					$(this).addClass("active");
					var index = $(".login_tabs li a").index(this);
					$(".tab_content>div").eq(index).show().siblings().hide();
				});
				
				//第一组校验组，默认组号为"1"
				$.formValidator.initConfig({formid:"form1",submitButtonID:"button1",debug:false,submitonce:false,
					/*
					onerror:function(msg,obj,errorlist){
						//$.map(errorlist,function(msg1){alert(msg1)});
						alert(msg);
					}*/
					onsuccess:function(){
						$("#form1").ajaxSubmit({
		                    type:'post',
		                    url:'${basePath}system/userLogin.action',
		                    success:function(data){
		                    	if(data == "success"){
		                    		window.location.href="${basePath}system/toMain.action?userType=1";
								}else if(data == "error"){
									alert("登录失败！");
								}else if(data == "nosession"){
									window.location.href="${basePath}system/loginout.action";
								}
		                    }
		                });
						return false;
					}
				});
				$("#certno").formValidator({onshow:"请输入15或18位的身份证",onfocus:"请输入15或18位的身份证",oncorrect:"输入正确"}).functionValidator({fun:isCardID});
				$("#password").formValidator({onshow:"请输入至少6个字符",onfocus:"请输入至少6个字符",oncorrect:"密码合法"}).inputValidator({min:6,empty:{leftempty:false,rightempty:false,emptyerror:"密码不能为空格"},onerror:"输入有误"});
				/* 
				$("#phoneNumber").formValidator({onshow:"11位手机号",onfocus:"11位手机号",oncorrect:"通过"}).regexValidator({ regExp: "mobile", onError: "手机号码格式不正确" });
				$("#iptName").formValidator({onshow:"至少4个字符",onfocus:"至少4个字符",oncorrect:"通过"}).inputValidator({min:4,empty:{leftempty:false,rightempty:false,emptyerror:"输入有误"},onerror:"输入有误"});
				$("#t_Email").formValidator({onshow:"6-100个字符",onfocus:"6-100个字符",oncorrect:"恭喜你,你输对了",defaultvalue:"@"}).inputValidator({min:6,max:100,onerror:"长度非法"}).regexValidator({regexp:"^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$",onerror:"格式不正确"});
			    */
				
				//第二组校验组，组号为"2"
				$.formValidator.initConfig({validatorgroup:"2",formid:"form2",submitButtonID:"button2",debug:false,submitonce:false,
					/*,
					onerror:function(msg,obj,errorlist){
						//$.map(errorlist,function(msg1){alert(msg1)});
						alert(msg);
					}*/
					onsuccess:function(){
						$("#form2").ajaxSubmit({
		                    type:'post',
		                    url:'${basePath}system/platFormUserLogin.action',
		                    success:function(data){
		                    	if(data == "success"){
		                    		window.location.href="${basePath}system/toMain.action?userType=2";
								}else if(data == "error"){
									alert("登录失败！");
								}else if(data == "nosession"){
									window.location.href="${basePath}system/loginout.action";
								}
		                    }
		                });
						return false;
					}
				});
				$("#creditCode").formValidator({validatorgroup:"2",onshow:"请输入社会信用代码",onfocus:"请输入社会信用代码",oncorrect:"输入正确"}).functionValidator({
		            fun: function (val, elem) {
		                if (!/^[A-Za-z0-9]{1}[A-Za-z0-9]{1}[0-9]{6}[A-Za-z0-9]{9}[A-Za-z0-9]{1}$/.test(val)) {
		                    return "社会信用代码错误";
		                }
		                return true;
		            }
		        });
				$("#password1").formValidator({validatorgroup:"2",onshow:"请输入至少6个字符",onfocus:"请输入至少6个字符",oncorrect:"密码合法"}).inputValidator({min:6,empty:{leftempty:false,rightempty:false,emptyerror:"密码不能为空格"},onerror:"输入有误"});
				
			});
			
			
			function test1(obj) {
				if(obj.value=="全角字符当做1个长度") {
					$.formValidator.getInitConfig("1").wideword = false;
					obj.value = "全角字符当做2个长度";
				} else {
					$.formValidator.getInitConfig("1").wideword = true;
					obj.value = "全角字符当做1个长度";
				}
			}
		</script>
	</head>
	<body>
		<div class="login_area">
			<div class="login_block">
				<ul class="login_tabs">
					<li>
						<a class=""><i class="fa fa-user"></i>&nbsp;驾驶员用户登录</a>
					</li>
					<li>
						<a class=""><i class="fa fa-building"></i>&nbsp;平台用户登录</a>
					</li>
				</ul>
				<div class="tab_content">
					<div class="">
						<form id="form1" class="login_form" method="post" action="userLogin.action">
							<input type="hidden" name="usertype" value="0" />
							<table class="form_table">
								<tr>
									<td width="140" align="right">身份证号（账号）：</td>
									<td width="220" align="left">
										<input type="text" class="reg_input" size="24" name="certno" id="certno" />
									</td>
									<td align="left"><span id="certnoTip" class="onshow"></span></td>
								</tr>
								<tr>
									<td align="right">密码：</td>
									<td align="left">
										<input type="password" class="reg_input" size="24" id="password" name="password"/>
									</td>
									<td align="left"><span id="passwordTip" class="onshow"></span></td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2">
										<input type="checkbox" id="remember-1" name="rememberMe" value="true" />
										<label for="remember-1">记住用户名</label>
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<div class="but_area">
											<input id="button1" name="button1" type="submit" value="登录" class="l_button"/>
											<span class="clew_txt">还没账号？
												<a href="javascript:void(0);" onclick="mainGo('', '${basePath}system/openReg.action');">立即注册</a>
												<!-- <a href="userReg.jsp" target="main">找回密码</a> -->
											</span>
										</div>
									</td>
								</tr>
							</table>
						</form>
					</div>
					<div class="">
						<form id="form2" class="login_form" method="post" action="platFormUserLogin.action">
							<input type="hidden" name="usertype" value="1" />
							<table class="form_table">
								<tr>
									<td width="140" align="right">社会信用代码：</td>
									<td width="220" align="left">
										<input type="text" class="reg_input" size="24" name="creditCode" id="creditCode" />
									</td>
									<td align="left"><span id="creditCodeTip" class="onshow"></span></td>
								</tr>
								<tr>
									<td align="right">密码：</td>
									<td align="left">
										<input type="password" class="reg_input" size="24" name="passWord" id="password1"/>
									</td>
									<td align="left"><span id="password1Tip" class="onshow"></span></td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2">
										<input type="checkbox" id="remember-1" name="rememberMe" value="true" />
										<label for="remember-1">记住用户名</label>
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<div class="but_area">
											<input id="button2" name="button2" type="submit" value="登录" class="l_button"/>
											<span class="clew_txt">还没账号？
												<a href="javascript:void(0);" onclick="mainGo('', '${basePath}system/openReg.action');">立即注册</a>
												<!-- <a href="userReg.jsp" target="main">找回密码</a> -->
											</span>
										</div>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>