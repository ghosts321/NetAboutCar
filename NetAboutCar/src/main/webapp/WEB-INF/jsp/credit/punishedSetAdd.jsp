<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(function(){
	//日期控件
	$('.date-picker').datepicker();
});
function save(){
	if($("#pun_text").val()==""){
		$("#pun_text").tips({
			side:3,
            msg:'请输入处分名称',
            bg:'#AE81FF',
            time:2
        });
		$("#pun_text").focus();
		return false;
	}
	if($("#pun_desc").val()==""){
		$("#pun_desc").tips({
			side:3,
            msg:'请输入处分描述',
            bg:'#AE81FF',
            time:2
        });
		$("#pun_desc").focus();
		return false;
	}
	var r = /^[0-9]*[1-9][0-9]*$/ ;
	var min_score = $('#min_score').val();
	if(min_score == "" || !r.test(min_score)){
		$("#min_score").tips({
			side:3,
            msg:'阈值下限不能为空且必须为正整数！',
            bg:'#AE81FF',
            time:2
        });
		$("#min_score").focus();
		return false;
	}
	var max_score = $('#max_score').val();
	if(max_score == "" || !r.test(max_score)){
		$("#max_score").tips({
			side:3,
            msg:'阈值上限不能为空且必须为正整数！',
            bg:'#AE81FF',
            time:2
        });
		$("#max_score").focus();
		return false;
	}
	if($("#valid_date").val()==""){
		$("#valid_date").tips({
			side:3,
            msg:'请输入生效日期',
            bg:'#AE81FF',
            time:2
        });
		$("#valid_date").focus();
		return false;
	}
	if($("#invalid_date").val()==""){
		$("#invalid_date").tips({
			side:3,
            msg:'请选择失效日期',
            bg:'#AE81FF',
            time:2
        });
		$("#invalid_date").focus();
		return false;
	}
	if($("#invalid_date").val()<=$("#valid_date").val()){
		$("#invalid_date").tips({
			side:3,
            msg:'失效日期不能大于生效日期',
            bg:'#AE81FF',
            time:2
        });
		$("#invalid_date").focus();
		return false;
	}
	$("#punishedSetForm").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}

</script>
</head>
<body>
<div class="container">
<form action="<%=basePath%>credit/addPunishedSet.action" name="punishedSetForm" id="punishedSetForm" method="post" >
		<div id="zhongxin" align="center" style="padding-top:50px">
		<table>
			<tr>
				<td style="text-align: right;">处分名称：</td>
				<td><input type="text" name="pun_text" id="pun_text" value="" title="处分名称"/></td>
			</tr>
			<tr>
			    <td style="text-align: right;">处分描述：</td>
				<td><input type="text" name="pun_desc" id="pun_desc" value="" title="处分描述"/></td>
			</tr>
			<tr>
			    <td style="text-align: right;">阀值下限：</td>
				<td><input type="text" name="min_score" id="min_score" value="" title="阀值下限"/></td>
			</tr>
			<tr>
			    <td style="text-align: right;">阀值上限：</td>
				<td><input type="text" name="max_score" id="max_score" value="" title="阀值上限"/></td>
			</tr>
			<tr>
			    <td style="text-align: right;">生效日期：</td>
				<td>
					<input class="date-picker" name="valid_date" id="valid_date" type="text"
							data-date-format="yyyy-mm-dd" readonly="readonly"
							placeholder="请选择日期"/>
				</td>
			</tr>
			<tr>
			    <td style="text-align: right;">失效日期：</td>
			    <td>
			    	<input class="date-picker" name="invalid_date" id="invalid_date" type="text"
							data-date-format="yyyy-mm-dd" readonly="readonly"
							placeholder="请选择日期"/>
		    	</td>
			</tr>
			<tr>
			    <td style="text-align: right;">有效性：</td>
				<td>
					 <select class="form-control" name="available" id="available">
						<option value="1">有效</option>
						<option value="0">无效</option>
					</select>				
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center; padding-top: 20px;">
					<input type="hidden" name="pun_type" id="pun_type"  value="${pun_type}"/>
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>&nbsp;&nbsp;
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
</body>
</html>