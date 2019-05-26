<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.imgStyle{
	margin-bottom:0.5em;
	width: 220px;
	height: 150px;
 }
textarea{
 margin-bottom: 4px;
}
</style>
<script type="text/javascript">
$(function() {
	$.ajaxSettings.async = false; //设置getJson同步
	$.getJSON("<%=basePath %>static/js/minzu.json",function(datas){
		$.each(datas,function(index,msg){
			if("${drv.nation}" == msg.id){
				$("#nationTd").html(msg.name);
				return false;
			}
		});
	});
	$.ajaxSettings.async = true;//设置getJson异步
	
	var company = "";
	var companyList = "${drv.company}".split(",");
	for(var i = 0;i < companyList.length;i++){
		if(companyList[i] == 1){
			company += "滴滴出行，";
		}else if(companyList[i] == 2){
			company += "Uber中国，";
		}else if(companyList[i] == 3){
			company += "神州专车，";
		}else if(companyList[i] == 4){
			company += "首汽约车，";
		}else if(companyList[i] == 5){
			company += "易到";
		}
	}
	if("" != company && null != company){
		$("#companyTd").html(company.substr(0,company.length-1));
	}
	var certphotoImg = "";
	if("" != "${drv.certphoto}" && null != "${drv.certphoto}"){
		var certphoto = "${drv.certphoto}".split('#');
		for(var i = 0;i < certphoto.length;i++){
			certphotoImg += "<img class='imgStyle' src='"+certphoto[i]+"'>";
		}
	}
	$("#certphotoTd").html(certphotoImg);
	var drivecardphotoImg = "";
	if("" != "${drv.drivecardphoto}" && null != "${drv.drivecardphoto}"){
		drivecardphotoImg = "<img class='imgStyle' src='${drv.drivecardphoto}'>";
	}
	$("#drivecardphotoTd").html(drivecardphotoImg);
});
//证书作废
function operateDrvPermitcert(){
	var reason = $('#reason').val();
	if(reason == ""){
		$("#reason").tips({
			side:3,
            msg:'请填写原因！',
            bg:'#AE81FF',
            time:2
        });
		$("#reason").focus();
	}else{
		$("#form1").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
}
</script>

</head>
<body>
<div class="container">
<form action="<%=basePath %>pilotApply/operateDrvPermitcert.action" name="form1" id="form1" method="post" >
		<div id="zhongxin">
		<table border="1" class="table">
		    <tr>
		      <th colspan="4">驾驶员信息</th>
		    </tr>
			<tr>
				<th style="text-align: right;width: 100px;">姓名：</th>
				<td style="width:200px;">${drv.username}</td>
			    <th style="text-align: right;width: 100px;">性别：</th>
				<td style="width:200px;">
					<c:if test="${drv.sex==1}">男</c:if>
					<c:if test="${drv.sex==0}">女</c:if>
				</td>
			</tr>
			<tr>
				<th style="text-align: right;">区域编码：</th>
				<td>${drv.areacode}</td>
			    <th style="text-align: right;">民族：</th>
				<td id="nationTd">${drv.nation}</td>
			</tr>
			<tr>
				<th style="text-align: right;">政治背景：</th>
				<td>
					<c:if test="${drv.political==0}">群众</c:if>
					<c:if test="${drv.political==1}">团员</c:if>
					<c:if test="${drv.political==2}">党员</c:if>
				</td>
			    <th style="text-align: right;">身份证号：</th>
				<td>${drv.certno}</td>
			</tr>
			<tr>
				<th style="text-align: right;">学历：</th>
				<td>
					<c:if test="${drv.education==0}">初中</c:if>
					<c:if test="${drv.education==1}">高中</c:if>
					<c:if test="${drv.education==2}">中技</c:if>
					<c:if test="${drv.education==3}">中专</c:if>
					<c:if test="${drv.education==4}">大专</c:if>
					<c:if test="${drv.education==5}">本科</c:if>
					<c:if test="${drv.education==6}">硕士</c:if>
					<c:if test="${drv.education==7}">博士</c:if>
					<c:if test="${drv.education==8}">博士后</c:if>
					<c:if test="${drv.education==9}">教授</c:if>
				</td>
			    <th style="text-align: right;">户籍地址：</th>
				<td>${drv.censusaddr}</td>
			</tr>
			<tr>
				<th style="text-align: right;">驾驶证号：</th>
				<td>${drv.drivecardno}</td>
			    <th style="text-align: right;">驾驶证取证时间：</th>
				<td>${drv.carddate}</td>
			</tr>
			<tr>
				<th style="text-align: right;">驾驶证签发机构：</th>
				<td>${drv.carissuingagency}</td>
			    <th style="text-align: right;">驾驶证准驾车型：</th>
				<td>
					<c:if test="${drv.cardrivingtype==0}">小型车</c:if>
					<c:if test="${drv.cardrivingtype==1}">中型车</c:if>
					<c:if test="${drv.cardrivingtype==2}">大型车</c:if>
				</td>
			</tr>
			<tr>
				<th style="text-align: right;">驾龄：</th>
				<td>${drv.driveyears}</td>
			    <th style="text-align: right;">家庭地址：</th>
				<td>${drv.address}</td>
			</tr>
			<tr>
				<th style="text-align: right;">手机：</th>
				<td>${drv.telno}</td>
				<th style="text-align: right;">紧急联系人：</th>
				<td>${drv.contactname}</td>
			</tr>
			<tr>
				<th style="text-align: right;">紧急联系人工作单位：</th>
				<td>${drv.contactemployer}</td>
			    <th style="text-align: right;">紧急联系电话：</th>
				<td>${drv.contacttelno}</td>
			</tr>
			<tr>
				<th style="text-align: right;">家庭社会背景：</th>
				<td>${drv.familybg}</td>
			    <th style="text-align: right;">服务网约车平台公司：</th>
				<td id="companyTd"></td>
			</tr>
			<tr>
			    <th style="text-align: right;">合同ID：</th>
				<td>${drv.contractid}</td>
				<th style="text-align: right;">工作状态：</th>
				<td>${drv.workstatus}</td>
			</tr>
			<tr>
			    <th style="text-align: right;">创建时间：</th>
				<td>${drv.createdatetime}</td>
				<th style="text-align: right;">申请时间：</th>
				<td>${drv.applydate}</td>
			</tr>
			<tr>
			    <th style="text-align: right;">身份认证状态：</th>
				<td>
					<c:if test="${drv.checkstatus==null}">未认证</c:if>
					<c:if test="${drv.checkstatus==1}">已提交认证</c:if>
					<c:if test="${drv.checkstatus==2}">认证中</c:if>
					<c:if test="${drv.checkstatus==3}">认证未通过</c:if>
					<c:if test="${drv.checkstatus==4}">认证通过</c:if>
				</td>
				<th style="text-align: right;">记录内容：</th>
				<td>${drv.recordcont}</td>
			</tr>
			<tr>
				<th style="text-align: right;">备注：</th>
				<td colspan="3">${drv.remark}</td>
			</tr>
			<tr>
			    <th style="text-align: right;">个人照片(白底1寸)：</th>
				<td><img src="${drv.photo}"></td>
				<th style="text-align: right;">驾驶证照片：</th>
				<td id="drivecardphotoTd"></td>
			</tr>
			<tr>
				<th style="text-align: right;">身份证照片：</th>
				<td colspan="3" id="certphotoTd"></td>
			</tr>
			<tr>
		      <th colspan="4">考试信息</th>
		    </tr>
			<tr>
				<th style="text-align: right;">全国考试成绩：</th>
				<td>${drv.quanguo}</td>
			    <th style="text-align: right;">地区考试成绩：</th>
				<td>${drv.difang}</td>
			</tr>
			<tr>
			    <th style="text-align: right;" >作废原因：</th>
			    <td colspan="3"><textarea style="width: 400px" cols="40" rows="2" name="reason" id="reason" ></textarea></td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
					<input type="hidden" id="applyid" name="applyid" value="${drv.applyid}" />
					<input type="hidden" id="certno" name="certno" value="${drv.certno}" />
					<input type="hidden" id="status" name="status" value="3" />
					<a class="btn btn-mini btn-primary" onclick="operateDrvPermitcert();">作废</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
	<script language="javascript" src="jquery-1.4.2.min.js"></script>
</body>
</html>