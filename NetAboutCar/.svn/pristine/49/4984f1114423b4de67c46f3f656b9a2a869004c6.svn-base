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
function showPhoto(photoPath){
	var iTop = (window.screen.availHeight - 30 - 650) / 2;
    //获得窗口的水平位置
    var iLeft = (window.screen.availWidth - 10 - 413) / 2; 
		win=window.open ('../echarts5.jsp','newWin', 'modal=yes, width=650,height=413,resizable=no, scrollbars=no,top=' + iTop + ',left=' + iLeft +' '); 
		if (win.location.href != "about:blank") {
			 win.focus();
		}
	
}
//证书作废
function operateCarPermitcert(){
	var reason = $('#reason').val();
	if(reason == ""){
		alert("请填写原因！");
	}else{
		$("#carInfoForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
}
</script>

</head>
<body>
<div class="container">
<form action="<%=basePath %>car/operateCarPermitcert.action" name="carInfoForm" id="carInfoForm" method="post" >
		<div id="zhongxin">
		<table border="1" class="table">
		    <tr>
		      <th colspan="4">基本信息</th>
		    </tr>
			<tr>
				<th style="text-align: right;width: 100px;">车辆编号：</th>
				<td style="width:200px;">${carInfo.carId}</td>
			    <th style="text-align: right;width: 100px;">车牌号：</th>
				<td style="width:200px;">${carInfo.carNum}</td>
			</tr>
			<tr>
				<th style="text-align: right;">身份证号码：</th>
				<td>${carInfo.certNo}</td>
			    <th style="text-align: right;">车牌颜色：</th>
				<td>${carInfo.carColor}</td>
			</tr>
			<tr>
				<th style="text-align: right;">车身颜色：</th>
				<td>${carInfo.bodyColor}</td>
			    <th style="text-align: right;">车主名称/公司名称：</th>
				<td>${carInfo.manCompany}</td>
			</tr>
			<tr>
				<th style="text-align: right;">联系地址：</th>
				<td>${carInfo.address}</td>
			    <th style="text-align: right;">联系电话：</th>
				<td>${carInfo.telNo}</td>
			</tr>
			<tr>
				<th style="text-align: right;">车辆类别：</th>
				<td>
			    	<c:choose>  
					    <c:when test="${carInfo.category=='1'}"> 
							     小型车
					    </c:when>  
					    <c:when test="${carInfo.category=='2'}"> 
							     中型车
					    </c:when>
					 </c:choose>
			    </td>
			    <th style="text-align: right;">车辆类型：</th>
				<td>
					<c:choose>  
					    <c:when test="${carInfo.carType=='1'}"> 
							     家庭轿车
					    </c:when>  
					    <c:when test="${carInfo.carType=='2'}"> 
							  SUV
					    </c:when>
					 </c:choose>	
				</td>
			</tr>
			<tr>
				<th style="text-align: right;">发动机号：</th>
				<td>${carInfo.engineNum}</td>
			    <th style="text-align: right;">车架号/VIN：</th>
				<td>${carInfo.chassisNum}</td>
			</tr>
			<tr>
				<th style="text-align: right;">厂牌：</th>
				<td>${carInfo.label}</td>
			    <th style="text-align: right;">型号：</th>
				<td>${carInfo.model}</td>
			</tr>
			<tr>
				<th style="text-align: right;">车长：</th>
				<td>${carInfo.length}</td>
			    <th style="text-align: right;">车宽：</th>
				<td>${carInfo.width}</td>
			</tr>
			
			<tr>
				<th style="text-align: right;">车高：</th>
				<td>${carInfo.height}</td>
			    <th style="text-align: right;">总质量：</th>
				<td>${carInfo.totalQuality}</td>
			</tr>
			<tr>
				<th style="text-align: right;">出厂日期：</th>
				<td>${carInfo.outDate}</td>
			    <th style="text-align: right;">购车时间：</th>
				<td>${carInfo.buyDate}</td>
			</tr>
			<tr>
				<th style="text-align: right;">经济类型：</th>
				<td>
					<c:choose>  
					    <c:when test="${carInfo.economyType=='1'}"> 
							     经济型
					    </c:when>  
					    <c:when test="${carInfo.economyType=='2'}"> 
							     舒适型
					    </c:when>
					    <c:when test="${carInfo.economyType=='3'}"> 
							     豪华型
					    </c:when>
					 </c:choose>
				</td>
			    <th style="text-align: right;">座位数：</th>
				<td>${carInfo.seatNum}</td>
			</tr>
			
			<tr>
				<th style="text-align: right;">可乘坐座位数：</th>
				<td>${carInfo.allowSeat}</td>
			    <th style="text-align: right;">车辆购买价格：</th>
				<td>${carInfo.purchasePrice}</td>
			</tr>
			
			<tr>
				<th style="text-align: right;">发证行政区划代码：</th>
				<td>${carInfo.areaCode}</td>
			    <th style="text-align: right;">发证基层交管部门：</th>
				<td>${carInfo.endDept}</td>
			</tr>
			
			<tr>
				<th style="text-align: right;">车辆登记证编码：</th>
				<td>${carInfo.regCode}</td>
			    <th style="text-align: right;">车辆登记时间：</th>
				<td>${carInfo.regDate}</td>
			</tr>
			
			<tr>
				<th style="text-align: right;">行驶证初领时间：</th>
				<td>${carInfo.receiveDate}</td>
			    <th style="text-align: right;">车辆状态：</th>
				<td>${carInfo.status}</td>
			</tr>
			<tr>
				<th style="text-align: right;">轴距：</th>
				<td>${carInfo.wheelBase}</td>
				<th style="text-align: right;"></th>
				<td></td>
			</tr>
			<tr>
		      <th colspan="4">申请信息</th>
		    </tr>
			<tr>
				<th style="text-align: right;">申请机构代码：</th>
				<td>${carPermitApply.instId}</td>
			    <th style="text-align: right;">申请时间：</th>
				<td>${carPermitApply.applyDate}</td>
			</tr>
			
			
			<tr>
				<th style="text-align: right;">车辆卫星定位装置信息：</th>
				<td>${carPermitApply.positionInfo}</td>
			    <th style="text-align: right;">应急报警装置信息：</th>
				<td>${carPermitApply.alarmInfo}</td>
			</tr>
			
			<tr>
				<th style="text-align: right;">车辆年检信息：</th>
				<td>${carPermitApply.inspectionInfo}</td>
			    <th style="text-align: right;">二级维护信息：</th>
				<td>${carPermitApply.maintainInfo}</td>
			</tr>
			
			<tr>
				<th style="text-align: right;">技术等级评定信息：</th>
				<td>${carPermitApply.gradeInfo}</td>
			    <th style="text-align: right;">车辆保险信息：</th>
				<td>${carPermitApply.dutyInfo}</td>
			</tr>
			<tr>
				<th style="text-align: right;">外勘资料：</th>
				<td>
					<c:choose>  
					    <c:when test="${carPermitApply.externalExploration==null}"> 
							    无
					    </c:when>  
					    <c:otherwise>
							<a href="${carPermitApply.externalExploration}">点击下载</a>
						</c:otherwise>	
					 </c:choose>
				</td>
			    <th style="text-align: right;">变更车辆性质文件：</th>
				<td>
					<c:choose>  
					    <c:when test="${carPermitApply.changeProperty==null}"> 
							    无
					    </c:when>  
					    <c:otherwise>
					    	<img class="imgStyle" src="${carPermitApply.changeProperty}">
						</c:otherwise>	
					 </c:choose>
				</td>
			</tr>
			
			<tr>
				<th style="text-align: right;">车辆照片：</th>
				<c:set value="${ fn:split(carPermitApply.carPhoto, ';') }" var="url" />
				<td>
				  <c:forEach items="${url}" var="s">
					<img src="${s}"/>
				  </c:forEach>
				</td>
			    <th style="text-align: right;">行驶证照片：</th>
				<c:set value="${ fn:split(carPermitApply.drivePhoto, ';') }" var="url" />
				<td>
				  <c:forEach items="${url}" var="s">
					<img src="${s}"/>
				  </c:forEach>
				</td>
			</tr>
			
			<tr>
			    <th style="text-align: right;" >备注：</th>
				<td colspan="3">${carPermitApply.remark}</td>
			</tr>
			<tr>
			    <th style="text-align: right;" >作废原因：</th>
			    <td colspan="3"><textarea style="width: 400px" cols="40" rows="2" name="reason" id="reason" ></textarea></td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center; padding-top: 5px;padding-bottom: 5px;">
					<input type="hidden" id="applyid" name="applyid" value="${carPermitApply.applyId}" />
					<input type="hidden" id="certno" name="certno" value="${carInfo.certNo}" />
					<input type="hidden" id="status" name="status" value="3" />
					<a class="btn btn-mini btn-primary" onclick="operateCarPermitcert();">作废</a>
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