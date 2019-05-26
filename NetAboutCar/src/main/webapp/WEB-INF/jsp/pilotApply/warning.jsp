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
</script>
</head>
<body>
	<div class="panel-body">
		<div class="page-header">
			<h1 style="font-size:15px;">
				预警管理
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					预警列表
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
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">姓名</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" id="userName" name="userName" value="" class="form-control" />
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">手机号</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" id="certNo" name="Username" value="" class="form-control" />
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">状态</label>
                        <div class="col-sm-1">
                            <select id="applyType" name="applyType">
					            <option value="">全部</option>
					            <option value="0">冻结</option>
					            <option value="1">正常</option>
				        	</select>
                        </div>
                        <div class="col-sm-3" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
		<table id="tradeList" class="table table-striped table-bordered table-hover">
			<thead>
				<tr align="center"  style="height:420">
					<td class="center"  style="width: 50px;">序号</th>
					<td class='center'>预警类型</th>
					<td class='center'>详细信息</th>
					<td class='center'>操作</th>
				</tr>
			</thead>
			<tr align="center"  style="height:420">
				<td class="center">1</td>
				<td class="center">驾驶员证件预警</td>
				<td class="center">驾驶员：刘海科营运证将于2016-10-31过期，请在截止日期之前进行处理</td>
				<td class="center">
					<!-- <button type="button" class='btn btn-mini btn-info''>处理</button> -->
					<button type='button' class='btn btn-default' ><span class='glyphicon glyphicon-wrench' aria-hidden='true' ></span>处理</button>
				</td>
			</tr>
			<tr align="center"  style="height:420">
				<td class="center">2</td>
				<td class="center">车辆预警</td>
				<td class="center">车牌号：沪KR9888行驶证将于2016-11-01过期，请在截止日期之前进行处理</td>
				<td class="center">
					<!-- <button type="button" class='btn btn-mini btn-info''>处理</button> -->
					<button type='button' class='btn btn-default' ><span class='glyphicon glyphicon-wrench' aria-hidden='true' ></span>处理</button>
				</td>
			</tr>
			<tr align="center"  style="height:10px">
				<td class="center">3</td>
				<td class="center">备案预警</td>
				<td class="center">滴滴打车平台谢红可备案信息不合格，请及时进行处理</td>
				<td class="center">
					<!-- <button type="button" class='btn btn-mini btn-info''>处理</button> -->
					<button type='button' class='btn btn-default' ><span class='glyphicon glyphicon-wrench' aria-hidden='true' ></span>处理</button>
				</td>
			</tr>
   		</table>
	</div>
	
</body>
</html>