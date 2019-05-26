<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
function check(){
	var category = "${category}";
	var upperCode = $("#upper_type_code").val();
	if(upperCode != ''){
		$.post('checkUpperCode.action',{upperCode:upperCode,category:category},function(data){
			if(data == 'no'){
				$("#upper_type_code").tips({
					side:3,
		            msg:'上级指标代码不存在，请重新输入',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#upper_type_code").focus();
				$("#upper_type_code").select();
				$('.btn-save').hide();
			}else if(data == 'error'){
				$("#upper_type_code").tips({
					side:3,
		            msg:'验证失败，请重新输入上级指标代码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#upper_type_code").focus();
				$("#upper_type_code").select();
				$('.btn-save').hide();
			}else{
				$('.btn-save').show();
				
			}
		});
		return false;
	}
}
//保存
function save(){
	if($("#type_code").val()==""){
		$("#type_code").tips({
			side:3,
            msg:'请输入指标编码',
            bg:'#AE81FF',
            time:2
        });
		$("#type_code").focus();
		return false;
	}
	if($("#type_name").val()==""){
		$("#type_name").tips({
			side:3,
            msg:'请输入指标名称',
            bg:'#AE81FF',
            time:2
        });
		$("#type_name").focus();
		return false;
	}
	if($("#type_desc").val()==""){
		$("#type_desc").tips({
			side:3,
            msg:'请输入指标描述',
            bg:'#AE81FF',
            time:2
        });
		$("#type_desc").focus();
		return false;
	}
	
	$("#form").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();		
}
$(function(){
	var category = "${category}";
	var type = "${type}";
	$("#form").attr("action","addIndicType.action?type="+type+"&category="+category);
})

</script>
</head>
<body>
	<div class="container">
		<form action="" method="post" name="form" id="form">
			<div id="zhongxin" align="center" style="padding-top: 30px">
		   	<table>
					<tr>
						<td align="right">指标编码：</td>
						<td align="left"><input class="form-control"
							name="type_code" id="type_code" type="text" value="${indicType.type_code }"<c:if test="${type=='update'}">readonly</c:if>></td>
					</tr>
					<tr>
						<td align="right">指标名称：</td>
						<td align="left"><input class="form-control"
							name="type_name" id="type_name" type="text" value="${indicType.type_name }"/></td>
					</tr>
					<tr>
						<td align="right">指标级别：</td>
						<td align="left"><input class="form-control"
							name="type_level" id="type_level" type="text" value="${indicType.type_level }"/></td>
					</tr>
					<tr>
						<td align="right">上级指标编码：</td>
						<td align="left"><input class="form-control"
							name="upper_type_code" id="upper_type_code" type="text" value="${indicType.upper_type_code }" onblur="check()"/></td>
					</tr>
					<tr>
						<td align="right">指标描述：</td>
						<td align="left"><input class="form-control"
							name="type_desc" id="type_desc" type="text" value="${indicType.type_desc }"></input>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" style="text-align: center; padding-top: 20px;">
							<a class='btn btn-mini btn-primary btn-save' onclick='save()'>保存</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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