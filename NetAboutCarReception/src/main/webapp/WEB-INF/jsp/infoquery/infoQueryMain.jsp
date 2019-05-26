<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>用户注册</title>
		<link rel="stylesheet" type="text/css" href="${basePath}css/fontawesome/css/font-awesome.min.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}css/userReg.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}css/calendar.css">
		<link rel="stylesheet" type="text/css" href="${basePath}css/font-awesome.css"/>
		<link rel="stylesheet" type="text/css" href="${basePath}css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="${basePath}css/main.css"/>
		<!--[if IE]>
		<link rel="stylesheet" type="text/css" href="${basePath}css/client/css/font-awesome-ie7.min.css" />
		<![endif]-->
		<script type="text/javascript" src="${basePath}js/formValidator_min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidatorRegex.js"></script>
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
			.input-mini {
			    width: 60px;
			}
			.input-large {
			    width: 210px;
			}
			.input-small {
			    width: 150px;
			}
		</style>
		<script type="text/javascript">
			$(function() {
				
				$(".login_tabs").children("li").children("a").removeClass("active");
				
				var usertype = "0";
				if (usertype && usertype != "") {
					if (usertype == "0") {
						$(".login_tabs").children("li").eq(0).children("a").addClass("active");
						$(".tab_content").children("div").eq(0).show().siblings().hide();
					} else if (usertype == "1"){
						$(".login_tabs").children("li").eq(1).children("a").addClass("active");
						$(".tab_content").children("div").eq(1).show().siblings().hide();
					} else if (usertype == "2"){
						$(".login_tabs").children("li").eq(1).children("a").addClass("active");
						$(".tab_content").children("div").eq(2).show().siblings().hide();
					}
				}
				
				$(".login_tabs li a").click(function() {
					$(".login_tabs").children("li").children("a").removeClass("active");
					$(this).addClass("active");
					var index = $(".login_tabs li a").index(this);
					$(".tab_content>div").eq(index).show().siblings().hide();
				});
				
				//第一组校验组，默认组号为"1"
			//	$.formValidator.initConfig({formid:"form1",submitButtonID:"button1",debug:false,submitonce:true
					/*,
					onerror:function(msg,obj,errorlist){
						//$.map(errorlist,function(msg1){alert(msg1)});
						alert(msg);
					}*/
			//	});
				//$("#hphm1b").formValidator({onshow:"请输入至少6个字符",emptyerror:"密码不能为空格"}).functionValidator({fun:isCardID});
				//$("#passWord").formValidator({onshow:"请输入至少6个字符",onfocus:"请输入至少6个字符",oncorrect:"密码合法"}).inputValidator({min:6,empty:{leftempty:false,rightempty:false,emptyerror:"密码不能为空格"},onerror:"输入有误"});
				/* 
				$("#phoneNumber").formValidator({onshow:"11位手机号",onfocus:"11位手机号",oncorrect:"通过"}).regexValidator({ regExp: "mobile", onError: "手机号码格式不正确" });
				$("#iptName").formValidator({onshow:"至少4个字符",onfocus:"至少4个字符",oncorrect:"通过"}).inputValidator({min:4,empty:{leftempty:false,rightempty:false,emptyerror:"输入有误"},onerror:"输入有误"});
				$("#t_Email").formValidator({onshow:"6-100个字符",onfocus:"6-100个字符",oncorrect:"恭喜你,你输对了",defaultvalue:"@"}).inputValidator({min:6,max:100,onerror:"长度非法"}).regexValidator({regexp:"^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$",onerror:"格式不正确"});
			    */
				
				//第二组校验组，组号为"2"
			//	$.formValidator.initConfig({validatorgroup:"2",formid:"form2",submitButtonID:"button2",debug:false,submitonce:true
					/*,
					onerror:function(msg,obj,errorlist){
						//$.map(errorlist,function(msg1){alert(msg1)});
						alert(msg);
					}*/
				//});
				/* $("#userName1").formValidator({validatorgroup:"2",onshow:"请输入用户名",onfocus:"请输入用户名",oncorrect:"输入正确"}).inputValidator({min:6,max:30,onerror:"长度非法"});
				$("#passWord1").formValidator({validatorgroup:"2",onshow:"请输入至少6个字符",onfocus:"请输入至少6个字符",oncorrect:"密码合法"}).inputValidator({min:6,empty:{leftempty:false,rightempty:false,emptyerror:"密码不能为空格"},onerror:"输入有误"});
 */				//第三组校验组，组号为"3"
			//	$.formValidator.initConfig({validatorgroup:"3",formid:"form3",submitButtonID:"button3",debug:false,submitonce:true
					/*,
					onerror:function(msg,obj,errorlist){
						//$.map(errorlist,function(msg1){alert(msg1)});
						alert(msg);
					}*/
				//});
			});
			
			
			/* function test1(obj) {
				if(obj.value=="全角字符当做1个长度") {
					$.formValidator.getInitConfig("1").wideword = false;
					obj.value = "全角字符当做2个长度";
				} else {
					$.formValidator.getInitConfig("1").wideword = true;
					obj.value = "全角字符当做1个长度";
				}
			} */
			
			function search1(url){
				var a = $("#certno").val() ;
				urll = url+"?certno="+a ;
				$("#content").load(urll, function() {
					
				});
				//$("#form1").submit();
					 
					//alert("暂无该证信息");
				}
			
			function search2(url){
				var tou =$("#tou").val();
				var carnum = $("#carnum").val() ;
				var enginenum = $("#enginenum").val() ;

			urll = url+"?carnum="+tou+carnum+"&enginenum="+ enginenum ;
			$("#content").load(urll, function() {
				
			});
				//alert("号牌种类、号牌号码与发动机号不匹配");
			}
		
			function search3(url){
				var creditcode = $("#creditcode").val() ;
				urll = url+"?creditcode="+creditcode ;
				$("#content").load(urll, function() {
					
				});

				//alert("暂无该平台信息");
			}
		</script>
	</head>
	<body>
		<div class="login_area">
			<div class="login_block" id="content">
				<ul class="login_tabs">
					<li>
						<a class=""><i class="fa fa-truck"></i>&nbsp;驾驶证信息查询</a>
					</li>
					<li>
						<a class=""><i class="fa fa-male"></i>&nbsp;机动车信息查询</a>
					</li>
					<li>
						<a class=""><i class="fa fa-trash"></i>&nbsp;平台业务信息查询</a>
					</li>
				</ul>
				<div class="tab_content" >
					<div class=""  style="background: url('${basePath}/images/search-bg1.jpg') right center no-repeat;">
						<form id="form1" class="login_form" action="${basePath}infoquery/searchDriver.action">
							<input type="hidden" name="usertype" value="0" />
							<table class="form_table">
								<tr>
									<td align="right">身份证号码：</td>
									<td align="left">
			                             <input id="certno" name="certno"   placeholder="身份证号码" class="input-small" style="text-transform:uppercase"  type="text">
									</td>
								</tr>
								<!-- <tr>
									<td align="right">姓名：</td>
									<td align="left">
			                             <input id="pcertid" name="pcertid" maxlength="6" placeholder="姓名" class="input-small" style="text-transform:uppercase" data-valid="required minlen:5" data-valid-len="::号牌号码长度错误" type="text">
									</td>
								</tr> -->
								<tr>
									<td align="right"></td>
									<td align="left">
										<button type="button" class="btn btn-success btn-large" onclick="search1('${basePath}infoquery/searchDriver.action');">
				                            <i class="icon-search"></i>
				                            查询
				                        </button>
									</td>
								</tr>
							</table>
						</form>
					</div>
					<div class="" style="background: url('${basePath}/images/search-bg2.jpg') right center no-repeat; boder:1">
						<form id="form2" class="login_form" action="userLogin.action">
							<input type="hidden" name="usertype" value="1" />
							<table class="form_table">
								<tr>
									<td align="right">号牌号码：</td>
									<td align="left">
										 <select id="tou" class="input-mini">
			                                   <option value="浙" selected="selected">浙</option> 
												<option value="闽" selected="selected">闽</option> 
												<option value="粤" selected="selected">粤</option> 
												<option value="京" selected="selected">京</option> 
												<option value="津" selected="selected">津</option> 
												<option value="冀" selected="selected">冀</option> 
												<option value="晋" selected="selected">晋</option> 
												<option value="蒙" selected="selected">蒙</option> 
												<option value="辽" selected="selected">辽</option> 
												<option value="吉" selected="selected">吉</option> 
												<option value="黑" selected="selected">黑</option> 
												<option value="沪" selected="selected">沪</option> 
												<option value="苏" selected="selected">苏</option> 
												<option value="皖" selected="selected">皖</option> 
												<option value="赣" selected="selected">赣</option> 
												<option value="鲁" selected="selected">鲁</option> 
												<option value="豫" selected="selected">豫</option> 
												<option value="鄂" selected="selected">鄂</option> 
												<option value="湘" selected="selected">湘</option> 
												<option value="桂" selected="selected">桂</option> 
												<option value="琼" selected="selected">琼</option> 
												<option value="渝" selected="selected">渝</option> 
												<option value="川" selected="selected">川</option> 
												<option value="贵" selected="selected">贵</option> 
												<option value="云" selected="selected">云</option> 
												<option value="藏" selected="selected">藏</option> 
												<option value="陕" selected="selected">陕</option> 
												<option value="甘" selected="selected">甘</option> 
												<option value="青" selected="selected">青</option> 
												<option value="宁" selected="selected">宁</option> 
												<option value="新" selected="selected">新</option> 

			                             </select>
			                             <input id="carnum" name="carnum"   placeholder="请输入号牌号码" class="input-small" style="text-transform:uppercase" data-valid="required minlen:5" data-valid-len="::号牌号码长度错误" type="text">
									</td>
								</tr>
								
								<tr>
									<td align="right"></td>
									<td align="left">
										<button type="button" class="btn btn-success btn-large" onclick="search2('${basePath}infoquery/searchCar.action');">
				                            <i class="icon-search"></i>
				                            查询
				                        </button>
									</td>
								</tr>
							</table>
						</form>
					</div>
					<div class="" style="background: url('${basePath}/images/search-bg3.jpg') right center no-repeat;">
						<form id="form3" class="login_form" action="userLogin.action">
							<input type="hidden" name="usertype" value="2" />
							<table class="form_table">
								<tr>
									<td align="right">统一社会信用代码：</td>
									<td align="left">
										 <input id="creditcode" name="creditcode"  placeholder="请输入社会信用代码" class="input-small" style="text-transform:uppercase" data-valid="required minlen:5" data-valid-len="::社会信用代码长度错误" type="text">
									</td>
								</tr>
								<tr>
									<td align="right"></td>
									<td align="left">
										<button type="button" class="btn btn-success btn-large" onclick="search3('${basePath}infoquery/searchPlatform.action');">
				                            <i class="icon-search"></i>
				                            查询
				                        </button>
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
