<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../../common.jsp" %>

<link type="text/css" href="<%=basePath%>datetime/css/jquery-ui-1.8.17.custom.css" rel="stylesheet" />
<link type="text/css" href="<%=basePath%>datetime/css/jquery-ui-timepicker-addon.css" rel="stylesheet" />
<script type="text/javascript" src="<%=basePath%>datetime/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>datetime/js/jquery-ui-1.8.17.custom.min.js"></script>
<script type="text/javascript" src="<%=basePath%>datetime/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="<%=basePath%>datetime/js/jquery-ui-timepicker-zh-CN.js"></script> 
<script src="<%=basePath %>static/js/jquery.tips.js" type="text/javascript"></script>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
 a:hover{color:white;text-decoration:none;}
 table{border-collapse:separate;}
select,textarea{
	margin-top: 4px;
	margin-bottom: 4px;
}
textarea{
  width: 222px;
}
</style>
<script type="text/javascript">
$(function(){
    //日期控件
    $(".ui_timepicker").datetimepicker({
        //showOn: "button",
        //buttonImage: "./css/images/icon_calendar.gif",
       // buttonImageOnly: true,
        showSecond: true,
        timeFormat: 'hh:mm:ss',
        stepHour: 1,
        stepMinute: 1,
        stepSecond: 1
    }); 
});
//获取文件名
function getFile(obj,inputName){
	var file_name = $(obj).val();
	var houzhui=file_name.split(".");
	var last=houzhui[houzhui.length-1];
	var tp ="doc,docx";
	var rs=tp.indexOf(last);
				
	//如果返回的结果大于或等于0，说明包含允许上传的文件类型
	if(rs>=0){
		$("input[name='"+inputName+"']").val(file_name);
		alert();
		return true;
		}else{
			alert("您选择的上传文件不是有效文件,请上传后缀为doc,docx的文档文件！");
			$("input[name='"+inputName+"']").val("");
			return false;
		}
} 

//获取文件名
function getFile1(obj,inputName){
	var file_name = $(obj).val();
	var houzhui=file_name.split(".");
	var last=houzhui[houzhui.length-1];
	var tp ="doc,docx";
	var rs=tp.indexOf(last);
				
	//如果返回的结果大于或等于0，说明包含允许上传的文件类型
	if(rs>=0){
		$("input[name='"+inputName+"']").val(file_name);
		alert();
		return true;
		}else{
			alert("您选择的上传文件不是有效文件,请上传后缀为doc,docx的文档文件！");
			$("input[name='"+inputName+"']").val("");
			return false;
		}
}
//获取处罚内容
function getTerm(){
	<%-- var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="处罚内容信息";
	 diag.URL = '<%=basePath%>penalty/tremIndex.action';
	 diag.Width = 1000;
	 diag.Height = 1000;
	 diag.CancelEvent = function(){ //关闭事件
		/* if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			setTimeout("location.reload()",100);
		} */
		location.reload();
		diag.close();
	 };
	 diag.show(); --%>
	  document.getElementById('casereason').blur();
	 window.open("<%=basePath%>penalty/tremsIndex.action","","status:no;resizable:yes;dialogHeight:410px;dialogWidth:460px;unadorne:yes");
}


function getDrvno(){

var drvId = $("#drivcarno").val();
$.ajax({
type:'post',
url:'<%=basePath%>drvpenalty/getDrvno.action?drivcarno='+drvId,
data:{},
success:function(data){
   if(data=="erro"){
      alert("您输入的驾驶证号不正确");
      document.getElementById("drivcarno").value="";
       
       }

    }
 })

}

//保存
function save(){

		var regCar=/^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$/;
  		var regIdCard=/^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
  
  		var carId=$("#carid").val();
  		var drvId = $("#drivcarno").val();



	 if(regCar.test(carId)==false){
		$("#carid").tips({
			side:3,
            msg:'请输入正确的车牌号码',
            bg:'#AE81FF',
            time:2
        });
		$("#carid").focus();
		return false;
	} 
	
	if(regIdCard.test(drvId)==false){
		$("#drivcarno").tips({
			side:3,
            msg:'请输入正确的驾驶证号码',
            bg:'#AE81FF',
            time:2
        });
		$("#drivcarno").focus();
		return false;
	}
	
	 if($("#drivename").val()==""){
		$("#drivename").tips({
			side:3,
            msg:'请输入司机名称',
            bg:'#AE81FF',
            time:2
        });
		$("#drivename").focus();
		return false;
	}
	
	if($("#plateName").val()==""){
		$("#plateName").tips({
			side:3,
            msg:'请填写所属平台',
            bg:'#AE81FF',
            time:2
        });
		$("#plateName").focus();
		return false;
	}
	
	if($("#casesource").val()==""){
		$("#casesource").tips({
			side:3,
            msg:'请选择案件来源',
            bg:'#AE81FF',
            time:2
        });
		$("#casesource").focus();
		return false;
	}
	
	if($("#areacode").val()==""){
		$("#areacode").tips({
			side:3,
            msg:'请填写行政区划',
            bg:'#AE81FF',
            time:2
        });
		$("#areacode").focus();
		return false;
	}
	
	if($("#instid").val()==""){
		$("#instid").tips({
			side:3,
            msg:'请填写组织机构',
            bg:'#AE81FF',
            time:2
        });
		$("#instid").focus();
		return false;
	}
	
	if($("#caseuserid").val()==""){
		$("#caseuserid").tips({
			side:3,
            msg:'请填写案件承办人',
            bg:'#AE81FF',
            time:2
        });
		$("#caseuserid").focus();
		return false;
	}
	
	if($("#isregister").val()==""){
		$("#isregister").tips({
			side:3,
            msg:'请选择案件状态',
            bg:'#AE81FF',
            time:2
        });
		$("#isregister").focus();
		return false;
	}
	
	if($("#casereason").val()==""){
		$("#casereason").tips({
			side:3,
            msg:'请填写案件事由',
            bg:'#AE81FF',
            time:2
        });
		$("#casereason").focus();
		return false;
	}
	
	if($("#punishtype").val()==""){
		$("#punishtype").tips({
			side:3,
            msg:'请选择处罚类型',
            bg:'#AE81FF',
            time:2
        });
		$("#punishtype").focus();
		return false;
	}
	
	if($("#punishcontent").val()==""){
		$("#punishcontent").tips({
			side:3,
            msg:'请填写处罚内容',
            bg:'#AE81FF',
            time:2
        });
		$("#punishcontent").focus();
		return false;
	}
	
	/* if($("#evidenceUrl").val()==""){
		$("#evidenceUrl").tips({
			side:3,
            msg:'请上传证据文件',
            bg:'#AE81FF',
            time:2
        });
		$("#evidenceUrl").focus();
		return false;
	}
	
	if($("#excelFile").val()==""){
		$("#excelFile").tips({
			side:3,
            msg:'请上传处罚文书',
            bg:'#AE81FF',
            time:2
        });
		$("#excelFile").focus();
		return false;
	}  */
	$("#drvPlantCaseInfoForm").submit();
    $("#zhongxin").hide();
	$("#zhongxin2").show();  
}
</script>
</head>
<body>
	<div class="container">
		<form action="drvAddCase.action" method="post" name="drvPlantCaseInfoForm" id="drvPlantCaseInfoForm" enctype ="multipart/form-data">
			<div id="zhongxin" align="center" style="padding-top: 25px">
		   	<table> 
		   	        <tr>
						<td align="right">车牌号：</td>
						<td align="left"><input class="form-control"
							name="carid" id="carid" type="text" placeholder="请输入车牌号"></td>
					</tr>
					
					 <tr>
						<td align="right">驾驶证号码：</td>
						<td align="left"><input class="form-control"
							name="drivcarno" id="drivcarno" type="text" placeholder="请输入驾驶证号码"
							onblur="getDrvno()"></td>
					</tr>
					
					 <tr>
						<td align="right">司机名称：</td>
						<td align="left"><input class="form-control"
							name="drivename" id="drivename" type="text" placeholder="请输入司机名称"></td>
					</tr>
					
					<tr >
						<td align="right">平台名称：</td>
						<td align="left">
							<select class="form-control" name="plateName" id="plateName">
							<option value="">请输入平台名称</option>
								<c:forEach items="${platformList}" var="platform">
									<option value="${platform.platformName}">${platform.platformName}</option>
								</c:forEach>
							</select>
						</td>
						<td align="left"></td>
					</tr>
					
					<tr>
						<td align="right">案件来源：</td>
						<td align="left">
							<select class="form-control" name="casesource" id="casesource">
								<option value="01">稽查执法查扣违章</option>
								<option value="02">信访投诉违章</option>
								<option value="00">手工录入</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td align="right">行政区划：</td>
						<td align="left"><input class="form-control"
							name="areacode" id=""areacode"" type="text" placeholder="请输入行政区划"/></td>
					</tr>
					
					<tr>
						<td align="right">组织机构：</td>
						<td align="left">
						<input class="form-control"
							name="instid" id="instid" type="text" placeholder="请输入组织机构"/>
						</td>
					</tr>
					
					<tr>
						<td align="right">案件状态：</td>
						<td align="left">
							<select class="form-control" name="isregister" id="isregister">
								<option value=""></option>
								<option value="00">已结案</option>
								<option value="01">未交罚款</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td align="right">案发时间：</td>
						<td><input type="text" class="ui_timepicker" id="casetime" name="casetime" readonly="readonly"  value=""  data-date-format="yyyy-mm-dd" style="width:220px;"/></td>	
					</tr> 
					
					<tr>
						<td align="right">案件事由：</td>
						<td align="left"><textarea class="form-control" rows="4" cols="1" 
							name="casereason" id="casereason" placeholder="请输入案件事由" onfocus="getTerm()" readonly></textarea>
						</td>
					</tr>
					<tr>
						<td align="right">处罚类型：</td>
						<td align="left">
							<select class="form-control" name="punishtype" id="punishtype">
								<option value=""></option>
								<option value="0001">口头警告</option>
								<option value="0002">200元以下罚款</option>
								<option value="0003">暂扣或吊销驾驶证</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right">处罚内容：</td>
						<td align="left"><textarea class="form-control" rows="4" cols="1" 
							name="punishcontent" id="punishcontent" placeholder="请输入案件事由"></textarea>
						</td>
					</tr>
					<tr height="40">
								<td align="right">证据上传：</td>
								<td  align="left" colspan="3">
							         <div class="box">
										<input type="text" name="compn" id="compn" class="file_textbox" />
										<a href="javascript:void(0);" class="upload_link">上传</a>
										<input type="file" multiple  class="uploadFile" name="compnfile"  id="compnfile" onchange="getFile(this,'compn')" />
									</div>         
								</td>
							</tr> 
					<tr height="40">
						<td align="right">处罚文书上传：</td>
						<td  align="left" colspan="3">
							 <div class="box">
								<input type="text" name="punish" id="punish" class="file_textbox" />
								<a href="javascript:void(0);" class="upload_link">上传</a>
								<input type="file" multiple  class="uploadFile" name="punishfile"  id="punishfile" onchange="getFile(this,'punish')" />
							</div>         
						</td>
					</tr>
					<tr >
						<td colspan="2" height="40" style="text-align: center;">
							<a class='btn btn-mini btn-primary' onclick='save()'>保存</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">返回</a>
						</td>
					</tr>
				</table>
			</div>
			<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="<%=basePath%>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
        </form>     
	</div>
</body>
</html>