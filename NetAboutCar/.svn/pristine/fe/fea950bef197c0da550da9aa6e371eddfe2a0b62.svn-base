<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp" %>
<%-- <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%-- <link href="<%=basePath %>static/css/bootstrap.min.css" rel="stylesheet"/>
<link href="<%=basePath %>bootstrap/css/bootstrap-table.css" rel="stylesheet"/>
<link href="<%=basePath %>static/css/ace.min.css" rel="stylesheet"/>
<link href="<%=basePath %>static/css/ace-responsive.min.css" rel="stylesheet"/>
<link href="<%=basePath %>static/css/ace-skins.min.css" rel="stylesheet"/>
<link href="<%=basePath %>static/css/font-awesome.min.css" rel="stylesheet"/>
<link href="<%=basePath %>bootstrap/css/docs.min.css" rel="stylesheet"/>
<link href="<%=basePath %>static/css/myStyle.css" rel="stylesheet"/>
<link href="<%=basePath %>bootstrap/css/buttomdocs.min.css" rel="stylesheet"/>
<link href="<%=basePath %>plugins/buttons/css/buttons.css" rel="stylesheet"/>
<link href="<%=basePath %>plugins/buttons/css/font-awesome.min.css" rel="stylesheet"/>
<link href="<%=basePath %>bootstrap/css/main.css" rel="stylesheet"/>
<link href="<%=basePath %>bootstrap/css/awesome-bootstrap-checkbox.css" rel="stylesheet"/>
<link href="<%=basePath %>static/css/userReg.css" rel="stylesheet"/>


<!--js-->
<script src="<%=basePath %>bootstrap/js/jquery-1.12.0.min.js" type="text/javascript"></script>
<script src="<%=basePath %>bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=basePath %>bootstrap/js/bootstrap-table.js" type="text/javascript"></script>
<script src="<%=basePath %>bootstrap/js/distpicker.data.js" type="text/javascript"></script>
<script src="<%=basePath %>bootstrap/js/distpicker.js" type="text/javascript"></script>
<script src="<%=basePath %>bootstrap/js/main.js" type="text/javascript"></script>
<script src="<%=basePath %>bootstrap/js/bootstrap-table-zh-CN.js" type="text/javascript"></script>

<script src="<%=basePath %>js/formValidator_min.js" type="text/javascript" charset="UTF-8"></script>
<script src="<%=basePath %>js/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>


<script src="<%=basePath %>static/js/jquery.tips.js" type="text/javascript"></script>
 --%>
 <link rel="stylesheet" href="../static/css/datepicker.css" /><!-- 日期框 -->
 <script type="text/javascript" src="../static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
 <script src="../js/formValidator_min.js" type="text/javascript" charset="UTF-8"></script>
<script src="../js/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
 
<style>
select,textarea{
	margin-top: 4px;
	margin-bottom: 4px;

}
textarea{
  width: 210px;
}
.onShow{
	min-width:10px;
}
</style>
<script type="text/javascript">
	var msg = <%=request.getAttribute("responseMsg")%> ;
	if(msg != null){
		alert(msg);
	}
	$(function(){
		var provinceList = ${provinceList};
		var provinceStr = "<option value=''>请选择</option>";
		if(provinceList != null){
			for(var i=0;i<provinceList.length;i++){
				provinceStr += "<option value='"+provinceList[i].areaCode+"'>"+provinceList[i].areaName+"</option>";
			}
			$("#areaCode_province").append(provinceStr);
		}
	});
	
	function getAreaCode(sourceSelectId,targetSelectId){
		$("#instId").empty();
		var codeParam = $("#"+sourceSelectId+"").find("option:selected").val();
		$("#"+targetSelectId+"").empty();
		$.ajax({
            type: "post",
            url: "getAreaCode.action",
            data: "codeParam=" + codeParam,
            success: function (data) {
            	var codeJson = eval(data);
            	var codeStr = "<option value=''>请选择</option>";
        		if(codeJson != null){
        			for(var i=0;i<codeJson.length;i++){
        				codeStr += "<option value='"+codeJson[i].areaCode+"'>"+codeJson[i].areaName+"</option>";
        			}
        			$("#"+targetSelectId+"").append(codeStr);
        		}
            }
        });
	}
	/* function setAreaCode(sourceSelectId){
		var codeParam = $("#"+sourceSelectId+"").find("option:selected").val();
		$("#areaCode").val(codeParam);
		initDept(codeParam);
	} */
	function initDept(codeParam){
		//var codeParam = $("#areaCode").find("option:selected").val();
		var length = $("#areaCode_city option").length;
		var codeParam;
		if(length<=3){
			codeParam = $("#areaCode_province").find("option:selected").val();
		}else{
			codeParam = $("#areaCode_city").find("option:selected").val();
		}
		$("#instId").empty();
		$.ajax({
            type: "post",
            url: "<%=basePath %>instInfo/getInstByAreaCode.action",
            data: "codeParam=" + codeParam,
            success: function (data) {
            	var instJson = eval(data);
            	var codeStr = "";
        		if(instJson != null){
        			for(var i=0;i<instJson.length;i++){
        				codeStr += "<option value='"+instJson[i].instId+"'>"+instJson[i].instName+"</option>";
        			}
        			$("#instId").append(codeStr);
        		}
            }
        });
	}
	function regitsUser(){
		var instId = $("#instId").val();
		if(instId == null || instId == ""){
			alert("对不起，没有选择机构!");
			return;
		}
		var phoneNum = $("#phoneNum").val();
		if(phoneNum == null || phoneNum == ""){
			alert("对不起，请输入手机号!");
			return ;
		}
		$("#userInfoForm").submit();
	}
	function userInfoReset(){
		$("#userInfoForm").reset();
	}
$(document).ready(function(){
	$.formValidator.initConfig({formid:"userInfoForm",debug:false,submitonce:true,
		onerror:function(msg,obj,errorlist){
			//$.map(errorlist,function(msg1){alert(msg1)});
			alert(msg);
		}
	});
	//用户名
	//$("#userName").formValidator({onShow: "请输入用户名", onfocus: "请输入用户名"}).functionValidator({ fun:isUsername}).inputValidator({min:6,max:30,onerror:"字符长度6-30"});
	$("#userName").formValidator({ajax:true,onShow: "请输入用户名", onfocus: "请输入用户名", onCorrect: "用户名可以使用，请完善下面信息。" }).inputValidator({ min: 6, max: 30, onerror: "输入长度不正确！" })
       .ajaxValidator({
         dataType: "text",
         async: true,
         url: "validUserName.action",
         success: function (data) {
           if (data == "0") { return true; }
           else if (data == "1") { return false; }
         },
         buttons: $("#button"),
         error: function (jqXHR, textStatus, errorThrown) { alert("服务器没有返回数据，可能服务器忙，请重试" + errorThrown); },
         onerror: "该用户名已被注册，请更换。",
         onWait: "正在对用户名进行合法性校验，请稍候..."
       });  //这里添加defaultPassed()的话，则默认验证通过。
	//真实姓名
	$("#realName").formValidator({onshow:"请输入真实姓名",onfocus:"请输入真实姓名"}).functionValidator({fun:isChinese});
	//密码
	$("#password").formValidator({onShow: "请输入密码", onfocus: "请输入密码"}).functionValidator({ fun:isUsername});
	//家庭住址
    //$("#address").formValidator({onshow:"请输入家庭住址",onfocus:"请输入家庭住址"}).inputValidator({min:1,max:30,onerror:"地址格式有误"});
    //手机号
	$("#phoneNum").formValidator({onshow:"请输入你的手机号码",onfocus:"请输入你的手机号码"}).functionValidator({fun:isPhoneNumber});
	//邮箱
    //$("#email").formValidator({onShow:"请输入邮箱",onFocus:"邮箱6-100个字符,输入正确了才能离开焦点",defaultValue:"@"}).functionValidator({fun:isEmail});
});
function invalidUser(){
	$("#userName").val();
}
</script>
</head>
<body>
</div>
   <div class="container">
    	<!-- <fieldset> -->
		 <!--   <legend style="font-size: 18px;padding-left: 155px;" align="top"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户注册 
		    </legend> -->
		    	<form id="userInfoForm" name="userInfoForm" action="userRegist.action" method="post">
				<div id="zhongxin" align="center" style="padding-top: 30px">
				 <table>
			<tr>
				<td align="right">用户名：</td>
				<td align="left">  <input type="text" id="userName" name="userName" style="width: 210px" height="5px"><span id="userNameTip" class="onshow"></span></td>
			</tr>
			<tr>
				<td align="right">密码：</td>
				<td align="left">  <input type="password" id="password" name="password" style="width: 210px"><span id="passwordTip" class="onshow"></span></td>
			</tr>
			<tr>
				<td align="right">真实姓名：</td>
				<td align="left"> <input type="text" id="realName" name="realName" style="width: 210px"><span id="realNameTip" class="onshow"></span></td>
			</tr>
			<tr>
				<td align="right">出生日期：</td>
				<td align="left">   <input class="span10 date-picker" style="width: 210px" type="text" id="birthday" name="birthday" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="请选择"></td>
			</tr>
			<tr>
				<td align="right">性别：</td>
				<td align="left">    <input style="width:20px" type="radio" name="sex" id="sex" value="1" checked>男
				  <input type="radio" style="width:20px" name="sex" id="sex" value="2">女
				</td>
			</tr>
			<tr>
				<td align="right">区域：</td>
				<td align="left">   <select onchange="getAreaCode('areaCode_province','areaCode_city')" id="areaCode_province" data-placeholder="选择省">
						</select>
						<select onchange="getAreaCode('areaCode_city','areaCode')"  id="areaCode_city" data-placeholder="选择市">
						</select>
						<select onchange="initDept()" id="areaCode" name="areaCode" data-placeholder="选择区">
						</select>
				</td>
			</tr>
			<tr>
				<td align="right">所在机构：</td>
				<td align="left">    <select id="instId" name="instId">
					  </select>
				</td>
			</tr>
			<tr>
				<td align="right">手机号：</td>
				<td align="left">     <input type="text" id="phoneNum" name="phoneNum" style="width: 210px"><span id="phoneNumTip" class="onshow"></span>
				</td>
			</tr>
			<tr>
				<td align="right">邮箱：</td>
				<td align="left">    <input type="text" id="email" name="email" style="width: 210px"><span id="emailTip" class="onshow"></span>
				</td>
			</tr>
			<tr>
				<td align="right">职位：</td>
				<td align="left">      <input type="text" id="positions" name="positions" style="width: 210px"/>
				</td>
			</tr>
			<tr>
				<td align="right">办公电话：</td>
				<td align="left">  <input type="text" id="telNo" name="telNo" style="width: 210px"><span id="telNoTip" class="onshow"></span>
				</td>
			</tr>
			<tr>
				<td align="right">传真：</td>
				<td align="left"> <input type="text" id="fax" name="fax" style="width: 210px"><span id="faxTip" class="onshow"></span>
				</td>
			</tr>
			<tr>
				<td align="right">家庭住址：</td>
				<td align="left"> <textarea style="height:40px" cols="40" rows="5" name="address" id="address" ></textarea>
				</td>
			</tr>
			<tr>
				<td align="right">办公地址：</td>
				<td align="left">  <textarea style="height:40px" cols="40" rows="5" name="officeAddress" id="officeAddress" ></textarea>
				</td>
			</tr>
			<tr>
				<td align="right">说明：</td>
				<td align="left">    <textarea style="height:40px" cols="40" rows="5" name="remark" id="remark" ></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" style="padding-top: 20px;">
					<a class="btn btn-mini btn-primary" onclick="regitsUser();">保存</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
			</table>
			</div>
				</form>
		<!-- </fieldset> -->
   </div><!-- container end -->
   
<script type="text/javascript" src="<%=basePath %>static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
<script type="text/javascript">
$(function() {
	//日期框
	$('.date-picker').datepicker();
	
});

</script>
</body>
</html>