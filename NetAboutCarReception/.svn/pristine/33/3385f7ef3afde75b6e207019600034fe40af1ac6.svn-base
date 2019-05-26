<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="${basePath}css/userReg.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}css/jquery.selectlist.css"/>
		<script type="text/javascript" src="${basePath}js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidator_min.js"></script>
		<script type="text/javascript" src="${basePath}js/formValidatorRegex.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery-ui-1.10.4.custom.min.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery.selectlist.js"></script>
		<script type="text/javascript" src="${basePath}js/jquery.form.js"></script>
		<title>考试预约</title>
		<style type="text/css">
		.chk_1{
		vertical-align:text-bottom;margin-bottom:-1px;*margin-bottom:-4px;
		}
		</style>
		<script type="text/javascript">
			$(function(){
				var optionHtml="<select id='bespeakYear' name='bespeakYear'>";
				$.getJSON("${basePath}driver/getBespeakYear.action",function(datas){
					$.each(datas,function(index,msg){
						optionHtml+="<option value='"+msg.id+"'>"+msg.name+"</option>";
					});
					optionHtml += "</select>";
					$("#bespeak").html(optionHtml);
					$('#bespeakYear').selectlist({
						zIndex: 10,
						width: 240,
						height: 25,
						onChange:function(){
							var a = $("#selecthidden").val();
					    	new ajs(a);
					    	cleanHtml();
						}
					});
				});
			});
			var ajs = function ajss(date){
				$.ajax({
		            type: "post",
		            url: "${basePath}driver/getMngExamBespeakSum.action",
		            data: {date:date},
		            dataType:'json',
		            success: function (result) {
	            		var quanguohtml="";
	            		var difanghtml="";
	            		for (var i=0;i<result.length;i++){
	            			if(result[i].empty=='empty'){//结果为空
								cleanHtml();
								return false;
							}
	            			//$("#applyid").val(result[i].applyid);
	            			if(result[i].bespeaksum != 0){
			            		var cs = result[i].bespeak_date.split("-");
		            			if(result[i].exam_type=='1'){//全国
		            				if(i<7||!i%7==0){
		            					quanguohtml += "<input onclick=\"selectDetail("+result[i].morning_count+","+result[i].afternoon_count+","+result[i].exam_type+",'"+String(result[i].address)+"')\" type='radio' id='checkbox_a"+i+"' name='quanguobespeak_id' class='chk_1' value='"+result[i].bespeak_id+"'><label style='padding: 2px;' for='checkbox_a"+i+"'>"+" <B>"+ cs[2]+" </B>"+"<br><img width='10px' height='15px' src='../images/drverSum.png'/>"+result[i].bespeaksum +"</label>"
		            				}else{
		            					quanguohtml += "<input onclick=\"selectDetail("+result[i].morning_count+","+result[i].afternoon_count+","+result[i].exam_type+",'"+String(result[i].address)+"')\" type='radio' id='checkbox_a"+i+"' name='quanguobespeak_id' class='chk_1' value='"+result[i].bespeak_id+"'><label style='padding: 2px;' for='checkbox_a"+i+"'>"+" <B>"+ cs[2]+" </B>"+"<br><img width='10px' height='15px' src='../images/drverSum.png'/>"+result[i].bespeaksum +"</label><br/>"
		            				}
		            			}else{//地方
			            			if(i<7||!i%7==0){
			            				difanghtml += "<input onclick=\"selectDetail("+result[i].morning_count+","+result[i].afternoon_count+","+result[i].exam_type+",'"+String(result[i].address)+"')\" type='radio' id='checkbox_a"+i+"' name='difangbespeak_id' class='chk_1' value='"+result[i].bespeak_id+"'><label style='padding: 2px;' for='checkbox_a"+i+"'>"+" <B>"+ cs[2]+" </B>"+"<br><img width='10px' height='15px' src='../images/drverSum.png'/>"+result[i].bespeaksum +"</label>"
			            			}else{
			            				difanghtml += "<input onclick=\"selectDetail("+result[i].morning_count+","+result[i].afternoon_count+","+result[i].exam_type+",'"+String(result[i].address)+"')\" type='radio' id='checkbox_a"+i+"' name='difangbespeak_id' class='chk_1' value='"+result[i].bespeak_id+"'><label style='padding: 2px;' for='checkbox_a"+i+"'>"+" <B>"+ cs[2]+" </B>"+"<br><img width='10px' height='15px' src='../images/drverSum.png'/>"+result[i].bespeaksum +"</label><br/>"  
			            			}
		            			}
	            			}
	            		}
	            		$("#quanguoDiv").html(quanguohtml);
	            		$("#difangDiv").html(difanghtml);
		            }		 
			     });
			}
			function selectDetail(morning,afternoon,exam_type,address){
				var quanguomorninginput;
				var quanguoafternooninput;
				var difangmorninginput;
				var difangafternooninput;
				if(exam_type=="1"){//全国
					$("#quanguotextarea").html(address);
					if(morning==0){
						$('#quanguocheckbox_aa1').attr("disabled",true);
						$("#quanguocheckbox_aa1").attr("checked", false);
						$('#quanguocheckbox_aa2').attr("disabled",false);
						$("#quanguocheckbox_aa2").attr("checked", true);
					}else if(afternoon==0){
						$('#quanguocheckbox_aa2').attr("disabled",true);
						$("#quanguocheckbox_aa2").attr("checked", false);
						$('#quanguocheckbox_aa1').attr("disabled",false);
						$("#quanguocheckbox_aa1").attr("checked", true);
					}
					$("#checkbox_quanguo1").html("上午-"+morning);
					$("#checkbox_quanguo2").html("下午-"+afternoon);
					
					quanguomorninginput = $('<input>');
					quanguomorninginput.attr('type', 'hidden');
					quanguomorninginput.attr('name', 'quanguomorning_count');
					quanguomorninginput.attr('id', 'quanguomorning_count');
					quanguomorninginput.attr('value', morning);
					quanguoafternooninput = $('<input>');
					quanguoafternooninput.attr('type', 'hidden');
					quanguoafternooninput.attr('name', 'quanguoafternoon_count');
					quanguoafternooninput.attr('id', 'quanguoafternoon_count');
					quanguoafternooninput.attr('value', afternoon);
					if($('#quanguomorning_count').length>0){
						$('#quanguomorning_count').detach();
					}
					if($('#quanguoafternoon_count').length>0){
						$('#quanguoafternoon_count').detach();
					}
					$('form').append(quanguomorninginput);
					$('form').append(quanguoafternooninput);
				}else if(exam_type=="2"){//地方
					$("#difangtextarea").html(address);
					if(morning==0){
						$('#difangcheckbox_aa1').attr("disabled",true);
						$("#difangcheckbox_aa1").attr("checked", false);
						$('#difangcheckbox_aa2').attr("disabled",false);
						$("#difangcheckbox_aa2").attr("checked", true);
					}else if(afternoon==0){
						$('#difangcheckbox_aa2').attr("disabled",true);
						$("#difangcheckbox_aa2").attr("checked", false);
						$('#difangcheckbox_aa1').attr("disabled",false);
						$("#difangcheckbox_aa1").attr("checked", true);
					}
					$("#checkbox_difang1").html("上午-"+morning);
					$("#checkbox_difang2").html("下午-"+afternoon);
					
					difangmorninginput = $('<input>');
					difangmorninginput.attr('type', 'hidden');
					difangmorninginput.attr('name', 'difangmorning_count');
					difangmorninginput.attr('id', 'difangmorning_count');
					difangmorninginput.attr('value', morning);
					difangafternooninput = $('<input>');
					difangafternooninput.attr('type', 'hidden');
					difangafternooninput.attr('name', 'difangafternoon_count');
					difangafternooninput.attr('id', 'difangafternoon_count');
					difangafternooninput.attr('value', afternoon);
					
					if($('#difangmorning_count').length>0){
						$('#difangmorning_count').detach();
					}
					if($('#difangafternoon_count').length>0){
						$('#difangafternoon_count').detach();
					}
					$('form').append(difangmorninginput);
					$('form').append(difangafternooninput);
				}else{
					var quanguotime = $('input[name="quanguobespeak_id"]:checked').val();
					var difangtime = $('input[name="difangbespeak_id"]:checked').val();
					
					if(quanguotime !=null){
						quanguomorninginput = $('<input>');
						quanguomorninginput.attr('type', 'hidden');
						quanguomorninginput.attr('name', 'quanguomorning_count');
						quanguomorninginput.attr('id', 'quanguomorning_count');
						quanguomorninginput.attr('value', morning);
						quanguoafternooninput = $('<input>');
						quanguoafternooninput.attr('type', 'hidden');
						quanguoafternooninput.attr('name', 'quanguoafternoon_count');
						quanguoafternooninput.attr('id', 'quanguoafternoon_count');
						quanguoafternooninput.attr('value', afternoon);
						if($('#quanguomorning_count').length>0){
							$('#quanguomorning_count').detach();
						}
						if($('#quanguoafternoon_count').length>0){
							$('#quanguoafternoon_count').detach();
						}
						$('form').append(quanguomorninginput);
						$('form').append(quanguoafternooninput);
					}else if(difangtime !=null){
						difangmorninginput = $('<input>');
						difangmorninginput.attr('type', 'hidden');
						difangmorninginput.attr('name', 'difangmorning_count');
						difangmorninginput.attr('id', 'difangmorning_count');
						difangmorninginput.attr('value', morning);
						difangafternooninput = $('<input>');
						difangafternooninput.attr('type', 'hidden');
						difangafternooninput.attr('name', 'difangafternoon_count');
						difangafternooninput.attr('id', 'difangafternoon_count');
						difangafternooninput.attr('value', afternoon);
						if($('#difangmorning_count').length>0){
							$('#difangmorning_count').detach();
						}
						if($('#difangafternoon_count').length>0){
							$('#difangafternoon_count').detach();
						}
						$('form').append(difangmorninginput);
						$('form').append(difangafternooninput);
					}
					
				}
			}
			function cleanHtml(){
				$("#quanguotextarea").html("");
				$("#difangtextarea").html("");
				$('#checkbox_quanguo1').html("上午");
				$('#checkbox_quanguo2').html("下午");
				$('#checkbox_difang1').html("上午");
				$('#checkbox_difang2').html("下午");
				$('#quanguocheckbox_aa1').attr("disabled",false);
				$('#quanguocheckbox_aa2').attr("disabled",false);
				$('#difangcheckbox_aa1').attr("disabled",false);
				$('#difangcheckbox_aa2').attr("disabled",false);
			}
			function changeExamtype(value){
				if(value=="1"){//选择全国
					$("#difangDiv").hide();
					$("#quanguoDiv").show();
					$("#quanguotime").show();
					$("#difangtime").hide();
					$("#quanguoaddress").show();
					$("#difangaddress").hide();
				}else if(value=="2"){//选择地方
					$("#quanguoDiv").hide();
					$("#difangDiv").show();
					$("#quanguotime").hide();
					$("#difangtime").show();
					$("#quanguoaddress").hide();
					$("#difangaddress").show();
				}else{//全国-地方
					$("#difangDiv").show();
					$("#quanguoDiv").show();
					$("#quanguotime").show();
					$("#difangtime").show();
					$("#quanguoaddress").show();
					$("#difangaddress").show();
				}
			}
			$(document).ready(function(){
				$.formValidator.initConfig({formid:"form1",debug:false,submitonce:true,
					onerror:function(msg,obj,errorlist){
						alert(msg);
					},
					onsuccess:function(){
						var exam_type = $('input[name="exam_type"]:checked').val();
						if(exam_type=="1"){
							var quanguotime = $('input[name="quanguobespeak_id"]:checked').val();
							var quanguobespeaktime = $('input[name="quanguobespeak_time"]:checked').val();
							if(quanguotime==null){
								alert("请选择考试日期！");
								$("#main").load("${basePath}driver/openExamBespeak.action");
								return false;
							}
							if(quanguobespeaktime==null){
								alert("请选择考试时段！");
								$("#main").load("${basePath}driver/openExamBespeak.action");
								return false;
							}
						}else if(exam_type=="2"){
							var difangtime = $('input[name="difangbespeak_id"]:checked').val();
							var difangspeaktime = $('input[name="difangbespeak_time"]:checked').val();
							if(difangtime==null){
								alert("请选择考试日期！");
								$("#main").load("${basePath}driver/openExamBespeak.action");
								return false;
							}
							if(difangspeaktime==null){
								alert("请选择考试时段！");
								$("#main").load("${basePath}driver/openExamBespeak.action");
								return false;
							}
						}else{
							var quanguotime = $('input[name="quanguobespeak_id"]:checked').val();
							var difangtime = $('input[name="difangbespeak_id"]:checked').val();
							var quanguobespeaktime = $('input[name="quanguobespeak_time"]:checked').val();
							var difangspeaktime = $('input[name="difangbespeak_time"]:checked').val();
							if(quanguotime==null){
								alert("请选择全国考试日期！");
								$("#main").load("${basePath}driver/openExamBespeak.action");
								return false;
							}
							if(difangtime==null){
								alert("请选择地方考试日期！");
								$("#main").load("${basePath}driver/openExamBespeak.action");
								return false;
							}
							if(quanguobespeaktime==null){
								alert("请选择全国考试时段！");
								$("#main").load("${basePath}driver/openExamBespeak.action");
								return false;
							}
							if(difangspeaktime==null){
								alert("请选择地方考试时段！");
								$("#main").load("${basePath}driver/openExamBespeak.action");
								return false;
							}
						}
						$("#form1").ajaxSubmit({
							type:'post',
							url:'${basePath}driver/addDrvExamBespeak.action',
							success:function(data){
		                    	if(data == "success"){
		                    		alert("预约成功！");
		                    		window.location.href='${basePath}system/openMain.action';
								}else if(data == "empty"){
									alert("预约失败，请选择预约日期！");
									$("#main").load("${basePath}driver/openExamBespeak.action", function(){});
								}else if(data == "error"){
									alert("系统错误，预约失败！");
									$("#main").load("${basePath}driver/openExamBespeak.action", function(){});
								}else if(data == "exist"){
									alert("你已经预约过了！");
									window.location.href='${basePath}system/openMain.action';
								}else if(data == "noaccess"){
									alert("你不能预约考试！");
									$("#main").load("${basePath}driver/openExamBespeak.action", function(){});
								}
		                    }
		                });
						return false;
					}
				});
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
					<jsp:param name="leftmenu" value="driver"/>
				</jsp:include>
			</div>
			<div id="workarea" class="workarea">
				<div class="title_area">
					<div class="title">考试预约</div>
				</div>
				<div>
					<form action="${basePath}driver/addDrvExamBespeak.action" method="post" name="form1" id="form1">
						<input type="hidden" name="applyid" id="applyid"/>
						<table width="100%" border="0" cellpadding="5" cellspacing="2">
							<tr height="40">
								<td width="28%" align="right">预约年月：</td>
								<td width="30%" align="left">
									<span id="bespeak">
									</span>
								</td>
								<td width="37%" align="left">
									<span id="nameTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td width="28%" align="right">考试类型：</td>
								<td width="40%" align="left">
									<input type="radio" name="exam_type" value="3" id="checkbox_ab1" class="chk_1" checked onclick="changeExamtype(value)"/><label for="checkbox_ab1">全国-地方</label>
									<input type="radio" name="exam_type" value="1" id="checkbox_ab2" class="chk_1" onclick="changeExamtype(value)"/><label for="checkbox_ab2">全国</label>
									<input type="radio" name="exam_type" value="2" id="checkbox_ab3" class="chk_1" onclick="changeExamtype(value)"/><label for="checkbox_ab3">地方</label>
								</td>
								<td width="37%" align="left">
									<span id="nameTip" class="onshow"></span>
								</td>
							</tr>
							<tr height="40">
								<td width="28%" align="right">考试日期：</td>
								<td width="30%" align="left" colspan="2">
									<fieldset><legend>【全国】</legend><div id="quanguoDiv" title="全国"></div></fieldset><br>
									<fieldset><legend>【地方】</legend><div id="difangDiv" title="地方"></div></fieldset>
								</td>
							</tr>
							<tr height="40" id="quanguotime">
								<td width="28%" align="right">全国考试时段：</td>
								<td width="30%" colspan="2" align="left">
									<input type="radio" name="quanguobespeak_time" value="1" id="quanguocheckbox_aa1" class="chk_1" checked /><label for="quanguocheckbox_aa1" id="checkbox_quanguo1">上午</label>&nbsp;&nbsp;
									<input type="radio" name="quanguobespeak_time" value="2" id="quanguocheckbox_aa2" class="chk_1" /><label for="quanguocheckbox_aa2" id="checkbox_quanguo2">下午</label>
								</td>
								<td width="37%" align="left"></td>
							</tr>
							<tr height="40" id="difangtime">
								<td width="28%" align="right">地方考试时段：</td>
								<td width="30%" colspan="2" align="left">
									<input type="radio" name="difangbespeak_time" value="1" id="difangcheckbox_aa1" class="chk_1" checked /><label for="difangcheckbox_aa1" id="checkbox_difang1">上午</label>&nbsp;&nbsp;
									<input type="radio" name="difangbespeak_time" value="2" id="difangcheckbox_aa2" class="chk_1" /><label for="difangcheckbox_aa2" id="checkbox_difang2">下午</label>
								</td>
								<td width="37%" align="left"></td>
							</tr>
							<tr height="40" id="quanguoaddress">
								<td align="right">全国考试地点：</td>
								<td colspan="2" align="left">
									<textarea class="reg_textarea" cols="35" rows="3" name="address1" id="quanguotextarea" readonly="readonly"></textarea>
								</td>
								<td width="37%" align="left"></td>
							</tr>
							<tr height="40" id="difangaddress">
								<td align="right">地方考试地点：</td>
								<td colspan="2" align="left">
									<textarea class="reg_textarea" cols="35" rows="3" name="address2" id="difangtextarea" readonly="readonly"></textarea>
								</td>
								<td width="37%" align="left"></td>
							</tr>
							<tr>
								<td></td>
								<td colspan="2">
									<input id="confirm" name="button" type="submit" value="确认办理" class="button3" />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>