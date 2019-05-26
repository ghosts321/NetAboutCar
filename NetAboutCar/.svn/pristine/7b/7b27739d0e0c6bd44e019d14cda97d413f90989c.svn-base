<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
input{
    width: 220px;
}

</style>
<script type="text/javascript">
$(function(){
	//日期控件
	$('.date-picker').datepicker();
});

function check(){

	if($("#event_desc").val()==""){
		$("#event_desc").tips({
			side:3,
            msg:'请输入事件概要',
            bg:'#AE81FF',
            time:2
        });
		$("#event_desc").focus();
		return false;
	}
	if($("#event_detail").val()==""){
		$("#event_detail").tips({
			side:3,
            msg:'请输入事件详情',
            bg:'#AE81FF',
            time:2
        });
		$("#event_detail").focus();
		return false;
	}
	if($("#ar_fact").val()==""){
		$("#ar_fact").tips({
			side:3,
            msg:'请输入违规事实',
            bg:'#AE81FF',
            time:2
        });
		$("#ar_fact").focus();
		return false;
	}
	if($("#occurDate").val()==""){
		$("#occurDate").tips({
			side:3,
            msg:'请输入发生日期',
            bg:'#AE81FF',
            time:2
        });
		$("#occurDate").focus();
		return false;
	}
	if($("#occur_address").val()==""){
		$("#occur_address").tips({
			side:3,
            msg:'请输入发生地点',
            bg:'#AE81FF',
            time:2
        });
		$("#occur_address").focus();
		return false;
	}
	
	if("${event_type}"==1){
		checkIdcard();
	}else if("${event_type}"==2){
		checkCreditcode();
	}
}

function checkIdcard(){
	if($("#driver_certno").val()!=""){
		$.ajax({
			type:'post',
			url:'checkIdcard.action?idcards='+$("#driver_certno").val(),
			success:function(response){
				if(response=='success'){
					save();
				}else{
					$("#driver_certno").tips({
						side:3,
			            msg:response,
			            bg:'#AE81FF',
			            time:2
			        });
					$("#driver_certno").focus();
				}
			}
		});
	}else{
		$("#driver_certno").tips({
			side:3,
            msg:'请输入涉事驾驶员身份证号',
            bg:'#AE81FF',
            time:2
        });
		$("#driver_certno").focus();
	}
}


function checkCreditcode(){
	if($("#com_creditcode").val()!=""){
		$.ajax({
			type:'post',
			url:'checkCreditcode.action?creditcodes='+$("#com_creditcode").val(),
			success:function(response){
				if(response=='success'){
					save();
				}else{
					$("#com_creditcode").tips({
						side:3,
			            msg:response,
			            bg:'#AE81FF',
			            time:2
			        });
					$("#com_creditcode").focus();
				}
			}
		});
	}else{
		$("#com_creditcode").tips({
			side:3,
            msg:'请输入涉事平台统一信用代码',
            bg:'#AE81FF',
            time:2
        });
		$("#com_creditcode").focus();
	}
}


function save(){	
	$("#eventsForm").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}
//获取文件名
function getFile(obj){
	var file_name = $(obj).val();
	var houzhui=file_name.split(".");
	var last=houzhui[houzhui.length-1];
	var tp ="doc,docx";
	var rs=tp.indexOf(last);
				
	//如果返回的结果大于或等于0，说明包含允许上传的文件类型
	if(rs>=0){
		$("input[name='attachment']").val(file_name);
	}else{
		alert("您选择的上传文件不是有效的word文件！");
		$("input[name='attachment']").val("");
	}
}
</script>
</head>
<body>
<div class="container">
<form action="<%=basePath%>credit/addEvents.action" name="eventsForm" id="eventsForm" method="post" enctype ="multipart/form-data">
		<div id="zhongxin" align="center" style="padding-top:50px">
		<table>
			<tr>
				<td style="text-align: right;">事件概要：</td>
				<td><input type="text" name="event_desc" id="event_desc" value="" title="事件概要"/></td>
			</tr>
			<tr>
				 <td style="text-align: right;">事件详情：</td>
				<td align="left"><textarea style="width: 220px;height: 120px;" name="event_detail" id="event_detail"></textarea>
				</td>
			</tr>
			<tr>
			    <td style="text-align: right;">内容附件：</td>
				<td>
					 <div class="box">
						<input type="text" name="attachment" id="attachment" class="file_textbox" />
						<a href="javascript:void(1);" class="upload_link">上传</a>
						<input type="file" class="uploadFile" name="attachmentfile"  id="attachmentfile" onchange="getFile(this)" />
					</div>         
				</td>
			</tr>
			<tr>
			    <td style="text-align: right;">违规事实：</td>
				<td><input type="text" name="ar_fact" id="ar_fact" value="" title="违规事实"/></td>
			</tr>
			<tr>
			    <td style="text-align: right;">发生日期：</td>
				<td>
					<input class="date-picker" name="occurDate" id="occurDate" type="text"
							data-date-format="yyyy-mm-dd" readonly="readonly"
							placeholder="请选择日期"/>
				</td>
			</tr>
			<tr>
			    <td style="text-align: right;">发生地点：</td>
				<td><input type="text" name="occur_address" id="occur_address" value="" title="发生地点"/></td>
			</tr>
			<c:choose>
				<c:when test="${event_type == 1}">
					<tr>
					    <td style="text-align: right;">涉事驾驶员身份证号：</td>
						<td><input type="text" name="driver_certno" id="driver_certno" value="" title="涉事驾驶员身份证号"/></td>
					</tr>
				</c:when>
				<c:when test="${event_type == 2}">
					<tr>
					    <td style="text-align: right;">涉事平台统一信用代码：</td>
						<td><input type="text" name="com_creditcode" id="com_creditcode" value="" title="涉事平台统一信用代码"/></td>
					</tr>
				</c:when>
			</c:choose>
			<tr>
				<td colspan="2" style="text-align: center; padding-top: 20px;">
					<input type="hidden" name="event_type" id="event_type"  value="${event_type}"/>
					<a class="btn btn-mini btn-primary" onclick="check();">保存</a>&nbsp;&nbsp;
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" />
		<br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
</body>
</html>