<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String basePath2 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <script src='http://localhost:8000/CLodopfuncs.js?name=CLODOPA'></script> -->
<script type="text/javascript" language="javascript" src="../Lodop/LodopFuncs.js"></script>
<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
<embed id="LODOP_EM" type="application/x-print-lodop" width="0" height="0" pluginspage="../Lodop/install_lodop32.exe"/>
</object>
<style type="text/css" media=print>
.Noprint{display : none }
</style>
<script type="text/javascript">
/* function printImg(){
	var printData = document.getElementById("printData").innerHTML;
	document.body.innerHTML = printData; 
	window.print();  
	top.Dialog.close();
} */
var LODOP = getLodop();
function CreatePrintPage(username,sex,birthday,censusaddr,address,drivecardno,cardrivingtype,carddateYear,carddateMonth,carddateDay) {

	
	 LODOP.NewPage();
	<%--   LODOP.ADD_PRINT_SETUP_BKIMG("<%=basePath%>cert/9.png"); --%>
	  LODOP.SET_SHOW_MODE("BKIMG_WIDTH","125.94mm");
	  LODOP.SET_SHOW_MODE("BKIMG_HEIGHT","158.75mm");
	  LODOP.SET_SHOW_MODE("BKIMG_IN_PREVIEW",true);
	  LODOP.ADD_PRINT_TEXT(53,140,114,35,username);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
	  LODOP.ADD_PRINT_TEXT(58,334,100,30,sex);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
	  LODOP.ADD_PRINT_TEXT(102,144,111,35,birthday);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
	  LODOP.ADD_PRINT_TEXT(103,359,79,30,censusaddr);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",14);
	  LODOP.ADD_PRINT_TEXT(146,150,297,31,address);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
	  LODOP.ADD_PRINT_TEXT(188,150,295,35,drivecardno);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
	  LODOP.ADD_PRINT_TEXT(239,151,295,26,cardrivingtype);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
	  LODOP.ADD_PRINT_TEXT(292,278,34,20,carddateYear);
	  LODOP.ADD_PRINT_TEXT(291,323,24,20,carddateMonth);
	  LODOP.ADD_PRINT_TEXT(288,356,25,20,carddateDay);
	  LODOP.ADD_PRINT_TEXT(360,281,33,20,carddateYear);
	  LODOP.ADD_PRINT_TEXT(360,324,24,20,carddateMonth);
	  LODOP.ADD_PRINT_TEXT(357,355,22,20,carddateDay);
	  LODOP.ADD_PRINT_TEXT(430,142,305,154,"二维码区");
	  LODOP.NewPage();
	 <%--  LODOP.ADD_PRINT_SETUP_BKIMG("<%=basePath%>cert/10.png"); --%>
	  LODOP.SET_SHOW_MODE("BKIMG_WIDTH","119.86mm");
	  LODOP.SET_SHOW_MODE("BKIMG_HEIGHT","151.08mm");
	  LODOP.ADD_PRINT_TEXT(106,91,136,25,"名称");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",14);
	  LODOP.ADD_PRINT_TEXT(167,92,131,30,"地址");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",14);
	  LODOP.ADD_PRINT_TEXT(103,290,130,30,"名称");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",13);
	  LODOP.ADD_PRINT_TEXT(165,297,126,29,"地址");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
	  LODOP.ADD_PRINT_TEXT(228,93,100,26,"电话");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
	  LODOP.ADD_PRINT_TEXT(225,291,100,27,"电话");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",16);
	  LODOP.ADD_PRINT_TEXT(258,132,95,25,"报备日期");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",12);
	  LODOP.ADD_PRINT_TEXT(257,330,92,26,"报备日期");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",14);
	  LODOP.ADD_PRINT_TEXT(336,89,135,30,"名称");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
	  LODOP.ADD_PRINT_TEXT(401,89,134,28,"地址");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
	  LODOP.ADD_PRINT_TEXT(336,291,139,32,"名称");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
	  LODOP.ADD_PRINT_TEXT(400,288,140,25,"地址");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
	  LODOP.ADD_PRINT_TEXT(456,93,130,30,"电话");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
	  LODOP.ADD_PRINT_TEXT(457,291,137,25,"电话");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",14);
	  LODOP.ADD_PRINT_TEXT(493,133,85,25,"报备日期");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",13);
	  LODOP.ADD_PRINT_TEXT(489,331,95,26,"报备日期");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",13);
	  }
</script>
</head>
<%-- <body style="padding:10px;">
	 <input type="hidden" value="${filename }"/>
	 <div id="printData" style="text-align:center;" >
	 	<img width=800px height=600px src="<%=basePath %>static/images/${filename }">
	 </div>
	 <div class="noprint" align="center"><button onclick="printImg()" value="打印">打印</button></div>
</body> --%>

进入<a href="javascript:;" onclick="javascript:CreatePrintPage('${username}','${sex}','${birthday}','${censusaddr}','${address}','${drivecardno}','${cardrivingtype}','${carddateYear}','${carddateMonth}','${carddateDay}');LODOP.PRINT_DESIGN();">模板设计</a><br><br>
进入<a href="javascript:;" onclick="javascript:CreatePrintPage();LODOP.PREVIEW();">模板的打印预览</a>
进入<a href="javascript:;" onclick="javascript:CreatePrintPage();LODOP.PRINT();">模板的直接打印</a>
</html>