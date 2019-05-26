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
/*  a:hover{color:white;text-decoration:none;} */
/*  table{border-collapse:separate;} */
</style>
<script type="text/javascript">
function search(){
	alert("search");
}
$(function(){
	//日期控件
	$('.date-picker').datepicker();
	 //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
    $('#search').click(function () {  
    	$('#tradeList').bootstrapTable('refresh');
    });
});
function del(){
	alert("删除信息");
}
function addSurvey(){
	//window.open("getPilotApply.action","newwindow","height=500,width=400,toolbar=no,scrollbars=no");
	$('#add').modal();
}
function editSurvey(){
	$('#edit').modal();
}

</script>
</head>
<body>
	<div class="panel-body">
		<div class="page-header">
			<h1 style="font-size:15px;">
				现场勘探
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					勘察信息查询
				</small>
			</h1>
		</div>
		
	<%-- 	<table border='0' style="margin-top: 0px">
			<tbody>
				<tr>
					<td><p id="fontStyle">根据条件查询：</p></td>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="姓名" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="手机号" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					
					<td style="vertical-align:top;"> 
					 	<select class="chzn-select" name="STATUS" id="STATUS" data-placeholder="状态" style="vertical-align:top;width: 79px;">
						<option value=""></option>
						<option value="">全部</option>
						<option value="1" <c:if test="${pd.STATUS == '1' }">selected</c:if> >正常</option>
						<option value="0" <c:if test="${pd.STATUS == '0' }">selected</c:if> >冻结</option>
						</select>
					</td>
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
				</tr>
			</tbody>
		</table> --%>
				<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">勘察人员</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" id="userName" name="userName" value="" class="form-control" />
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">车牌号</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" id="certNo" name="Username" value="" class="form-control" />
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">时间</label>
                        <div class="col-sm-1">
                          	<input type="text" class="date-picker" id="bespeak_date" data-date-format="yyyy-mm-dd"/>
                        </div>
                        <div class="col-sm-3" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
         <div align="right"> 
			    	<button  type="button" class="btn btn-default" onclick='addSurvey()'>
		                <span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>新增
		            </button>
		            <button id="btn_add" type="button" class="btn btn-default" onclick="del();">
		                <span class="glyphicon glyphicon-remove" aria-hidden="true" ></span>删除
		            </button>
		   		</div>
		<table id="tradeList" class="table table-striped table-bordered table-hover">
			<thead>
				<tr align="center"  style="height:420">
					<td class="center"  style="width: 50px;"><b>序号</b></td>
					<td class='center'><b>所属平台</b></td>
					<td class='center'><b>车牌号</b></td>
					<td class='center'><b>车主</b></td>
					<td class='center'><b>勘察时间</b></td>
					<td class='center'><b>勘察人员</b></td>
					<td class='center'><b>操作</b></td>
				</tr>
			</thead>
			<tr align="center"  style="height:420">
				<td class="center">1</td>
				<td class="center">所属平台1</td>
				<td class="center">京AF3952</td>
				<td class='center'>测试用户1</td>
				<td class='center'>2017-3-8</td>
				<td class='center'>勘察人员1</td>
				
				<td class="center">
					<!-- <button type="button" class='btn btn-mini btn-info''>处理</button> -->
					<button type='button' class='btn btn-default' ><span  ></span>审批</button>
					<button type='button' class='btn btn-default'  onclick='editSurvey()'><span class='glyphicon glyphicon-edit' aria-hidden='true'></span>修改</button>
					<button type='button' class='btn btn-default' onclick='print()'  ><span class='glyphicon glyphicon-duplicate' aria-hidden='true' ></span>打印</button>
				<button type='button' class='btn btn-default' onclick='print()'  >情况下载</button>
				</td>
			</tr>
			<tr align="center"  style="height:420">
				<td class="center">1</td>
				<td class="center">滴滴打车</td>
				<td class="center">京K298888</td>
				<td class='center'>测试用户2</td>
				<td class='center'>2017-3-8</td>
				<td class='center'>勘察人员2</td>
				
				<td class="center">
					<!-- <button type="button" class='btn btn-mini btn-info''>处理</button> -->
					<button type='button' class='btn btn-default' ><span  ></span>审批</button>
					<!-- <button type='button' class='btn btn-default' ><span class='glyphicon glyphicon-duplicate' aria-hidden='true' ></span>打印</button> -->
										<button type='button' class='btn btn-default' onclick="editSurvey()"><span class='glyphicon glyphicon-edit' aria-hidden='true' ></span>修改</button>
					<button type='button' class='btn btn-default' onclick='print()'  ><span class='glyphicon glyphicon-duplicate' aria-hidden='true' ></span>打印</button>
					<button type='button' class='btn btn-default' onclick="upload()"><span class='glyphicon glyphicon-icon' ></span>情况下载</button>
				</td>
			</tr>
			
   		</table>	
	</div>
		<div class="modal fade " id="add" style="display:none;width:500px;margin-left:200px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						添加勘察结果：
					</h4>
				</div>
				<div class="modal-body"  style="height:440px">
					<table id="" class="table table-striped table-bordered table-hover"  style="width:80% ; height: 80%">
			             <tr >
						    <td align="right">序号：</td>
						    <td><input  class="form-control" size="10" name="name" id="name" value="" type="text" style="width:200px;"/></td>
						 </tr>
			             <tr>
						    <td align="right">所属平台：</td>
						    <td><input  class="form-control" size="10" name="name" id="name"  type="text"  style="width:200px;"/></td>
						 </tr>
			            <tr>
						    <td align="right">车牌号：</td>
						    <td><input  class="form-control" size="10" name="name" id="name"  type="text"  style="width:200px;"/></td>
						 </tr>
						 <tr>
						    <td align="right">车主：</td>
						    <td><input  class="form-control" size="10" name="name" id="name"  type="text"  style="width:200px;"/></td>
						 </tr>
						 <tr>
						    <td align="right">勘察时间：</td>
						    <td><input  class="form-control" size="10" name="name" id="name"  type="text"  style="width:200px;"/></td>
						 </tr>
						 <tr>
						    <td align="right">勘察人员：</td>
						    <td><input  class="form-control" size="10" name="name" id="name"  type="text"  style="width:200px;"/></td>
						 </tr>
			             <tr>
						    <td align="right">情况：</td>
						    <td><form action="importExcel.action" id="importForm" method="post" enctype="multipart/form-data" style="float: left">
	            <div class="box">
					<input type="file" multiple class="uploadFile" id="excelFile" name="excelFile" onchange="getFile(this,'excelFileText')" />
					<a href="javascript:importFile();" style="border-radius: 4px;" class="upload_link">导 入</a>&nbsp;
				</div>
			</form></td>
						 </tr>
						 <tr>
							<td colspan="2" style="text-align:center">
						     	<button type="button" class='btn btn-default btn-info' onclick='submit()'>保存</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						     	<button type="button" class="btn btn-danger" onclick='top.Dialog.close()'>关闭</button>
						     </td>
						</tr>
					</table>
					</div>
					</div>
					</div>
					</div>
					
					
					<div class="modal fade " id="edit" style="display:none;width:500px;margin-left:200px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						修改勘察结果：
					</h4>
				</div>
				<div class="modal-body">
					<table id="" width="50%" class="table table-striped table-bordered table-hover"  style="width:80% ; height: 80%">
			             <tr>
						    <td align="right">序号：</td>
						    <td><input  class="form-control" size="10" name="" id="" value="1" type="text" style="width:200px;"/></td>
						 </tr>
			             <tr>
						    <td align="right">所属平台：</td>
						    <td><input  class="form-control" size="10" name="" id=""  type="text" value="所属平台1" style="width:200px;"/></td>
						 </tr>
			            <tr>
						    <td align="right">车牌号：</td>
						    <td><input  class="form-control" size="10" name="" id=""  type="text" value="京AF3952" style="width:200px;"/></td>
						 </tr>
						 <tr>
						    <td align="right">车主：</td>
						    <td><input  class="form-control" size="10" name="" id=""  type="text" value="测试用户1" style="width:200px;"/></td>
						 </tr>
						 <tr>
						    <td align="right">勘察时间：</td>
						    <td><input  class="form-control" size="10" name="" id=""  type="text" value="2017-3-8" style="width:200px;"/></td>
						 </tr>
						 <tr>
						    <td align="right">勘察人员：</td>
						    <td><input  class="form-control" size="10" name="" id=""  type="text" value="勘察人员1" style="width:200px;"/></td>
						 </tr>
			             <tr>
						    <td align="right">情况：</td>
						    <td><form action="importExcel.action" id="importForm" method="post" enctype="multipart/form-data" style="float: left">
	            <div class="box">
					<input type="text" id="excelFileText" name="excelFileText" class="file_textbox" style="width: 150px;" />
					<input type="file" multiple class="uploadFile" id="excelFile" name="excelFile" onchange="getFile(this,'excelFileText')" />
					<a href="javascript:importFile();" style="border-radius: 4px;" class="upload_link">导 入</a>&nbsp;
				</div>
			</form></td>
						 </tr>
						 <tr>
							<td colspan="2" style="text-align:center">
						     	<button type="button" class='btn btn-default btn-info' onclick='submit()'>保存</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						     	<button type="button" class="btn btn-danger" onclick='top.Dialog.close()'>关闭</button>
						     </td>
						</tr>
					</table>
					</div>
					</div>
					</div>
					</div>
					
</body>
</html>