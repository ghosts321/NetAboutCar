<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
textarea{
 margin-bottom: 4px;
}
</style>
<script type="text/javascript">
 
//保存校验
function save(){
	var status = $("#result").val();
	if(status==-1){
		if($("#description").val()==""){
			$("#description").tips({
				side:3,
	            msg:'请输入审核意见',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#description").focus();
			return false;
		}
		$("#opinions").val("2");//不通过
	}else{
		$("#opinions").val("1");//通过
	}
	$("#appStatus").val(status);
	$("#carInfoForm").submit();
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
<form action="approve.action" name="carInfoForm" id="carInfoForm" method="post" >
		<div id="zhongxin">
		<div style="padding-top:30px;"></div>
		<div class="panel panel-default">
		<div class="panel-body">
		<span style="font-size:15px" class="title">基本信息</span>
		<table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
		    <tr>
				<th style="text-align: right;width: 20%">统一社会信用代码：</th>
				<td style="width:30%;">${platform.creditCode}</td>
			    <th style="text-align: right;width: 20%">企业名称：</th>
				<td style="width:30%">${platform.comName}</td>
			</tr>
			<tr>
				<th style="text-align: right;">企业简称：</th>
				<td>${platform.shortName}</td>
			    <th style="text-align: right;">网约车平台名称：</th>
				<td>${platform.platformName}</td>
			</tr>
			<tr>
				<th style="text-align: right;">企业营业执照号：</th>
				<td>${platform.busiliceNo}</td>
			    <th style="text-align: right;">注册地址：</th>
				<td>${platform.regAddress}</td>
			</tr>
			<tr>
				<th style="text-align: right;">经营地址：</th>
				<td>${platform.busiAddress}</td>
			    <th style="text-align: right;">通信地址：</th>
				<td>${platform.postAddress}</td>
			</tr>
			<tr>
				<th style="text-align: right;">邮编：</th>
				<td>${platform.areaCode}</td>
			    <th style="text-align: right;">联系电话：</th>
				<td>${platform.contactsTel}</td>
			</tr>
			<tr name="moreInfo">
				<th style="text-align: right;">法人代表姓名：</th>
				<td>${platform.corpName}</td>
			    <th style="text-align: right;">法人证件号码：</th>
				<td>${platform.corpcertNo}</td>
			</tr>
			<tr name="moreInfo">
				<th style="text-align: right;">法人电话：</th>
				<td>${platform.corpTelNo}</td>
			    <th style="text-align: right;">公司负责人：</th>
				<td>${platform.prinName}</td>
			</tr>
			<%-- <tr name="moreInfo">
				<th style="text-align: right;">负责人电话：</th>
				<td>${platform.printelNo}</td>
			</tr> --%>
		</table>
		</div>
		</div>
		<div style="padding-top:30px;"></div>
        <div class="panel panel-default">
        <div class="panel-body">
        <span style="font-size:15px" class="title">申请信息</span>
        <input type="hidden" name="applytype" value="${platformApply.applytype}"><!-- 申请类型 -->
		<table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
			<tr>
				<th style="text-align: right;width:20%;">企业申请编码：</th>
				<td style="width:30%;">${platformApply.applyId}</td>
			    <th style="text-align: right;width:20%;">统一社会信用代码：</th>
				<td style="width:30%;">${platformApply.creditCode}</td>
			</tr>
			<tr>
				<th style="text-align: right;">公司全名：</th>
				<td>${platformApply.applyCompany}</td>
			    <th style="text-align: right;">负责人姓名：</th>
				<td>${platformApply.dutyName}</td>
			</tr>
			<tr>
				<th style="text-align: right;">经办人姓名：</th>
				<td>${platformApply.handleName}</td>
			    <th style="text-align: right;">通信地址：</th>
				<td>${platformApply.address}</td>
			</tr>
			
			<tr>
				<th style="text-align: right;">邮编：</th>
				<td>${platformApply.zipCode}</td>
			    <th style="text-align: right;">电话：</th>
				<td>${platformApply.tel}</td>
			</tr>
			<tr>
				<th style="text-align: right;">手机：</th>
				<td>${platformApply.mobile}</td>
			    <th style="text-align: right;">电子邮箱：</th>
				<td>${platformApply.email}</td>
			</tr>
			<tr>
				<th style="text-align: right;">备注：</th>
				<td colspan="3">${platformApply.remark}</td>
			</tr>
		</table>
		</div>
		</div>
		
		<div style="padding-top:30px;"></div>
        <div class="panel panel-default">
        <div class="panel-body">
        <span style="font-size:15px" class="title">附件信息</span>
        <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
        	<tr>
        		<th style="text-align: right;width:20%;">附件：</th>
				<td colspan="3"><a href="${platformApply.annex}">点击下载</a></td>
        	</tr>
        </table>
		</div>
		</div>
		
		<div style="padding-top:30px;"></div>
        <div class="panel panel-default">
        <div class="panel-body">
        <span style="font-size:15px" class="title">认证信息</span>
        <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
        	<tr>
        		<th style="text-align: right;width:20%;">信息验证接口：</th>
				<th colspan="3"><a href='javascript:void(0)' id="yz" onclick='javascript:$("#tg").show();$("#yz").hide();'>验证</a>&nbsp;<span id="tg" style="display: none;"><font color="green">已通过</font></span></th>
        	</tr>
        </table>
		</div>
		</div>
		<c:if test="${not empty approve}">
			<div style="padding-top:30px;"></div>
			<div class="panel panel-default">
	            <div class="panel-body">
	            	<span style="font-size:15px" class="title">审核历史</span>
	                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
						<tr>
						    <th style="text-align: center;">序号</th>
							<th style="text-align: center;">审批人</th>
							<th style="text-align: center;">审批时间</th>
							<th style="text-align: center;">审批结果</th>
							<th style="text-align: center;">审批意见</th>
						</tr>
						<c:forEach var="approve" items="${approve}" varStatus="status">
							<tr>
								<td style="text-align: center;">${status.index+1}</td>
								<td style="text-align: center;">${approve.realname}</td>
								<td style="text-align: center;">
									<fmt:formatDate  value="${approve.apprdatetime}" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
								<td style="text-align: center;">
									<c:if test="${approve.opinions==1}">通过</c:if>
									<c:if test="${approve.opinions==2}">不通过</c:if>
								</td>
								<td style="text-align: center;">${approve.description}</td>
							</tr>
						</c:forEach>
						<tr>
						</tr>
					</table>
	            </div>
	        </div>
	    </c:if>
	    <c:if test="${not empty approve && platformApply.appStatus!=0}">
	        <div align="center"style="padding-top: 5px;padding-bottom: 5px;"><a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a></div>
		</c:if>
			<input type="hidden" id="applyId" name="applyId" value="${platformApply.applyId}">
			<input type="hidden" id="appStatus" name="appStatus" value="${platformApply.appStatus}">
			<input type="hidden" id="creditCode" name="creditCode" value="${platformApply.creditCode}">
			<input type="hidden" id="opinions" name="opinions" />
		<c:if test="${platformApply.appStatus==0}">
			<div style="padding-top:30px;"></div>
        	<div class="panel panel-default">
            <div class="panel-body">
            	<span style="font-size:15px" class="title">资料审核</span>
                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
			        <tr>
			            <th colspan="4">请在<font color='red'>附件</font>中仔细核对以下资料，资料完整请打钩</th>
			        </tr>
			        <tr>
					    <td colspan="4"> 
					    
						    <input type="checkbox" id="checkbox_a1" name="company" value="1" class="chk_1" /><label for="checkbox_a1">网络预约出租汽车经营申请表</label>
						    <input type="checkbox" id="checkbox_a2" name="company" value="1" class="chk_1" /><label for="checkbox_a2">投资人复印件</label>
							<input type="checkbox" id="checkbox_a3" name="company" value="1" class="chk_1" /><label for="checkbox_a3">负责人身份复印件</label>
							<input type="checkbox" id="checkbox_a4" name="company" value="1" class="chk_1" /><label for="checkbox_a4">资信证明复印件</label>
							<input type="checkbox" id="checkbox_a5" name="company" value="1" class="chk_1" /><label for="checkbox_a5">经办人的身份证明复印件</label>
					        
					        <input type="checkbox" id="checkbox_a6" name="company" value="1" class="chk_1" /><label for="checkbox_a6">经办人的委托书</label>
						    <input type="checkbox" id="checkbox_a7" name="company" value="1" class="chk_1" /><label for="checkbox_a7">企业法人营业执照</label>
							<input type="checkbox" id="checkbox_a8" name="company" value="1" class="chk_1" /><label for="checkbox_a8">属于分支机构的应当提供营业执照</label>
							<input type="checkbox" id="checkbox_a9" name="company" value="1" class="chk_1" /><label for="checkbox_a9">外商投资企业应提供外商投资企业批准证书</label>
							<input type="checkbox" id="checkbox_a10" name="company" value="1" class="chk_1" /><label for="checkbox_a10">具备互联网平台和信息数据交互及处理能力的证明材料</label>
					        
					        <input type="checkbox" id="checkbox_a11" name="company" value="1" class="chk_1" /><label for="checkbox_a11">具备供相关监管部门依法调取查询相关网络数据信息条件的证明材料</label>
							<input type="checkbox" id="checkbox_a12" name="company" value="1" class="chk_1" /><label for="checkbox_a12">数据库接入情况说明</label>
							<input type="checkbox" id="checkbox_a13" name="company" value="1" class="chk_1" /><label for="checkbox_a13">服务器设置在中国内地的情况说明</label>
					        <input type="checkbox" id="checkbox_a14" name="company" value="1" class="chk_1" /><label for="checkbox_a14">网络安全管理制度文本</label>
							<input type="checkbox" id="checkbox_a15" name="company" value="1" class="chk_1" /><label for="checkbox_a15">安全保护技术措施文本</label>
							
							<input type="checkbox" id="checkbox_a16" name="company" value="1" class="chk_1" /><label for="checkbox_a16">提供支付结算服务的银行或者非银行支付机构签订的协议范本</label>
					        <input type="checkbox" id="checkbox_a17" name="company" value="1" class="chk_1" /><label for="checkbox_a17">服务所在地办公场所、管理人员等信息</label>
							<input type="checkbox" id="checkbox_a18" name="company" value="1" class="chk_1" /><label for="checkbox_a18">经营管理制度文本</label>
							<input type="checkbox" id="checkbox_a19" name="company" value="1" class="chk_1" /><label for="checkbox_a19">安全生产管理制度文本</label>
					        <input type="checkbox" id="checkbox_a20" name="company" value="1" class="chk_1" /><label for="checkbox_a20">服务质量保障制度文本</label>
							
							<input type="checkbox" id="checkbox_a21" name="company" value="1" class="chk_1" /><label for="checkbox_a21">法律法规要求提供的其他材料</label>
					    </td>
					</tr>
				</table>
				</div>
				</div>
				
				<div style="padding-top:30px;"></div>
        		<div class="panel panel-default">
            	<div class="panel-body">
            	<span style="font-size:15px" class="title">审核意见</span>
                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
					<tr>
					    <th style="text-align: right;" >审核结果：</th>
					    <td colspan="3">
					    	<select style="width: 200px" id="result" name="result">
					    		<option value='1'>通过</option>
					    		<option value='-1'>不通过</option>
					  		</select>
					    </td>
					</tr>
					<tr>
					    <th style="text-align: right;">审核意见：</th>
					    <td colspan="3"><textarea style="width: 400px;height:50px" cols="40" rows="5" name="description" id="description" ></textarea></td>
					</tr>
				</table>
				</div>
				</div>
				
				<div style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
					<button type="button" class="btn btn-mini btn-primary" onclick="save();">提交</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</div>
				
			</c:if>
			
			<c:if test="${ platformApply.appStatus==3}">
				<div style="padding-top:30px;"></div>
        		<div class="panel panel-default">
            	<div class="panel-body">
            	<span style="font-size:15px" class="title">注销说明</span>
                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
					<tr>
					    <th style="text-align: right;" >审核结果：</th>
					    <td colspan="3">
					    	<select style="width: 200px" id="result" name="result">
					    		<option value='1'>通过</option>
					    		<option value='-1'>不通过</option>
					  		</select>
					    </td>
					</tr>
					<tr>
					    <th style="text-align: right;">审核意见：</th>
					    <td colspan="3"><textarea style="width: 400px;height:50px" cols="40" rows="5" name="description" id="description" ></textarea></td>
					</tr>
				</table>
				</div>
				</div>
				<div style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
					<button type="button" class="btn btn-mini btn-primary" onclick="save();">提交</button>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</div>
			</c:if>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="<%=basePath%>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
</body>
</html>