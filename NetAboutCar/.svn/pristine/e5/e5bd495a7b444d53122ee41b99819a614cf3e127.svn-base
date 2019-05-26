<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
function CreatePrintPage(sendYear,sendMonth,sendDay,instname,mancompandy,address,carnum,cartype,seatnum,langth,width,heigth,businessrange) {
LODOP.NewPage();
LODOP.PRINT_INITA(-25,10,800,871,"");
<%-- LODOP.ADD_PRINT_SETUP_BKIMG("<%=basePath%>cert/4.png"); --%>
LODOP.SET_SHOW_MODE("BKIMG_WIDTH","200.03mm");
LODOP.SET_SHOW_MODE("BKIMG_HEIGHT","245mm");
LODOP.ADD_PRINT_TEXT(294,265,305,76,mancompandy);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",17);
LODOP.ADD_PRINT_TEXT(386,262,307,73,address);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
LODOP.ADD_PRINT_TEXT(470,268,300,35,carnum);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
LODOP.ADD_PRINT_TEXT(511,269,293,42,"车辆类型");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",17);
LODOP.ADD_PRINT_TEXT(561,270,126,31,seatnum);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
LODOP.ADD_PRINT_TEXT(608,297,46,30,langth);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",14);
LODOP.ADD_PRINT_TEXT(653,303,40,28,width);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",13);
LODOP.ADD_PRINT_TEXT(699,299,45,27,heigth);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",14);
LODOP.ADD_PRINT_TEXT(741,257,195,30,businessrange);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",16);
LODOP.ADD_PRINT_TEXT(790,556,110,29,instname);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",14);
LODOP.ADD_PRINT_TEXT(829,364,62,29,sendYear);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",16);
LODOP.ADD_PRINT_TEXT(831,466,35,26,sendMonth);
LODOP.SET_PRINT_STYLEA(0,"FontSize",16);
LODOP.ADD_PRINT_TEXT(830,532,45,30,sendDay);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",16);
LODOP.NewPage();
<%-- LODOP.ADD_PRINT_SETUP_BKIMG("<%=basePath%>cert/5.png"); --%>
LODOP.SET_SHOW_MODE("BKIMG_WIDTH","200.03mm");
LODOP.SET_SHOW_MODE("BKIMG_HEIGHT","288.93mm");
LODOP.ADD_PRINT_TEXT(776,325,57,38,langth);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",26);
LODOP.ADD_PRINT_TEXT(344,438,74,51,"字");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",28);
LODOP.ADD_PRINT_TEXT(417,270,348,41,mancompandy);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",25);
LODOP.ADD_PRINT_TEXT(527,274,344,42,address);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",29);
LODOP.ADD_PRINT_TEXT(624,269,353,42,carnum);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",22);
LODOP.ADD_PRINT_TEXT(682,271,345,36,"车辆类型");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",19);
LODOP.ADD_PRINT_TEXT(725,273,338,36,seatnum);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",21);
LODOP.ADD_PRINT_TEXT(822,350,44,41,width);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",23);
LODOP.ADD_PRINT_TEXT(879,344,56,36,heigth);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",22);
LODOP.NewPage();
<%-- LODOP.ADD_PRINT_SETUP_BKIMG("<%=basePath%>cert/6.png"); --%>
LODOP.SET_SHOW_MODE("BKIMG_WIDTH","200.03mm");
LODOP.SET_SHOW_MODE("BKIMG_HEIGHT","249.24mm");
LODOP.ADD_PRINT_TEXT(149,165,536,206,"经营范围");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",16);
LODOP.ADD_PRINT_TEXT(413,168,530,201,"备注");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",16);
LODOP.ADD_PRINT_TEXT(704,408,105,35,instname);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
LODOP.ADD_PRINT_TEXT(803,374,66,25,sendYear);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",19);
LODOP.ADD_PRINT_TEXT(803,505,45,27,sendMonth);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",19);
LODOP.ADD_PRINT_TEXT(802,606,49,32,sendDay);
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",19);
LODOP.NewPage();
<%-- LODOP.ADD_PRINT_SETUP_BKIMG("<%=basePath%>cert/7.png"); --%>
LODOP.SET_SHOW_MODE("BKIMG_WIDTH","200.03mm");
LODOP.SET_SHOW_MODE("BKIMG_HEIGHT","249.24mm");
LODOP.ADD_PRINT_TEXT(429,97,63,30,"2017");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",19);
LODOP.ADD_PRINT_TEXT(433,210,36,25,"3");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",19);
LODOP.ADD_PRINT_TEXT(430,282,36,35,"15");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",19);
LODOP.ADD_PRINT_TEXT(431,378,61,30,"2017");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",19);
LODOP.ADD_PRINT_TEXT(428,491,38,33,"3");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",19);
LODOP.ADD_PRINT_TEXT(427,560,38,34,"15");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",19);
LODOP.ADD_PRINT_TEXT(786,45,62,32,"2017");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",19);
LODOP.ADD_PRINT_TEXT(784,156,37,33,"5");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",19);
LODOP.ADD_PRINT_TEXT(784,224,47,31,"10");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",19);
LODOP.ADD_PRINT_TEXT(786,380,62,31,"2017");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",19);
LODOP.ADD_PRINT_TEXT(787,488,36,30,"2");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",19);
LODOP.ADD_PRINT_TEXT(787,565,41,30,"14");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",19);
LODOP.NewPage();
<%-- LODOP.ADD_PRINT_SETUP_BKIMG("<%=basePath%>cert/8.png"); --%>
LODOP.SET_SHOW_MODE("BKIMG_WIDTH","125.41mm");
LODOP.SET_SHOW_MODE("BKIMG_HEIGHT","160.07mm");
LODOP.SET_SHOW_MODE("BKIMG_IN_PREVIEW",true);
LODOP.ADD_PRINT_TEXT(95,111,339,73,"违章和计分记录1");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",14);
LODOP.ADD_PRINT_TEXT(177,113,335,78,"违章和计分记录2");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",14);
LODOP.ADD_PRINT_TEXT(262,112,335,80,"违章和计分记录3");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",14);
LODOP.ADD_PRINT_TEXT(348,114,336,74,"违章和计分记录4");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",14);
LODOP.ADD_PRINT_TEXT(431,114,332,69,"违章和计分记录5");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",14);
LODOP.ADD_PRINT_TEXT(511,114,338,79,"违章和计分记录6");
LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
LODOP.SET_PRINT_STYLEA(0,"FontSize",14);
};    
</script>
</head>
<%-- <body style="padding:10px;">
	 <input type="hidden" value="${filename }"/>
	 <div id="printData" style="text-align:center;" >
	 	<img width=800px height=600px src="<%=basePath %>static/images/${filename }">
	 </div>
	 <div class="noprint" align="center"><button onclick="printImg()" value="打印">打印</button></div>
</body> --%>
进入<a href="javascript:;" onclick="javascript:CreatePrintPage('${sendYear}','${sendMonth}','${sendDay}','${instname}','${mancompandy}','${address}','${carnum}','${cartype}','${seatnum}','${langth}','${width}','${heigth}','${businessrange }');LODOP.PRINT_DESIGN();">模板设计</a><br><br>
进入<a href="javascript:;" onclick="javascript:CreatePrintPage('${sendYear}','${sendMonth}','${sendDay}','${instname}','${mancompandy}','${address}','${carnum}','${cartype}','${seatnum}','${langth}','${width}','${heigth}','${businessrange }');LODOP.PREVIEW();">模板的打印预览</a>
</html>