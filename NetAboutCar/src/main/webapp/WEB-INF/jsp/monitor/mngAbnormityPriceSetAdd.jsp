<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	if($("#regioncode").val()==""){
		$("#regioncode").tips({
			side:3,
            msg:'请输入行政区划代码',
            bg:'#AE81FF',
            time:2
        });
		$("#regioncode").focus();
		return false;
	}
	if($("#faretype").val()==""){
		$("#faretype").tips({
			side:3,
            msg:'请输入运价类型编号',
            bg:'#AE81FF',
            time:2
        });
		$("#faretype").focus();
		return false;
	}
	if($("#companyid").val()==""){
		$("#companyid").tips({
			side:3,
            msg:'请输入网约车公司标识',
            bg:'#AE81FF',
            time:2
        });
		$("#companyid").focus();
		return false;
	}
	if($("#pricestandard").val()==""){
		$("#pricestandard").tips({
			side:3,
            msg:'请输入运价标准值',
            bg:'#AE81FF',
            time:2
        });
		$("#pricestandard").focus();
		return false;
	}
	
	$("#form").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}
</script>
</head>
<body>
	<div class="container">
		<form action="addPriceSet.action" method="post" name="form" id="form">
			<div id="zhongxin" align="center" style="padding-top: 30px">
		   	<table>
					<tr>
						<td align="right">行政区划代码：</td>
						<td align="left"><input class="form-control"
							name="region_code" id="regioncode" type="text" /></td>
					</tr>
					<tr>
						<td align="right">运价类型编号：</td>
						<td align="left"><input class="form-control"
							name="fare_type" id="faretype" type="text" /></td>
					</tr>
					<tr>
						<td align="right">网约车公司标识：</td>
						<td align="left"><input class="form-control"
							name="company_id" id="companyid" type="text" ></input>
						</td>
					</tr>
					<tr>
						<td align="right">运价标准值：</td>
						<td align="left"><input class="form-control"
							name="price_standard" id="pricestandard" type="text" />
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