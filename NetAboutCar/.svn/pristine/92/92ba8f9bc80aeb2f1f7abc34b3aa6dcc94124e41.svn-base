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
function quxiao(){
	window.location.href="<%=basePath %>exam/planning.action";
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
					考试计划管理
				</small>
			</h1>
		</div>
		<form action="" method="post" name="form" id="form">
		   <table width="60%" align="center" border="0" cellpadding="5" cellspacing="2">
		             <tr height="40">
					    <td align="left">考试科目：
					    	<input   class="form-control" size="30" name="name" id="name"  type="text"/>
					    	考试地点：<input class="form-control" size="30" name="name" id="name"  type="text"/>	
					    </td>
					 </tr>
		             <tr height="40">
					    <td align="left">考试时间：
					    	<input type="text" class="form-control" name="carddate" id=dt2 placeholder="请选择日期" size="30">
					    	预约人数：<input class="form-control" size="30" name="name" id="name"  type="text"/>
					    </td>
					 </tr>
					  <tr>
					     <td align="center">
					     	<button type="button" class='btn btn-default btn-info' onclick='submit()'>确定</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					     	<button type="button" class='btn btn-default' onclick='quxiao()'>取消</button>
					     </td>
				      </tr>
			</table>
        </form>     
	</div>
</body>
</html>