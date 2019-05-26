<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link rel="stylesheet" href="${basePath}css/userReg.css" />
<%-- 		<link rel="stylesheet" type="text/css" href="${basePath}css/calendar.css">
 --%>		<link rel="stylesheet" type="text/css" href="${basePath}css/jquery.selectlist.css"/>
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidator_min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidatorRegex.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery-ui-1.10.4.custom.min.js"></script>
<%-- 		<script type="text/javascript" src="${basePath}js/calendar.js"></script> 
 --%>		<script type="text/javascript" src="${basePath}js/jquery.selectlist.js"></script>
		<title>窗口预约</title>
		<style type="text/css">
			
		</style>
		<script type="text/javascript">
		var msgg = '<%= request.getAttribute("responseMsg")%>';
		if(msgg != "null"){
			 alert(msgg);
			 window.location.href='${basePath}system/openMain.action';
			}
		
		$(function(){
			var optionHtml="<select id='choiceDate' name='choiceDate'>";
			$.getJSON("${basePath}vehicle/getDrvDisinctDate.action",function(datas){
				$.each(datas,function(index,msg){
					optionHtml+="<option value='"+msg.id+"'>"+msg.name+"</option>";
				});
				optionHtml+="</select>";
				$("#dd2").html(optionHtml);
				$("#choiceDate").selectlist({
					zIndex: 10,
					width: 230,
					height: 25,
					onChange:function(){
						var a = $("#selecthidden").val();
				    	new ajs(a);
					}
				}); 
			});
				
				$("#driverYears").spinner({
					max:50,
					min:1,
					step:1
				}); 
				/* 
				$('#dd2').calendar({
				    trigger: '#dt',
				    zIndex: 999,
					format: 'yyyy-mm',
					  view: 'date',
		            date: new Date(), 
		            selectedRang: [new Date(), null],
				    onSelected: function (view, date, data) {
				    	var d = new Date(date);  
				    	if(d.getMonth()>1){
				    		datee=d.getFullYear() + '-' + (d.getMonth() + 1);  
				    	}else{
				    		datee=d.getFullYear() + '-0' + (d.getMonth() + 1);  
				    	}	
				    	new ajs(datee);
				        console.log('event: onSelected');
				    },
				    onClose: function (view, date, data) {
				        console.log('event: onClose');
				        console.log('view:' + view);
				        console.log('date:' + date);
				        console.log('data:' + (data || 'None'));
				    }
				}); */
				
			});
			var array = new Array();
			var ajs =	 function ajss(date){
				$.ajax({
			            type: "post",
			            url: "${basePath}vehicle/getDrvBespeakSum.action",
			            data: "date=" + date,
			            success: function (result) {
			            	array = eval(result);
			            	var chtml=" ";
			          //  	var chtml = "<table><tbody><tr>";
			            	if(array!=null){
			            		for (i=0;i<array.length;i++){
				            		var cs = array[i].bespeakDate.split("-");
			            			if(i%7==0){
										  chtml += "<input  checked onclick=selectDetail("+array[i].morningCount+","+array[i].afternoonCount+",'"+String(array[i].address)+"') style='vertical-align:text-bottom;margin-bottom:-1px;*margin-bottom:-4px;' type='radio'   id='checkbox_a"+i+"' name='besDate' class='chk_1' value="+array[i].bespeakDate+"><label style='padding: 2px;' for='checkbox_a"+i+"'>"+" <B>"+ cs[2]+" </B>"+"<br><img width='10px' height='15px' src='../images/drverSum.png'/>"+array[i].sum +"</label><br>"
			            			}else{
										  chtml += "<input  checked onclick=selectDetail("+array[i].morningCount+","+array[i].afternoonCount+",'"+String(array[i].address) +"') style='vertical-align:text-bottom;margin-bottom:-1px;*margin-bottom:-4px;' type='radio'   id='checkbox_a"+i+"' name='besDate' class='chk_1' value="+array[i].bespeakDate+"><label style='padding: 2px;' for='checkbox_a"+i+"'>"+" <B>"+ cs[2]+" </B>"+"<br><img width='10px' height='15px' src='../images/drverSum.png'/>"+array[i].sum +"</label>"
			            			}
			            		}
			            		$("#choicespan").html(chtml);
			            	}		 
			            }
			        });}
			
			function selectDetail(morning,afternoon,address){
				if(morning==0){
					$("#checkbox_b11").checked=false; 
				}else{
					$("#checkbox_b11").html("上午-"+morning+" ");
				}
				if(afternoon==0){
					$("#checkbox_b22").checked=false;
				}else{
					$("#checkbox_b22").html("下午-"+afternoon+" ");
				}
				$("#address").html(address);
			}	
			var csplit = function(data){
				return	data.split();
			}
			
			$(document).ready(function(){
				$.formValidator.initConfig({formid:"form1",debug:false,submitonce:true,
					onerror:function(msg,obj,errorlist){
						//$.map(errorlist,function(msg1){alert(msg1)});
						alert(msg);
					}
				});
				
				$("#name").formValidator({onshow:"请输入姓名",onfocus:"请输入姓名"}).functionValidator({fun:isChinese});
				$("#idCard").formValidator({onshow:"15或18位的身份证",onfocus:"15或18位的身份证",oncorrect:"输入正确"}).functionValidator({fun:isCardID});
			    $("#driveCard").formValidator({onshow:"15或18位的身份证",onfocus:"15或18位的身份证",oncorrect:"输入正确"}).functionValidator({fun:isCardID});
			    $("#address").formValidator({onshow:"请输入家庭住址",onfocus:"请输入家庭住址"}).inputValidator({min:1,max:30,onerror:"地址格式有误"});
			    $("#driverYears").formValidator({onshow:"请输入驾龄",onfocus:"请输入驾龄"}).functionValidator({fun:isNum});
			    $("#tel").formValidator({onshow:"请输入你的手机号码",onfocus:"请输入你的手机号码"}).functionValidator({fun:isPhoneNumber});
			});
			
			//禁止输入空格键
			function banInputSapce(e){
				var keynum;
				if(window.event) { // IE
				  keynum = e.keyCode;
				} else if(e.which) { // Netscape/Firefox/Opera
				  keynum = e.which;
				}
				if(keynum == 32){
				  return false;
				}
				  return true;
			}
			
		</script>
	</head>
	<body>
		<div class="buss_area">
			<div class="personalmenu">
				<jsp:include page="/WEB-INF/jsp/driver/personalMenu.jsp">
					<jsp:param name="leftmenu" value="driver2"/>
				</jsp:include>
			</div>
			<div id="workarea" class="workarea">
				<div class="title_area">
					<div class="title">窗口业务办理预约
						<!-- <div class="help">
							<a class="guide" href="javascript:void(0);" target="_blank">操作指南</a>
							<a class="policy" href="javascript:void(0);" target="_blank">相关政策</a>
						</div> -->
					</div>
				</div>
				<div>
					<form action="${basePath }vehicle/addDrvBespeak.action" method="post" name="form1" id="form1">
						<table width="100%" border="0" cellpadding="5" cellspacing="2">
							<tr height="40">
								<td width="28%" align="right">选择月份：</td>
								<td width="30%" align="left">
									<div id="dd2"></div>
								</td>
								<td align="left">
									<span id="nameTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
			  					  <td width="30%" align="right">选择日期：</td>
								    <td width="30%" align="left" colspan="2">
									     <span id="choicespan" name="choicespan"></span>
									</td>
							 </tr>
							<tr height="40">
			  					  <td width="30%" align="right">具体时间：</td>
								    <td width="30%" align="left" colspan="2">
									     <input type="radio" id="checkbox_b1"  checked   name="detailDate" class="chk_1" value='0'/><label for="checkbox_b1" id="checkbox_b11" >上午</label>
									     <br>
									     <input type="radio" id="checkbox_b2"    name="detailDate" class="chk_1" value='1'/><label for="checkbox_b2" id="checkbox_b22" >下午</label>
									</td>
							 </tr>
							<tr height="40">
								<td align="right">地址：</td>
								<td colspan="2" align="left">
									<textarea class="reg_textarea" cols="45" rows="3" name="address" id="address" disabled="disabled"></textarea>
								</td>
							</tr>
							<tr>
								<td></td>
								<td colspan="2">
									<input id="button" name="button" type="submit" value="确认办理" class="button3" />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>