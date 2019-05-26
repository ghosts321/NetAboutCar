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
//保存
function save(){
	if($("#indic_code").val()==""){
		$("#indic_code").tips({
			side:3,
            msg:'请输入细则编码',
            bg:'#AE81FF',
            time:2
        });
		$("#indic_code").focus();
		return false;
	}
	if($("#indic_text").val()==""){
		$("#indic_text").tips({
			side:3,
            msg:'请输入细则名称',
            bg:'#AE81FF',
            time:2
        });
		$("#indic_text").focus();
		return false;
	}
	if($("#score").val()==""){
		$("#score").tips({
			side:3,
            msg:'请输入分值',
            bg:'#AE81FF',
            time:2
        });
		$("#score").focus();
		return false;
	}
	
	$("#form").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}
$(function(){
	var category = "${category}";
	var type = "${type}";
	var type_code = "${indic.type_code}";
	$("#form").attr("action","addIndic.action?type="+type+"&category="+category);
	$.getJSON('getTypeName.action',{category:category},function(data){
		$.each(data,function(i,d){
			if(d.type_code == type_code){
				var option = "<option value='"+d.type_code+"'selected>"+d.type_name+"</option>";
			}else{
				var option = "<option value='"+d.type_code+"'>"+d.type_name+"</option>";
			}
			$("#type_name").append(option);
		})
	})
});

</script>
</head>
<body>
	<div class="container">
		<form action="" method="post" name="form" id="form">
			<div id="zhongxin" align="center" style="padding-top: 30px">
		   	<table>
					<tr>
						<td align="right">细则编码：</td>
						<td align="left"><input class="form-control"
							name="indic_code" id="indic_code" type="text" value="${indic.indic_code }"<c:if test="${type=='update'}">readonly</c:if>></td>
					</tr>
					<tr>
						<td align="right">细则名称：</td>
						<td align="left"><input class="form-control"
							name="indic_text" id="indic_text" type="text" value="${indic.indic_text }"/></td>
					</tr>
					<tr>
						<td align="right">指标名称：</td>
						<td align="left">
							<select class="form-control" name="type_code" id="type_name"></select>
						</td>
					</tr>
					<tr>
						<td align="right">分值：</td>
						<td align="left"><input class="form-control"
							name="score" id="score" type="text" value="${indic.score }"></input>
						</td>
					</tr>
					<tr>
						<td align="right">状态：</td>
						<td align="left">
							<select class="form-control" name="indic_status">
					    		<option value="1" <c:if test="${indic.indic_status=='1'}">selected</c:if>>启用</option>
					    		<option value="0" <c:if test="${indic.indic_status=='0'}">selected</c:if>>禁用</option>
					    	</select>
						</td>
					</tr>
					<tr>
						<td align="right">描述：</td>
						<td align="left"><input class="form-control"
							name="indic_desc" id="indic_desc" type="text" value="${indic.indic_desc }"></input>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center; padding-top: 20px;">
							<a class='btn btn-mini btn-primary' onclick='save()'>保存</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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