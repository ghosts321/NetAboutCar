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
 a:hover{color:white;text-decoration:none;}
 table{border-collapse:separate;}
</style>
<script type="text/javascript">
function search(){
	alert("search");
}
function arrange(){
	window.location.href="<%=basePath %>exam/arrangeAdd.action";
}
function showDetail(){
	//window.open("getPilotApply.action","newwindow","height=500,width=400,toolbar=no,scrollbars=no");
	$('#peixun').modal();
}
</script>
</head>
<body>
	<div class="page-content">
		<div class="page-header">
			<h1 style="font-size:25px;font-weight: lighter;color: #2679b5">
				考试培训
				<small style="font-size: 19px">
					<i class="icon-double-angle-right"></i>
					培训安排
				</small>
			</h1>
		</div>
		
		<table border='0' style="margin-top: 0px;width:100%">
			<tbody>
				<tr>
					<td width="12%"><p id="fontStyle">根据条件查询：</p></td>
					<td width="10%">
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="培训主题" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td width="10%" style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
					<td align="right"><button class="btn btn-mini btn-danger" onclick="arrange();">安排培训</button></td>
				</tr>
			</tbody>
		</table>
		<table id="tradeList" class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th class="center"  style="width: 50px;">序号</th>
					<th class='center'>培训主题</th>
					<th class='center'>培训课程</th>
					<th class='center'>学习时间</th>
					<th class='center'>课程时长</th>
					<th class='center'>授课老师</th>
					<th class='center'>操作</th>
				</tr>
			</thead>
			<tr>
				<td class="center">1</td>
				<td class="center">产品培训</td>
				<td class="center">培训产品说明</td>
				<td class="center">2015-05-27至2015-05-31</td>
				<td class="center">3天</td>
				<td class="center">Admin</td>
				<td class="center">
					<button type="button" class='btn btn-mini btn-info' onclick="showDetail();">详细</button>
				</td>
			</tr>
   		</table>
	</div>
	<div class="modal fade" id="peixun" style="display:none;width:1000px;margin-left:-500px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" >
						培训详细信息：
					</h4>
				</div>
				<div class="modal-body" style="height:300px">
					<table class="table table-striped table-bordered">
						<tbody>
							<tr>
								<td><p id="fontStyle">培训主题：产品培训</p></td>
								<td><p id="fontStyle">培训课程：培训产品说明</p></td>
							</tr>
							<tr>
								<td><p id="fontStyle">授课方式：线上</p></td>
								<td><p id="fontStyle">课程时长：3天</p></td>
							</tr>
							<tr>
								<td colspan="2"><p id="fontStyle">学习时间：2015-05-27至2015-05-31</p></td>
							</tr>
							<tr>
								<td colspan="2"><p id="fontStyle">培训人员：</p>
									<table width="60%" align="center" border="0" cellpadding="5" cellspacing="2">
										<thead>
											<tr>
												<th>序号</th>
												<th>人员名称</th>
											</tr>
										</thead>
										<tbody>
									        <tr>  
									             <td>1</td>   
									             <td align = "center">刘扥</td>  
									         </tr>  
									        <tr>  
									             <td>2</td>   
									             <td align = "center">范文娇</td>  
									         </tr>  
									        <tr>  
									             <td>3</td>   
									             <td align = "center">赵文</td>  
									         </tr>  
										</tbody>
								 	</table>
								</td>
							</tr>
						</tbody>
   					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div><!-- /.modal-content --> 
		</div><!-- /.modal -->
	</div>
</body>
</html>