<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${basePath}css/userReg.css" />
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery.form.js"></script>
		<title>变更车辆性质</title>
		<script type="text/javascript">
			function submitForm(){
				var flag = "${flag}";
				if("0" == flag){
					alert("暂时不可以进行变更车辆性质功能！");
				}else{
					if("" == $("input[name='changePropertyText']").val() || null == $("input[name='changePropertyText']").val()){
						alert("请上传变更车辆性质后证明文件！");
				    }else{
				    	$("#form1").ajaxSubmit({
		                    type:'post',
		                    url:'${basePath}vehicle/addChangeProperty.action',
		                    success:function(data){
		                    	if(data == "success"){
		                    		alert("上传成功！");
		                    		$("#main").load("${basePath}vehicle/openChangeProperty.action", function() {});
								}else if(data == "error"){
									alert("上传失败！");
								}
		                    }
		                });
				    }
				}
			}
			function getFile(obj,inputName){
				var file_name = $(obj).val();
				
				
				var houzhui=file_name.split(".");
				
				var last=houzhui[houzhui.length-1];
				var tp ="jpg,jpeg,gif,bmp,png,JPG,JPEG,GIF,BMP,PNG";
				var rs=tp.indexOf(last);
				
				//如果返回的结果大于或等于0，说明包含允许上传的文件类型
				if(rs>=0){
					 $("input[name='"+inputName+"']").val(file_name);
					 return true;
				}else{
					 alert("请上传正确的图片格式！");
					 $("input[name='"+inputName+"']").val("");
					 return false;
				}
			}
		</script>
	</head>
	<body>
		<div class="buss_area">
			<div class="personalmenu">
				<jsp:include page="/WEB-INF/jsp/driver/personalMenu.jsp">
					<jsp:param name="leftmenu" value="vehicle"/>
				</jsp:include>
			</div>
			<div id="workarea" class="workarea">
				<div class="title_area">
					<div class="title">变更车辆性质
						<!-- <div class="help">
							<a class="guide" href="javascript:void(0);" target="_blank">操作指南</a>
							<a class="policy" href="javascript:void(0);" target="_blank">相关政策</a>
						</div> -->
					</div>
				</div>
				<div>
					<form action="${basePath}vehicle/addExternalExploration.action" method="post" name="form1" id="form1" enctype="multipart/form-data">
						<table width="100%" border="0" cellpadding="5" cellspacing="2">
							<tr height="40">
								<td width="18%" align="right">变更车辆性质文件：</td>
								<td width="30%" colspan="2" align="left">
							         <div class="box">
										<a href="ftp://liqin:Li.@10.80.1.236/upload/car/变更车辆性质文档.docx">点击下载</a>
									</div> 	         
								</td>
							</tr>
							<tr height="40">
								<td align="right">变更后文件上传：</td>
								<td colspan="2" align="left">
						         	<div class="box">
										<input type="text" name="changePropertyText" id="changePropertyText" class="file_textbox"/>
										<a href="javascript:void(0);" class="upload_link">浏览</a>
										<input type="file" class="uploadFile" name="changePropertyFile" id="changePropertyFile" onchange="getFile(this,'changePropertyText')" />
									</div> 	         
								</td>
							</tr>
						</table>
						<div class="form_button_area">
							<input id="button" name="button" type="button" value="确认办理" class="button3" onclick="submitForm();"/>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>