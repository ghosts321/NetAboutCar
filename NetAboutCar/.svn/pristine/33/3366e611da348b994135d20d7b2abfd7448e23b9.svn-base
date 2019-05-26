<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
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
		var provinceList = ${provinceList};
		var provinceStr = "<option value=''>请选择</option>";
		if(provinceList != null){
			for(var i=0;i<provinceList.length;i++){
				provinceStr += "<option value='"+provinceList[i].areaCode+"'>"+provinceList[i].areaName+"</option>";
			}
			$("#areaCode_province").append(provinceStr);
		}
		//初始化性别
		var sexRadio = ${userInfo.sex};
		if(sexRadio == 1){
			$('input[name=sex]').get(0).checked = true;
		}else{
			$('input[name=sex]').get(1).checked = true;
		}
		//日期框
		$('.date-picker').datepicker();
	});
	
	function getAreaCode(sourceSelectId,targetSelectId){
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
	
	function setAreaCode(sourceSelectId){
		var codeParam = $("#"+sourceSelectId+"").find("option:selected").val();
		$("#areaCode").val(codeParam);
	}
	
	//保存
	function save(){
		if($('input[name=sex]').get(0).checked){
			$("#sex").val(1);
		}else{
			$("#sex").val(2);
		}
		$("#userInfoForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
</script>
</head>
<body>
<div class="container">
	<form action="updateUser.action" name="userInfoForm" id="userInfoForm" method="post">
		<input type="hidden" id="userId" name="userId" value="${userInfo.userId}">
		<div id="zhongxin" align="center" style="padding-top: 30px">
		<table>
			<tr>
				<td style="width:30%;text-align: right;">用户名:</td>
				<td align="left"><input type="text" class="form-control" name="userName" id="userName" value="${userInfo.userName}" maxlength="32" readonly title="用户名不可修改"/></td>
			</tr>
			<tr>
				<td style="width:30%;text-align: right;">新密码:</td>
				<td align="left"><input class="form-control" type="text" name="password" id="password" value="" maxlength="32" title="新密码"/></td>
			</tr>
			<tr>
				<td style="width:30%;text-align: right;">真实姓名:</td>
				<td align="left"><input class="form-control" type="text" name="realName" id="realName" value="${userInfo.realName}" maxlength="32" placeholder="这里输入真实姓名" title="真实姓名"/></td>
			</tr>
			<tr>
				<td style="width:30%;text-align: right;">性别:</td>
				<td align="left">
					<input type="hidden" id="sex" name="userInfo.sex">
					<label><input name="sex" value="1" class="ace-checkbox-2" type="radio" /><span class="lbl">男</span></label>
					<label><input name="sex" value="2" class="ace-checkbox-2" type="radio" /><span class="lbl">女</span></label>
				</td>
			</tr>
			<tr>
				<td style="width:30%;text-align: right;">出生年月:</td>
				<td>
				<input class="span10 date-picker" name="birthday" value="${userInfo.birthday}" type="text" readonly="readonly" data-date-format="yyyy-mm-dd" placeholder="出生年月"  title="出生年月"/>
				</td>
			</tr>
			 <tr>
				<td style="width:30%;text-align: right;">住址:</td>
				<td><input class="form-control" type="text" name="address" id="address" value="${userInfo.address}" maxlength="32" placeholder="这里输入住址" title="住址"/></td>
			</tr>
			<tr>
				<td style="width:30%;text-align: right;">手机号:</td>
				<td><input class="form-control" type="text" name="phoneNum" id="phoneNum" value="${userInfo.phoneNum}" maxlength="32" placeholder="这里输入手机号" title="手机号"/></td>
			</tr>
			<tr>
				<td style="width:30%;text-align: right;">邮箱:</td>
				<td><input class="form-control" type="text" name="email" id="email" value="${userInfo.email}" maxlength="32" placeholder="这里输入邮箱" title="邮箱"/></td>
			</tr>
			<tr>
				<td style="width:30%;text-align: right;">职位:</td>
				<td><input class="form-control" type="text" name="positions" id="positions" value="${userInfo.positions}" maxlength="32" placeholder="这里输入邮箱" title="邮箱"/></td>
			</tr>
			<tr>
				<td style="width:30%;text-align: right;">办公地址:</td>
				<td><input class="form-control" type="text" name="officeAddress" id="officeAddress" value="${userInfo.officeAddress}" maxlength="32" placeholder="这里输入邮箱" title="邮箱"/></td>
			</tr>
			<tr>
				<td style="width:30%;text-align: right;">办公电话:</td>
				<td><input class="form-control" type="text" name="telNo" id="telNo" value="${userInfo.telNo}" maxlength="32" placeholder="这里输入邮箱" title="邮箱"/></td>
			</tr>
			<tr>
				<td style="width:30%;text-align: right;">传真:</td>
				<td><input class="form-control" type="text" name="fax" id="fax" value="${userInfo.fax}" maxlength="32" placeholder="这里输入传真" title="传真"/></td>
			</tr>
			<!-- <tr>
				<td style="width:30%;text-align: right;">所属区划:</td>
				<td>
					<input type="hidden" id="areaCode" name="areaCode">
					<select onchange="getAreaCode('areaCode_province','areaCode_city')" style="width: 100px" id="areaCode_province" data-placeholder="选择省">
					</select>
					<select onchange="getAreaCode('areaCode_city','areaCode_county')" style="width: 100px" id="areaCode_city" data-placeholder="选择市">
					</select>
					<select onchange="setAreaCode('areaCode_county')" style="width: 100px" id="areaCode_county" data-placeholder="选择区">
					</select>
				</td>
			</tr> -->
			<!-- <tr>
				<td style="width:30%;text-align: right;">所属机构:</td>
				<td><input type="hidden" id="instId" name="instId" value="0">
					<select>
						  <option value=""></option>
					</select>
				</td>
			</tr> -->
			<tr>
				<td style="width:30%;text-align: right;">备注:</td>
				<td><textarea class="form-control" name="remark" id="remark" maxlength="32" placeholder="这里输入备注" title="备注">${userInfo.remark}</textarea></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center; padding-top: 25px;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="<%=basePath %>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
</div>
</body>
</html>