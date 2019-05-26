<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>用户注册</title>
		<link rel="stylesheet" type="text/css" href="${basePath}css/userReg.css" />
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidator_min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidatorRegex.js"></script>
		<script type="text/javascript" src="${basePath}js/phonechecker.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery.form.js"></script>
		<style type="text/css">
			.reg_area {
			}
			
			.reg_area .reg_block {
				margin: 0;
				padding: 0;
			}
			
			.reg_area .reg_block .reg_tabs {
				ist-style: outside none none;
				border-bottom: 1px solid #ddd;
			}
			
			.reg_area .reg_block .reg_tabs:after {
				content: "."; 
			    display: block;
			    height: 0; 
			    clear: both; 
			    visibility: hidden;
			}
			
			.reg_area .reg_block .reg_tabs li {
				line-height: 20px;
				margin-bottom: -1px;
				float: left;
			}
			
			.reg_area .reg_block .reg_tabs li a {
				display: block;
				background-color: #f5f5f5;
				border: 1px solid transparent;
				color: #555;
				line-height: 20px;
				padding: 10px 12px;
				text-align: center;
				cursor: pointer;
			}
			.reg_area .reg_block .reg_tabs li a:hover {
				background-color: #eeeeee;
			}
			
			.reg_area .reg_block .reg_tabs li a.active {
				background-color: #fff;
				border-top: 1px solid #dddddd;
				border-left: 1px solid #dddddd;
				border-right: 1px solid #dddddd;
				cursor: default;
			}
			
			.reg_area .reg_block .reg_content {
				margin: 0;
				padding: 0;
			}
			
			.reg_area .reg_block .reg_content .reg_form {
				margin-top: 30px;
			}
			
			.reg_area .reg_block .reg_content .reg_form .form_table {
				width: 100%;
				border-collapse: collapse;
				border: none;
			}
			
			.reg_area .reg_block .reg_content .reg_form .form_table td {
				border: 0px;
				padding: 6px 6px;
				color: #555555;
			}
			
			.reg_area .reg_block .reg_content .reg_form .form_table .but_area {
				background: rgba(255, 255, 255, 0.6) none repeat scroll 0 0;
				border-top: 1px solid #e5e5e5;
				margin: 20px 0px;
				padding-top: 20px;
				padding-left: 165px;
			}
			
			.reg_area .reg_block .reg_content .reg_form .form_table .but_area:after {
				content: "."; 
			    display: block;
			    height: 0; 
			    clear: both; 
			    visibility: hidden;
			}
			
			.reg_area .reg_block .reg_content .reg_form .form_table .pw_strength {
				width: 200px;
				height: 28px;
			}
			
			.reg_area .reg_block .reg_content .reg_form .form_table .pw_strength .pw_str {
				font-size: 12px;
				color: #ffffff;
				text-align: center;
				background-color: #eee5de;
				border: 1px solid #ffffff;
				padding: 1px;
			}
			
			.reg_area .reg_block .reg_content .reg_form .form_table .but_area .reg_button {
				width: 120px;
				height: 30px;
				background-color: #9370db;
				color: #ffffff;
				font-family: "微软雅黑";
				font-size: 16px;
				letter-spacing: 3px;
				text-align: center;
				border: 0px;
				-moz-border-radius: 5px;
				-webkit-border-radius: 5px;
				border-radius: 5px;
				cursor: pointer;
				padding: 0px 10px 0px 13px;
				margin: 5px 10px;
				overflow: visible;
			}
			
			.reg_area .reg_block .reg_content .reg_form .form_table .but_area .reg_button:hover {
				background-color: #9932cc;
			}
			
			/*** 获取手机验证码链接 ******/
			a.get_code {
				width: 108px;
				color : #12abe4;
				font-size: 15px;
				text-align: center;
				text-decoration: none;
				display: inline-block;
				padding-left: 5px;
			}
			
			a.get_code:hover {
				color: #4169e1;
			}
			
		</style>
		<script type="text/javascript">
		     
			$(function() {
				$(".reg_tabs").children("li").children("a").removeClass("active");
				$(".reg_tabs").children("li").eq(0).children("a").addClass("active");
				$(".reg_content").children("div").eq(0).show().siblings().hide();
		 
				$(".reg_tabs li a").click(function() {
					$(".reg_tabs").children("li").children("a").removeClass("active");
					$(this).addClass("active");
					var index = $(".reg_tabs li a").index(this);
					$(".reg_content>div").eq(index).show().siblings().hide();
				});
			
			});
			$(document).ready(function(){
			 
				$.formValidator.initConfig({formid:"form1",submitButtonID:"button1",debug:false,submitonce:true,
					onerror:function(msg,obj,errorlist){
						//$.map(errorlist,function(msg1){alert(msg1)});
						alert(msg);
					}
				});
				//$("#certno").formValidator({onshow:"请输入15或18位身份证号码",onfocus:"请输入15或18位身份证号码",oncorrect:"输入正确"}).functionValidator({fun:isCardID});				
				$("#certno").formValidator({ajax:true,onshow:"请输入15或18位身份证号码",onfocus:"请输入15或18位身份证号码",oncorrect:"输入正确"}).functionValidator({fun:isCardID})
			       .ajaxValidator({
			         dataType: "text",
			         async: true,
			         url: "isexistUser.action",
			         success: function (data) {
			           if (data == "0") { return true; }
			           else if (data == "1") { return false; }
			         },
			         buttons: $("#button1"),
			         error: function (jqXHR, textStatus, errorThrown) { alert("服务器没有返回数据，可能服务器忙，请重试" + errorThrown); },
			         onError: "该账户已被注册，请更换。",
			         onWait: "正在对账户进行合法性校验，请稍候..."
			       });  //这里添加defaultPassed()的话，则默认验证通过。
				$("#password").formValidator({onshow:"至少6个字符",onfocus:"至少6个字符",oncorrect:"密码合法"}).inputValidator({min:6,empty:{leftempty:false,rightempty:false,emptyerror:"密码不能为空"},onerror:"输入有误"});
				$("#password2").formValidator({onshow:"至少6个字符",onfocus:"至少6个字符",oncorrect:"确认密码合法"}).inputValidator({min:6,empty:{leftempty:false,rightempty:false,emptyerror:"密码不能为空"},onerror:"输入有误"}).compareValidator({desid:"password",operateor:"=",onerror:"两次输入密码不一致"});
				$("#phoneno").formValidator({onshow:"请输入你的手机号码",onfocus:"请输入你的手机号码"}).functionValidator({fun:isPhoneNumber});
				/* $("#phonenumCode").formValidator({onshow:"请获取手机验证码",onfocus:"请获取手机验证码",oncorrect:"手机验证码合法"}).inputValidator({min:6,max:6,empty:{leftempty:false,rightempty:false,emptyerror:"手机验证码不能为空"},onerror:"输入有误"}); */
				
				
				$.formValidator.initConfig({validatorgroup:"2",submitButtonID:"button2",formid:"form2",debug:false,submitonce:true,
					onerror:function(msg,obj,errorlist){
						//$.map(errorlist,function(msg1){alert(msg1)});
						alert(msg);
					}
				});
				
				//$("#creditCode").formValidator({onshow:"请输入18位的社会信用代码",onfocus:"请输入18位的社会信用代码",oncorrect:"输入正确"}).inputValidator({min:18,max:18,empty:{leftempty:false,rightempty:false,emptyerror:"不能为空"},onerror:"输入有误"});
				
				$("#creditCode").formValidator({ajax:true,validatorgroup:"2",onShow: "请输入18位的社会信用代码", onfocus: "请输入18位的社会信用代码", onCorrect: "用户名可以使用，请完善下面信息。" }).functionValidator({
			            fun: function (val, elem) {
			                if (!/^[A-Za-z0-9]{1}[A-Za-z0-9]{1}[0-9]{6}[A-Za-z0-9]{9}[A-Za-z0-9]{1}$/.test(val)) {
			                    return "社会信用代码错误";
			                }
			                return true;
			            }
			        })
			       .ajaxValidator({
			         dataType: "text",
			         async: true,
			         url: "isexistPlatFormUser.action",
			         success: function (data) {
			           if (data == "0") { return true; }
			           else if (data == "1") { return false; }
			         },
			         buttons: $("#button"),
			         error: function (jqXHR, textStatus, errorThrown) { alert("服务器没有返回数据，可能服务器忙，请重试" + errorThrown); },
			         onError: "该账户已被注册，请更换。",
			         onWait: "正在对账户进行合法性校验，请稍候..."
			       });  //这里添加defaultPassed()的话，则默认验证通过。
				
				
				$("#passWord3").formValidator({validatorgroup:"2",onshow:"至少6个字符",onfocus:"至少6个字符",oncorrect:"密码合法"}).inputValidator({min:6,empty:{leftempty:false,rightempty:false,emptyerror:"密码不能为空"},onerror:"输入有误"});
				$("#passWord4").formValidator({validatorgroup:"2",onshow:"至少6个字符",onfocus:"至少6个字符",oncorrect:"确认密码合法"}).inputValidator({min:6,empty:{leftempty:false,rightempty:false,emptyerror:"密码不能为空"},onerror:"输入有误"}).compareValidator({desid:"passWord3",operateor:"=",onerror:"两次输入密码不一致"});
				$("#phoneNo").formValidator({validatorgroup:"2",onshow:"请输入您的手机号码",onfocus:"请输入您的手机号码"}).functionValidator({fun:isPhoneNumber});
				//$("#t_Email").formValidator({onshow:"6-100个字符",onfocus:"6-100个字符",oncorrect:"恭喜你,你输对了",defaultvalue:"@"}).inputValidator({min:6,max:100,onerror:"长度非法"}).regexValidator({regexp:"^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$",onerror:"格式不正确"});
				
				PhoneChecker($("#phonenumCode"), $("#clickCode"), "ajaxGetPhoneCheckode.action").bindCallback(function(data){
					if (data.message == true) {
						//dialog.tooltip("短信发送成功", 2000);
		 			} else if (data.message == false) {
 						alert(data.msg);
 						this.reset();
 						return;
        			}
				}).bindSetup(function(){
					return {
						"regInfo" : $("#regInfo").val()
					};
				});
				
				PhoneChecker($("#phonenumCode2"), $("#clickCode2"), "ajaxGetPhoneCheckode.action").bindCallback(function(data){
					if (data.message == true) {
						//dialog.tooltip("短信发送成功", 2000);
		 			} else if (data.message == false) {
 						alert(data.msg);
 						this.reset();
 						return;
        			}
				}).bindSetup(function(){
					return {
						"regInfo" : $("#regInfo").val()
					};
				});
				
			});
			
			function CharMode(iN){  
				if (iN>=48 && iN <=57) //数字  
					return 1;  
				if (iN>=65 && iN <=90) //大写  
					return 2;  
				if (iN>=97 && iN <=122) //小写  
					return 4;  
				else  
					return 8;   
			}
			
			//bitTotal函数  
			//计算密码模式  
			function bitTotal(num){  
				modes=0;  
				for (var i=0; i<4; i++){  
					if (num & 1) modes++;  
					num>>>=1;  
				}  
				return modes;  
			}
			
			//返回强度级别  
			function checkStrong(sPW){  
				if (sPW.length<=8)  
					return 0; //密码太短  
					Modes=0;  
				for (var i=0; i<sPW.length; i++){  
				//密码模式  
					Modes|=CharMode(sPW.charCodeAt(i));  
				}  
				return bitTotal(Modes);  
			}
			
			//显示颜色  
			function pwStrength(pwd,type) {
				O_color="#eeeeee";
				L_color="#FF0000";
				M_color="#FF9900";
				H_color="#33CC00";
				if (pwd==null||pwd==''){
					Lcolor=Mcolor=Hcolor=O_color;
				} else{
					S_level=checkStrong(pwd);
					switch(S_level) {  
						case 0:
							Lcolor=Mcolor=Hcolor=O_color;
						case 1:
							Lcolor=L_color;
							Mcolor=Hcolor=O_color;
							break;
						case 2:
							Lcolor=Mcolor=M_color;
							Hcolor=O_color;
							break;
						default:
							Lcolor=Mcolor=Hcolor=H_color;
					}  
				}
				if(type=="1"){
					$("#strength_L").css("background",Lcolor);
					$("#strength_M").css("background",Mcolor);
					$("#strength_H").css("background",Hcolor);
				}else{
					$("#strength_L2").css("background",Lcolor);
					$("#strength_M2").css("background",Mcolor);
					$("#strength_H2").css("background",Hcolor);
				}
				
				return;  
			}
		</script>
	</head>
	<body>
		<div class="reg_area">
			<div class="reg_block">
				<ul class="reg_tabs">
					<li>
						<a class=""><i class="fa fa-user"></i> 驾驶员用户注册</a>
					</li>
					<li>
						<a class=""><i class="fa fa-building"></i>&nbsp;平台用户注册</a>
					</li>
				</ul>
				<div class="reg_content">
					<div class="">
						<form id="form1" name="form" class="reg_form" action="${basePath}system/userReg.action" method="post">
							<table class="form_table">
								<tr>
									<td width="160" align="right">身份证号（账号）：</td>
									<td width="220" align="left">
										<input type="text" class="reg_input" size="24" name="certno" id="certno" maxlength="18" />
									</td>
									<td align="left">
										<span id="certnoTip" class="onshow"></span>
									</td>
								</tr>
								<tr>
									<td align="right">密码：</td>
									<td align="left">
										<input type="password" id="password" name="password" class="reg_input" size="24" onblur="pwStrength(this.value,'1');" onkeyup="pwStrength(this.value,'1');" />
									</td>
									<td align="left">
										<span id="passwordTip" class="onshow"></span>
									</td>
								</tr>
								<tr>
									<td align="right">密码强度：</td>
									<td align="left">
										<table border="0" cellspacing="0" cellpadding="1" class="pw_strength">
											<tr>
												<td width="33%" id="strength_L" class="pw_str">弱</td>
												<td width="33%" id="strength_M" class="pw_str">中</td>
												<td width="33%" id="strength_H" class="pw_str">强</td>
											</tr>
										</table>
					 				</td>
					 				<td></td>
								</tr>
								<tr>
									<td align="right">确认密码：</td>
									<td align="left">
										<input type="password" id="password2" name="password2" class="reg_input" size="24" />
									</td>
									<td align="left">
										<span id="password2Tip" class="onshow"></span>
									</td>
								</tr>
								<tr>
									<td align="right">手机号：</td>
									<td align="left">
										<input type="text" id="phoneno" name="phoneno" class="reg_input" size="24" maxlength="11" />
									</td>
									<td align="left">
										<span id="phonenoTip" class="onshow"></span>
									</td>
								</tr>
								<!-- <tr>
									<td align="right">手机验证码：</td>
									<td align="left">
										<input type="text" id="phonenumCode2" name="phonenumCode" class="reg_input" maxlength="6" style="width: 90px;"/>
										<a id="clickCode"></a>
									</td>
									<td align="left">
										<span id="phonenumCode2" class="onshow"></span>
									</td>
								</tr> -->
								<tr>
									<td colspan="3">
										<div class="but_area">
											<input id="button1" name="button1" type="submit" value="注册" class="reg_button" />
											<span class="clew_txt">如果您已有帐号，可
												<a href="javascript:void(0);" onclick="mainGo('', '${basePath}system/openLogin.action?usertype=0');">直接登录</a>
											</span>
										</div>
									</td>
								</tr>
							</table>
						</form>
					</div>
					
					<div class="" style="display: none">
						<form id="form2" name="form" class="reg_form" action="${basePath}system/PlatFormUserReg.action" method="post">
							<table class="form_table">
								<tr>
									<td width="160" align="right">社会信用代码：</td>
									<td width="220" align="left">
										<input type="text" class="reg_input" size="24" name="creditCode" id="creditCode" maxlength="18" />
									</td>
									<td align="left">
										<span id="creditCodeTip" class="onshow"></span>
									</td>
								</tr>
								<tr>
									<td align="right">密码：</td>
									<td align="left">
										<input type="password" id="passWord3" name="passWord" class="reg_input" size="24" onblur="pwStrength(this.value,'2');" onkeyup="pwStrength(this.value,'2');" />
									</td>
									<td align="left">
										<span id="passWord3Tip" class="onshow"></span>
									</td>
								</tr>
								<tr>
									<td align="right">密码强度：</td>
									<td align="left">
										<table border="0" cellspacing="0" cellpadding="1" class="pw_strength">
											<tr>
												<td width="33%" id="strength_L2" class="pw_str">弱</td>
												<td width="33%" id="strength_M2" class="pw_str">中</td>
												<td width="33%" id="strength_H2" class="pw_str">强</td>
											</tr>
										</table>
					 				</td>
					 				<td></td>
								</tr>
								<tr>
									<td align="right">确认密码：</td>
									<td align="left">
										<input type="password" id="passWord4" name="passWord4" class="reg_input" size="24" />
									</td>
									<td align="left">
										<span id="passWord4Tip" class="onshow"></span>
									</td>
								</tr>
								<tr>
									<td align="right">手机号：</td>
									<td align="left">
										<input type="text" id="phoneNo" name="phoneNo" class="reg_input" size="24" maxlength="11" />
									</td>
									<td align="left">
										<span id="phoneNoTip" class="onshow"></span>
									</td>
								</tr>
								<!-- <tr>
									<td align="right">手机验证码：</td>
									<td align="left">
										<input type="text" id="phonenum2Code" name="phonenumCode" class="reg_input" maxlength="6" style="width: 90px;"/>
										<a id="clickCode2"></a>
									</td>
									<td align="left">
										<span id="phonenumCode2Tip" class="onshow"></span>
									</td>
								</tr> -->
								<tr>
									<td colspan="3">
										<div class="but_area">
											<input id="button2" name="button2" type="submit" value="注册" class="reg_button" />
											<span class="clew_txt">如果您已有帐号，可
												<a href="javascript:void(0);" onclick="mainGo('', '${basePath}system/openLogin.action?usertype=1');">直接登录</a>
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