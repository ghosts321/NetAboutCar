<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> 	
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
网约车资质申办系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<style type="text/css">

.STYLE1 {color: #FFFFFF;font-family:'Microsoft YaHei';font-size: 14px}
.STYLE2 {color: #FFFFFF;font-family:'Microsoft YaHei';font-size: 22px}

body{margin:0px;padding:0px;}
a{color: #FFFFFF;transition:0.5s;text-decoration:none;}
a:hover{color:yellow}


</style>
</head>
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="#004080">
    <td height="25" align="right"></td>
    <td align="left"></td>
    <td width="59%" align="right"></td>
    <td width="8%" align="right">&nbsp;</td>
  </tr>
  <tr bgcolor="#0D419D">
    <td width="13%" height="64" align="right" valign="middle"><img src="images/uzf.png" width="80" height="80" /></td>
    <td width="20%" height="100" valign="top"><span class="STYLE2"><br>网约车资质申办系统</span>
    <span class="STYLE1"><a href="http://www.122.gov.cn" target="blank"></a></td>
    <td align="right">&nbsp;</td>
	<td align="right">&nbsp;</td>
  </tr>
</table>
    <span style="font-family:'Microsoft YaHei';font-size: 16px;margin-left:120px;">请从地图中选择您要访问的互联网服务管理平台</span></center>
	<div id="main" style="height:450px"></div>
	<span id="wrong-message" style="color:red"> </span>
	<script src="js/echarts.js"></script>
	<script type="text/javascript">
        // 路径配置
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/map' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main')); 
                
               option = {
				    tooltip : {
				        trigger: 'item',
				        formatter: '{b}'
				    },
				    series : [
				        {
				            name: '中国',
				            type: 'map',
				            mapType: 'china',
				            selectedMode : 'multiple',
				            itemStyle:{
				                normal:{
									label:{
								    show:true,
									textStyle:{color: '#DCE7FC' }},
									areaStyle:{color:'#114EC9'},
									fontStyle:{color:'white'}
									},
				                emphasis:{label:{show:true}}
				            },
				            data:[
				                
				            ]
				        }
				    ]
				};
				var ecConfig = require('echarts/config');
				myChart.on(ecConfig.EVENT.MAP_SELECTED, function (param){
				    var selected = param.selected;
				    for (var p in selected) {
				        if (selected[p]) {
				        	var val=encodeURI(p);
				           //$.post(<%=request.getContextPath()%>/+"system/toDefault.action?areaName="+p);
				        	window.location.href="<%=basePath%>system/toDefault.action?areaName="+val;
				        }
				    }
				     
				})
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
        );
    </script>
</body>
</body>
</html>