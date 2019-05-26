<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String basePath2 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <script src='http://localhost:8000/CLodopfuncs.js?name=CLODOPA'></script> -->
<script type="text/javascript" language="javascript" src="../Lodop/LodopFuncs.js"></script>
<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
<embed id="LODOP_EM" type="application/x-print-lodop" width="0" height="0" pluginspage="../Lodop/install_lodop32.exe"/>
</object>
<title>Insert title here</title>
</head>
<script language="javascript" type="text/javascript">
var LODOP = getLodop();
  function CreatePrintPage(businessrange,businessarea,comname,instname,sendYear,sendMonth,sendDay,endYear,endMonth,endDay,regaddress,businesstime,economic) {

	
	 LODOP.NewPage();
	  LODOP.PRINT_INITA(9,33,921,595,"打印控件功能演示_Lodop功能_装载背景图");
	  LODOP.SET_PRINT_PAGESIZE(2,0,0,"A4");
	<%--   LODOP.ADD_PRINT_SETUP_BKIMG("<%=basePath %>cert/1.png"); --%>
	  LODOP.SET_SAVE_MODE("CenterVertically",true);//设置成居中显示
	  LODOP.SET_PRINT_PAGESIZE(2,0,0,"A4");//设置打印页面属性：2：表示横向打印，0：定义纸张宽度，为0表示无效设置，A4：设置纸张为A4
	  LODOP.SET_SHOW_MODE("BKIMG_WIDTH","259.56mm");
	  LODOP.SET_SHOW_MODE("BKIMG_HEIGHT","169.86mm");
	  LODOP.SET_SHOW_MODE("BKIMG_IN_PREVIEW",true);
	  LODOP.ADD_PRINT_TEXT(320,289,130,30,comname);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",17);
	  LODOP.SET_PRINT_STYLEA(0,"AlignJustify",1);
	  LODOP.ADD_PRINT_TEXT(362,290,121,30,businessrange);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",17);
	  LODOP.ADD_PRINT_TEXT(268,605,30,28,"字");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",13);
	  LODOP.ADD_PRINT_TEXT(267,668,35,24,"号");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",13);
	  LODOP.ADD_PRINT_TEXT(412,250,180,31,regaddress);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
	  LODOP.ADD_PRINT_TEXT(516,230,45,26,sendYear);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",12);
	  LODOP.ADD_PRINT_TEXT(516,298,25,26,sendMonth);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",13);
	  LODOP.ADD_PRINT_TEXT(516,349,30,26,sendDay);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",13);
	  LODOP.ADD_PRINT_TEXT(516,419,41,26,endYear);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",12);
	  LODOP.SET_PRINT_STYLEA(0,"Vorient",2);
	  LODOP.ADD_PRINT_TEXT(516,479,27,26,endMonth);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",13);
	  LODOP.SET_PRINT_STYLEA(0,"Horient",2);
	  LODOP.ADD_PRINT_TEXT(515,536,26,25,endDay);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",12);
	  LODOP.ADD_PRINT_TEXT(514,612,47,26,sendYear);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",13);
	  LODOP.ADD_PRINT_TEXT(517,687,23,28,sendMonth);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",13);
	  LODOP.ADD_PRINT_TEXT(517,738,22,25,sendDay);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",14);
	  LODOP.ADD_PRINT_TEXT(466,722,99,27,instname);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
	  LODOP.NewPage();
	  LODOP.SET_PRINT_PAGESIZE(1,0,0,"A4");
	  LODOP.SET_SHOW_MODE("BKIMG_WIDTH","161.66mm");
	  LODOP.SET_SHOW_MODE("BKIMG_HEIGHT","199.23mm");
	  LODOP.SET_SHOW_MODE("BKIMG_IN_PREVIEW",true);
<%-- 	  LODOP.ADD_PRINT_SETUP_BKIMG("<%=basePath %>cert/2.png"); --%>
	  LODOP.ADD_PRINT_TEXT(409,259,62,31,"副字");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",19);
	  LODOP.ADD_PRINT_TEXT(405,395,69,30,"副号");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",19);
	  LODOP.ADD_PRINT_TEXT(468,251,57,32,"2018");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",16);
	  LODOP.ADD_PRINT_TEXT(467,339,26,30,"3");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",17);
	  LODOP.ADD_PRINT_TEXT(466,407,38,35,"14");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
	  LODOP.ADD_PRINT_TEXT(569,455,120,33,instname);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",14);
	  LODOP.ADD_PRINT_TEXT(630,282,51,26,"2017");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",14);
	  LODOP.ADD_PRINT_TEXT(630,367,24,23,"3");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
	  LODOP.ADD_PRINT_TEXT(630,430,31,23,"14");
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
	  LODOP.NewPage();
	<%--   LODOP.ADD_PRINT_SETUP_BKIMG("<%=basePath%>cert/3.png"); --%>
	  LODOP.SET_SHOW_MODE("BKIMG_WIDTH","200.03mm");
	  LODOP.SET_SHOW_MODE("BKIMG_HEIGHT","229.13mm");
	  LODOP.ADD_PRINT_TEXT(160,266,349,70,instname);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",19);
	  LODOP.ADD_PRINT_TEXT(257,272,342,91,regaddress);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",17);
	  LODOP.ADD_PRINT_TEXT(381,281,334,54,businessrange);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
	  LODOP.ADD_PRINT_TEXT(446,282,331,51,economic);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",19);
	  LODOP.ADD_PRINT_TEXT(516,283,330,51,businessarea);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",18);
	  LODOP.ADD_PRINT_TEXT(583,283,331,57,businesstime);
	  LODOP.SET_PRINT_STYLEA(0,"FontName","黑体");
	  LODOP.SET_PRINT_STYLEA(0,"FontSize",17);


  };    
</script> 
</body>
进入<a href="javascript:;" onclick="javascript:CreatePrintPage('${businessrange}','${businessarea }','${comname }','${instname}','${sendYear}','${sendMonth}','${sendDay}','${endYear}','${endMonth}','${endDay } ','${regaddress }','${businesstime }','${economic }');LODOP.PRINT_DESIGN();">模板设计</a><br><br>
进入<a href="javascript:;" onclick="javascript:CreatePrintPage('${businessrange}','${businessarea }','${comname }','${instname}','${sendYear}','${sendMonth}','${sendDay}','${endYear}','${endMonth}','${endDay } ','${regaddress }');LODOP.PREVIEW();">模板的打印预览</a>
进入<a href="javascript:;" onclick="javascript:CreatePrintPage('${businessrange}','${businessarea }','${comname }','${instname}','${sendYear}','${sendMonth}','${sendDay}','${endYear}','${endMonth}','${endDay } ','${regaddress }');LODOP.PRINT();">模板的直接打印</a>
</html>