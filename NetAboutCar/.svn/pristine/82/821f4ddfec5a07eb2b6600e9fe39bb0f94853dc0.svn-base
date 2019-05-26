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
	window.location.href="<%=basePath %>exam/arrange.action";
}
$(function(){
	$("#check_all").click(function() {
	    if (this.checked) {
	        $("input[name='personid']").each(function() {
	            this.checked = true;
	        });
	    } else {
	        $("input[name='personid']").each(function() {
	            this.checked = false;
	        });
	    }
	});
});
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
		<form action="" method="post" name="form" id="form">
		   <table width="60%" align="center" border="0" cellpadding="5" cellspacing="2">
		             <tr height="40">
					    <td align="left">培训主题：
					    	<input  class="form-control" size="30" name="name" id="name"  type="text"/>
					    	培训课程：<select id="educationlbg" name="educationlbg">
							  <option value="0"></option>
							  <option value="1">培训产品说明</option>
							</select>	
					    </td>
					 </tr>
		             <tr height="40">
					    <td align="left">学习时间：
					    	<input type="text"  class="form-control" name="startdate" id="dt" placeholder="请选择日期" size="30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    	<input type="text"  class="form-control" name="carddate" id=dt2 placeholder="请选择日期" size="30">
					    </td>
					 </tr>
					 <tr height="40">
					    <td align="left">授课方式：
					    	<select id="educationlbg" name="educationlbg">
							  <option value="0">线上</option>
							  <option value="1">线下</option>
							</select>	
					    </td>
					 </tr>
					 <tr height="40">
					    <td align="left">培训人员：
					    	<div style="overflow:auto;overflow-x:hidden;width:500px;margin-left:20px;height:100px;">
					    		<!-- <label class="checkbox inline font-size"><input type="checkbox" value=" ">AB</label> -->
								<table width="60%" align="center" border="0" cellpadding="5" cellspacing="2">
									<thead>
										<tr>
											<th><input type="checkbox" id="check_all" />序号</th>
											<th>人员名称</th>
										</tr>
									</thead>
									<tbody>
								        <tr>  
								             <td><input type="checkbox" name="personid" value="XXX"/>1</td>   
								             <td align = "center">刘扥</td>  
								         </tr>  
								        <tr>  
								             <td><input type="checkbox" name="personid" value="XXX"/>2</td>   
								             <td align = "center">范文娇</td>  
								         </tr>  
								        <tr>  
								             <td><input type="checkbox" name="personid" value="XXX"/>3</td>   
								             <td align = "center">赵文</td>  
								         </tr>  
									</tbody>
							 	</table>
					    	</div>
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