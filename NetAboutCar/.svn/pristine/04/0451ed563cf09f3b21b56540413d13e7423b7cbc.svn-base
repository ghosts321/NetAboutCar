<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
 #fontStyle{
 	size:20px;
 	padding-left:20px
 }
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
	$('.date-picker').datepicker();
});
//保存
function save(){
	if($("#examname").val()==""){
		$("#examname").tips({
			side:3,
            msg:'请输入考试科目',
            bg:'#AE81FF',
            time:2
        });
		$("#examname").focus();
		return false;
	}
	if($("#address").val()==""){
		$("#address").tips({
			side:3,
            msg:'请输入考试地点',
            bg:'#AE81FF',
            time:2
        });
		$("#address").focus();
		return false;
	}
	if($("#examcontent").val()==""){
		$("#examcontent").tips({
			side:3,
            msg:'请输入考试内容',
            bg:'#AE81FF',
            time:2
        });
		$("#examcontent").focus();
		return false;
	}
	if($("#bespeakDate").val()==""){
		$("#bespeakDate").tips({
			side:3,
            msg:'请选择预约日期',
            bg:'#AE81FF',
            time:2
        });
		$("#bespeakDate").focus();
		return false;
	}
	if($("#sum").val()==""){
		$("#sum").tips({
			side:3,
            msg:'请输入预约人数',
            bg:'#AE81FF',
            time:2
        });
		$("#sum").focus();
		return false;
	}
	if($("#bespeak_time").val()=="1"){
		$("#morningcount").val($("#sum").val());
	}else{
		$("#afternooncount").val($("#sum").val());
	}
	
	$("#form").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}
$(document).ready(function(){
	var a = '${mngExamBespeak.morning_count}';
	if(a==0){
		$("#sum").val('${mngExamBespeak.afternoon_count}');
	}else{
		$("#sum").val('${mngExamBespeak.morning_count}');
	}
});
</script>
</head>
<body>
	<div class="container">
		<form action="updateExamBespeak.action" method="post" name="form" id="form">
			<input type="hidden" name="bespeak_id" value="${mngExamBespeak.bespeak_id }" />
			<input type="hidden" name="create_user" value="${mngExamBespeak.create_user }" />
			<input type="hidden" name="create_time" value="${mngExamBespeak.create_time }" />
			<div id="zhongxin" align="center" style="padding-top: 30px">
		   	<table>
		             <tr>
					    <td align="right">考试科目：</td>
					    <td colspan="2" align="left">
					    	<input class="form-control" size="30" name="exam_name"  value ="${mngExamBespeak.exam_name }" id="examname"  type="text"/>
					    </td>
					 </tr>
					 <tr>
					    <td align="right">考试地点：</td>
					    <td colspan="2" align="left">
					    	<input class="form-control" size="30" name="address" id="address" value ="${mngExamBespeak.address }" type="text"/>	
					    </td>
					 </tr>
					 <tr>
					    <td align="right">考试内容：</td>
					    <td  colspan="2" align="left">
					    	<textarea class="form-control" rows="1" cols="1" name="exam_content" id="examcontent">${mngExamBespeak.exam_content}</textarea>
					    </td>
					 </tr>
		             <tr>
					    <td align="right">预约日期：</td>
					    <td colspan="2" align="left">
					    	<input class="date-picker" name="bespeak_date" value ="${mngExamBespeak.bespeak_date }" id="bespeakDate" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="请选择日期"  title="请选择日期"/>
					    </td>
					 </tr>
					 <tr>
					    <td align="right">考试类型：</td>
					    <td colspan="2" align="left">
					    	<select class="form-control" name="exam_type">
					    		<option value="1" <c:if test="${mngExamBespeak.exam_type=='1'}">selected</c:if>>全国</option>
					    		<option value="2" <c:if test="${mngExamBespeak.exam_type=='2'}">selected</c:if>>地方</option>
					    	</select>
					    </td>
					 </tr>
					 <tr>
					 	<td align="right">预约时段：</td>
					 	<td align="left">
					 		<select class="form-control" name="bespeak_time" id="bespeak_time">
								<option value="1" <c:if test="${mngExamBespeak.afternoon_count=='0'}">selected</c:if>>上午</option>
								<option value="2" <c:if test="${mngExamBespeak.morning_count=='0'}">selected</c:if>>下午</option>
							</select>
						</td>
					 </tr>
					 <tr>
						<td align="right">预约人数：</td>
						<td align="left">
							<input class="form-control" id="sum" type="text" />
							<input type="hidden" id="morningcount" name="morning_count"/>
							<input type="hidden" id="afternooncount" name="afternoon_count"/>
						</td>
					 </tr>
				  <tr>
				     <td style="text-align: center; padding-top: 25px;" colspan="3">
				     	<a class='btn btn-mini btn-primary' onclick='save()'>保存</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				     	<a class='btn btn-mini btn-danger' onclick="top.Dialog.close();">取消</a>
				     </td>
			      </tr>
			</table>
			</div>
			<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="<%=basePath%>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
        </form>     
	</div>
</body>
</html>