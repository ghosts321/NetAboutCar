<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${basePath}css/userReg.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui-1.10.4.custom.min.css"/>
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidator_min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidatorRegex.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery.form.js"></script>
		<style type="text/css">
			.STYLE1 {color: #2E863E;font-family:'Microsoft YaHei';font-size: 12px}
			 .divStyle {
				width:78%;
				border: 1px solid #E5E5E5;
				min-height:200px;
				-webkit-box-shadow: 3px 3px 50px #E5E5E5;
				box-shadow: 3px 3px 50px #E5E5E5;
				margin: 10px 0 10px 5px
			 }
			body,table{
			font-size:13px;
			}
			table{
			table-layout:fixed;
			empty-cells:show;
			border-collapse: collapse;
			margin:0 auto;
			}
			.table{
			border:1px solid #cad9ea;
			color:#666;
			margin-bottom: 10px;
			margin-top: 10px;
			}
			.table th {
			background-repeat:repeat-x;
			height:30px;
			}
			.table td,.table th{
			border:0px solid #cad9ea;
			padding:0 0.5em 0;
			}
			.table tr.alter{
			background-color:#f5fafe;
			}
			.form_table td {
				border: 0px;
				padding: 6px 6px;
				color: #555555;
			}
			.pw_str {
				font-size: 12px;
				color: #ffffff;
				text-align: center;
				background-color: #eee5de;
				border: 1px solid #ffffff;
				padding: 1px;
			}
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
				$.formValidator.initConfig({formid:"form1",submitButtonID:"button1",debug:false,submitonce:true,
					onerror:function(msg,obj,errorlist){
						alert(msg);
					},
					onsuccess:function(){
						$("#form1").ajaxSubmit({
							type:'post',
							url:'${basePath}system/changePassword.action',
							success:function(data){
		                    	if(data == "success"){
		                    		alert("修改成功！请重新登录！");
		                    		$("#main").load("${basePath}system/openLogin.action");
								}else if(data == "nosession"){
									alert("登录过期！请重新登录！");
									window.location.href="${basePath}system/loginout.action";
								}else if(data == "error"){
									alert("旧密码输入错误！修改失败！");
									$("#main").load("${basePath}system/openChangePassword.action");
								}else if(data == "fail"){
									alert("系统错误！修改失败！");
									$("#main").load("${basePath}system/openChangePassword.action");
								}
		                    }
		                });
						return false;
					}
				}),
				$("#oldpassword").formValidator({onshow:"至少6个字符",onfocus:"至少6个字符",oncorrect:"密码合法"}).inputValidator({min:6,empty:{leftempty:false,rightempty:false,emptyerror:"密码不能为空"},onerror:"输入有误"});
				$("#newpassword").formValidator({onshow:"至少6个字符",onfocus:"至少6个字符",oncorrect:"密码合法"}).inputValidator({min:6,empty:{leftempty:false,rightempty:false,emptyerror:"密码不能为空"},onerror:"输入有误"});
				$("#oncepassword").formValidator({onshow:"至少6个字符",onfocus:"至少6个字符",oncorrect:"确认密码合法"}).inputValidator({min:6,empty:{leftempty:false,rightempty:false,emptyerror:"密码不能为空"},onerror:"输入有误"}).compareValidator({desid:"newpassword",operateor:"=",onerror:"两次输入密码不一致"});
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
		<div class="buss_area">
			<div class="personalmenu">
				<jsp:include page="/WEB-INF/jsp/driver/personalMenu.jsp">
					<jsp:param name="leftmenu" value="person4"/>
				</jsp:include>
			</div>
			<div id="workarea" class="workarea">
				<div class="title_area">
					<div class="title">修改密码
					</div>
				</div>
				<div>
					<form action="" method="post" name="form1" id="form1">
						<table width="97%"  border="1" cellpadding="0" cellspacing="0" class="table">
						  <tr height="40">
						    <td align="right">旧密码：</td>
									<td align="left">
										<input type="password" id="oldpassword" name="oldpassword" class="reg_input" size="24" onblur="pwStrength(this.value,'1');" onkeyup="pwStrength(this.value,'1');" />
									</td>
									<td align="left">
										<span id="oldpasswordTip" class="onshow"></span>
							</td>
						  </tr>
						  <tr height="40">
						    <td align="right">新密码：</td>
									<td align="left">
										<input type="password" id="newpassword" name="newpassword" class="reg_input" size="24" onblur="pwStrength(this.value,'1');" onkeyup="pwStrength(this.value,'1');" />
									</td>
									<td align="left">
										<span id="newpasswordTip" class="onshow"></span>
							</td>
						  </tr>
						  <tr height="40">
						    <td align="right">再次输入新密码：</td>
									<td align="left">
										<input type="password" id="oncepassword" name="oncepassword" class="reg_input" size="24" onblur="pwStrength(this.value,'1');" onkeyup="pwStrength(this.value,'1');" />
									</td>
									<td align="left">
										<span id="oncepasswordTip" class="onshow"></span>
							</td>
						  </tr>
						</table>
						<div class="form_button_area">
							<input id="button1" name="button" type="submit" value="修改" class="button3" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>