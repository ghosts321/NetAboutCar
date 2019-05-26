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
$(function(){
	//日期控件
	$('.date-picker').datepicker();
});
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
	if($("#regionname").val()==""){
		$("#regionname").tips({
			side:3,
            msg:'请输入行政区划名称',
            bg:'#AE81FF',
            time:2
        });
		$("#regionname").focus();
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
	if($("#companyname").val()==""){
		$("#companyname").tips({
			side:3,
            msg:'请输入网约车公司名称',
            bg:'#AE81FF',
            time:2
        });
		$("#companyname").focus();
		return false;
	}
	if($("#begintime").val()==""){
		$("#begintime").tips({
			side:3,
            msg:'请选择监测开始时间',
            bg:'#AE81FF',
            time:2
        });
		$("#begintime").focus();
		return false;
	}
	if($("#endtime").val()==""){
		$("#endtime").tips({
			side:3,
            msg:'请选择监测结束时间',
            bg:'#AE81FF',
            time:2
        });
		$("#endtime").focus();
		return false;
	}
	
	$("#form").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}

$(function(){
	//日期控件
   	$('.date-picker').datepicker();
});

//日期校验
function changeDateValue(){
	var begin = $("#begintime").val();
	var end = $("#endtime").val();	
	
	var arr = begin.split("-");
    var begintm = new Date(arr[0], arr[1], arr[2]);
    var begintms = begintm.getTime();

    var arrs = end.split("-");
    var endtm = new Date(arrs[0], arrs[1], arrs[2]);
    var endtms = endtm.getTime();

    if(end == "" || begintms > endtms){ //开始时间大于结束时间时，设置结束时间的值为开始时间
		$("#endtime").val(begin);
	}
}
function changeDateValue1(){
	var begin = $("#begintime").val();
	var end = $("#endtime").val();	
	
	var arr = begin.split("-");
    var begintm = new Date(arr[0], arr[1], arr[2]);
    var begintms = begintm.getTime();

    var arrs = end.split("-");
    var endtm = new Date(arrs[0], arrs[1], arrs[2]);
    var endtms = endtm.getTime();

    if(begin == "" || begintms > endtms){ //开始时间大于结束时间时，设置结束时间的值为开始时间
		$("#begintime").val(end);
	}
}
</script>
</head>
<body>
	<div class="container">
		<form action="updateOperatingSet.action" method="post" name="form" id="form">
			<div id="zhongxin" align="center" style="padding-top: 30px">
			<input type="hidden" name="operating_time_id" value="${mngOperatingTimeSet.operating_time_id }"/>
			<input type="hidden" name="create_user" value="${mngOperatingTimeSet.create_user }"/>
			<input type="hidden" name="create_time" value="${mngOperatingTimeSet.create_time }"/>
		   	<table>
					<tr>
						<td align="right">行政区划代码：</td>
						<td align="left"><input class="form-control"
							name="region_code" id="regioncode" type="text" value="${mngOperatingTimeSet.region_code }"/></td>
					</tr>
					<tr>
						<td align="right">行政区划名称：</td>
						<td align="left"><input class="form-control"
							name="region_name" id="regionname" type="text" value="${mngOperatingTimeSet.region_name }" /></td>
					</tr>
					<tr>
						<td align="right">网约车公司标识：</td>
						<td align="left"><input class="form-control"
							name="company_id" id="companyid" type="text" value="${mngOperatingTimeSet.company_id }" />
						</td>
					</tr>
					<tr>
						<td align="right">网约车公司名称：</td>
						<td align="left"><input class="form-control"
							name="company_name" id="companyname" type="text" value="${mngOperatingTimeSet.company_name }" />
						</td>
					</tr>
					
					<tr>
						<td align="left">监测起止时间:</td>
                    	<td align="left">
							从<input class="date-picker" name="begin_time" id="begintime" type="text" data-date-format="yyyy-mm-dd" onchange="changeDateValue();" value="${mngOperatingTimeSet.begin_time }"/>
                    	</td>
                    </tr>
                    <tr>
                   	 	<td align="right"></td>
                    	<td align="left">
							至<input class="date-picker" name="end_time" id="endtime" type="text" data-date-format="yyyy-mm-dd" onchange="changeDateValue1();" value="${mngOperatingTimeSet.end_time }"/>
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