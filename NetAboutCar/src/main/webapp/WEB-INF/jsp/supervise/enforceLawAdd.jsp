<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp" %>
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
</script>
</head>
<body>
	<div class="container">
		<form action="addExamBespeak.action" method="post" name="form" id="form">
			<div id="zhongxin" align="center" style="padding-top: 30px">
		   	<table>
					<tr>
						<td align="right">车牌号：</td>
						<td align="left"><input class="form-control"
							name="exam_name" id="examname" type="text"></td>
					</tr>
					<tr>
						<td align="right">违法行为：</td>
						<td align="left"><input class="form-control"
							name="address" id="address" type="text"></td>
					</tr>
					<tr>
						<td align="right">违规行为：</td>
						<td align="left">
							<input class="form-control"
							name="address" id="address" type="text">
						</td>
					</tr>
					<tr>
						<td align="right">操作人：</td>
						<td align="left"><input class="form-control"
							name="address" id="address" type="text"/></td>
					</tr>
					<tr>
						<td align="right">操作时间：</td>
						<td align="left">
						<input class="form-control"
							name="address" id="address" type="text"/>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center; padding-top: 25px;">
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