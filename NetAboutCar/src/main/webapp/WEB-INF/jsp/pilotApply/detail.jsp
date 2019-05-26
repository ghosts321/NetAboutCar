<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
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
padding:0 0.5em 0;
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
	
	$("tr[name='moreInfo']").css("display","none");
	
});

//驾驶员身份验证（修改驾驶员申请表验证状态为1）
function validateDrv(){
	var applyid = $('#applyid').val();
	$.ajax({
		type: "POST",
		url: '<%=basePath %>pilotApply/validateDrv.action',
    	data: {applyid:applyid},
		dataType:'json',
		success: function(data){
			$("#checkresult").html("已提交认证");
		}
	});
}
//处理身份审核结果（通过、不通过）
function sendValidate(){
	var status = $("#result").val();
	$("#status").val(status);
	var description = $("#description").val();
	if(status == 1 && description == ""){
		$("#description").tips({
			side:3,
            msg:'请填写审核意见！',
            bg:'#AE81FF',
            time:2
        });
		$("#description").focus();
	}else{
		if(description == ""){
			$("#description").val("身份验证已通过");
		}else{
			if(status == 1){
				$("#description").val("身份验证审核不通过，原因："+description);
			}
		}
		$("#form1").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
}
//处理考试审核结果（通过、不通过）
function examValidate(){
	var status = $("#result").val();
	$("#status").val(status);
	var description = $("#description").val();
	if(status == 3 && description == ""){
		$("#description").tips({
			side:3,
            msg:'请填写审核意见！',
            bg:'#AE81FF',
            time:2
        });
		$("#description").focus();
	}else{
		if(description == ""){
			$("#description").val("考试审核已通过");
		}else{
			if(status == 3){
				$("#description").val("考试审核不通过，原因："+description);
			}
		}
		$("#form1").attr("action","<%=basePath %>pilotApply/examValidate.action");
		$("#form1").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
}
//处理窗口审核结果（通过、不通过）
function windowValidate(){
	var status = $("#result").val();
	$("#status").val(status);
	var description = $("#description").val();
	if($("#archivenum").val()==""){
		$("#archivenum").tips({
			side:3,
            msg:'请输入档案编号',
            bg:'#AE81FF',
            time:2
        });
		$("#archivenum").focus();
		return false;
	}
	if($("#archivename").val()==""){
		$("#archivename").tips({
			side:3,
            msg:'请输入档案名称',
            bg:'#AE81FF',
            time:2
        });
		$("#archivename").focus();
		return false;
	}
	if(status == 5 && description == ""){
		$("#description").tips({
			side:3,
            msg:'请填写审核意见！',
            bg:'#AE81FF',
            time:2
        });
		$("#description").focus();
	}else{
		if(description == ""){
			$("#description").val("窗口办理验证已通过");
		}else{
			if(status == 5){
				$("#description").val("窗口办理验证不通过，原因："+description);
			}
		}
		$("#form1").attr("action","<%=basePath %>pilotApply/windowValidate.action");
		$("#form1").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
}
//处理变更审核结果（通过、不通过）
function changeValidate(){
	var status = $("#result").val();
	$("#status").val(status);
	var description = $("#description").val();
	if(status == 1 && description == ""){
		$("#description").tips({
			side:3,
            msg:'请填写审核意见！',
            bg:'#AE81FF',
            time:2
        });
		$("#description").focus();
	}else{
		if(description == ""){
			$("#description").val("变更申请审核已通过");
		}else{
			if(status == 1){
				$("#description").val("变更申请审核不通过，原因："+description);
			}
		}
		$("#form1").attr("action","<%=basePath %>pilotApply/changeValidate.action");
		$("#form1").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
}
//注销申请审核
function cancelValidate(status){
	$("#status").val(status);
	var description = $("#description").val();
	if(status == 1 && description == ""){
		$("#description").tips({
			side:3,
            msg:'请填写审核意见！',
            bg:'#AE81FF',
            time:2
        });
		$("#description").focus();
	}else{
		if(description == ""){
			$("#description").val("注销申请已通过");
		}else{
			if(status == 1){
				$("#description").val("注销申请审核不通过，原因："+description);
			}
		}
		$("#form1").attr("action","<%=basePath %>pilotApply/cancelValidate.action");
		$("#form1").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
}
function showMore(obj){
	$("tr[name='moreInfo']").css("display","");
	$(obj).html("收起..");
	$(obj).attr("onclick","showLess(this);");
}
function showLess(obj){
	$("tr[name='moreInfo']").css("display","none");
	$(obj).html("更多..");
	$(obj).attr("onclick","showMore(this);");
}
function imageView(type){
	if(type == 1){
		top.Dialog.open({
	        InnerHtml: "<img width='120' height='140' src='${drv.photo}'>",
	        Title:"个人照片",
	        Width:200,
	        Height:150
	    });
	}else if(type == 2){
		var imgHtml = "";
		if("" != "${drv.certphoto}" && null != "${drv.certphoto}"){
			var certphoto = "${drv.certphoto}".split('#');
			for(var i = 0;i < certphoto.length;i++){
				imgHtml += "<img style='margin-bottom:0.5em;width: 350px;height:200px;' src='"+certphoto[i]+"'><br>";
			}
		}
		top.Dialog.open({
	        InnerHtml: imgHtml,
	        Title:"身份证照片",
	        Width:350,
	        Height:410
	    });
	}else if(type == 3){
		if("" != "${drv.drivecardphoto}" && null != "${drv.drivecardphoto}"){
			top.Dialog.open({
		        InnerHtml: "<img style='margin-bottom:0.5em;width: 350px;height:200px;' src='${drv.drivecardphoto}'>",
		        Title:"驾驶证照片",
		        Width:360,
		        Height:210
		    });
		}
	}
}

</script>

</head>
<body>
<div class="container">
<form action="<%=basePath %>pilotApply/authentication.action" name="form1" id="form1" method="post" >
		<div id="zhongxin">
		<div style="padding-top:30px;"></div>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span style="font-size:15px" class="title">基本信息</span>
            		<div style="text-align: right;"><a style="cursor:pointer;text-align: right;" onclick="showMore(this);">更多..</a></div>
	                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
						<tr>
							<th style="text-align: right;width:20%;">姓名：</th>
							<td style="width:30%;">${drv.username}</td>
						    <th style="text-align: right;width:20%;">性别：</th>
							<td style="width:30%;">
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
						    <th style="text-align: right;">户籍所在地：</th>
							<td>${drv.censusaddr}</td>
						</tr>
						<tr name="moreInfo">
							<th style="text-align: right;">现在住址：</th>
							<td>${drv.address}</td>
							<th style="text-align: right;">手机：</th>
							<td>${drv.telno}</td>
						</tr>
						<tr name="moreInfo">
							<th style="text-align: right;">紧急联系人：</th>
							<td>${drv.contactname}</td>
						    <th style="text-align: right;">紧急联系电话：</th>
							<td>${drv.contacttelno}</td>
						</tr>
						<tr name="moreInfo">
							<th style="text-align: right;">居住证：</th>
							<td>${drv.residencepermit}</td>
						    <th style="text-align: right;">车辆档案号：</th>
							<td>${drv.filenumber}</td>
						</tr>
						<tr name="moreInfo">
							<th style="text-align: right;">驾驶证号：</th>
							<td>${drv.drivecardno}</td>
						    <th style="text-align: right;">驾驶证取证时间：</th>
							<td>${drv.carddate}</td>
						</tr>
						<tr name="moreInfo">
							<th style="text-align: right;">发证机关：</th>
							<td>${drv.carissuingagency}</td>
						    <th style="text-align: right;">驾驶证准驾车型：</th>
							<td>
								<c:if test="${drv.cardrivingtype==0}">小型车</c:if>
								<c:if test="${drv.cardrivingtype==1}">中型车</c:if>
								<c:if test="${drv.cardrivingtype==2}">大型车</c:if>
							</td>
						</tr>
						<tr name="moreInfo">
							<th style="text-align: right;">创建时间：</th>
							<td>${drv.createdatetime}</td>
							<th style="text-align: right;">申请时间：</th>
							<td>${drv.applydate}</td>
						</tr>
						<tr name="moreInfo">
							
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
					</table>
            </div>
        </div>
        <div style="padding-top:30px;"></div>
        <div class="panel panel-default">
            <div class="panel-body">
            	<span style="font-size:15px" class="title">申请资料</span>
				<table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
					<tr>
					    <th style="text-align: center;">序号</th>
						<th style="text-align: center;">资料名称</th>
						<th style="text-align: center;">操作</th>
					</tr>
					<tr>
						<td style="text-align: center;">1</td>
						<td style="text-align: center;">个人照片（白底一寸）</td>
						<td style="text-align: center;"><a style="cursor:pointer;" onclick="imageView(1);" >查看</a></td>
					</tr>
					<tr>
						<td style="text-align: center;">2</td>
						<td style="text-align: center;">身份证照片</td>
						<td style="text-align: center;"><a style="cursor:pointer;" onclick="imageView(2);">查看</a></td>
					</tr>
					<tr>
						<td style="text-align: center;">3</td>
						<td style="text-align: center;">驾驶证照片</td>
						<td style="text-align: center;"><a style="cursor:pointer;" onclick="imageView(3);">查看</a></td>
					</tr>
				</table>
            </div>
        </div>
        
        <c:if test="${drv.applytype==1}">
        	<div style="padding-top:30px;"></div>
	        <div class="panel panel-default">
	            <div class="panel-body">
	            	<span style="font-size:15px" class="title">身份认证</span>
	                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
						<tr>
							<th style="text-align: right;width:20%;">身份认证结果：</th>
							<td colspan="3" id="checkresult">
								<c:if test="${drv.checkstatus==null}">未认证</c:if>
								<c:if test="${drv.checkstatus==1}">已提交认证</c:if>
								<c:if test="${drv.checkstatus==2}">认证中</c:if>
								<c:if test="${drv.checkstatus==3}">认证未通过</c:if>
								<c:if test="${drv.checkstatus==4}">认证通过</c:if>
								<c:if test="${null == drv.checkstatus}">
			                		<span id="validateButton" style="float:right;">
			                			<button type='button' class='btn btn-mini btn-danger' onclick='validateDrv()'>身份验证</button>
			                		</span>
							    </c:if>
							</td>
						</tr>
					</table>
	            </div>
	        </div>
	        
	        <c:choose>
				<c:when test="${drv.appstatus==2  || drv.appstatus==3 || drv.appstatus==4}">
					<div style="padding-top:30px;"></div>
			        <div class="panel panel-default">
			            <div class="panel-body">
			            	<span style="font-size:15px" class="title">考试信息</span>
			                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
			                	<tr>
									<th style="text-align: right;width:20%;">全国考试成绩：</th>
									<td>${drv.quanguo}</td>
								    <th style="text-align: right;width:20%;">地区考试成绩：</th>
									<td>${drv.difang}</td>
								</tr>
			                </table>
			            </div>
			        </div>
				</c:when>
			</c:choose>
        </c:if>
		
		<c:if test="${not empty drv.approveList}">
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
						<c:forEach var="approve" items="${drv.approveList}" varStatus="status">
							<tr>
								<td style="text-align: center;">${status.index+1}</td>
								<td style="text-align: center;">${approve.username}</td>
								<td style="text-align: center;">
									<fmt:formatDate  value="${approve.apprdatetime}" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
								<td style="text-align: center;">
									<c:if test="${approve.opinions==1}">不通过</c:if>
									<c:if test="${approve.opinions==2}">通过</c:if>
								</td>
								<td style="text-align: center;">${approve.description}</td>
							</tr>
					    </c:forEach>
					</table>
	            </div>
	        </div>
		</c:if>
		
		<c:if test="${drv.applytype==1}">
			<c:choose>
				<c:when test="${drv.appstatus==4 || drv.appstatus==5}">
					<div style="padding-top:30px;"></div>
			        <div class="panel panel-default">
			            <div class="panel-body">
			            	<span style="font-size:15px" class="title">档案信息</span>
			                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
			                	<tr>
								    <th style="text-align: right;" >档案编码：</th>
								    <td><input type="text" id="archivenum" name="archivenum" value="" class="form-control" /></td>
								    <th style="text-align: right;" >档案名称：</th>
								    <td><input type="text" id="archivename" name="archivename" value="" class="form-control" /></td>
								</tr>
			                </table>
	                	</div>
			        </div>
				</c:when>
			</c:choose>
			
			<div style="padding-top:30px;"></div>
	        <div class="panel panel-default">
	            <div class="panel-body">
	            	<c:choose>
						<c:when test="${drv.appstatus==0}">
							<span style="font-size:15px" class="title">身份审核</span>
			                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
		                		<tr>
								    <th style="text-align: right;" >审核结果：</th>
								    <td colspan="3">
								    	<select style="width: 200px" id="result" name="result">
								    		<option value='2'>通过</option>
								    		<option value='1'>不通过</option>
								  		</select>
								    </td>
								</tr>
								<tr>
								    <th style="text-align: right;" >审核意见：</th>
								    <td colspan="3"><textarea style="width: 400px;height:50px" cols="40" rows="5" name="description" id="description"></textarea></td>
								</tr>
								<tr>
									<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
										<button type="button" class="btn btn-mini btn-primary" onclick="sendValidate();">提交</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
									</td>
								</tr>
			                </table>
						</c:when>
						<c:when test="${drv.appstatus==2 || drv.appstatus==3}">
							<span style="font-size:15px" class="title">考试审核</span>
			                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
			                	<tr>
								    <th style="text-align: right;" >审核结果：</th>
								    <td colspan="3">
								    	<select style="width: 200px" id="result" name="result">
								    		<option value='4'>通过</option>
								    		<option value='3'>不通过</option>
								  		</select>
								    </td>
								</tr>
								<tr>
								    <th style="text-align: right;" >审核意见：</th>
								    <td colspan="3"><textarea style="width: 400px;height:50px" cols="40" rows="5" name="description" id="description"></textarea></td>
								</tr>
								<tr>
									<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
										<button type="button" class="btn btn-mini btn-primary" onclick="examValidate();">提交</button>&nbsp;&nbsp;&nbsp;
										<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
									</td>
								</tr>
			                </table>
						</c:when>
						<c:when test="${drv.appstatus==4 || drv.appstatus==5}">
			            	<span style="font-size:15px" class="title">窗口审核</span>
			                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
								<tr>
								    <th style="text-align: right;" >审核结果：</th>
								    <td colspan="3">
								    	<select style="width: 200px" id="result" name="result">
								    		<option value='6'>通过</option>
								    		<option value='5'>不通过</option>
								  		</select>
								    </td>
								</tr>
								<tr>
								    <th style="text-align: right;" >审核意见：</th>
								    <td colspan="3"><textarea style="width: 400px;height:50px" cols="40" rows="5" name="description" id="description"></textarea></td>
								</tr>
								<tr>
									<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
										<button type="button" class="btn btn-mini btn-primary" onclick="windowValidate();">提交</button>&nbsp;&nbsp;&nbsp;
										<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
									</td>
								</tr>
			                </table>
						</c:when>
						<c:when test="${drv.zhuxiao==0}">
							<span style="font-size:15px" class="title">注销信息</span>
			                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
			                	<tr>
								    <th style="text-align: right;" >审核意见：</th>
								    <td colspan="3"><textarea style="width: 400px;height:50px" cols="40" rows="5" name="description" id="description"></textarea></td>
								</tr>
								<tr>
									<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
										<button type="button" class="btn btn-mini btn-primary" onclick="cancelValidate(2);">通过</button>
										<button type="button" class="btn btn-mini btn-primary" onclick="cancelValidate(1);">不通过</button>
										<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
									</td>
								</tr>
			                </table>
						</c:when>
						<c:otherwise>
							<span style="font-size:15px" class="title">考试信息</span>
			                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
		                		<tr>
									<th style="text-align: right;width:20%;">全国考试成绩：</th>
									<td>${drv.quanguo}</td>
								    <th style="text-align: right;width:20%;">地区考试成绩：</th>
									<td>${drv.difang}</td>
								</tr>
								<tr>
									<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
										<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
									</td>
								</tr>
			                </table>
						</c:otherwise>	
					</c:choose>
	            </div>
	        </div>
		</c:if>
		<c:if test="${drv.applytype==2}">
			<c:choose>
				<c:when test="${drv.appstatus==0}">
					<div style="padding-top:30px;"></div>
			        <div class="panel panel-default">
			            <div class="panel-body">
							<span style="font-size:15px" class="title">变更审核</span>
			                <table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
		                		<tr>
								    <th style="text-align: right;" >审核结果：</th>
								    <td colspan="3">
								    	<select style="width: 200px" id="result" name="result">
								    		<option value='2'>通过</option>
								    		<option value='1'>不通过</option>
								  		</select>
								    </td>
								</tr>
								<tr>
								    <th style="text-align: right;" >审核意见：</th>
								    <td colspan="3"><textarea style="width: 400px;height:50px" cols="40" rows="5" name="description" id="description"></textarea></td>
								</tr>
								<tr>
									<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
										<button type="button" class="btn btn-mini btn-primary" onclick="changeValidate();">提交</button>&nbsp;&nbsp;&nbsp;
										<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
									</td>
								</tr>
			                </table>
	                	</div>
               		</div>
				</c:when>
				<c:otherwise>
	                <table width="100%" border="0" cellpadding="5" cellspacing="2">
						<tr>
							<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
								<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
							</td>
						</tr>
	                </table>
				</c:otherwise>
			 </c:choose>
		</c:if>
		
		<table width="100%" border="1" cellpadding="5" cellspacing="2" class="table">
			<tr style="display:none;">
				<td>
					<input type="hidden" id="applyid" name="applyid" value="${drv.applyid}" />
					<input type="hidden" id="certno" name="certno" value="${drv.certno}" />
					<input type="hidden" id="examresult" name="examresult" value="${drv.quanguo}/${drv.difang}" />
					<input type="hidden" id="status" name="status" value="" />
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="<%=basePath %>static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
	<script language="javascript" src="jquery-1.4.2.min.js"></script>
</body>
</html>