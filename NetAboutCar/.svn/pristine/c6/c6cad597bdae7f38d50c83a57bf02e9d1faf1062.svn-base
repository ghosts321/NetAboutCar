<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
 /* a:hover{color:white;text-decoration:none;}
 table{border-collapse:separate;} */
 /* table.gridtable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
} */
/* table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
} */
/* table.gridtable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}  */
</style>
<script type="text/javascript">
$(function() {
    $("#dataType").change(function(){
    	var dataType = $(this).children('option:selected').val();
    	$("#excel").attr("href","exportExcel.action?dataType="+dataType);
    	if("platform" == dataType){
    		$("#table_platform").show();
    		$("#table_vehicle").hide();
    		$("#table_pilot").hide();
    	}else if("vehicle" == dataType){
    		$("#table_platform").hide();
    		$("#table_vehicle").show();
    		$("#table_pilot").hide();
    	}else if("pilot" == dataType){
    		$("#table_platform").hide();
    		$("#table_vehicle").hide();
    		$("#table_pilot").show();
    	}
    });
});
$(function() {
	//日期控件
	$('.date-picker').datepicker();
    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
    $('#btn_query').click(function () {
    	$('#tradeList').bootstrapTable('refresh');
    });
});
function search(){
	alert("search");
}
</script>
</head>
<body>
	<div class="panel-body">
		<div class="page-header">
			<h1 style="font-size:15px;">
				统计分析
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					营运数据统计
				</small>
			</h1>
		</div>
		
		<!-- <table border='0' style="margin-top: 0px">
			<tbody>
				<tr>
					<td><p id="fontStyle">统计维度：</p></td>
					<td>
						<select id="dataType" placeholder="统计维度" style="width:100px">
               				<option value="platform">&nbsp;&nbsp;&nbsp;企业</option>
               				<option value="vehicle">&nbsp;&nbsp;&nbsp;车辆</option>
               				<option value="pilot">&nbsp;&nbsp;&nbsp;驾驶员</option>
                        </select>
					</td>
					<td><p id="fontStyle">查询条件：</p></td>
					<td>
						<span class="input-icon">
							<select name="areaType" placeholder="所属区域" style="width:120px">
	               				<option value="">&nbsp;&nbsp;&nbsp;所属区域</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;北京</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;上海</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;广州</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;深圳</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;河北</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;重庆</option>
	                        </select>
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="开始时间" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>-
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="结束时间" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
					<td style="vertical-align:top;" align="right"><a id='excel' class='btn btn-mini btn-info' href="exportExcel.action">导出excel</a></td>
				</tr>
			</tbody>
		</table> -->
		   <div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group"  style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="bespeak_date">统计维度</label>
                         <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                          <select id="dataType" placeholder="统计维度" style="width:100px">
               				<option value="platform">&nbsp;&nbsp;&nbsp;企业</option>
               				<option value="vehicle">&nbsp;&nbsp;&nbsp;车辆</option>
               				<option value="pilot">&nbsp;&nbsp;&nbsp;驾驶员</option>
                        </select>
                        </div>
                          
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="address">查询条件</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
                           <select name="areaType" placeholder="所属区域" style="width:120px">
	               				<option value="">&nbsp;&nbsp;&nbsp;所属区域</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;北京</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;上海</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;广州</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;深圳</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;河北</option>
	               				<option value="">&nbsp;&nbsp;&nbsp;重庆</option>
	                        </select>
                        </select>
                        </div>
                    <!--     <label class="control-label col-sm-1" style="font-weight: normal;">订单起止时间</label> -->
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px; width:390px">
							从<input type="text" class="date-picker" id="beginTime" placeholder="请选择开始时间" data-date-format="yyyy-mm-dd" onchange="changeDateValue();"/>
							至<input type="text" class="date-picker" id="endTime" placeholder="请选择结束时间" data-date-format="yyyy-mm-dd" onchange="changeDateValue1();"/>
                        </div>
                        
                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:10px" id="btn_query" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
		<table id="table_platform"  style="width:100%" class="table table-striped table-bordered table-hover">
			<thead>
			<tr align="center">
				<td class="center" style="width: 50px;">序号</td>
				<td class='center'>企业名称</td>
				<td class='center'>注册车辆数</td>
				<td class='center'>注册驾驶员数</td>
				<td class='center'>活跃车辆数</td>
				<td class='center'>计价标准</td>
				<td class='center'>订单数</td>
			</tr>
			</thead>
			<tr align="center">
				<td class="center">1</td>
				<td class="center">滴滴打车</td>
				<td class="center">3478</td>
				<td class="center">3478</td>
				<td class="center">3362</td>
				<td class="center">2.3元/公里</td>
				<td class="center">12482</td>
			</tr>
			<tr align="center">
				<td class="center">2</td>
				<td class="center">神州专车</td>
				<td class="center">5268</td>
				<td class="center">5268</td>
				<td class="center">4623</td>
				<td class="center">2.4元/公里</td>
				<td class="center">82482</td>
				
			</tr>
			<tr align="center">
				<td class="center">3</td>
				<td class="center">优步</td>
				<td class="center">4789</td>
				<td class="center">4789</td>
				<td class="center">4223</td>
				<td class="center">1.8元/公里</td>
				<td class="center">52482</td>
			</tr>
   		</table>
		<table id="table_vehicle" class="gridtable" style="width:100%;display: none;">
			<thead>
			<tr>
				<th class="center" style="width: 50px;">序号</th>
				<th class='center'>车牌号码</th>
				<th class='center'>订单数</th>
			</tr>
			</thead>
			<tr>
				<td class="center">1</td>
				<td class="center">沪KR9888</td>
				<td class="center">滴滴打车：482<br>优步：243</td>
			</tr>
			<tr>
				<td class="center">2</td>
				<td class="center">京AH8888</td>
				<td class="center">滴滴打车：482<br>神州专车：131<br>优步：243</td>
			</tr>
   		</table>
		<table id="table_pilot" class="gridtable" style="width:100%;display: none;">
			<thead>
			<tr>
				<th class="center" style="width: 50px;">序号</th>
				<th class='center'>驾驶员名称</th>
				<th class='center'>订单数</th>
			</tr>
			</thead>
			<tr>
				<td class="center">1</td>
				<td class="center">张凯杰</td>
				<td class="center">滴滴打车：482<br>优步：243</td>
			</tr>
			<tr>
				<td class="center">2</td>
				<td class="center">韦宇冰</td>
				<td class="center">滴滴打车：482<br>神州专车：131<br>优步：243</td>
			</tr>
   		</table>
	</div>
	
</body>
</html>