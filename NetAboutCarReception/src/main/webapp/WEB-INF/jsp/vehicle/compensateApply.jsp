<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link rel="stylesheet" href="${basePath}css/userReg.css" />
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery.form.js"></script>
		<title>补办申请</title>
		<script type="text/javascript">
			function submitForm(){
				var time=getNowFormatDate();
				var code="A"+time;
				$("#applyId").val(code);
				
				var pcertNo = $("#pcertNo").val();
				if(null != pcertNo && "" != pcertNo){
					$("#form1").ajaxSubmit({
	                    type:'post',
	                    url:'${basePath}vehicle/addCompensateApply.action',
	                    success:function(data){
	                    	if(data == "success"){
	                    		$("#main").load("${basePath}vehicle/openProgressList.action", function() {});
							}else if(data == "error"){
								alert("申请失败！");
							}
	                    }
	                });
				}else{
					alert("没有车辆运输证信息，无法进行补办申请！");
				}
			}
			
			function getNowFormatDate(){
			    var day = new Date();
			    var Year = 0;
			    var Month = 0;
			    var Day = 0;
			    var hour=0;
			    var minu=0;
			    var mill=0;
			    var secodes=0;
			    var CurrentDate = "";
			    Year= day.getFullYear();//支持IE和火狐浏览器.
			    Month= day.getMonth()+1;
			    Day = day.getDate();
			    hour=day.getHours();
			    minu=day.getMinutes();
			    secodes=day.getSeconds();
			    mill=day.getMilliseconds();
			    
			    CurrentDate += Year;
			    if (Month >= 10 ){
			     CurrentDate += Month;
			    }
			    else{
			     CurrentDate += "0" + Month;
			    }
			    if (Day >= 10 ){
			     CurrentDate += Day ;
			    }
			    else{
			     CurrentDate += "0" + Day ;
			    }
			    if(hour>=10){
			      CurrentDate += hour ;
			    }else{
			      CurrentDate += "0" + hour ;
			    }
			    if(minu>=10){
				  CurrentDate += minu ;
				  }else{
				  CurrentDate += "0" + minu ;
				}
			    if(secodes>=10){
					  CurrentDate += secodes ;
				  }else{
				  CurrentDate += "0" + secodes ;
				}
			    CurrentDate+=mill;
			    return CurrentDate;
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
					<div class="title">网约车证件补办申请
						<!-- <div class="help">
							<a class="guide" href="javascript:void(0);" target="_blank">操作指南</a>
							<a class="policy" href="javascript:void(0);" target="_blank">相关政策</a>
						</div> -->
					</div>
				</div>
				<div>
					<form action="" method="post" name="form1" id="form1">
						<table width="100%" border="0" cellpadding="5" cellspacing="2">
							<tr height="40">
								<td width="28%" align="right">身份证号码：</td>
								<td width="30%" align="left">
									<input class="reg_input" size="25" name="certno" id="certno" value="${carPermitcert.certNo}" type="text" readonly />
								</td>
							</tr>
							<tr height="40">
								<td width="28%" align="right">证书编号：</td>
								<td width="30%" align="left">
									<input class="reg_input" size="25" name="pcertNo" id="pcertNo" value="${carPermitcert.pcertNo}" type="text" readonly />
								</td>
							</tr>
							<tr height="40">
								<td width="28%" align="right">发证日期：</td>
								<td width="30%" align="left">
									<input class="reg_input" size="25" name="sendDate" id="sendDate" value="${carPermitcert.sendDate}" type="text" readonly />
								</td>
							</tr>
							<tr height="40">
								<td width="28%" align="right">有效期：</td>
								<td width="30%" align="left">
									<input class="reg_input" size="25" name="endDate" id="endDate" value="${carPermitcert.endDate}" type="text" readonly />
								</td>
							</tr>
							<tr height="40">
								<td width="28%" align="right">发证机构：</td>
								<td width="30%" align="left">
									<input class="reg_input" size="25" name="instId" id="instId" value="${carPermitcert.instId}" type="text" readonly />
								</td>
							</tr>
							<tr height="40">
								<td align="right">备注：</td>
								<td colspan="2" align="left">
									<textarea class="reg_textarea" cols="45" rows="3" name="remark" id="remark" ></textarea>
								</td>
							</tr>
							<tr>
								<td></td>
								<td colspan="2">
									<input name="applyId" id="applyId" type="hidden"/>
									<input id="button" name="button" type="button" onclick="submitForm();" value="确认办理" class="button3" />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>