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
<script type="text/javascript">

$(function(){ 
  	//日期框
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
	 
})
//保存校验
function save(){
   
  var regMobile=/^1[3,5,8]\d{9}$/;
  var regIdCard=/^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
  var regEmail =/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/; 
  var regCarNum=/^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$/;
  var regName= /[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*/;
  
  var name=$("#compn_name").val();
  var phoneNum=$("#compn_tel").val();
  var carId = $("#compn_number").val();
  var driverId = $("#driver_licence").val();
  var email = $("#compn_email").val();
  var carnum = $("#car_number").val();
   
   
  if(regName.test(name)==false){
		$("#compn_name").tips({
			side:3,
            msg:'请输入正确的姓名',
            bg:'#AE81FF',
            time:2
        });
		$("#compn_name").focus();
		return false;
	}
	
	if(regMobile.test(phoneNum)==false){
		$("#compn_tel").tips({
			side:3,
            msg:'请输入正确的电话号',
            bg:'#AE81FF',
            time:2
        });
		$("#compn_tel").focus();
		return false;
	}
	
	if($("#compn_sex").val()=="0"){
		$("#compn_sex").tips({
			side:3,
            msg:'请选择性别',
            bg:'#AE81FF',
            time:2
        });
		$("#compn_sex").focus();
		return false;
	}
	
	if($("#compn_time").val()==""){
		$("#compn_time").tips({
			side:3,
            msg:'请输入投诉时间',
            bg:'#AE81FF',
            time:2
        });
		$("#compn_time").focus();
		return false;
	}
	
	if(email!=null && email!=''){
	  if(regEmail.test(email)==false){
	  	$("#compn_email").tips({
			side:3,
            msg:'请输入正确的邮箱',
            bg:'#AE81FF',
            time:2
        });
		$("#compn_email").focus();
		return false;
	    }
	 }
	
	if(carId!=null && carId!=''){
	if(regIdCard.test(carId)==false){
		$("#compn_number").tips({
			side:3,
            msg:'请输入正确的身份证号',
            bg:'#AE81FF',
            time:2
        });
		$("#compn_number").focus();
		return false;
	   }
	}
	    
	 
	 if(regCarNum.test(carnum)==false){
		$("#car_number").tips({
			side:3,
            msg:'请输入正确的车牌号',
            bg:'#AE81FF',
            time:2
        });
		$("#car_number").focus();
		return false;
	}
		
	if($("#car_company").val()=="请选择"){
		$("#car_company").tips({
			side:3,
            msg:'请输入网约车所属平台名称',
            bg:'#AE81FF',
            time:2
        });
		$("#car_company").focus();
		return false;
	}
		
	  if(regIdCard.test(driverId)==false){
		 $("#driver_licence").tips({
			side:3,
            msg:'请输入正确的驾驶证号码',
            bg:'#AE81FF',
            time:4
        });
		$("#driver_licence").focus();
		return false;
	   }

	
		 if($("#driver_name").val()==""){
		$("#driver_name").tips({
			side:3,
            msg:'请输入驾驶员姓名',
            bg:'#AE81FF',
            time:2
        });
		$("#driver_name").focus();
		return false;
	}
	
    if($("#compn_reason").val()==""){
		$("#compn_reason").tips({
			side:3,
            msg:'请输入投诉内容',
            bg:'#AE81FF',
            time:2
        });
		$("#compn_reason").focus();
		return false;
	}
	

    
	$("#addForm").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}

function reg(){
var driverId = $("#driver_licence").val();
if(driverId!=null &&driverId!=''){
$.ajax({
  type:"post",
  url:'<%=basePath%>drvcomplaint/reg.action?driver_licence='+driverId,
  data:{},
  cache:false,
  success:function(data){
   if(data=="erro"){
      //alert("您输入的驾驶证号不是网约车驾驶员证号");
       $("#driver_licence").tips({
			side:3,
            msg:'服务器校验未通过',
            bg:'#AE81FF',
            time:2
        });
      $("#driver_licence").focus(); 
      document.getElementById("driver_licence").value=""; 
   }
  
  }
     });

  }

}

               function getFile(obj,inputName){
				var file_name = $(obj).val();
				var houzhui=file_name.split(".");
				var last=houzhui[houzhui.length-1];
				var tp ="doc,docx";
				var rs=tp.indexOf(last);
				
				//如果返回的结果大于或等于0，说明包含允许上传的文件类型
				if(rs>=0){
					 $("input[name='"+inputName+"']").val(file_name);
					 return true;
				}else{
					 alert("您选择的上传文件不是有效的文档！");
					 $("input[name='"+inputName+"']").val("");
					 return false;
				}
			} 
			

</script>
<style>
    table{
	table-layout:automatic;
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
border:1px solid #cad9ea;
padding:5px 0.5em 0;
width:100px
}
.table tr.alter{
background-color:#f5fafe;
}
img{
margin-bottom:0.5em;
width: 220px;
height: 150px;
}

select,textarea{
	margin-bottom: 8px;
}
textarea{
  width:200px;
  height:50px
}
</style>
</head>
<body>
<div class="container">
<form  action="addDrvComplaint.action" name="addForm" id="addForm" method="post" enctype="multipart/form-data" >
		<div id="zhongxin" align="center" style="padding-top:30px">
		<table  class="table">
		   <tr><td colspan="4"><strong>投诉人基本信息</strong></td></tr>
			<tr>
				<td style="text-align: right;">姓名：</td>
			 <td><input type="text" name="compn_name" id="compn_name" value="" title="姓名" style="width:220px;"/></td>	
			 <td style="text-align: right;">性别：</td>
				<td ><select name="compn_sex" id="compn_sex" style="width:220px;">
				  <option value="0">请选择</option>
				     <option value="1">男</option>
				      <option value="2">女</option>       
				  </select></td>
			</tr>
 
			<tr>
			    <td style="text-align: right;">手机号：</td>
				<td><input type="text" name="compn_tel" id="compn_tel" value="" title="手机号" style="width:220px;"/></td>
				<td style="text-align: right;">投诉时间：</td>
			<td><input type="text" class="ui_timepicker" id="compn_time" name="compn_time" readonly  value=""  data-date-format="yyyy-mm-dd" style="width:220px;"/></td>	
			</tr>
		
			<tr><td style="text-align: right;" >身份证号：</td>
				<td><input type="text" name="compn_number" id="compn_number" value="" title="身份证号" style="width:220px;"/></td>
				  <td style="text-align: right;">电子邮件：</td>
				<td><input type="text" name="compn_email" id="compn_email" value="" title="电子邮件" style="width:220px;"/></td>
				</tr>
				<tr>  <td style="text-align: right;">现住地址：</td>
				<td colspan="3"><textarea name="compn_address" id="compn_address"  title="现住地址" style="width:500px;height:50px;"></textarea></td></tr>
				
				
                 <tr><td colspan="4"><strong>投诉信息</strong></td></tr>
				<tr> <td style="text-align: right;">驾驶员姓名：</td>
				<td><input type="text" name="driver_name" id="driver_name" value="" title="驾驶员姓名" style="width:220px;"/></td>
				
				<td style="text-align: right;">驾驶证号码：</td>
				<td><input type="text" name="driver_licence" id="driver_licence" onblur="reg()" value="" title="驾驶证号码" style="width:220px;"/></td>
				</tr>
				<tr>
				<td style="text-align: right;">车牌号：</td>
				<td><input type="text" name="car_number" id="car_number" value="" title="车牌号" style="width:220px;"/></td> 
				<td style="text-align: right;">网约车公司名称：</td>
				<td>
				<select name="car_company" id="car_company" style="width:220px;">
			        <option value="请选择">请选择</option>
				     <c:forEach items="${comlist}" var="comlist">
				     <option value="${comlist.comname}">${comlist.comname}</option>
				     </c:forEach>     
				  </select>
				</td>
				</tr>
				 <tr height="40">
								<td align="right">投诉文件：</td>
								<td colspan="3" align="left">
							         <div class="box">
										<input type="text" name="compn" id="compn" class="file_textbox" />
										<a href="javascript:void(0);" class="upload_link">上传</a>
										<input type="file" multiple  class="uploadFile" name="compnfile"  id="compnfile" onchange="getFile(this,'compn')" />
									</div>         
								</td>
							</tr> 
							<tr>
			    <td style="text-align: right;">投诉内容：</td>
			    <td colspan="3"><textarea name="compn_reason" id="compn_reason"  style="width:500px;height:50px;"></textarea></td>
			</tr>
			<tr>
				<td  style="text-align: center; padding-top: 20px;" colspan=4>
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>&nbsp;&nbsp;&nbsp;
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
				
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="<%=basePath%>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
</body>
</html>