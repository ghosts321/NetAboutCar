<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
table{
	table-layout:fixed;
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
}
.table tr.alter{
background-color:#f5fafe;
}
img{
margin-bottom:0.5em;
width: 220px;
height: 150px;
}
</style>
<script type="text/javascript">

//保存校验
function save(){
	$("#driverwzwfAddDetermine").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}
function showPhoto(photoPath){
	var iTop = (window.screen.availHeight - 30 - 650) / 2;
    //获得窗口的水平位置
    var iLeft = (window.screen.availWidth - 10 - 413) / 2; 
		win=window.open ('../echarts5.jsp','newWin', 'modal=yes, width=650,height=413,resizable=no, scrollbars=no,top=' + iTop + ',left=' + iLeft +' '); 
		if (win.location.href != "about:blank") {
			 win.focus();
		}
	
}
</script>

</head>
<body>
<div class="container">
<form action="driverwzwfAddDetermine.action" name="driverwzwfAddDetermine" id="driverwzwfAddDetermine" method="post" >
		<div id="zhongxin">
		<table border="1" class="table">
		<input type="hidden" value="${drvIllegalInfo.name}"  id="name">
		    <tr>
		      <th colspan="4">违规行为详细信息</th>
		    </tr>
			<tr>
				<th style="text-align: right;width: 80px;">姓名：</th>
				<td style=" text-align: left;width:220px;">${drvIllegalInfo.name}</td>
			    <th style="text-align: right;width: 80px;">身份证号：</th>
				<td style="text-align: left; width:220px;">${drvIllegalInfo.certno}</td>
			</tr>
			<tr>
				<th style="text-align: right;">所属平台：</th>
				<td style="text-align: left;">${drvIllegalInfo.company_name}</td>
			    <th style="text-align: right;">车牌号：</th>
				<td style="text-align: left;">${drvIllegalInfo.car_num}</td>
			</tr>
			<tr>
				<th style="text-align: right;">违规地点：</th>
				<td style="text-align: left;">${drvIllegalInfo.illegal_address}</td>
			    <th style="text-align: right;">违章时间：</th>
				<td style="text-align: left;">${drvIllegalInfo.illegal_time}</td>
			</tr>
			<tr>
				<th style="text-align: right;">违规行为：</th>
				<td colspan="3" style="text-align: left;">
				${drvIllegalInfo.illegal_content}
			    </td>
			</tr>
			<tr>
			
						<th colspan="4" style="text-align: center">
					<input type="hidden" id="drv_illegal_id" name="drv_illegal_id" value="${drvIllegalInfo.drv_illegal_id}" />
					<input type="hidden" id="status" name="status" value="2" />
							<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
						</th>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
	<script language="javascript" src="jquery-1.4.2.min.js"></script>
</body>
</html>